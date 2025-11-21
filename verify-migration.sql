-- Verify that season and episode columns were added to rooms table
-- This query will show the structure of the rooms table including the new columns

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'rooms'
ORDER BY ordinal_position;
