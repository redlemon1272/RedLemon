-- FIX: Allow all users to read public user profiles (required for Friend List sync with custom auth)

-- 1. Drop restrictve policies
DROP POLICY IF EXISTS "Enable read access for all users" ON public.users;
DROP POLICY IF EXISTS "Public profiles are viewable by everyone" ON public.users;
DROP POLICY IF EXISTS "Users can view their own profile" ON public.users;

-- 2. Create permissive SELECT policy
CREATE POLICY "Enable read access for all users"
ON public.users FOR SELECT
USING (true);

-- 3. Ensure RLS is enabled (but permissive for select)
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
