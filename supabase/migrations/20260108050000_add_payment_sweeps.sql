-- Create table to log payment sweeps
CREATE TABLE IF NOT EXISTS payment_sweeps (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    from_address TEXT NOT NULL,
    to_address TEXT NOT NULL,
    chain TEXT NOT NULL,
    amount TEXT NOT NULL,
    tx_hash TEXT,
    user_id UUID REFERENCES users(id),
    status TEXT DEFAULT 'pending',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for querying by user
CREATE INDEX IF NOT EXISTS idx_payment_sweeps_user_id ON payment_sweeps(user_id);

-- Add derivation_index column to payment_pools if missing
ALTER TABLE payment_pools ADD COLUMN IF NOT EXISTS derivation_index INTEGER;
