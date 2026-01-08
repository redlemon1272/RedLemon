-- Admin RPC to fetch all payment transactions (bypasses RLS due to SECURITY DEFINER)
-- This is required because the RLS policy only allows users to see their OWN transactions.
CREATE OR REPLACE FUNCTION get_all_payment_transactions(
    p_limit INT DEFAULT 50,
    p_offset INT DEFAULT 0
)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    username TEXT,
    chain TEXT,
    currency TEXT,
    amount NUMERIC,
    tx_hash TEXT,
    created_at TIMESTAMPTZ
)
LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
    RETURN QUERY
    SELECT 
        pt.id, 
        pt.user_id, 
        u.username, 
        pt.chain, 
        pt.currency, 
        pt.amount, 
        pt.tx_hash, 
        pt.created_at
    FROM payment_transactions pt
    LEFT JOIN users u ON u.id = pt.user_id
    ORDER BY pt.created_at DESC
    LIMIT p_limit OFFSET p_offset;
END;
$$;

-- Admin RPC for payment stats
-- Required because standard SELECT count(*) would also be filtered by RLS
CREATE OR REPLACE FUNCTION get_payment_stats()
RETURNS TABLE (
    total_transactions BIGINT,
    total_revenue_usd NUMERIC,
    revenue_30d NUMERIC,
    revenue_90d NUMERIC
)
LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
    RETURN QUERY
    SELECT 
        COUNT(*)::BIGINT,
        COALESCE(SUM(amount), 0),
        COALESCE(SUM(CASE WHEN created_at > NOW() - INTERVAL '30 days' THEN amount ELSE 0 END), 0),
        COALESCE(SUM(CASE WHEN created_at > NOW() - INTERVAL '90 days' THEN amount ELSE 0 END), 0)
    FROM payment_transactions;
END;
$$;
