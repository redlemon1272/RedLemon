-- 1. Switch from Boolean to Timestamp for Subscriptions
ALTER TABLE users ADD COLUMN IF NOT EXISTS subscription_expires_at TIMESTAMPTZ DEFAULT NULL;

-- 2. Create Key Derivation Indices table (for HD Wallet Tracking)
CREATE TABLE IF NOT EXISTS key_derivation_indices (
    chain TEXT PRIMARY KEY, -- 'btc', 'evm', 'sol'
    next_index INT NOT NULL DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed initial derivation indices
INSERT INTO key_derivation_indices (chain, next_index) VALUES
('btc', 0),
('evm', 0),
('sol', 0)
ON CONFLICT DO NOTHING;

-- 3. Modify payment_pools to store derived path (optional but useful)
ALTER TABLE payment_pools ADD COLUMN IF NOT EXISTS derivation_path_index INT;

-- 4. RLS for new table
ALTER TABLE key_derivation_indices ENABLE ROW LEVEL SECURITY;

-- Service Role (Edge Function) has full access
DROP POLICY IF EXISTS "Service role has full access to indices" ON key_derivation_indices;
CREATE POLICY "Service role has full access to indices" 
ON key_derivation_indices FOR ALL 
TO service_role 
USING (true);

-- No public access
DROP POLICY IF EXISTS "No public access to indices" ON key_derivation_indices;
CREATE POLICY "No public access to indices" 
ON key_derivation_indices FOR ALL 
TO anon, authenticated 
USING (false);

-- 5. Enforce Room Limits (Free Tier constraint)
CREATE OR REPLACE FUNCTION check_room_creation_limits()
RETURNS TRIGGER AS $$
BEGIN
  -- Check if user is premium
  IF (SELECT subscription_expires_at FROM users WHERE id = auth.uid()) > NOW() THEN
    RETURN NEW; -- Premium user, allow
  END IF;

  -- Check active rooms (created in last 72h). 
  -- Note: We count rooms created recently as "active". OLD rooms don't count against limit.
  IF (SELECT COUNT(*) FROM rooms WHERE host_user_id = auth.uid() AND created_at > NOW() - INTERVAL '72 hours') >= 1 THEN
    RAISE EXCEPTION 'Free Tier Limit: You can only host 1 active room at a time.';
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop trigger if exists to allow idempotent runs
DROP TRIGGER IF EXISTS enforce_room_limit ON rooms;

CREATE TRIGGER enforce_room_limit
BEFORE INSERT ON rooms
FOR EACH ROW
EXECUTE FUNCTION check_room_creation_limits();

-- 6. Enforce 72-Hour Limit (Visibility/Access)
-- Old rooms from Free users become invisible (Archived/Locked)
-- Note: Requires enabling RLS on rooms if not already enabled.
ALTER TABLE rooms ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public can view active rooms" ON rooms;
CREATE POLICY "Public can view active rooms"
ON rooms FOR SELECT
USING (
  -- Room is recent ( < 72h )
  (created_at > NOW() - INTERVAL '72 hours') 
  OR 
  -- OR Host is Premium
  ((SELECT subscription_expires_at FROM users WHERE id = host_user_id) > NOW())
);
