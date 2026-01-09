-- Secure RPC Verification Function
-- Requires pgsodium extension (which is standard in Supabase)

CREATE OR REPLACE FUNCTION verify_user_signature(p_user_id UUID, p_path TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, extensions -- Ensure access to pgsodium
AS $$
DECLARE
    v_headers JSONB;
    v_signature TEXT;
    v_timestamp TEXT;
    v_pub_key_base64 TEXT;
    v_pub_key_bytes BYTEA;
    v_sig_bytes BYTEA;
    v_message BYTEA;
    v_valid BOOLEAN;
    v_ts_int BIGINT;
    v_now_int BIGINT;
BEGIN
    -- 0. Get Headers safely
    BEGIN
        v_headers := current_setting('request.headers', true)::jsonb;
    EXCEPTION WHEN OTHERS THEN
        RAISE EXCEPTION 'Could not access request headers. Are you calling this via API?';
    END;

    v_signature := v_headers->>'x-identity-signature';
    v_timestamp := v_headers->>'x-timestamp';

    -- 1. Check Headers exist
    IF v_signature IS NULL OR v_timestamp IS NULL THEN
        RAISE EXCEPTION 'Missing signature headers (x-identity-signature, x-timestamp)';
    END IF;

    -- 2. Check Replay (60s window)
    BEGIN
        v_ts_int := v_timestamp::BIGINT;
    EXCEPTION WHEN OTHERS THEN
         RAISE EXCEPTION 'Invalid timestamp format';
    END;
    
    v_now_int := EXTRACT(EPOCH FROM NOW())::BIGINT;
    
    -- Allow 60s skew (in past or future)
    IF ABS(v_now_int - v_ts_int) > 60 THEN
         RAISE EXCEPTION 'Request timestamp expired (Skew: %s seconds)', (v_now_int - v_ts_int);
    END IF;

    -- 3. Get Public Key for User
    SELECT public_key INTO v_pub_key_base64
    FROM public.users
    WHERE id = p_user_id;

    IF v_pub_key_base64 IS NULL THEN
        RAISE EXCEPTION 'No public key registered for user %', p_user_id;
    END IF;

    -- 4. Decode Hex/Base64
    -- Swift code sends Base64.
    BEGIN
        v_pub_key_bytes := decode(v_pub_key_base64, 'base64');
        v_sig_bytes := decode(v_signature, 'base64');
    EXCEPTION WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to decode keys/signature from base64';
    END;
    
    -- 5. Construct Message: timestamp + user_id.lowercase + path
    -- IMPORTANT: Must match Swift construction exactly
    v_message := (v_timestamp || lower(p_user_id::text) || p_path)::bytea;

    -- 6. Verify
    -- pgsodium returns boolean
    v_valid := pgsodium.crypto_sign_verify_detached(v_sig_bytes, v_message, v_pub_key_bytes);

    IF NOT v_valid THEN
        RAISE EXCEPTION 'Invalid cryptographic signature';
    END IF;
    
    RETURN TRUE;
END;
$$;


-- UPDATE 1: room_heartbeat
CREATE OR REPLACE FUNCTION public.room_heartbeat(p_room_id text, p_user_id uuid)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    -- 🔒 SECURE: Verify Signature before action
    PERFORM verify_user_signature(p_user_id, '/rpc/room_heartbeat');

    -- Update participant heartbeat
    UPDATE public.room_participants
    SET last_seen = NOW()
    WHERE room_id = p_room_id AND user_id = p_user_id;

    -- Update room activity
    UPDATE public.rooms
    SET last_activity = NOW()
    WHERE id = p_room_id;
END;
$$;

-- UPDATE 2: assign_payment_address (RPC version)
-- Note: The implementation logic is same as before, but secured.
CREATE OR REPLACE FUNCTION assign_payment_address(p_chain TEXT, p_user_id UUID)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_address TEXT;
    v_pool_id UUID;
    v_expires_at TIMESTAMPTZ;
BEGIN
    -- 🔒 SECURE: Verify Signature
    -- Note: Edge Functions might bypass this if they write directly, 
    -- but this secures the RPC endpoint itself.
    PERFORM verify_user_signature(p_user_id, '/rpc/assign_payment_address');

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

    -- 2. Find and Lock a free address
    SELECT id, address INTO v_pool_id, v_address
    FROM payment_pools
    WHERE chain = p_chain 
      AND status = 'available'
    LIMIT 1
    FOR UPDATE SKIP LOCKED;

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
