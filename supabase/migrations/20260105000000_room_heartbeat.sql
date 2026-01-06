-- Migration: Room Heartbeat & Zombie Cleanup V2
-- Date: 2026-01-05
-- Description: Adds heartbeat RPC and robust cleanup logic for zombie rooms.

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
  -- This prevents the "inactive room" check from killing active parties
  UPDATE public.rooms
  SET last_activity = NOW()
  WHERE id = p_room_id;
END;
$$;

-- Grant access to authenticated users
GRANT EXECUTE ON FUNCTION public.room_heartbeat(text, uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.room_heartbeat(text, uuid) TO service_role;


-- 2. Cleanup Function (Called by Edge Function)
-- Returns list of deleted room IDs for logging
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
  -- Users who haven't sent a heartbeat in 2 minutes are considered gone/crashed.
  DELETE FROM public.room_participants
  WHERE last_seen < (NOW() - stale_threshold);

  -- B. Remove Zombie Rooms
  -- A room is a "Zombie" if:
  -- 1. It is NOT an event (Events are persistent)
  -- 2. AND (
  --      It has 0 participants
  --      OR
  --      The Host is missing from the participants list (Orphaned)
  --    )
  RETURN QUERY
  WITH deleted_rows AS (
    DELETE FROM public.rooms
    WHERE
      id NOT LIKE 'event_%' -- PROTECT SYSTEM EVENTS
      AND (
        -- Condition 1: Empty Room
        (SELECT COUNT(*) FROM public.room_participants rp WHERE rp.room_id = rooms.id) = 0
        
        OR
        
        -- Condition 2: Orphaned Room (Host is gone)
        -- We check if the host_user_id is present in the participants table for this room.
        -- If NOT present, the host has disconnected/timed out.
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
