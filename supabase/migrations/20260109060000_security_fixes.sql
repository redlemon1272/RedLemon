-- Security Fixes 2026-01-09
-- Fixes IDOR vulnerabilities in RPC functions by enforcing auth.uid()

-- 1. Fix assign_payment_address
-- Removed p_user_id parameter, uses auth.uid() instead.
CREATE OR REPLACE FUNCTION assign_payment_address(p_chain TEXT)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_address TEXT;
    v_pool_id UUID;
    v_expires_at TIMESTAMPTZ;
    p_user_id UUID := auth.uid(); -- SECURE: Use authenticated user ID
BEGIN
    -- Check if user is authenticated
    IF p_user_id IS NULL THEN
        RETURN jsonb_build_object('success', false, 'error', 'Not authenticated');
    END IF;

    -- 1. Check if user already has an active assignment for this chain
    SELECT address, id INTO v_address, v_pool_id
    FROM payment_pools
    WHERE assigned_to_user_id = p_user_id 
      AND chain = p_chain
      AND status = 'assigned';
      
    -- If they do, just return it (idempotency)
    IF v_address IS NOT NULL THEN
        RETURN jsonb_build_object(
            'success', true,
            'address', v_address,
            'message', 'Existing assignment found'
        );
    END IF;

    -- 2. Find and Lock a free address (SKIP LOCKED is key for concurrency)
    SELECT id, address INTO v_pool_id, v_address
    FROM payment_pools
    WHERE chain = p_chain 
      AND status = 'available'
    LIMIT 1
    FOR UPDATE SKIP LOCKED; -- Locks the row so other txns skip it

    -- 3. If no address found, return error
    IF v_pool_id IS NULL THEN
        RETURN jsonb_build_object(
            'success', false,
            'error', 'No available addresses in pool. Please contact support.'
        );
    END IF;

    -- 4. Assign it
    v_expires_at := NOW() + INTERVAL '24 hours';
    
    UPDATE payment_pools
    SET status = 'assigned',
        assigned_to_user_id = p_user_id,
        assigned_at = NOW()
    WHERE id = v_pool_id;

    RETURN jsonb_build_object(
        'success', true,
        'address', v_address,
        'expires_at', v_expires_at
    );
END;
$$;


-- 2. Fix room_heartbeat
-- Removed p_user_id parameter, uses auth.uid() instead.
CREATE OR REPLACE FUNCTION public.room_heartbeat(p_room_id text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    p_user_id UUID := auth.uid(); -- SECURE: Use authenticated user ID
BEGIN
    -- Update participant heartbeat (Enforce user_id match)
    UPDATE public.room_participants
    SET last_seen = NOW()
    WHERE room_id = p_room_id AND user_id = p_user_id;

    -- Update room activity (keep it alive)
    UPDATE public.rooms
    SET last_activity = NOW()
    WHERE id = p_room_id;
END;
$$;

-- Drop the old insecure versions (Supabase might overload based on args, so explicit drop is safer)
-- The old signature was (text, uuid) for heartbeat and (text, uuid) for assign
DROP FUNCTION IF EXISTS public.room_heartbeat(text, uuid);
DROP FUNCTION IF EXISTS public.assign_payment_address(text, uuid);
