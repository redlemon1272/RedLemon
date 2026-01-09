-- Add daily sweep-payments cron job
-- Runs at 9:00 AM UTC daily, same time as server backups

SELECT cron.schedule(
    'sweep-payments',
    '10 9 * * *',
    $$SELECT net.http_post(
        'http://supabase-edge-functions:8000/sweep-payments',
        '{}'::JSONB,
        'application/json',
        '{}'::JSONB,
        60000
    )$$
);

-- Comment: This sweeps funds from per-user derived addresses to the master wallet
-- It checks all chains (Base, Ethereum, Arbitrum, Optimism, Polygon)
-- Only sweeps if balance > 0.0005 ETH (~$1.50) to avoid wasting gas on dust
-- Logs all sweeps to payment_sweeps table
