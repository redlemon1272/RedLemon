-- Migration: Atomic Payment Processing (Hardened)
-- Description: Creates a secure RPC to process detected crypto payments in a single transaction.

CREATE OR REPLACE FUNCTION public.process_payment_batch_secure(
    p_user_id UUID,
    p_transactions JSONB,
    p_days_to_add INTEGER
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    new_expiry TIMESTAMPTZ;
    current_expiry TIMESTAMPTZ;
    tx RECORD;
BEGIN
    -- 1. Validate inputs
    IF p_user_id IS NULL OR p_days_to_add <= 0 THEN
        RETURN jsonb_build_object('success', false, 'message', 'Invalid parameters');
    END IF;

    -- 2. Insert Transactions Atomic
    -- Expected JSON format: [{"payment_address": "...", "chain": "...", "currency": "...", "amount": 0.1, "tx_hash": "...", "duration_days": 30}]
    FOR tx IN SELECT * FROM jsonb_to_recordset(p_transactions) AS x(
        payment_address TEXT, 
        chain TEXT, 
        currency TEXT, 
        amount NUMERIC, 
        tx_hash TEXT, 
        duration_days INTEGER
    ) LOOP
        INSERT INTO payment_transactions (
            user_id, payment_address, chain, currency, amount, tx_hash, duration_days
        ) VALUES (
            p_user_id, tx.payment_address, tx.chain, tx.currency, tx.amount, tx.tx_hash, tx.duration_days
        ) ON CONFLICT (chain, tx_hash) DO NOTHING;
    END LOOP;

    -- 3. Calculate and Update Expiry
    SELECT subscription_expires_at INTO current_expiry
    FROM users WHERE id = p_user_id;

    IF current_expiry IS NOT NULL AND current_expiry > NOW() THEN
        new_expiry := current_expiry + (p_days_to_add || ' days')::INTERVAL;
    ELSE
        new_expiry := NOW() + (p_days_to_add || ' days')::INTERVAL;
    END IF;

    UPDATE users 
    SET subscription_expires_at = new_expiry,
        is_premium = true
    WHERE id = p_user_id;

    RETURN jsonb_build_object(
        'success', true, 
        'new_expiry', new_expiry,
        'added_days', p_days_to_add
    );

EXCEPTION WHEN OTHERS THEN
    RETURN jsonb_build_object('success', false, 'message', SQLERRM);
END;
$$;

GRANT EXECUTE ON FUNCTION public.process_payment_batch_secure TO service_role;
