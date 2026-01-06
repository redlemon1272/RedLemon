-- Migration: Room Heartbeat & Zombie Cleanup V2 (Updated)
-- Date: 2026-01-05
-- Description: Adds heartbeat RPC, strict cleanup logic, and auto-sync triggers.

-- 1. Room Heartbeat RPC
-- Called by client every ~30s to prove liveness.
CREATE OR REPLACE FUNCTION public.room_heartbeat(p_room_id text, p_user_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  -- Update participant heartbeat
  UPDATE public.room_participants
  SET last_seen = NOW()
  WHERE room_id = p_room_id AND user_id = p_user_id;

  -- Update room activity (keep it alive)
  UPDATE public.rooms
  SET last_activity = NOW()
  WHERE id = p_room_id;
END;
$$;

GRANT EXECUTE ON FUNCTION public.room_heartbeat(text, uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.room_heartbeat(text, uuid) TO service_role;


-- 2. Trigger: Auto-Update `participants_count`
-- Ensures the UI always shows the correct number of people.
CREATE OR REPLACE FUNCTION public.update_room_participants_count()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        UPDATE public.rooms
        SET participants_count = (SELECT COUNT(*) FROM public.room_participants WHERE room_id = NEW.room_id)
        WHERE id = NEW.room_id;
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        UPDATE public.rooms
        SET participants_count = (SELECT COUNT(*) FROM public.room_participants WHERE room_id = OLD.room_id)
        WHERE id = OLD.room_id;
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop trigger if exists to allow clean re-apply
DROP TRIGGER IF EXISTS tr_update_participants_count ON public.room_participants;

CREATE TRIGGER tr_update_participants_count
AFTER INSERT OR DELETE ON public.room_participants
FOR EACH ROW
EXECUTE FUNCTION public.update_room_participants_count();


-- 3. Cleanup Function (Robust)
CREATE OR REPLACE FUNCTION public.cleanup_inactive_rooms_v2()
RETURNS TABLE(deleted_id text, deleted_name text, reason text)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  stale_threshold interval := INTERVAL '2 minutes'; -- Participants gone after 2 mins of no heartbeat
BEGIN
  -- A. Remove Stale Participants
  -- This will fire the trigger above, updating participants_count.
  DELETE FROM public.room_participants
  WHERE last_seen < (NOW() - stale_threshold);

  -- B. Remove Zombie Rooms
  RETURN QUERY
  WITH deleted_rows AS (
    DELETE FROM public.rooms
    WHERE
      id NOT LIKE 'event_%' -- PROTECT SYSTEM EVENTS
      AND (
        -- Condition 1: Empty Room (using actual count from table source)
        (SELECT COUNT(*) FROM public.room_participants rp WHERE rp.room_id = rooms.id) = 0
        
        OR
        
        -- Condition 2: Orphaned Room (Host is gone)
        NOT EXISTS (
            SELECT 1 
            FROM public.room_participants rp 
            WHERE rp.room_id = rooms.id 
            AND rp.user_id = rooms.host_user_id
        )
      )
    RETURNING id, name, 'zombie'::text
  )
  SELECT id, name, reason FROM deleted_rows;

END;
$$;

GRANT EXECUTE ON FUNCTION public.cleanup_inactive_rooms_v2() TO service_role;


-- 4. Schedule via pg_cron (Every Minute)
-- Requires pg_cron extension to be enabled.
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_cron') THEN
        -- Unschedule old jobs to avoid duplicates
        PERFORM cron.unschedule('cleanup-zombie-rooms');
        
        -- Schedule new job every minute
        PERFORM cron.schedule(
            'cleanup-zombie-rooms',
            '* * * * *', 
            'SELECT public.cleanup_inactive_rooms_v2();'
        );
    END IF;
END $$;
