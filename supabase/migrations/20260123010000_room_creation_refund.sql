-- Migration: User Room Creation Refund (Grace Period)
-- Date: 2026-01-23
-- Description: Automatically refunds the 72-hour hosting credit if a user room
--              is deleted within 30 minutes of creation (handles technical failures).

-- 1. Create the refund function
CREATE OR REPLACE FUNCTION public.maybe_refund_room_creation()
RETURNS TRIGGER AS $$
BEGIN
    -- Only refund for user rooms (ignore system events)
    IF OLD.id LIKE 'event_%' THEN
        RETURN OLD;
    END IF;

    -- GRACE PERIOD: 10 minutes
    -- Logic: If the room is deleted within 10 minutes of its creation,
    -- we assume a technical failure or setup issue occurred and refund the credit.
    IF (NOW() - OLD.created_at) < INTERVAL '10 minutes' THEN
        -- Delete the corresponding history record to restore the user's credit
        DELETE FROM public.room_creation_history
        WHERE user_id = OLD.host_user_id
          AND room_id = OLD.id;

        -- Logging for diagnostic purposes (visible in Supabase logs)
        RAISE NOTICE 'RL_REFUND: Restored hosting credit for user % (Room % closed after %)',
            OLD.host_user_id, OLD.id, (NOW() - OLD.created_at);
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Attach the trigger to the rooms table
DROP TRIGGER IF EXISTS tr_refund_room_on_delete ON public.rooms;

CREATE TRIGGER tr_refund_room_on_delete
AFTER DELETE ON public.rooms
FOR EACH ROW
EXECUTE FUNCTION public.maybe_refund_room_creation();

-- 3. Documentation
COMMENT ON FUNCTION public.maybe_refund_room_creation() IS
    'Automatically restores a free user''s hosting credit if their room is closed within 10 minutes.
     This ensures connectivity issues or playback errors don''t waste their once-per-30-day/72-hour attempt.';
