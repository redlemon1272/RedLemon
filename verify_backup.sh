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

# Wait for healthy (Polling)
echo "$LOG_PREFIX ⏳ Waiting for DB to boot..."
MAX_TRIES=30
for i in $(seq 1 $MAX_TRIES); do
    if docker exec "$TEMP_CONTAINER_NAME" pg_isready -U postgres > /dev/null 2>&1; then
        echo "$LOG_PREFIX ✅ DB is ready."
        break
    fi
    if [ "$i" -eq "$MAX_TRIES" ]; then
         echo "$LOG_PREFIX ❌ DB failed to boot in time."
         docker rm -f "$TEMP_CONTAINER_NAME" > /dev/null
         exit 1
    fi
    sleep 1
done

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
    # 4. Data Integrity Check (Multi-Table)
    echo "$LOG_PREFIX 🔍 Verifying consistency..."
    
    # Critical Tables to Check
    TABLES=("users" "rooms" "payment_pools" "payment_transactions" "key_derivation_indices")
    
    ALL_VALID=true
    
    for table in "${TABLES[@]}"; do
        COUNT=$(docker exec "$TEMP_CONTAINER_NAME" psql -U postgres -d postgres -t -c "SELECT count(*) FROM public.$table;" 2>/dev/null)
        # Trim whitespace
        COUNT=$(echo "$COUNT" | xargs)
        
        if [[ "$COUNT" =~ ^[0-9]+$ ]]; then
            echo "$LOG_PREFIX   - $table: $COUNT rows (OK)"
        else
            echo "$LOG_PREFIX   - $table: FAILED (Could not read)"
            ALL_VALID=false
        fi
    done
    
    # We enforce that 'users' must have at least 1 row (admin/self)
    USER_COUNT=$(docker exec "$TEMP_CONTAINER_NAME" psql -U postgres -d postgres -t -c "SELECT count(*) FROM public.users;" 2>/dev/null | xargs)

    if [ "$ALL_VALID" = true ] && [ "$USER_COUNT" -gt 0 ]; then
        echo "$LOG_PREFIX ✅ Verification Successful!"
        STATUS="verified"
    else
        echo "$LOG_PREFIX ❌ Verification Failed: Data inconsistency found."
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
