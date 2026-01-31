-- Migration to backfill recovery_hash for existing users
-- This ensures all existing accounts get a recovery phrase

-- For existing users without a recovery_hash, we'll need to generate one
-- Since we can't generate the phrase itself in SQL, we'll leave recovery_hash NULL
-- The app will detect this and prompt the user to generate their phrase on next login

-- This is already handled by the previous migration (006_monetization_schema.sql)
-- which added the recovery_hash column with NULL as default

-- The app logic should:
-- 1. On app start, check if current user has recovery_hash
-- 2. If NULL, show "Generate Recovery Phrase" modal
-- 3. Generate phrase, hash it, update database
-- 4. Show BackupPhraseView to user

-- No SQL changes needed, this is handled client-side
