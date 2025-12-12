-- Add is_premium column to users table
ALTER TABLE users ADD COLUMN IF NOT EXISTS is_premium BOOLEAN DEFAULT FALSE;

-- Create payment_pools table
CREATE TABLE IF NOT EXISTS payment_pools (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    chain TEXT NOT NULL CHECK (chain IN ('btc', 'evm', 'sol')),
    address TEXT NOT NULL UNIQUE,
    status TEXT NOT NULL DEFAULT 'available' CHECK (status IN ('available', 'assigned', 'used')),
    assigned_to_user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    assigned_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraint: An address can only be assigned to one user at a time
    CONSTRAINT unique_assignment UNIQUE (chain, address)
);

-- Index for finding available addresses quickly
CREATE INDEX IF NOT EXISTS idx_payment_pools_available 
ON payment_pools(chain, status) 
WHERE status = 'available';

-- Index for finding a user's currently assigned address
CREATE INDEX IF NOT EXISTS idx_payment_pools_user_assignment
ON payment_pools(assigned_to_user_id)
WHERE status = 'assigned';

-- Create payment_transactions table (Log of all payments)
CREATE TABLE IF NOT EXISTS payment_transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id),
    chain TEXT NOT NULL,
    currency TEXT NOT NULL, -- 'BTC', 'ETH', 'USDC'
    amount NUMERIC NOT NULL,
    tx_hash TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Prevent double-counting the same transaction
    CONSTRAINT unique_tx_hash UNIQUE (chain, tx_hash)
);

-- RLS Policies

-- payment_pools:
-- Users can read ONLY their assigned address
ALTER TABLE payment_pools ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their assigned address" 
ON payment_pools FOR SELECT 
TO authenticated 
USING (assigned_to_user_id = auth.uid());

-- Service Role (Admin/Edge Function) has full access
CREATE POLICY "Service role has full access to pools" 
ON payment_pools FOR ALL 
TO service_role 
USING (true);


-- payment_transactions:
-- Users can view their own transaction history
ALTER TABLE payment_transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own transactions" 
ON payment_transactions FOR SELECT 
TO authenticated 
USING (user_id = auth.uid());

-- RPC: Atomic Address Assignment
-- Finds an available address for the given chain, locks it, and assigns it to the user.
CREATE OR REPLACE FUNCTION assign_payment_address(p_chain TEXT, p_user_id UUID)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    v_address TEXT;
    v_pool_id UUID;
    v_expires_at TIMESTAMPTZ;
BEGIN
    -- 1. Check if user already has an active assignment for this chain
    SELECT address, id INTO v_address, v_pool_id
    FROM payment_pools
    WHERE assigned_to_user_id = p_user_id 
      AND chain = p_chain
      AND status = 'assigned';
      
    -- If they do, just return it (idempotency)
    IF v_address IS NOT NULL THEN
        RETURN jsonb_build_object(
            'success', true,
            'address', v_address,
            'message', 'Existing assignment found'
        );
    END IF;

    -- 2. Find and Lock a free address (SKIP LOCKED is key for concurrency)
    SELECT id, address INTO v_pool_id, v_address
    FROM payment_pools
    WHERE chain = p_chain 
      AND status = 'available'
    LIMIT 1
    FOR UPDATE SKIP LOCKED; -- Locks the row so other txns skip it

    -- 3. If no address found, return error
    IF v_pool_id IS NULL THEN
        RETURN jsonb_build_object(
            'success', false,
            'error', 'No available addresses in pool. Please contact support.'
        );
    END IF;

    -- 4. Assign it
    v_expires_at := NOW() + INTERVAL '24 hours';
    
    UPDATE payment_pools
    SET status = 'assigned',
        assigned_to_user_id = p_user_id,
        assigned_at = NOW()
    WHERE id = v_pool_id;

    RETURN jsonb_build_object(
        'success', true,
        'address', v_address,
        'expires_at', v_expires_at
    );
END;
$$;

-- SEED DATA (MOCK ADDRESSES FOR TESTING)
-- In production, you would upload thousands of these.
INSERT INTO payment_pools (chain, address) VALUES
('btc', 'bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh'), 
('btc', 'bc1gwq49q7j290432dfjkl2490f2490f2390f2490f'),
('evm', '0x71C7656EC7ab88b098defB751B7401B5f6d8976F'),
('evm', '0x2546BcD3c84621e976D8185a91A922aE77ECEc30'),
('sol', 'HN7cABmqD8aa3iT46X9X2390fja093fja0923fja09f')
ON CONFLICT DO NOTHING;
