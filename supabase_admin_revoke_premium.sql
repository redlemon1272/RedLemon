-- PostgreSQL function to revoke premium hosting from a user
-- This function clears premium status and expiry date

DROP FUNCTION IF EXISTS admin_revoke_premium(uuid, text);

CREATE OR REPLACE FUNCTION admin_revoke_premium(
    caller_user_id UUID,
    target_username TEXT
)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    caller_is_admin BOOLEAN;
    target_user_id UUID;
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
    SELECT id 
    INTO target_user_id
    FROM users 
    WHERE username = target_username;
    
    -- Check if target user exists
    IF target_user_id IS NULL THEN
        RETURN json_build_object(
            'success', false,
            'message', 'User not found: ' || target_username
        );
    END IF;
    
    -- Revoke premium by setting is_premium to false and clearing expiry
    UPDATE users 
    SET is_premium = false,
        subscription_expires_at = NULL
    WHERE id = target_user_id;
    
    -- Return success result
    RETURN json_build_object(
        'success', true,
        'message', 'Revoked premium from ' || target_username
    );
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN json_build_object(
            'success', false,
            'message', 'Error revoking premium: ' || SQLERRM
        );
END;
$$;

GRANT EXECUTE ON FUNCTION admin_revoke_premium(UUID, TEXT) TO authenticated;
