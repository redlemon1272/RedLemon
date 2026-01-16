-- Migration: Add hosting_streak to users and update admin_grant_premium
-- Description: Tracks the number of successful watch parties hosted by a user to award prestige badges.

-- 1. Add hosting_streak column
ALTER TABLE users
ADD COLUMN IF NOT EXISTS hosting_streak INTEGER DEFAULT 0;

-- 2. Update admin_grant_premium function to handle streaks
-- Drop existing function if it exists (handles upgrades)
DROP FUNCTION IF EXISTS admin_grant_premium(text, integer);
DROP FUNCTION IF EXISTS admin_grant_premium(uuid, text, integer);

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
    current_streak INTEGER;
    new_streak INTEGER;
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
    SELECT id, subscription_expires_at, hosting_streak
    INTO target_user_id, current_expiry, current_streak
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

    -- Calculate new expiry date and streak
    -- If current expiry is in the future, extend from that date and increment streak
    -- Otherwise, extend from now and reset streak to 0 (Base Premium)
    IF current_expiry IS NOT NULL AND current_expiry > NOW() THEN
        new_expiry := current_expiry + (days_to_add || ' days')::INTERVAL;
        new_streak := COALESCE(current_streak, 0) + 1;
    ELSE
        new_expiry := NOW() + (days_to_add || ' days')::INTERVAL;
        new_streak := 0;
    END IF;

    -- Update the user's premium expiry and status
    UPDATE users
    SET subscription_expires_at = new_expiry,
        is_premium = true,
        hosting_streak = new_streak
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

-- Grant execute permission only to authenticated users
GRANT EXECUTE ON FUNCTION admin_grant_premium(UUID, TEXT, INTEGER) TO authenticated;

-- Refresh schema cache if needed
notify pgrst, 'reload schema';
