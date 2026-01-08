-- Migration: Fix Event Room Cleanup Bug
-- Date: 2026-01-08
-- Description: Removes the "orphaned host" condition from cleanup_inactive_rooms_v2()
--              which incorrectly deleted event rooms when the first joiner left.
--              The "Empty Room" condition (COUNT = 0) is sufficient protection.

-- Re-create the cleanup function without the problematic "orphaned host" check
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
  -- FIXED: Removed "orphaned host" condition which incorrectly deleted event rooms
  -- when the first joiner (who happens to be host_user_id) leaves.
  -- The "Empty Room" condition is sufficient for all cases.
  RETURN QUERY
  WITH deleted_rows AS (
    DELETE FROM public.rooms
    WHERE
      id NOT LIKE 'event_%' -- PROTECT SYSTEM EVENTS FROM DELETION
      AND (
        -- Condition: Empty Room (no participants left)
        (SELECT COUNT(*) FROM public.room_participants rp WHERE rp.room_id = rooms.id) = 0
      )
    RETURNING id, name, 'zombie'::text
  )
  SELECT id, name, reason FROM deleted_rows;

END;
$$;

-- Ensure permissions are maintained
GRANT EXECUTE ON FUNCTION public.cleanup_inactive_rooms_v2() TO service_role;
