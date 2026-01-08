-- Drop the old definition of the function which only had 2 arguments.
-- This resolves ambiguity/overloading issues so PostgREST uses the new 3-argument function (with default) for all calls.
DROP FUNCTION IF EXISTS get_all_payment_transactions(INT, INT);

-- Ensure the new function (from previous migration) is definitely there and correct.
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
    tx_hash TEXT,
    created_at TIMESTAMPTZ,
    duration_days INTEGER
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
        pt.created_at,
        pt.duration_days
    FROM payment_transactions pt
    LEFT JOIN users u ON u.id = pt.user_id
    WHERE 
        (p_search IS NULL OR u.username ILIKE '%' || p_search || '%')
    ORDER BY pt.created_at DESC
    LIMIT p_limit OFFSET p_offset;
END;
$$;
