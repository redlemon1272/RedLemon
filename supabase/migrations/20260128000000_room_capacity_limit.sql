-- 20260128000000_room_capacity_limit.sql
-- Enforce 25-user limit for watch party rooms

-- 1. Update existing rooms to 25 max participants and set default for new rooms
ALTER TABLE rooms ALTER COLUMN max_participants SET DEFAULT 25;
UPDATE rooms SET max_participants = 25 WHERE id NOT LIKE 'event_%';

-- 2. Trigger function to check capacity before joining
CREATE OR REPLACE FUNCTION check_room_capacity()
RETURNS TRIGGER AS $$
DECLARE
    current_count INT;
    max_count INT;
BEGIN
    -- Get current count and max allowed
    SELECT participants_count, max_participants
    INTO current_count, max_count
    FROM rooms
    WHERE id = NEW.room_id;

    -- Safety check if room doesn't exist (unlikely)
    IF max_count IS NULL THEN
        RETURN NEW;
    END IF;

    -- Block if at or over capacity
    -- We use >= because participants_count is updated via another trigger or heartbeat
    -- If it's already at max, this new join should be rejected.
    IF current_count >= max_count THEN
        RAISE EXCEPTION 'This room is currently full (%/%) participants.', current_count, max_count;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. Apply trigger to room_participants
DROP TRIGGER IF EXISTS enforce_room_capacity ON room_participants;
CREATE TRIGGER enforce_room_capacity
BEFORE INSERT ON room_participants
FOR EACH ROW
EXECUTE FUNCTION check_room_capacity();
