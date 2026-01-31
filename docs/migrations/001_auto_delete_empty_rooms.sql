-- Migration: Auto-delete empty rooms
-- Description: Automatically delete rooms when the last participant leaves
-- Date: 2025-11-08

-- Function to delete empty rooms
CREATE OR REPLACE FUNCTION delete_empty_rooms()
RETURNS TRIGGER AS $$
BEGIN
  -- Delete room if no participants remain
  DELETE FROM rooms
  WHERE id = OLD.room_id
  AND NOT EXISTS (
    SELECT 1 FROM room_participants WHERE room_id = OLD.room_id
  );
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger to run after participant leaves
CREATE TRIGGER delete_empty_rooms_trigger
AFTER DELETE ON room_participants
FOR EACH ROW
EXECUTE FUNCTION delete_empty_rooms();

-- To apply this migration:
-- 1. Go to Supabase Dashboard → SQL Editor
-- 2. Copy and paste this entire script
-- 3. Click "Run"
--
-- This will ensure rooms are automatically cleaned up when the last
-- participant leaves, keeping your database tidy!
