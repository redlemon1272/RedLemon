-- Migration: Add hosting_streak to users
-- Description: Tracks the number of successful watch parties hosted by a user to award prestige badges.

ALTER TABLE users 
ADD COLUMN IF NOT EXISTS hosting_streak INTEGER DEFAULT 0;

-- Refresh schema cache if needed
notify pgrst, 'reload schema';
