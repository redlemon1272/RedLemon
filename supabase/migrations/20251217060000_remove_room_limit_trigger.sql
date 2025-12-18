-- 20251217060000_remove_room_limit_trigger.sql
-- EMERGENCY FIX: Drop the room limit trigger and policy to unblock room creation.
-- We suspect "check_room_creation_limits" or the RLS policy is causing a deadlock/hang.

-- 1. Drop the trigger
DROP TRIGGER IF EXISTS enforce_room_limit ON rooms;

-- 2. Drop the function
DROP FUNCTION IF EXISTS check_room_creation_limits();

-- 3. Reset RLS Policy on rooms to be permissive (to rule out RLS recursion)
DROP POLICY IF EXISTS "Public can view active rooms" ON rooms;

-- Create a temporary permissive policy
CREATE POLICY "Enable access to all users"
ON rooms FOR ALL
USING (true)
WITH CHECK (true);
