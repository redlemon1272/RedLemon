-- Migration: Increase Free Tier Cooldown to 1 Week (168 Hours)
-- Date: 2026-01-23
-- Description: Updates the room creation limit from 72 hours to 168 hours (1 week).
--              Also updates the history cleanup policy to retain data for 8 days.

-- 1. Update the limit enforcement trigger function
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
    IF (is_user_premium IS TRUE)
       OR (user_premium_until IS NOT NULL AND user_premium_until > NOW())
       OR (user_subscription_expires IS NOT NULL AND user_subscription_expires > NOW()) THEN
        -- User is Premium: Allow creation, log to history
        INSERT INTO public.room_creation_history (user_id, room_id) VALUES (host_id, NEW.id);
        RETURN NEW;
    END IF;

    -- User is FREE: Check Limits using the persistent history table
    -- Count room creation events (not rooms) in the last 168 hours (1 WEEK)
    SELECT COUNT(*) INTO room_count
    FROM public.room_creation_history
    WHERE user_id = host_id
      AND created_at > (NOW() - INTERVAL '168 hours');

    -- If user has created 1 or more rooms in the last 168h, BLOCK.
    IF room_count >= 1 THEN
        RAISE EXCEPTION 'Free User Limit Reached: You can only host 1 room every 168 hours (7 days). Upgrade to Premium for unlimited hosting.';
    END IF;

    -- Allow creation and log to history
    INSERT INTO public.room_creation_history (user_id, room_id) VALUES (host_id, NEW.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 2. Update the status check function (used by UI for cooldown timer)
CREATE OR REPLACE FUNCTION public.get_free_tier_status(target_user_id UUID)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    is_user_premium BOOLEAN;
    user_premium_until TIMESTAMPTZ;
    user_subscription_expires TIMESTAMPTZ;
    room_count INT;
    last_creation TIMESTAMPTZ;
    remaining_interval INTERVAL;
    remaining_seconds BIGINT;
BEGIN
    -- 1. Check Premium Status
    SELECT is_premium, premium_until, subscription_expires_at
    INTO is_user_premium, user_premium_until, user_subscription_expires
    FROM public.users
    WHERE id = target_user_id;

    IF (is_user_premium IS TRUE)
       OR (user_premium_until IS NOT NULL AND user_premium_until > NOW())
       OR (user_subscription_expires IS NOT NULL AND user_subscription_expires > NOW()) THEN
        RETURN jsonb_build_object('remaining_seconds', 0, 'is_locked', false);
    END IF;

    -- 2. Check History (Last 168 Hours)
    SELECT COUNT(*), MAX(created_at) INTO room_count, last_creation
    FROM public.room_creation_history
    WHERE user_id = target_user_id
      AND created_at > (NOW() - INTERVAL '168 hours');

    IF room_count >= 1 THEN
        -- Calculate remaining time based on 168h window
        remaining_interval := (last_creation + INTERVAL '168 hours') - NOW();
        remaining_seconds := FLOOR(EXTRACT(EPOCH FROM remaining_interval));

        IF remaining_seconds < 0 THEN remaining_seconds := 0; END IF;

        RETURN jsonb_build_object(
            'remaining_seconds', remaining_seconds,
            'is_locked', remaining_seconds > 0,
            'last_created_at', last_creation
        );
    ELSE
        RETURN jsonb_build_object('remaining_seconds', 0, 'is_locked', false);
    END IF;
END;
$$;


-- 3. Update Cleanup Function (Keep history for 8 days now that limit is 7 days)
CREATE OR REPLACE FUNCTION public.cleanup_old_room_history()
RETURNS void AS $$
BEGIN
    DELETE FROM public.room_creation_history
    WHERE created_at < NOW() - INTERVAL '8 days';
END;
$$ LANGUAGE plpgsql;

-- 4. Re-grant permissions (sanity check)
GRANT EXECUTE ON FUNCTION public.get_free_tier_status(UUID) TO anon, authenticated, service_role;
