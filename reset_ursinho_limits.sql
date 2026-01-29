-- Full Reset for 'ursinho' (Hosting + Payment)
-- 1. Clears active rooms (resets "1 room per 24h" limit if based on active rooms)
-- 2. Clears room history (if tracks historical limit)
-- 3. Wipes payment data (fresh start for payment test)
-- 4. Revokes premium

DO $$
DECLARE
    target_user_id UUID;
BEGIN
    -- Get User ID
    SELECT id INTO target_user_id FROM public.users WHERE username = 'ursinho';
    
    IF target_user_id IS NOT NULL THEN
        -- 1. Clear Rooms (Active & History)
        DELETE FROM public.rooms WHERE host_user_id = target_user_id;
        
        -- Attempt to clear history if table exists (Catch error if not)
        BEGIN
            DELETE FROM public.room_creation_history WHERE user_id = target_user_id;
        EXCEPTION WHEN undefined_table THEN
            RAISE NOTICE 'room_creation_history table does not exist, skipping';
        END;

        -- 2. Clear Payment Data
        DELETE FROM public.payment_transactions WHERE user_id = target_user_id;
        DELETE FROM public.payment_pools WHERE assigned_to_user_id = target_user_id;
        
        -- 3. Revoke Premium
        UPDATE public.users 
        SET is_premium = false, 
            subscription_expires_at = NULL
        WHERE id = target_user_id;
        
        RAISE NOTICE '✅ FULL RESET complete for ursinho (ID: %)', target_user_id;
    ELSE
        RAISE NOTICE '❌ User ursinho not found';
    END IF;
END $$;
