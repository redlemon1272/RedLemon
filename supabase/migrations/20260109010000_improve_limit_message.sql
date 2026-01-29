-- Migration: Improve Room Creation Limit Message
-- Date: 2026-01-09
-- Description: Updates check_room_creation_limits to include remaining time in error message.

CREATE OR REPLACE FUNCTION public.check_room_creation_limits()
RETURNS TRIGGER AS $$
DECLARE
    is_user_premium BOOLEAN;
    user_premium_until TIMESTAMPTZ;
    user_subscription_expires TIMESTAMPTZ;
    room_count INT;
    host_id UUID;
    last_creation TIMESTAMPTZ;
    remaining_interval INTERVAL;
    remaining_text TEXT;
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
    IF (is_user_premium IS TRUE AND user_premium_until IS NULL AND user_subscription_expires IS NULL) 
       OR (user_premium_until IS NOT NULL AND user_premium_until > NOW())
       OR (user_subscription_expires IS NOT NULL AND user_subscription_expires > NOW()) THEN
        -- User is Premium: Allow creation, log to history
        INSERT INTO public.room_creation_history (user_id, room_id) VALUES (host_id, NEW.id);
        RETURN NEW;
    END IF;

    -- User is FREE: Check Limits
    SELECT COUNT(*) INTO room_count
    FROM public.room_creation_history
    WHERE user_id = host_id
      AND created_at > (NOW() - INTERVAL '24 hours');

    -- If user has created 1 or more rooms in the last 24h, BLOCK.
    IF room_count >= 1 THEN
        -- Calculate remaining time
        SELECT created_at INTO last_creation
        FROM public.room_creation_history
        WHERE user_id = host_id
        ORDER BY created_at DESC LIMIT 1;
        
        remaining_interval := (last_creation + INTERVAL '24 hours') - NOW();
        
        -- Round to nearest minute for cleaner display
        remaining_text := EXTRACT(HOUR FROM remaining_interval) || ' hours ' || 
                          EXTRACT(MINUTE FROM remaining_interval) || ' minutes';

        RAISE EXCEPTION 'Free User Limit Reached: You can host 1 item every 24 hours. Unlock in %.', remaining_text;
    END IF;

    -- Allow creation and log to history
    INSERT INTO public.room_creation_history (user_id, room_id) VALUES (host_id, NEW.id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
