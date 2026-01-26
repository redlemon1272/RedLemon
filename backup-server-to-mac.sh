#!/bin/bash
# =============================================================================
# RedLemon Server Backup Script (Fast Version)
# Downloads essential server data to your Mac for disaster recovery
# 
# IMPORTANT: Database is backed up via pg_dump (not file copy) for consistency
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/Desktop/RedLemon-ServerBackup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="redlemon_backup_$TIMESTAMP"

echo "🍋 RedLemon Server Backup Tool (Fast)"
echo "======================================"
echo "Backup Location: $BACKUP_DIR/$BACKUP_NAME"
echo ""

# Create backup directory
mkdir -p "$BACKUP_DIR/$BACKUP_NAME"
cd "$BACKUP_DIR/$BACKUP_NAME"

echo "📦 Step 1/5: Creating database backup on server..."
"$SCRIPT_DIR/remote_exec.sh" "docker exec supabase-db pg_dump -U postgres --clean --if-exists > /root/db_backup.sql && ls -lh /root/db_backup.sql"

echo "📥 Step 2/5: Downloading database backup (~600MB, may take a minute)..."
"$SCRIPT_DIR/remote_download.sh" "/root/db_backup.sql" "./database.sql"
echo "✅ Database: $(ls -lh database.sql 2>/dev/null | awk '{print $5}')"

echo "📥 Step 3/5: Downloading essential config files..."
# Only download the small essential files, not the whole docker/volumes
mkdir -p docker

# Get .env
"$SCRIPT_DIR/remote_download.sh" "/root/supabase/docker/.env" "./docker/.env"

# Get docker-compose.yml
"$SCRIPT_DIR/remote_download.sh" "/root/supabase/docker/docker-compose.yml" "./docker/docker-compose.yml" 2>/dev/null || true

# Get edge functions (small, essential)
"$SCRIPT_DIR/remote_exec.sh" "cd /root/supabase/docker/volumes && tar czf /root/functions_backup.tar.gz functions/"
"$SCRIPT_DIR/remote_download.sh" "/root/functions_backup.tar.gz" "./functions_backup.tar.gz"
if [ -f functions_backup.tar.gz ]; then
    tar xzf functions_backup.tar.gz -C docker/
    rm functions_backup.tar.gz
fi

# Get Caddyfile if exists
"$SCRIPT_DIR/remote_download.sh" "/root/supabase/docker/Caddyfile" "./docker/Caddyfile" 2>/dev/null || true

echo "✅ Config files downloaded"

echo "📥 Step 4/5: Downloading cron and scripts..."
"$SCRIPT_DIR/remote_exec.sh" "crontab -l > /root/crontab_backup.txt 2>/dev/null || echo '# No crontab'"
"$SCRIPT_DIR/remote_download.sh" "/root/crontab_backup.txt" "./crontab_backup.txt"
"$SCRIPT_DIR/remote_download.sh" "/root/update_disk_stats.sh" "./update_disk_stats.sh" 2>/dev/null || true

echo "📥 Step 5/5: Downloading Zilean setup scripts..."
mkdir -p zilean
"$SCRIPT_DIR/remote_download.sh" "/root/start_zilean.sh" "./zilean/start_zilean.sh" 2>/dev/null || true
"$SCRIPT_DIR/remote_download.sh" "/root/maintain_zilean.sh" "./zilean/maintain_zilean.sh" 2>/dev/null || true
"$SCRIPT_DIR/remote_download.sh" "/root/zilean_heartbeat.sh" "./zilean/zilean_heartbeat.sh" 2>/dev/null || true
echo "✅ Zilean scripts saved (binary can be rebuilt from github.com/iPromKnight/zilean)"

# Create manifest
cat > manifest.json << MANIFEST
{
  "backup_date": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "server_ip": "151.243.109.243",
  "backup_name": "$BACKUP_NAME",
  "contents": {
    "database": "database.sql (PostgreSQL dump - MOST IMPORTANT)",
    "env": "docker/.env (secrets)",
    "functions": "docker/functions/ (edge functions)",
    "crontab": "crontab_backup.txt",
    "zilean": "zilean/ (startup scripts - binary from GitHub)"
  },
  "zilean_note": "Zilean binary not backed up. Get latest from: github.com/iPromKnight/zilean",
  "restore_instructions": "Use restore-to-new-server.sh <new-ip>"
}
MANIFEST

# Cleanup server temp files
"$SCRIPT_DIR/remote_exec.sh" "rm -f /root/db_backup.sql /root/functions_backup.tar.gz /root/crontab_backup.txt" 2>/dev/null || true

# Calculate total size
TOTAL_SIZE=$(du -sh . | awk '{print $1}')

echo ""
echo "============================================"
echo "✅ BACKUP COMPLETE!"
echo "============================================"
echo "📁 Location: $BACKUP_DIR/$BACKUP_NAME"
echo "📊 Total Size: $TOTAL_SIZE"
echo ""
echo "Contents:"
ls -lh
echo ""
echo "Most important file: database.sql (contains all users, payments, streams, etc.)"
echo ""
echo "To restore to a new server:"
echo "  ./restore-to-new-server.sh <new-server-ip>"
echo ""

# Keep only last 7 backups to save space
echo "🧹 Cleaning old backups (keeping last 7)..."
ls -td "$BACKUP_DIR"/redlemon_backup_* 2>/dev/null | tail -n +8 | xargs rm -rf 2>/dev/null || true
echo "Done!"
