-- FIX: Update room_participants RLS policies to allow public access
-- This fixes the error: new row violates row-level security policy for table "room_participants"

-- 1. Ensure RLS is enabled
ALTER TABLE room_participants ENABLE ROW LEVEL SECURITY;

-- 2. Drop existing restrictive policies
DROP POLICY IF EXISTS "Enable all access for participants" ON room_participants;
DROP POLICY IF EXISTS "Users can manage their own participation" ON room_participants;
DROP POLICY IF EXISTS "Hosts can manage room participants" ON room_participants;

-- 3. Create open policies (matching the app's custom auth model)
CREATE POLICY "Enable read access for all"
ON room_participants FOR SELECT
USING (true);

CREATE POLICY "Enable insert for all"
ON room_participants FOR INSERT
WITH CHECK (true);

CREATE POLICY "Enable update for all"
ON room_participants FOR UPDATE
USING (true)
WITH CHECK (true);

CREATE POLICY "Enable delete for all"
ON room_participants FOR DELETE
USING (true);
