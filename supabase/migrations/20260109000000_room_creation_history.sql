-- Migration: Room Creation History for Free User Limits
-- Date: 2026-01-09
-- Description: Creates a persistent room_creation_history table to track room 
--              creation events independently of the ephemeral rooms table.
--              This fixes the bypass where free users could create unlimited rooms
--              because rooms are deleted when hosts leave, resetting the limit counter.

-- 1. Create the room_creation_history table
CREATE TABLE IF NOT EXISTS public.room_creation_history (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    room_id TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Create index for efficient lookups by user and time
CREATE INDEX IF NOT EXISTS idx_room_creation_history_user_time 
ON public.room_creation_history(user_id, created_at DESC);

-- 3. Enable RLS on the table (security best practice)
ALTER TABLE public.room_creation_history ENABLE ROW LEVEL SECURITY;

-- 4. Create RLS policies
-- Users can view their own history
CREATE POLICY "Users can view own room creation history" ON public.room_creation_history
    FOR SELECT USING (auth.uid() = user_id);

-- 5. Update the room creation limits function to use the history table
CREATE OR REPLACE FUNCTION public.check_room_creation_limits()
RETURNS TRIGGER AS $$
DECLARE
    is_user_premium BOOLEAN;
    user_premium_until TIMESTAMPTZ;
    user_subscription_expires TIMESTAMPTZ;
    room_count INT;
    host_id UUID;
BEGIN
    -- Determine the host ID (fallback to auth.uid() if not explicitly provided)
    host_id := NEW.host_user_id;
    IF host_id IS NULL THEN
        host_id := auth.uid();
    END IF;

    -- Skip limit check for event rooms (host_username = 'RedLemon Events')
    IF NEW.host_username = 'RedLemon Events' THEN
        RETURN NEW;
    END IF;

    -- Fetch premium status for the host
    SELECT is_premium, premium_until, subscription_expires_at
    INTO is_user_premium, user_premium_until, user_subscription_expires
    FROM public.users
    WHERE id = host_id;

    -- Check if Premium is Active
    -- Premium is valid if:
    --   1. is_premium is TRUE, OR
    --   2. premium_until is set AND in the future, OR
    --   3. subscription_expires_at is set AND in the future (crypto payments)
    IF (is_user_premium IS TRUE) 
       OR (user_premium_until IS NOT NULL AND user_premium_until > NOW())
       OR (user_subscription_expires IS NOT NULL AND user_subscription_expires > NOW()) THEN
        -- User is Premium: Allow creation, log to history
        INSERT INTO public.room_creation_history (user_id, room_id) VALUES (host_id, NEW.id);
        RETURN NEW;
    END IF;

    -- User is FREE: Check Limits using the persistent history table
    -- Count room creation events (not rooms) in the last 24 hours
    SELECT COUNT(*) INTO room_count
    FROM public.room_creation_history
    WHERE user_id = host_id
      AND created_at > (NOW() - INTERVAL '24 hours');

    -- If user has created 1 or more rooms in the last 24h, BLOCK.
    IF room_count >= 1 THEN
        RAISE EXCEPTION 'Free User Limit Reached: You can only host 1 room every 24 hours. Upgrade to Premium for unlimited hosting.';
    END IF;

    -- Allow creation and log to history
    INSERT INTO public.room_creation_history (user_id, room_id) VALUES (host_id, NEW.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 6. Re-attach the trigger (drop first to ensure clean state)
DROP TRIGGER IF EXISTS enforce_room_limit ON public.rooms;

CREATE TRIGGER enforce_room_limit
BEFORE INSERT ON public.rooms
FOR EACH ROW
EXECUTE FUNCTION public.check_room_creation_limits();

-- 7. Create cleanup function for old history records (run periodically)
CREATE OR REPLACE FUNCTION public.cleanup_old_room_history()
RETURNS void AS $$
BEGIN
    DELETE FROM public.room_creation_history
    WHERE created_at < NOW() - INTERVAL '1 days';
END;
$$ LANGUAGE plpgsql;

-- 8. Grant necessary permissions
GRANT SELECT, INSERT ON public.room_creation_history TO authenticated;
GRANT SELECT, INSERT ON public.room_creation_history TO anon;

COMMENT ON TABLE public.room_creation_history IS 
    'Persistent log of room creation events for enforcing free user limits. 
     Rooms are ephemeral (deleted on host departure), but this table persists 
     to track the 72-hour creation limit for free users.';
