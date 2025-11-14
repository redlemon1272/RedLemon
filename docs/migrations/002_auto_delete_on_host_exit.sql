-- Migration: Auto-delete rooms when host exits
-- Description: Automatically delete room when the host (not just any participant) leaves
-- Date: November 8, 2025

-- Drop old trigger that only deleted on empty rooms
DROP TRIGGER IF EXISTS delete_empty_rooms_trigger ON room_participants;
DROP FUNCTION IF EXISTS delete_empty_rooms();

-- New function: Delete room when HOST leaves
CREATE OR REPLACE FUNCTION delete_room_on_host_exit()
RETURNS TRIGGER AS $$
DECLARE
  host_user_id UUID;
BEGIN
  -- Get the host user ID for this room
  SELECT r.host_user_id INTO host_user_id
  FROM rooms r
  WHERE r.id = OLD.room_id;

  -- If the leaving user IS the host, delete the entire room
  IF OLD.user_id = host_user_id THEN
    DELETE FROM rooms WHERE id = OLD.room_id;
    RAISE NOTICE 'Room % deleted because host left', OLD.room_id;
  END IF;

  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger to run after participant leaves
CREATE TRIGGER delete_room_on_host_exit_trigger
AFTER DELETE ON room_participants
FOR EACH ROW
EXECUTE FUNCTION delete_room_on_host_exit();

-- To apply this migration:
-- 1. Go to Supabase Dashboard → SQL Editor
-- 2. Copy and paste this entire script
-- 3. Click "Run"
--
-- Now when a host leaves their room, the room is immediately deleted
-- and all guests are kicked. Guests can continue watching from their
-- "Continue Watching" section.
