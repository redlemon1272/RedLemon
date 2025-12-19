-- Rollback script for Global Premium Trial Feature
-- Run this in Supabase SQL Editor to remove the feature's database objects

-- 1. Drop the RPC functions
DROP FUNCTION IF EXISTS admin_create_global_trial;
DROP FUNCTION IF EXISTS get_active_global_trial;
DROP FUNCTION IF EXISTS admin_end_global_trial;

-- 2. Drop the table
DROP TABLE IF EXISTS global_premium_trials;

-- 3. (Optional) Verify cleanup
-- SELECT * FROM global_premium_trials; -- Should error
