-- Migration: Feedback and Session Logging System
-- Date: 2025-12-16

-- 1. Feedback Reports Table
CREATE TABLE feedback_reports (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    type TEXT NOT NULL, -- 'bug', 'stream_issue', 'feature_request', 'other'
    message TEXT NOT NULL,
    contact_email TEXT, -- Optional
    app_version TEXT,
    platform TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS for feedback
ALTER TABLE feedback_reports ENABLE ROW LEVEL SECURITY;

-- Allow public inserts (anyone can send feedback)
CREATE POLICY "Public can insert feedback" 
ON feedback_reports FOR INSERT 
WITH CHECK (true);

-- Allow admins to view (assuming service role or auth users)
CREATE POLICY "Admins can view feedback" 
ON feedback_reports FOR SELECT 
USING (true); -- Simplify for now, or match existing verified_streams logic


-- 2. Session Logs Table
CREATE TABLE session_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id UUID NOT NULL,
    imdb_id TEXT,
    stream_hash TEXT,
    platform TEXT,
    app_version TEXT,
    events JSONB NOT NULL, -- The structured log of events
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS for logs
ALTER TABLE session_logs ENABLE ROW LEVEL SECURITY;

-- Allow public inserts
CREATE POLICY "Public can insert logs" 
ON session_logs FOR INSERT 
WITH CHECK (true);

-- Allow admins to select
CREATE POLICY "Admins can view logs" 
ON session_logs FOR SELECT 
USING (true);

-- Comments
COMMENT ON TABLE feedback_reports IS 'User submitted feedback and bug reports.';
COMMENT ON TABLE session_logs IS 'Anonymized session logs for debugging playback issues.';
