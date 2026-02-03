-- Migration: Self-Healing Key Verification
-- Date: 2026-02-03
-- Description: If signature fails with stored key, try the key from x-public-key header.
--              If THAT works, update the user's stored key (self-heal).

CREATE OR REPLACE FUNCTION public.verify_user_signature(p_user_id uuid, p_path text)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public', 'extensions'
AS $function$
DECLARE
    v_headers JSONB;
    v_signature TEXT;
    v_timestamp TEXT;
    v_header_pub_key TEXT;
    v_stored_pub_key TEXT;
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
    v_header_pub_key := v_headers->>'x-public-key';

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
    
    IF ABS(v_now_int - v_ts_int) > 60 THEN
         RAISE EXCEPTION 'Request timestamp expired (Skew: %s seconds)', (v_now_int - v_ts_int);
    END IF;

    -- 3. Get Stored Public Key for User
    SELECT public_key INTO v_stored_pub_key
    FROM public.users
    WHERE id = p_user_id;

    IF v_stored_pub_key IS NULL AND v_header_pub_key IS NULL THEN
        RAISE EXCEPTION 'No public key registered for user %', p_user_id;
    END IF;

    -- 4. Construct Message: timestamp + user_id.lowercase + path
    v_message := (v_timestamp || lower(p_user_id::text) || p_path)::bytea;

    -- 5. Decode signature
    BEGIN
        v_sig_bytes := decode(v_signature, 'base64');
    EXCEPTION WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to decode signature from base64';
    END;

    -- 6. Try verification with STORED key first
    IF v_stored_pub_key IS NOT NULL THEN
        BEGIN
            v_pub_key_bytes := decode(v_stored_pub_key, 'base64');
            v_valid := pgsodium.crypto_sign_verify_detached(v_sig_bytes, v_message, v_pub_key_bytes);
            
            IF v_valid THEN
                RETURN TRUE;
            END IF;
        EXCEPTION WHEN OTHERS THEN
            -- Stored key failed to decode or verify, try header key
            NULL;
        END;
    END IF;

    -- 7. SELF-HEALING: Try verification with HEADER key
    IF v_header_pub_key IS NOT NULL AND v_header_pub_key != v_stored_pub_key THEN
        BEGIN
            v_pub_key_bytes := decode(v_header_pub_key, 'base64');
            v_valid := pgsodium.crypto_sign_verify_detached(v_sig_bytes, v_message, v_pub_key_bytes);
            
            IF v_valid THEN
                -- Success! Update the user's stored key to match
                UPDATE public.users
                SET public_key = v_header_pub_key
                WHERE id = p_user_id;
                
                RAISE NOTICE 'Self-healed public key for user %', p_user_id;
                RETURN TRUE;
            END IF;
        EXCEPTION WHEN OTHERS THEN
            RAISE EXCEPTION 'Invalid cryptographic signature (self-heal attempt failed)';
        END;
    END IF;
    
    RAISE EXCEPTION 'Invalid cryptographic signature';
END;
$function$;
