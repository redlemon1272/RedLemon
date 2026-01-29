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

    IF (is_user_premium IS TRUE AND user_premium_until IS NULL AND user_subscription_expires IS NULL) 
       OR (user_premium_until IS NOT NULL AND user_premium_until > NOW())
       OR (user_subscription_expires IS NOT NULL AND user_subscription_expires > NOW()) THEN
        RETURN jsonb_build_object('remaining_seconds', 0, 'is_locked', false);
    END IF;

    -- 2. Check History
    SELECT COUNT(*), MAX(created_at) INTO room_count, last_creation
    FROM public.room_creation_history
    WHERE user_id = target_user_id
      AND created_at > (NOW() - INTERVAL '24 hours');

    IF room_count >= 1 THEN
        remaining_interval := (last_creation + INTERVAL '24 hours') - NOW();
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

GRANT EXECUTE ON FUNCTION public.get_free_tier_status(UUID) TO anon, authenticated, service_role;
