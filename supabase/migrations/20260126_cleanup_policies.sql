-- Cleanup Legacy Policies on user_watch_history
DROP POLICY IF EXISTS "Enable insert for all users" ON public.user_watch_history;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.user_watch_history;
DROP POLICY IF EXISTS "Enable update for all users" ON public.user_watch_history;
