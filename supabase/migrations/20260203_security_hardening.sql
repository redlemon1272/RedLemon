-- Migration: Security Hardening (Admin & Payments - Header Based)
-- Date: 2026-02-03
-- Description: Enforces Ed25519 signature verification on sensitive RPCs using headers for identity.

-- 1. Secure admin_grant_premium (Existing params)
CREATE OR REPLACE FUNCTION admin_grant_premium(
    caller_user_id UUID,
    target_username TEXT,
    days_to_add INTEGER
)
RETURNS JSON
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    caller_is_admin BOOLEAN;
    target_user_id UUID;
    current_expiry TIMESTAMPTZ;
    new_expiry TIMESTAMPTZ;
BEGIN
    -- 🔒 SECURE: Verify Signature (Uses the passed UUID)
    PERFORM verify_user_signature(caller_user_id, '/rpc/admin_grant_premium');

    -- Check if the caller is an admin
    SELECT is_admin INTO caller_is_admin FROM users WHERE id = caller_user_id;
    IF caller_is_admin IS NOT TRUE THEN
        RETURN jsonb_build_object('success', false, 'message', 'Forbidden: Admin privileges required');
    END IF;

    -- Find the target user by username
    SELECT id, subscription_expires_at INTO target_user_id, current_expiry
    FROM users WHERE username = target_username;

    IF target_user_id IS NULL THEN
        RETURN jsonb_build_object('success', false, 'message', 'User not found: ' || target_username);
    END IF;

    IF days_to_add <= 0 OR days_to_add > 36500 THEN
        RETURN jsonb_build_object('success', false, 'message', 'Invalid duration');
    END IF;

    IF current_expiry IS NOT NULL AND current_expiry > NOW() THEN
        new_expiry := current_expiry + (days_to_add || ' days')::INTERVAL;
    ELSE
        new_expiry := NOW() + (days_to_add || ' days')::INTERVAL;
    END IF;

    UPDATE users 
    SET subscription_expires_at = new_expiry, is_premium = true
    WHERE id = target_user_id;

    RETURN jsonb_build_object(
        'success', true,
        'message', 'Granted ' || days_to_add || ' days to ' || target_username
    );
END;
$$;

-- 2. Secure admin_revoke_premium (Existing params)
CREATE OR REPLACE FUNCTION public.admin_revoke_premium(caller_user_id uuid, target_username text) 
RETURNS json
LANGUAGE plpgsql 
SECURITY DEFINER
AS $$
DECLARE
    caller_is_admin BOOLEAN;
    target_user_id UUID;
BEGIN
    -- 🔒 SECURE: Verify Signature
    PERFORM verify_user_signature(caller_user_id, '/rpc/admin_revoke_premium');
    
    -- Check if the caller is an admin
    SELECT is_admin INTO caller_is_admin FROM users WHERE id = caller_user_id;
    IF caller_is_admin IS NOT TRUE THEN
        RETURN jsonb_build_object('success', false, 'message', 'Forbidden: Admin privileges required');
    END IF;
    
    -- Find the target user by username
    SELECT id INTO target_user_id FROM users WHERE username = target_username;
    IF target_user_id IS NULL THEN
        RETURN jsonb_build_object('success', false, 'message', 'User not found: ' || target_username);
    END IF;
    
    UPDATE users 
    SET is_premium = false, subscription_expires_at = NULL, premium_until = NULL
    WHERE id = target_user_id;

    RETURN jsonb_build_object('success', true, 'message', 'Premium status revoked for ' || target_username);
END;
$$;

-- 3. Secure get_all_payment_transactions (Header extraction)
CREATE OR REPLACE FUNCTION get_all_payment_transactions(
    p_limit INT DEFAULT 50,
    p_offset INT DEFAULT 0,
    p_search TEXT DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    username TEXT,
    chain TEXT,
    currency TEXT,
    amount NUMERIC,
    amount_usd NUMERIC,
    tx_hash TEXT,
    created_at TIMESTAMPTZ,
    duration_days INTEGER
)
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
    v_caller_id UUID;
    caller_is_admin BOOLEAN;
    eth_price_usd NUMERIC;
    btc_price_usd NUMERIC;
BEGIN
    -- 🔒 SECURE: Extract Caller ID from headers
    v_caller_id := (current_setting('request.headers', true)::jsonb->>'x-identity-id')::uuid;
    
    IF v_caller_id IS NULL THEN
        RAISE EXCEPTION 'Forbidden: Identity header missing';
    END IF;

    -- 🔒 SECURE: Verify Signature
    PERFORM verify_user_signature(v_caller_id, '/rpc/get_all_payment_transactions');

    -- 🔒 AUTHORIZE: Check if caller is admin
    SELECT is_admin INTO caller_is_admin FROM users WHERE id = v_caller_id;
    IF caller_is_admin IS NOT TRUE THEN
        RAISE EXCEPTION 'Forbidden: Admin privileges required';
    END IF;

    SELECT price_usd INTO eth_price_usd FROM crypto_prices WHERE symbol = 'ETH';
    SELECT price_usd INTO btc_price_usd FROM crypto_prices WHERE symbol = 'BTC';
    
    eth_price_usd := COALESCE(eth_price_usd, 3100);
    btc_price_usd := COALESCE(btc_price_usd, 91000);

    RETURN QUERY
    SELECT 
        pt.id, pt.user_id, u.username, pt.chain, pt.currency, pt.amount,
        CASE 
            WHEN pt.currency = 'ETH' THEN pt.amount * eth_price_usd
            WHEN pt.currency = 'BTC' THEN pt.amount * btc_price_usd
            ELSE pt.amount
        END AS amount_usd,
        pt.tx_hash, pt.created_at, pt.duration_days
    FROM payment_transactions pt
    LEFT JOIN users u ON u.id = pt.user_id
    WHERE 
        (p_search IS NULL OR u.username ILIKE '%' || p_search || '%' OR pt.tx_hash ILIKE '%' || p_search || '%')
    ORDER BY pt.created_at DESC
    LIMIT p_limit OFFSET p_offset;
END;
$$;

-- 4. Secure get_payment_stats (Header extraction)
CREATE OR REPLACE FUNCTION get_payment_stats()
RETURNS TABLE (
    total_transactions BIGINT,
    total_revenue_usd NUMERIC,
    revenue_30d NUMERIC,
    revenue_90d NUMERIC
)
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
    v_caller_id UUID;
    caller_is_admin BOOLEAN;
    eth_price_usd NUMERIC;
    btc_price_usd NUMERIC;
BEGIN
    -- 🔒 SECURE: Extract Caller ID from headers
    v_caller_id := (current_setting('request.headers', true)::jsonb->>'x-identity-id')::uuid;
    
    IF v_caller_id IS NULL THEN
        RAISE EXCEPTION 'Forbidden: Identity header missing';
    END IF;

    -- 🔒 SECURE: Verify Signature
    PERFORM verify_user_signature(v_caller_id, '/rpc/get_payment_stats');

    -- 🔒 AUTHORIZE: Check if caller is admin
    SELECT is_admin INTO caller_is_admin FROM users WHERE id = v_caller_id;
    IF caller_is_admin IS NOT TRUE THEN
        RAISE EXCEPTION 'Forbidden: Admin privileges required';
    END IF;

    SELECT price_usd INTO eth_price_usd FROM crypto_prices WHERE symbol = 'ETH';
    SELECT price_usd INTO btc_price_usd FROM crypto_prices WHERE symbol = 'BTC';
    
    eth_price_usd := COALESCE(eth_price_usd, 3100);
    btc_price_usd := COALESCE(btc_price_usd, 91000);

    RETURN QUERY
    SELECT 
        COUNT(*)::BIGINT,
        COALESCE(SUM(CASE WHEN currency = 'ETH' THEN amount * eth_price_usd WHEN currency = 'BTC' THEN amount * btc_price_usd ELSE amount END), 0),
        COALESCE(SUM(CASE WHEN created_at > NOW() - INTERVAL '30 days' THEN CASE WHEN currency = 'ETH' THEN amount * eth_price_usd WHEN currency = 'BTC' THEN amount * btc_price_usd ELSE amount END ELSE 0 END), 0),
        COALESCE(SUM(CASE WHEN created_at > NOW() - INTERVAL '90 days' THEN CASE WHEN currency = 'ETH' THEN amount * eth_price_usd WHEN currency = 'BTC' THEN amount * btc_price_usd ELSE amount END ELSE 0 END), 0)
    FROM payment_transactions;
END;
$$;

-- 5. Secure update_crypto_price (Header extraction)
CREATE OR REPLACE FUNCTION update_crypto_price(
    p_symbol TEXT, 
    p_price_usd NUMERIC
)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
    v_caller_id UUID;
    caller_is_admin BOOLEAN;
BEGIN
    -- 🔒 SECURE: Extract Caller ID from headers
    v_caller_id := (current_setting('request.headers', true)::jsonb->>'x-identity-id')::uuid;
    
    IF v_caller_id IS NULL THEN
        RAISE EXCEPTION 'Forbidden: Identity header missing';
    END IF;

    -- 🔒 SECURE: Verify Signature
    PERFORM verify_user_signature(v_caller_id, '/rpc/update_crypto_price');

    -- 🔒 AUTHORIZE: Check if caller is admin
    SELECT is_admin INTO caller_is_admin FROM users WHERE id = v_caller_id;
    IF caller_is_admin IS NOT TRUE THEN
        RAISE EXCEPTION 'Forbidden: Admin privileges required';
    END IF;

    INSERT INTO crypto_prices (symbol, price_usd, updated_at)
    VALUES (p_symbol, p_price_usd, NOW())
    ON CONFLICT (symbol) DO UPDATE SET 
        price_usd = p_price_usd,
        updated_at = NOW();
END;
$$;

-- Refresh schema cache
notify pgrst, 'reload schema';
