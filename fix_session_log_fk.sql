-- Fix Session Log Deletion FK
-- Created: 2026-01-10

-- Drop existing constraint
ALTER TABLE public.feedback_reports
DROP CONSTRAINT IF EXISTS feedback_reports_session_log_id_fkey;

-- Add new constraint with ON DELETE CASCADE
ALTER TABLE public.feedback_reports
ADD CONSTRAINT feedback_reports_session_log_id_fkey
FOREIGN KEY (session_log_id)
REFERENCES public.session_logs(id)
ON DELETE CASCADE;

-- Verify
-- No output needed, if it runs it works.
