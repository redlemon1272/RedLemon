-- FIX: Point foreign key to public.users instead of auth.users
-- The app uses custom username-based auth stored in 'public.users', not Supabase Auth 'auth.users'.

-- 1. Drop the incorrect foreign key
ALTER TABLE user_watch_history
DROP CONSTRAINT IF EXISTS user_watch_history_user_id_fkey;

-- 2. Add the correct foreign key referencing public.users
ALTER TABLE user_watch_history
ADD CONSTRAINT user_watch_history_user_id_fkey
FOREIGN KEY (user_id) REFERENCES public.users(id)
ON DELETE CASCADE;

-- 3. (Optional) Re-apply RLS just in case (previous script should have handled it, but being safe)
DROP POLICY IF EXISTS "Enable insert for all users" ON user_watch_history;
CREATE POLICY "Enable insert for all users"
ON user_watch_history FOR INSERT
WITH CHECK (true);
