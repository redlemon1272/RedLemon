-- Fix get_payment_stats to properly calculate USD values
-- ETH amounts need to be multiplied by ~3100 (current price)
-- We use a hardcoded price estimate since we don't have live feeds
-- Admin can update this periodically or we can add live price lookup later

CREATE OR REPLACE FUNCTION get_payment_stats()
RETURNS TABLE (
    total_transactions BIGINT,
    total_revenue_usd NUMERIC,
    revenue_30d NUMERIC,
    revenue_90d NUMERIC
)
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
    -- Hardcoded price estimates (update these periodically or add live lookup)
    eth_price_usd NUMERIC := 3100;
    btc_price_usd NUMERIC := 91000;
BEGIN
    RETURN QUERY
    SELECT 
        COUNT(*)::BIGINT,
        COALESCE(SUM(
            CASE 
                WHEN currency = 'ETH' THEN amount * eth_price_usd
                WHEN currency = 'BTC' THEN amount * btc_price_usd
                ELSE amount  -- Assume stablecoins are 1:1
            END
        ), 0),
        COALESCE(SUM(
            CASE WHEN created_at > NOW() - INTERVAL '30 days' THEN 
                CASE 
                    WHEN currency = 'ETH' THEN amount * eth_price_usd
                    WHEN currency = 'BTC' THEN amount * btc_price_usd
                    ELSE amount
                END
            ELSE 0 END
        ), 0),
        COALESCE(SUM(
            CASE WHEN created_at > NOW() - INTERVAL '90 days' THEN 
                CASE 
                    WHEN currency = 'ETH' THEN amount * eth_price_usd
                    WHEN currency = 'BTC' THEN amount * btc_price_usd
                    ELSE amount
                END
            ELSE 0 END
        ), 0)
    FROM payment_transactions;
END;
$$;
