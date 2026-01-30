-- ============================================
-- ADMIN DASHBOARD SETUP
-- ============================================

-- 1. Add Admin Flag to Users
ALTER TABLE users ADD COLUMN IF NOT EXISTS is_admin BOOLEAN DEFAULT FALSE;

-- 2. Create App Logs Table (for remote error reporting)
CREATE TABLE IF NOT EXISTS app_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    level TEXT NOT NULL CHECK (level IN ('DEBUG', 'INFO', 'WARNING', 'ERROR')),
    message TEXT NOT NULL,
    stack_trace TEXT,
    version TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Index for fast querying by time and level
CREATE INDEX IF NOT EXISTS idx_app_logs_created_at ON app_logs(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_app_logs_level ON app_logs(level);

-- 3. Create Analytics Events Table
CREATE TABLE IF NOT EXISTS analytics_events (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    event_name TEXT NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_analytics_events_name ON analytics_events(event_name);
CREATE INDEX IF NOT EXISTS idx_analytics_events_time ON analytics_events(created_at DESC);

-- ============================================
-- RLS POLICIES (Security)
-- ============================================

-- Enable RLS
ALTER TABLE app_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE analytics_events ENABLE ROW LEVEL SECURITY;

-- Policy: Users can insert their own logs/events
-- Policy: Users can insert their own logs/events
DROP POLICY IF EXISTS "Users can insert own logs" ON app_logs;
CREATE POLICY "Users can insert own logs" 
ON app_logs FOR INSERT 
WITH CHECK (auth.uid() = user_id OR user_id IS NULL);

DROP POLICY IF EXISTS "Users can insert own analytics" ON analytics_events;
CREATE POLICY "Users can insert own analytics" 
ON analytics_events FOR INSERT 
WITH CHECK (auth.uid() = user_id OR user_id IS NULL);

-- Policy: Only Admins can view logs/events
-- Note: This requires the user to have is_admin = TRUE in the users table
DROP POLICY IF EXISTS "Admins can view all logs" ON app_logs;
CREATE POLICY "Admins can view all logs" 
ON app_logs FOR SELECT 
USING (
    EXISTS (
        SELECT 1 FROM users 
        WHERE id = auth.uid() AND is_admin = TRUE
    )
);

DROP POLICY IF EXISTS "Admins can view all analytics" ON analytics_events;
CREATE POLICY "Admins can view all analytics" 
ON analytics_events FOR SELECT 
USING (
    EXISTS (
        SELECT 1 FROM users 
        WHERE id = auth.uid() AND is_admin = TRUE
    )
);

-- ============================================
-- CLEANUP (Maintenance)
-- ============================================

-- Auto-delete logs older than 30 days
CREATE OR REPLACE FUNCTION cleanup_old_logs()
RETURNS void AS $$
BEGIN
  DELETE FROM app_logs WHERE created_at < NOW() - INTERVAL '30 days';
  DELETE FROM analytics_events WHERE created_at < NOW() - INTERVAL '90 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Schedule it (requires pg_cron)
-- Schedule it (requires pg_cron extension to be enabled)
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_cron') THEN
    PERFORM cron.schedule(
      'cleanup-logs',
      '0 4 * * *', -- Runs daily at 4 AM
      'SELECT cleanup_old_logs()'
    );
  END IF;
END $$;
