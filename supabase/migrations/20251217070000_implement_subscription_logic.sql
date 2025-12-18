-- Migration: Implement Subscription Logic and Room Creation Limits
-- Date: 2025-12-17
-- Description: Re-enables room creation limits with strict 1 room per 72h policy for free users, 
--              and ensures the users table has the necessary columns for premium subscription tracking.

-- 1. Ensure 'premium_until' column exists in public.users
--    (Assuming 'users' table is in public schema based on previous context, or matches auth.users)
--    Safe to run even if column exists.
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'users' AND column_name = 'premium_until') THEN
        ALTER TABLE public.users ADD COLUMN premium_until TIMESTAMPTZ;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'users' AND column_name = 'test_is_premium') THEN
        -- Using 'is_premium' computed column concept if needed, but likely we want a real column if not present
        -- Assuming 'is_premium' exists based on app code, but let's be safe:
        -- If app uses specific column name, we stick to it. SupabaseUser struct has 'isPremium'.
        -- We'll assume the column is 'is_premium' BOOLean.
         IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'users' AND column_name = 'is_premium') THEN
            ALTER TABLE public.users ADD COLUMN is_premium BOOLEAN DEFAULT FALSE;
         END IF;
    END IF;
END $$;

-- 2. Create or Replace the Function to Check Limits
CREATE OR REPLACE FUNCTION public.check_room_creation_limits()
RETURNS TRIGGER AS $$
DECLARE
    is_user_premium BOOLEAN;
    user_premium_until TIMESTAMPTZ;
    room_count INT;
    host_id UUID;
BEGIN
    -- Determine the host ID (fallback to auth.uid() if not explicitly provided, though app sends it)
    host_id := NEW.host_user_id;
    IF host_id IS NULL THEN
        host_id := auth.uid();
    END IF;

    -- Fetch premium status for the host
    SELECT is_premium, premium_until 
    INTO is_user_premium, user_premium_until
    FROM public.users
    WHERE id = host_id;

    -- Check if Premium is Active
    -- Premium is valid if is_premium is TRUE OR (premium_until is set AND in the future)
    IF (is_user_premium IS TRUE) OR (user_premium_until IS NOT NULL AND user_premium_until > NOW()) THEN
        -- User is Premium: Allow creation
        RETURN NEW;
    END IF;

    -- User is FREE: Check Limits
    -- Count rooms created by this user in the last 72 hours
    SELECT COUNT(*) INTO room_count
    FROM public.rooms
    WHERE host_user_id = host_id
      AND created_at > (NOW() - INTERVAL '72 hours');

    -- If user has created 1 or more rooms in the last 72h, BLOCK.
    IF room_count >= 1 THEN
        RAISE EXCEPTION 'Free User Limit Reached: You can only host 1 room every 72 hours. Upgrade to Premium for unlimited hosting.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. Attaching the Trigger
-- First, drop if exists to ensure clean state
DROP TRIGGER IF EXISTS enforce_room_limit ON public.rooms;

CREATE TRIGGER enforce_room_limit
BEFORE INSERT ON public.rooms
FOR EACH ROW
EXECUTE FUNCTION public.check_room_creation_limits();
