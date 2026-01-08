-- Add live crypto price tracking
-- Prices are stored in a table and updated by Edge Function or cron

-- 1. Create table to store current prices
CREATE TABLE IF NOT EXISTS crypto_prices (
    symbol TEXT PRIMARY KEY,          -- 'ETH', 'BTC'
    price_usd NUMERIC NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert default values (will be updated by cron/edge function)
INSERT INTO crypto_prices (symbol, price_usd) VALUES 
    ('ETH', 3100),
    ('BTC', 91000)
ON CONFLICT (symbol) DO NOTHING;

-- 2. Create function to update prices (called by Edge Function)
CREATE OR REPLACE FUNCTION update_crypto_price(p_symbol TEXT, p_price_usd NUMERIC)
RETURNS VOID
LANGUAGE plpgsql SECURITY DEFINER AS $$
BEGIN
    INSERT INTO crypto_prices (symbol, price_usd, updated_at)
    VALUES (p_symbol, p_price_usd, NOW())
    ON CONFLICT (symbol) DO UPDATE SET 
        price_usd = p_price_usd,
        updated_at = NOW();
END;
$$;

-- 3. Update get_payment_stats to use live prices from table
CREATE OR REPLACE FUNCTION get_payment_stats()
RETURNS TABLE (
    total_transactions BIGINT,
    total_revenue_usd NUMERIC,
    revenue_30d NUMERIC,
    revenue_90d NUMERIC
)
LANGUAGE plpgsql SECURITY DEFINER AS $$
DECLARE
    eth_price_usd NUMERIC;
    btc_price_usd NUMERIC;
BEGIN
    -- Fetch current prices from table
    SELECT price_usd INTO eth_price_usd FROM crypto_prices WHERE symbol = 'ETH';
    SELECT price_usd INTO btc_price_usd FROM crypto_prices WHERE symbol = 'BTC';
    
    -- Fallback to defaults if prices not found
    eth_price_usd := COALESCE(eth_price_usd, 3100);
    btc_price_usd := COALESCE(btc_price_usd, 91000);

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
