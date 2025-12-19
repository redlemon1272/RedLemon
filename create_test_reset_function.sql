-- Run this ONCE to create the helper function
CREATE OR REPLACE FUNCTION reset_payment_test_user(target_username TEXT)
RETURNS TEXT
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    target_user_id UUID;
BEGIN
    -- Get User ID
    SELECT id INTO target_user_id FROM users WHERE username = target_username;
    
    IF target_user_id IS NULL THEN
        RETURN 'User not found: ' || target_username;
    END IF;

    -- 1. Delete Payment History
    DELETE FROM payment_transactions WHERE user_id = target_user_id;
    
    -- 2. Delete Address Assignments (Forces new address generation)
    DELETE FROM payment_pools WHERE assigned_to_user_id = target_user_id;
    
    -- 3. Revoke Premium
    UPDATE users 
    SET is_premium = false, 
        subscription_expires_at = NULL 
    WHERE id = target_user_id;
    
    RETURN 'Success: Hard reset complete for ' || target_username;
END;
$$;

-- USAGE (Run this whenever you want to test):
-- SELECT reset_payment_test_user('ursinho');
