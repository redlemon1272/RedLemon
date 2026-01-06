#!/bin/bash

# Configuration
BACKUP_DIR="/root/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="backup_$TIMESTAMP.sql"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform Backup
echo "Starting backup for $TIMESTAMP..."
docker exec supabase-db pg_dump -U postgres postgres > "$BACKUP_DIR/$FILENAME"

# Check if backup succeeded
if [ $? -eq 0 ]; then
  FILESIZE=$(stat -c%s "$BACKUP_DIR/$FILENAME")
  echo "✅ Backup successful: $BACKUP_DIR/$FILENAME"
  
  # Log to DB
  docker exec -i supabase-db psql -U postgres postgres -c "INSERT INTO public.backup_logs (filename, size_bytes, status) VALUES ('$FILENAME', $FILESIZE, 'pending_verification');"

  # Optional: Compress
  # Note: We verify BEFORE compression to avoid having to unzip
  
  # Trigger Verification
  /root/verify_backup.sh "$FILENAME"
  
  # If Verification Succeeded, Compress
  if [ $? -eq 0 ]; then
      gzip "$BACKUP_DIR/$FILENAME"
      echo "✅ Compressed to: $BACKUP_DIR/$FILENAME.gz"
  else
      echo "⚠️ Verification failed. Keeping uncompressed file for debugging."
  fi

else
  echo "❌ Backup failed!"
  # Log failure
  docker exec -i supabase-db psql -U postgres postgres -c "INSERT INTO public.backup_logs (filename, status) VALUES ('$FILENAME', 'failed');"
  exit 1
fi

# Cleanup: Keep only last 7 days of backups
find "$BACKUP_DIR" -type f -name "backup_*.gz" -mtime +7 -exec rm {} \;
echo "🧹 Cleaned up old backups (kept last 7 days)"
