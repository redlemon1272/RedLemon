-- Migration: Fix Registration Error Messages (Server-Side)
-- Date: 2026-02-03
-- Description: Changes register_user_secure to THROW an exception when a username is taken.
--              This allows the existing client to show a descriptive error message 
--              instead of a generic decoding failure.

CREATE OR REPLACE FUNCTION public.register_user_secure(p_username text, p_public_key text)
RETURNS json
LANGUAGE plpgsql
SECURITY DEFINER
AS $function$
DECLARE
    v_user_id uuid;
    v_existing_pubkey text;
BEGIN
    -- Check if user exists
    SELECT id, public_key INTO v_user_id, v_existing_pubkey 
    FROM public.users 
    WHERE username = p_username;

    IF v_user_id IS NOT NULL THEN
        -- If keys match, it's a re-auth/login (Success)
        IF v_existing_pubkey = p_public_key THEN
            UPDATE public.users SET last_seen = now() WHERE id = v_user_id;
            RETURN json_build_object(
                'id', v_user_id, 
                'username', p_username, 
                'status', 're-authenticated'
            );
        ELSE
            -- KEY MISMATCH: The username exists but the key doesn't match.
            -- We RAISE EXCEPTION so PostgREST returns a 400 error with this message.
            -- The Swift client handles this in makeRequest and shows it in the UI.
            
            -- Log for debug purposes
            INSERT INTO public.debug_logs (category, message, data) 
            VALUES ('KEY_MISMATCH', p_username, jsonb_build_object('existing', v_existing_pubkey, 'incoming', p_public_key));
            
            RAISE EXCEPTION 'Username already taken: %', p_username;
        END IF;
    END IF;

    -- NEW REGISTRATION
    INSERT INTO public.users (username, public_key) 
    VALUES (p_username, p_public_key) 
    RETURNING id INTO v_user_id;

    RETURN json_build_object(
        'id', v_user_id, 
        'username', p_username, 
        'status', 'registered'
    );
END;
$function$;
