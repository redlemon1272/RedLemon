-- Migration: Enable Admin Deletion for Feedback and Logs
-- Date: 2025-12-16

-- 1. Allow deletion of Feedback Reports
CREATE POLICY "Admins can delete feedback" 
ON feedback_reports FOR DELETE 
USING (true);

-- 2. Allow deletion of Session Logs
CREATE POLICY "Admins can delete logs" 
ON session_logs FOR DELETE 
USING (true);
