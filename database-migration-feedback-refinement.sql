-- Migration: Add session_log_id to feedback_reports
-- Links a feedback report to a specific session log

ALTER TABLE public.feedback_reports
ADD COLUMN session_log_id uuid REFERENCES public.session_logs(id);

-- Add index for quicker lookups
CREATE INDEX idx_feedback_reports_session_log_id ON public.feedback_reports(session_log_id);
