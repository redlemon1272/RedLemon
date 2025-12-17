-- Revoke premium status from everyone EXCEPT 'lemontom'
UPDATE users
SET subscription_expires_at = NULL
WHERE username != 'lemontom';

-- Ensure lemontom has premium (just in case)
UPDATE users
SET subscription_expires_at = NOW() + INTERVAL '100 years'
WHERE username = 'lemontom' AND (subscription_expires_at IS NULL OR subscription_expires_at < NOW());
