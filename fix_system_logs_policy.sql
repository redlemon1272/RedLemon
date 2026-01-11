-- Fix System Logs Deletion Permissions
-- Created: 2026-01-10

-- 1. Ensure RLS is enabled
ALTER TABLE public.system_job_logs ENABLE ROW LEVEL SECURITY;

-- 2. Drop existing delete policy if it exists
DROP POLICY IF EXISTS "Allow admins to delete" ON public.system_job_logs;

-- 3. Create Policy for Deletion
CREATE POLICY "Allow admins to delete"
ON public.system_job_logs
FOR DELETE
USING (
  auth.uid() IN (
    SELECT id FROM public.users WHERE is_admin = true
  )
);

-- 4. Grant DELETE permission to authenticated users (RLS will enforce the admin check)
GRANT DELETE ON public.system_job_logs TO authenticated;
GRANT DELETE ON public.system_job_logs TO service_role;
