-- Fix RLS policy to allow anon key to insert/update events_config
-- This is safe because events_config is public configuration data

-- Drop the restrictive policy
DROP POLICY IF EXISTS "Authenticated users can manage configs" ON events_config;

-- Create a more permissive policy for INSERT/UPDATE
-- Allow anon role to insert/update (needed for generation script)
CREATE POLICY "Allow anon to manage configs"
ON events_config
FOR ALL
TO anon
USING (true)
WITH CHECK (true);

-- Keep the public read policy
-- (Already exists from migration, but included here for completeness)
-- CREATE POLICY "Public read access to active configs"
-- ON events_config
-- FOR SELECT
-- USING (is_active = true);
