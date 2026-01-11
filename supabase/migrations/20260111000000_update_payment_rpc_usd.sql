-- Update Admin RPC to return calculated USD value
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
    amount_usd NUMERIC, -- New column
    tx_hash TEXT,
    created_at TIMESTAMPTZ,
    duration_days INTEGER
)
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
    eth_price_usd NUMERIC;
    btc_price_usd NUMERIC;
BEGIN
    -- Fetch prices (Optimization: Could cache or join, but this is simple)
    SELECT price_usd INTO eth_price_usd FROM crypto_prices WHERE symbol = 'ETH';
    SELECT price_usd INTO btc_price_usd FROM crypto_prices WHERE symbol = 'BTC';
    
    eth_price_usd := COALESCE(eth_price_usd, 3100);
    btc_price_usd := COALESCE(btc_price_usd, 91000);

    RETURN QUERY
    SELECT 
        pt.id, 
        pt.user_id, 
        u.username, 
        pt.chain, 
        pt.currency, 
        pt.amount,
        -- Dynamic USD Calculation
        CASE 
            WHEN pt.currency = 'ETH' THEN pt.amount * eth_price_usd
            WHEN pt.currency = 'BTC' THEN pt.amount * btc_price_usd
            ELSE pt.amount -- Stablecoins
        END AS amount_usd,
        pt.tx_hash, 
        pt.created_at,
        pt.duration_days
    FROM payment_transactions pt
    LEFT JOIN users u ON u.id = pt.user_id
    WHERE 
        (p_search IS NULL OR u.username ILIKE '%' || p_search || '%' OR pt.tx_hash ILIKE '%' || p_search || '%')
    ORDER BY pt.created_at DESC
    LIMIT p_limit OFFSET p_offset;
END;
$$;
