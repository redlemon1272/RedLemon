-- Migration: Remove hosting_streak logic from admin_grant_premium
-- Description: Reverts the admin_grant_premium function to its original state, removing all hosting_streak calculations.

CREATE OR REPLACE FUNCTION admin_grant_premium(
    caller_user_id UUID,
    target_username TEXT,
    days_to_add INTEGER
)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER  -- Runs with the privileges of the function owner
AS $$
DECLARE
    caller_is_admin BOOLEAN;
    target_user_id UUID;
    current_expiry TIMESTAMPTZ;
    new_expiry TIMESTAMPTZ;
    result JSON;
BEGIN
    -- Check if caller exists and is authenticated
    IF caller_user_id IS NULL THEN
        RETURN json_build_object(
            'success', false,
            'message', 'Unauthorized: You must be logged in'
        );
    END IF;

    -- Check if the caller is an admin
    SELECT is_admin
    INTO caller_is_admin
    FROM users
    WHERE id = caller_user_id;

    IF caller_is_admin IS NOT TRUE THEN
        RETURN json_build_object(
            'success', false,
            'message', 'Forbidden: Admin privileges required'
        );
    END IF;

    -- Find the target user by username
    SELECT id, subscription_expires_at
    INTO target_user_id, current_expiry
    FROM users
    WHERE username = target_username;

    -- Check if target user exists
    IF target_user_id IS NULL THEN
        RETURN json_build_object(
            'success', false,
            'message', 'User not found: ' || target_username
        );
    END IF;

    -- Validate days_to_add
    IF days_to_add <= 0 OR days_to_add > 36500 THEN
        RETURN json_build_object(
            'success', false,
            'message', 'Invalid duration: must be between 1 and 36500 days'
        );
    END IF;

    -- Calculate new expiry date
    -- If current expiry is in the future, extend from that date
    -- Otherwise, extend from now
    IF current_expiry IS NOT NULL AND current_expiry > NOW() THEN
        new_expiry := current_expiry + (days_to_add || ' days')::INTERVAL;
    ELSE
        new_expiry := NOW() + (days_to_add || ' days')::INTERVAL;
    END IF;

    -- Update the user's premium expiry and status (WITHOUT hosting_streak)
    UPDATE users
    SET subscription_expires_at = new_expiry,
        is_premium = true
    WHERE id = target_user_id;

    -- Return success result
    RETURN json_build_object(
        'success', true,
        'message', 'Granted ' || days_to_add || ' days of premium to ' || target_username || '. Expires: ' || to_char(new_expiry, 'YYYY-MM-DD HH24:MI:SS')
    );

EXCEPTION
    WHEN OTHERS THEN
        RETURN json_build_object(
            'success', false,
            'message', 'Error granting premium: ' || SQLERRM
        );
END;
$$;

-- Refresh schema cache
notify pgrst, 'reload schema';
