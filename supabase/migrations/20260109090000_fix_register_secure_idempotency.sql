-- Fix: Make register_user_secure idempotent to allow Key Repair
-- This allows the app to self-heal if local keys are out of sync with the server.

CREATE OR REPLACE FUNCTION public.register_user_secure(
    p_username text, 
    p_public_key text
)
RETURNS json
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_user_id uuid;
    v_existing_pubkey text;
BEGIN
    -- 1. Check if user already exists
    SELECT id, public_key INTO v_user_id, v_existing_pubkey
    FROM public.users
    WHERE username = p_username;

    IF v_user_id IS NOT NULL THEN
        -- 2. If it's the SAME public key, it's an idempotent re-registration (Self-Healing)
        IF v_existing_pubkey = p_public_key THEN
            UPDATE public.users SET last_seen = now() WHERE id = v_user_id;
            RETURN json_build_object(
                'id', v_user_id,
                'username', p_username,
                'status', 're-authenticated'
            );
        ELSE
            -- 3. DIFFERENT public key = Unauthorized takeover attempt
            RAISE EXCEPTION 'Username already taken: %', p_username;
        END IF;
    END IF;

    -- 4. New Registration
    INSERT INTO public.users (username, public_key)
    VALUES (p_username, p_public_key)
    RETURNING id INTO v_user_id;
    
    RETURN json_build_object(
        'id', v_user_id,
        'username', p_username,
        'status', 'registered'
    );
END;
$$;

-- Ensure permissions are set correctly
GRANT EXECUTE ON FUNCTION public.register_user_secure TO anon, authenticated, service_role;
