-- Migration: Fix Event Room Persistence (Zombie Cleanup Patch)
-- Date: 2026-01-08

-- 1. Unschedule potential Legacy Jobs (Safely)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_cron') THEN
        -- Attempt to unschedule legacy jobs, ignoring errors if they don't exist
        BEGIN
            PERFORM cron.unschedule('cleanup_rooms');
        EXCEPTION WHEN OTHERS THEN NULL; END;
        
        BEGIN
            PERFORM cron.unschedule('cleanup-rooms');
        EXCEPTION WHEN OTHERS THEN NULL; END;
        
        BEGIN
            PERFORM cron.unschedule('cleanup_inactive_rooms');
        EXCEPTION WHEN OTHERS THEN NULL; END;
    END IF;
END $$;

-- 2. Drop Legacy Functions (Explicitly to handle return type changes)
DROP FUNCTION IF EXISTS public.cleanup_inactive_rooms_v1() CASCADE;
DROP FUNCTION IF EXISTS public.cleanup_inactive_rooms() CASCADE;

-- 3. Patch the "Original" function name with Safe V2 Logic
CREATE OR REPLACE FUNCTION public.cleanup_inactive_rooms()
RETURNS TABLE(deleted_id text, deleted_name text, reason text)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  stale_threshold interval := INTERVAL '2 minutes';
BEGIN
  -- A. Remove Stale Participants
  DELETE FROM public.room_participants
  WHERE last_seen < (NOW() - stale_threshold);

  -- B. Remove Zombie Rooms (SAFE MODE)
  RETURN QUERY
  WITH deleted_rows AS (
    DELETE FROM public.rooms
    WHERE
      id NOT LIKE 'event_%' -- PROTECT SYSTEM EVENTS
      AND (
        -- Condition 1: Empty Room
        (SELECT COUNT(*) FROM public.room_participants rp WHERE rp.room_id = rooms.id) = 0
        OR
        -- Condition 2: Orphaned Room
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

-- 4. Grant permissions
GRANT EXECUTE ON FUNCTION public.cleanup_inactive_rooms() TO service_role;

