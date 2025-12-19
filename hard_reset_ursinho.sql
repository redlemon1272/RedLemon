-- HARD RESET for 'ursinho' payment testing
-- This script completely wipes payment data for the user, forcing a fresh start.
-- 1. Clears payment history (so next payment counts from $0)
-- 2. Clears assigned addresses (so user gets a NEW address)
-- 3. Revokes premium status

DO $$
DECLARE
    target_user_id UUID;
BEGIN
    -- Get User ID
    SELECT id INTO target_user_id FROM users WHERE username = 'ursinho';
    
    IF target_user_id IS NOT NULL THEN
        -- 1. Delete Payment History
        DELETE FROM payment_transactions WHERE user_id = target_user_id;
        
        -- 2. Delete Address Assignments (Forces new address generation on next click)
        DELETE FROM payment_pools WHERE assigned_to_user_id = target_user_id;
        
        -- 3. Revoke Premium
        UPDATE users 
        SET is_premium = false, 
            subscription_expires_at = NULL 
        WHERE id = target_user_id;
        
        RAISE NOTICE 'Hard reset complete for ursinho (ID: %)', target_user_id;
    ELSE
        RAISE NOTICE 'User ursinho not found';
    END IF;
END $$;
