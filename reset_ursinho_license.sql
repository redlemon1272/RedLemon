-- Reset hosting license for user 'ursinho' for payment testing
UPDATE users 
SET is_premium = false, 
    subscription_expires_at = NULL 
WHERE username = 'ursinho';

-- Optional: Verify the update
SELECT username, is_premium, subscription_expires_at 
FROM users 
WHERE username = 'ursinho';
