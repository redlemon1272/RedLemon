-- Migration: Add Secure Auth (Public Key Infrastructure)

-- 1. Add public_key column to users table
ALTER TABLE public.users 
ADD COLUMN IF NOT EXISTS public_key text;

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS users_public_key_idx ON public.users (public_key);


-- 2. Function to verify Ed25519 signatures (Using pgSodium)
-- Enable the extension if not enabled
CREATE EXTENSION IF NOT EXISTS pgsodium;

CREATE OR REPLACE FUNCTION public.verify_request_signature(
    p_user_id uuid,
    p_signature text,
    p_timestamp text,
    p_method text,
    p_path text,
    p_body text
)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_user_public_key text;
    v_message text;
    v_valid boolean;
BEGIN
    -- 1. Get user's public key
    SELECT public_key INTO v_user_public_key FROM public.users WHERE id = p_user_id;
    
    IF v_user_public_key IS NULL THEN
        RETURN false; -- No key = Insecure account, reject signed actions
    END IF;
    
    -- 2. Reconstruct message: Timestamp + Method + Path + Body
    -- MUST MATCH CLIENT-SIDE CONSTRUCTION EXACTLY
    v_message := p_timestamp || p_method || p_path || COALESCE(p_body, '');
    
    -- 3. Verify using pgSodium
    -- pgsodium.crypto_sign_verify_detached(sig, msg, key)
    -- We need to decode Base64 signature and key to bytea
    
    -- NOTE: In a real deployment, ensure pgsodium is available and public_key is stored in a format it accepts (usually hex or bytea).
    -- If stored as Base64, decode it: decode(v_user_public_key, 'base64')
    
    BEGIN
        v_valid := pgsodium.crypto_sign_verify_detached(
            decode(p_signature, 'base64'), 
            convert_to(v_message, 'utf8'), 
            decode(v_user_public_key, 'base64')
        );
    EXCEPTION WHEN OTHERS THEN
        RETURN false; -- verification failed/crashed
    END;
    
    RETURN v_valid;
END;
$$;

-- 3. Secure Registration Function
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
    v_existing_user public.users%ROWTYPE;
BEGIN
    -- Check if username exists
    SELECT * INTO v_existing_user FROM public.users WHERE username = p_username;
    
    IF FOUND THEN
        -- If user exists but has NO public key, allow "Claiming" (First-come-first-serve for migration)
        IF v_existing_user.public_key IS NULL THEN
            UPDATE public.users 
            SET public_key = p_public_key, last_seen = now()
            WHERE id = v_existing_user.id;
            
            RETURN json_build_object(
                'id', v_existing_user.id,
                'username', v_existing_user.username,
                'status', 'claimed'
            );
        ELSE
            -- User exists AND has a key -> Fail (Username taken)
            RAISE EXCEPTION 'Username already taken by a secured account.';
        END IF;
    ELSE
        -- Create new user
        INSERT INTO public.users (username, public_key)
        VALUES (p_username, p_public_key)
        RETURNING id INTO v_user_id;
        
        RETURN json_build_object(
            'id', v_user_id,
            'username', p_username,
            'status', 'created'
        );
    END IF;
END;
$$;

-- 4. Grant Execute Permissions
GRANT EXECUTE ON FUNCTION public.register_user_secure TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.verify_request_signature TO anon, authenticated, service_role;
