#!/bin/bash

# Configuration
BACKUP_DIR="/root/backups"
LOG_PREFIX="[VERIFY]"
TEMP_CONTAINER_NAME="verify_restore_$(date +%s)"

# Arguments
BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
    echo "$LOG_PREFIX ❌ Error: No backup file specified."
    exit 1
fi

FULL_PATH="$BACKUP_DIR/$BACKUP_FILE"

if [ ! -f "$FULL_PATH" ]; then
    echo "$LOG_PREFIX ❌ Error: File not found: $FULL_PATH"
    exit 1
fi

echo "$LOG_PREFIX 🧪 Starting verification for: $BACKUP_FILE"

# 1. Start Temporary Postgres Container
# We use the same image as production to ensure compatibility
echo "$LOG_PREFIX 🚀 Starting temporary container..."
docker run -d --name "$TEMP_CONTAINER_NAME" \
  -e POSTGRES_PASSWORD=verify_temp_pass \
  postgres:15.1-alpine 

# Wait for healthy
echo "$LOG_PREFIX ⏳ Waiting for DB to boot..."
sleep 10

# 2. Copy Backup to Container
echo "$LOG_PREFIX 📦 Copying backup..."
docker cp "$FULL_PATH" "$TEMP_CONTAINER_NAME":/tmp/backup.sql

# 3. Perform Restore
echo "$LOG_PREFIX 🔄 Restoring (this might take a moment)..."
# We ignore errors initially to capture the output, but we check exit code
docker exec "$TEMP_CONTAINER_NAME" psql -U postgres -d postgres -f /tmp/backup.sql > /dev/null 2>&1
RESTORE_EXIT_CODE=$?

if [ $RESTORE_EXIT_CODE -ne 0 ]; then
    echo "$LOG_PREFIX ❌ Restore command failed (Exit Code: $RESTORE_EXIT_CODE)"
    STATUS="restore_failed"
else
    # 4. Data Integrity Check
    echo "$LOG_PREFIX 🔍 Verifying data..."
    # Check if users table has data
    USER_COUNT=$(docker exec "$TEMP_CONTAINER_NAME" psql -U postgres -d postgres -t -c "SELECT count(*) FROM public.users;")
    
    # Trim whitespace
    USER_COUNT=$(echo "$USER_COUNT" | xargs)
    
    if [[ "$USER_COUNT" =~ ^[0-9]+$ ]] && [ "$USER_COUNT" -gt 0 ]; then
        echo "$LOG_PREFIX ✅ Verification Successful! User Count: $USER_COUNT"
        STATUS="verified"
    else
        echo "$LOG_PREFIX ❌ Verification Failed: User count is invalid ($USER_COUNT)"
        STATUS="verification_failed"
    fi
fi

# 5. Cleanup
echo "$LOG_PREFIX 🧹 Cleaning up container..."
docker rm -f "$TEMP_CONTAINER_NAME" > /dev/null

# 6. Update Production Log
echo "$LOG_PREFIX 📝 Updating log status to '$STATUS'..."
docker exec -i supabase-db psql -U postgres postgres -c "UPDATE public.backup_logs SET status = '$STATUS' WHERE filename = '$BACKUP_FILE';"

if [ "$STATUS" == "verified" ]; then
    exit 0
else
    exit 1
fi
