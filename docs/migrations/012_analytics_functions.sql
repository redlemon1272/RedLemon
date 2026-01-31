-- ============================================
-- ANALYTICS FUNCTIONS
-- ============================================

-- 1. App Version Stats
-- Aggregates logs to find unique versions and their usage count
CREATE OR REPLACE FUNCTION get_app_version_stats()
RETURNS TABLE (version text, count bigint) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    l.version, 
    COUNT(*) as count
  FROM app_logs l
  WHERE l.version IS NOT NULL
  GROUP BY l.version
  ORDER BY count DESC;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Content Popularity (Leaderboard)
-- Aggregates room history to find most watched content
-- Note: This assumes we have enough history in 'rooms' or 'analytics_events'
-- For now, we'll query the 'rooms' table for current/recent popularity
CREATE OR REPLACE FUNCTION get_content_popularity()
RETURNS TABLE (title text, type text, count bigint) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    r.name as title,
    CASE 
      WHEN r.season IS NOT NULL THEN 'series' 
      ELSE 'movie' 
    END as type,
    COUNT(*) as count
  FROM rooms r
  WHERE r.name IS NOT NULL
  GROUP BY r.name, r.season
  ORDER BY count DESC
  LIMIT 10;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant access
GRANT EXECUTE ON FUNCTION get_app_version_stats() TO anon, authenticated, service_role;
GRANT EXECUTE ON FUNCTION get_content_popularity() TO anon, authenticated, service_role;
