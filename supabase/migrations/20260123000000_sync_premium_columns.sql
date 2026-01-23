-- Migration: Sync Premium Expiry Columns
-- Description: Ensures 'premium_until' and 'subscription_expires_at' always stay in sync 
--              to prevent discrepancies between legacy triggers and modern app logic.

-- 1. Create a trigger function to keep columns in sync
CREATE OR REPLACE FUNCTION public.sync_user_premium_columns()
RETURNS TRIGGER AS $$
BEGIN
    -- If subscription_expires_at changed, update premium_until
    IF (NEW.subscription_expires_at IS DISTINCT FROM OLD.subscription_expires_at) THEN
        NEW.premium_until := NEW.subscription_expires_at;
    END IF;
    
    -- If premium_until changed (e.g. from legacy script), update subscription_expires_at
    IF (NEW.premium_until IS DISTINCT FROM OLD.premium_until) THEN
        NEW.subscription_expires_at := NEW.premium_until;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Attach the trigger
DROP TRIGGER IF EXISTS tr_sync_premium_columns ON public.users;
CREATE TRIGGER tr_sync_premium_columns
BEFORE INSERT OR UPDATE ON public.users
FOR EACH ROW
EXECUTE FUNCTION public.sync_user_premium_columns();

-- 3. Update existing data to be consistent
UPDATE public.users 
SET subscription_expires_at = premium_until 
WHERE subscription_expires_at IS NULL AND premium_until IS NOT NULL;

UPDATE public.users 
SET premium_until = subscription_expires_at 
WHERE premium_until IS NULL AND subscription_expires_at IS NOT NULL;

-- 4. Update admin functions to be more robust
CREATE OR REPLACE FUNCTION public.admin_revoke_premium(caller_user_id uuid, target_username text) RETURNS json
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    caller_is_admin BOOLEAN;
    target_user_id UUID;
BEGIN
    -- Check if caller exists and is authenticated
    IF caller_user_id IS NULL THEN
        RETURN json_build_object('success', false, 'message', 'Unauthorized: You must be logged in');
    END IF;
    
    -- Check if the caller is an admin
    SELECT is_admin INTO caller_is_admin FROM users WHERE id = caller_user_id;
    IF caller_is_admin IS NOT TRUE THEN
        RETURN json_build_object('success', false, 'message', 'Forbidden: Admin privileges required');
    END IF;
    
    -- Find the target user by username
    SELECT id INTO target_user_id FROM users WHERE username = target_username;
    IF target_user_id IS NULL THEN
        RETURN json_build_object('success', false, 'message', 'User not found: ' || target_username);
    END IF;
    
    -- Revoke premium by setting is_premium to false and clearing BOTH expiry columns
    UPDATE users 
    SET is_premium = false,
        subscription_expires_at = NULL,
        premium_until = NULL
    WHERE id = target_user_id;

    -- Also reset their payment pools status to 'available' if you want to be thorough
    -- But keep assigned_to_user_id so they keep the same address if they return?
    -- Actually, it's safer to keep it assigned so 'check-payment' can still find their money.
    
    RETURN json_build_object('success', true, 'message', 'Premium status revoked for ' || target_username);
END;
$$;
