-- FIX: Create missing user_blocks table
-- This table is required for SocialService to load friends (it first checks for blocks)

-- 1. Create table if not exists
CREATE TABLE IF NOT EXISTS user_blocks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    blocker_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    blocked_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Ensure unique block pair
    CONSTRAINT unique_block UNIQUE (blocker_id, blocked_id)
);

-- 2. Indexes
CREATE INDEX IF NOT EXISTS idx_user_blocks_blocker ON user_blocks(blocker_id);
CREATE INDEX IF NOT EXISTS idx_user_blocks_blocked ON user_blocks(blocked_id);

-- 3. RLS Policies
ALTER TABLE user_blocks ENABLE ROW LEVEL SECURITY;

-- Drop existing policies to be safe
DROP POLICY IF EXISTS "Enable read access for all users" ON user_blocks;
DROP POLICY IF EXISTS "Enable insert for all users" ON user_blocks;
DROP POLICY IF EXISTS "Enable delete for all users" ON user_blocks;

-- Allow all authenticated users to read/insert/delete (managed by app logic)
CREATE POLICY "Enable read access for all users"
ON user_blocks FOR SELECT
USING (true);

CREATE POLICY "Enable insert for all users"
ON user_blocks FOR INSERT
WITH CHECK (true);

CREATE POLICY "Enable delete for all users"
ON user_blocks FOR DELETE
USING (true);

-- 4. Enable Realtime
ALTER PUBLICATION supabase_realtime ADD TABLE user_blocks;
