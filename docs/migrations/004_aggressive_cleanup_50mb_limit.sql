-- Migration: Aggressive Cleanup for 50MB Database Limit
-- Description: Automatically delete old data to stay within free tier limits
-- Date: 2025-11-08
--
-- Supabase Free Tier: 500MB total (we're targeting 50MB for safety)
-- Strategy: Keep only recent/active data, aggressively clean old records

-- ============================================
-- 1. CHAT MESSAGES - Keep only 1 days (biggest space consumer)
-- ============================================

-- Delete chat messages older than 1 days
CREATE OR REPLACE FUNCTION cleanup_old_chat_messages()
RETURNS void AS $$
BEGIN
  DELETE FROM chat_messages
  WHERE created_at < NOW() - INTERVAL '1 days';

  RAISE NOTICE 'Cleaned up chat messages older than 1 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Run every 6 hours
SELECT cron.schedule(
  'cleanup-old-chat-messages',
  '0 */6 * * *',
  'SELECT cleanup_old_chat_messages()'
);

-- ============================================
-- 2. ROOMS - Delete inactive rooms after 12 hours
-- ============================================

CREATE OR REPLACE FUNCTION cleanup_inactive_rooms()
RETURNS void AS $$
BEGIN
  DELETE FROM rooms
  WHERE last_activity < NOW() - INTERVAL '12 hours'
  OR created_at < NOW() - INTERVAL '24 hours';

  RAISE NOTICE 'Cleaned up inactive rooms';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Run every hour
SELECT cron.schedule(
  'cleanup-inactive-rooms',
  '0 * * * *',
  'SELECT cleanup_inactive_rooms()'
);

-- ============================================
-- 3. WEBRTC SIGNALS - Keep only 30 minutes
-- ============================================

CREATE OR REPLACE FUNCTION cleanup_webrtc_signals()
RETURNS void AS $$
BEGIN
  DELETE FROM webrtc_signaling
  WHERE created_at < NOW() - INTERVAL '30 minutes';

  RAISE NOTICE 'Cleaned up WebRTC signals older than 30 minutes';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Run every 15 minutes
SELECT cron.schedule(
  'cleanup-webrtc-signals',
  '*/15 * * * *',
  'SELECT cleanup_webrtc_signals()'
);

-- ============================================
-- 4. WATCH HISTORY - Keep only last 30 days
-- ============================================

CREATE OR REPLACE FUNCTION cleanup_old_watch_history()
RETURNS void AS $$
BEGIN
  DELETE FROM watch_history
  WHERE watched_at < NOW() - INTERVAL '30 days';

  RAISE NOTICE 'Cleaned up watch history older than 30 days';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Run daily at 3 AM
SELECT cron.schedule(
  'cleanup-old-watch-history',
  '0 3 * * *',
  'SELECT cleanup_old_watch_history()'
);

-- ============================================
-- 5. INACTIVE USERS - Delete after 90 days
-- ============================================

CREATE OR REPLACE FUNCTION cleanup_inactive_users()
RETURNS void AS $$
BEGIN
  -- Delete users who haven't been seen in 90 days
  -- This will cascade delete their data due to foreign keys
  DELETE FROM users
  WHERE last_seen < NOW() - INTERVAL '90 days';

  RAISE NOTICE 'Cleaned up inactive users (90+ days)';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Run weekly on Sunday at 4 AM
SELECT cron.schedule(
  'cleanup-inactive-users',
  '0 4 * * 0',
  'SELECT cleanup_inactive_users()'
);

-- ============================================
-- 6. ORPHANED FRIEND REQUESTS - Clean rejected/old
-- ============================================

CREATE OR REPLACE FUNCTION cleanup_friend_requests()
RETURNS void AS $$
BEGIN
  -- Delete rejected requests older than 1 days
  DELETE FROM friend_requests
  WHERE status = 'rejected' AND created_at < NOW() - INTERVAL '1 days';

  -- Delete pending requests older than 30 days (expired)
  DELETE FROM friend_requests
  WHERE status = 'pending' AND created_at < NOW() - INTERVAL '30 days';

  RAISE NOTICE 'Cleaned up old friend requests';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Run daily at 2 AM
SELECT cron.schedule(
  'cleanup-friend-requests',
  '0 2 * * *',
  'SELECT cleanup_friend_requests()'
);

-- ============================================
-- 7. MASTER CLEANUP FUNCTION (run all)
-- ============================================

CREATE OR REPLACE FUNCTION run_all_cleanup()
RETURNS void AS $$
BEGIN
  PERFORM cleanup_old_chat_messages();
  PERFORM cleanup_inactive_rooms();
  PERFORM cleanup_webrtc_signals();
  PERFORM cleanup_old_watch_history();
  PERFORM cleanup_friend_requests();
  PERFORM cleanup_inactive_users();

  RAISE NOTICE '✅ All cleanup tasks completed';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================
-- 8. DATABASE SIZE MONITORING
-- ============================================

CREATE OR REPLACE FUNCTION check_database_size()
RETURNS TABLE (
  table_name TEXT,
  row_count BIGINT,
  total_size TEXT,
  data_size TEXT,
  index_size TEXT
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    relname::TEXT AS table_name,
    n_tup_ins AS row_count,
    pg_size_pretty(pg_total_relation_size(relid)) AS total_size,
    pg_size_pretty(pg_relation_size(relid)) AS data_size,
    pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) AS index_size
  FROM pg_stat_user_tables
  ORDER BY pg_total_relation_size(relid) DESC;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Usage: SELECT * FROM check_database_size();
-- This helps monitor which tables are using the most space

-- ============================================
-- RETENTION POLICY SUMMARY
-- ============================================

-- Chat Messages:      1 days     (cleaned every 6 hours)
-- Rooms:              12-24 hours (cleaned hourly)
-- WebRTC Signals:     30 minutes  (cleaned every 15 min)
-- Watch History:      30 days     (cleaned daily)
-- Friend Requests:    7-30 days   (cleaned daily)
-- Inactive Users:     90 days     (cleaned weekly)

-- ============================================
-- TO APPLY THIS MIGRATION
-- ============================================

-- 1. Go to Supabase Dashboard → SQL Editor
-- 2. Copy and paste this entire script
-- 3. Click "Run"
-- 4. Verify: SELECT * FROM cron.job; (should see 6 scheduled jobs)
-- 5. Test: SELECT run_all_cleanup(); (runs all cleanup tasks immediately)
-- 6. Monitor: SELECT * FROM check_database_size(); (see table sizes)

-- ============================================
-- NOTES
-- ============================================

-- These aggressive cleanup policies ensure you stay within 50MB:
-- - Chat messages are the biggest space consumer (text heavy)
-- - Rooms are temporary by nature (12-24 hour lifecycle)
-- - WebRTC signals are ephemeral (only needed during connection)
-- - Watch history kept for reasonable time (1 month)
-- - Inactive users cleaned after 3 months (fair retention)

-- If you still hit limits, further reduce:
-- - Chat: 3 days instead of 7
-- - Rooms: 6 hours instead of 12
-- - Watch History: 14 days instead of 30
