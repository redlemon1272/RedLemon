-- FIX: Update RLS policies to allow inserting without Supabase Auth (auth.uid())

-- 1. Drop existing policies
DROP POLICY IF EXISTS "Users can manage their own history" ON user_watch_history;
DROP POLICY IF EXISTS "Users can view own and friends history" ON user_watch_history;

-- 2. New Policy: Allow public access (INSERT/SELECT/UPDATE/DELETE)
-- Since the app uses custom auth (rpc/login_by_username) and doesn't set auth.uid(),
-- we must rely on the client providing the correct user_id.
-- In a real production app with Supabase Auth, you would use auth.uid().
-- For this "username only" auth model, we'll open it up.

CREATE POLICY "Enable read access for all users"
ON user_watch_history FOR SELECT
USING (true);

CREATE POLICY "Enable insert for all users"
ON user_watch_history FOR INSERT
WITH CHECK (true);

CREATE POLICY "Enable update for all users"
ON user_watch_history FOR UPDATE
USING (true);

-- 3. Ensure enable row level security is still on (or turn it off if preferred, but policies above control it)
ALTER TABLE user_watch_history ENABLE ROW LEVEL SECURITY;
