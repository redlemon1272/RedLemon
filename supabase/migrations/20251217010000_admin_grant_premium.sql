-- Secure RPC to grant premium status
CREATE OR REPLACE FUNCTION admin_grant_premium(
    target_username TEXT,
    days_to_add INT
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER -- Runs with privileges of creator (postgres) to bypass RLS, allowing update of other users
AS $$
DECLARE
    caller_is_admin BOOLEAN;
    target_uid UUID;
    current_expiry TIMESTAMPTZ;
    new_expiry TIMESTAMPTZ;
BEGIN
    -- 1. Security Check: Caller MUST be an admin
    SELECT is_admin INTO caller_is_admin
    FROM users
    WHERE id = auth.uid();

    IF caller_is_admin IS NOT TRUE THEN
        RAISE EXCEPTION 'Access Denied: You must be an admin to perform this action.';
    END IF;

    -- 2. Find Target User
    SELECT id, subscription_expires_at INTO target_uid, current_expiry
    FROM users
    WHERE username = target_username;

    IF target_uid IS NULL THEN
        RETURN jsonb_build_object('success', false, 'message', 'User @' || target_username || ' not found');
    END IF;

    -- 3. Calculate New Expiry
    -- If expired or null, start from NOW. If active, add to existing time.
    IF current_expiry IS NULL OR current_expiry < NOW() THEN
        current_expiry := NOW();
    END IF;

    new_expiry := current_expiry + (days_to_add || ' days')::INTERVAL;

    -- 4. Update User
    UPDATE users
    SET subscription_expires_at = new_expiry
    WHERE id = target_uid;

    RETURN jsonb_build_object(
        'success', true, 
        'message', 'Granted ' || days_to_add || ' days to @' || target_username,
        'new_expiry', new_expiry
    );
END;
$$;
