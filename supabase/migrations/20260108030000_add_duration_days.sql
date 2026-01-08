-- Add duration_days column to payment_transactions to track subscription length
ALTER TABLE payment_transactions ADD COLUMN IF NOT EXISTS duration_days INTEGER;

-- Optional: Set default or update existing records if needed. 
-- For now we leave them null or can update manually.
