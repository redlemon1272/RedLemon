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
  echo "✅ Backup successful: $BACKUP_DIR/$FILENAME"
  # Optional: Compress
  gzip "$BACKUP_DIR/$FILENAME"
  echo "✅ Compressed to: $BACKUP_DIR/$FILENAME.gz"
else
  echo "❌ Backup failed!"
  exit 1
fi

# Cleanup: Keep only last 7 days of backups
find "$BACKUP_DIR" -type f -name "backup_*.gz" -mtime +7 -exec rm {} \;
echo "🧹 Cleaned up old backups (kept last 7 days)"
