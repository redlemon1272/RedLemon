#!/bin/bash
# =============================================================================
# RedLemon Server Restore Script
# Deploys a backup to a fresh Ubuntu server (Ubuntu 22.04/24.04 recommended)
# Includes: Supabase, Edge Functions, Caddy SSL, and Zilean
# =============================================================================

set -e

# Check arguments
if [ -z "$1" ]; then
    echo "Usage: $0 <new-server-ip> [backup-folder]"
    echo ""
    echo "Examples:"
    echo "  $0 192.168.1.100                    # Uses latest backup"
    echo "  $0 192.168.1.100 redlemon_backup_20260114_120000"
    exit 1
fi

NEW_SERVER_IP="$1"
SERVER_USER="root"
SERVER_PASS="123Scarface123!"  # Default AnonVM password - CHANGE THIS!
BACKUP_BASE="$HOME/Desktop/RedLemon-ServerBackup"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find backup folder
if [ -n "$2" ]; then
    BACKUP_DIR="$BACKUP_BASE/$2"
else
    # Use most recent backup
    BACKUP_DIR=$(ls -td "$BACKUP_BASE"/redlemon_backup_* 2>/dev/null | head -1)
fi

if [ ! -d "$BACKUP_DIR" ]; then
    echo "❌ Backup not found: $BACKUP_DIR"
    echo "Available backups:"
    ls -1 "$BACKUP_BASE" 2>/dev/null || echo "  No backups found. Run backup-server-to-mac.sh first."
    exit 1
fi

echo "🍋 RedLemon Server Restore Tool"
echo "================================="
echo "New Server: $SERVER_USER@$NEW_SERVER_IP"
echo "Backup: $BACKUP_DIR"
echo ""
echo "⚠️  IMPORTANT: Update the password in this script if using a new server!"
echo ""
read -p "Continue with restore? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 1
fi

cd "$BACKUP_DIR"

# Create temporary expect script for this server
cat > /tmp/restore_exec.exp << EOF
#!/usr/bin/expect -f
set timeout 600
set password "$SERVER_PASS"
set cmd [lindex \$argv 0]
spawn ssh -o StrictHostKeyChecking=no $SERVER_USER@$NEW_SERVER_IP \$cmd
expect {
    "password:" { send "\$password\r"; exp_continue }
    eof
}
catch wait result
exit [lindex \$result 3]
EOF
chmod +x /tmp/restore_exec.exp

cat > /tmp/restore_upload.exp << EOF
#!/usr/bin/expect -f
set timeout 1200
set password "$SERVER_PASS"
set src [lindex \$argv 0]
set dest [lindex \$argv 1]
spawn scp -o StrictHostKeyChecking=no \$src $SERVER_USER@$NEW_SERVER_IP:\$dest
expect {
    "password:" { send "\$password\r"; exp_continue }
    eof
}
catch wait result
exit [lindex \$result 3]
EOF
chmod +x /tmp/restore_upload.exp

echo ""
echo "🔧 Step 1/8: Installing Docker on new server..."
/tmp/restore_exec.exp 'apt-get update && apt-get upgrade -y && curl -fsSL https://get.docker.com | sh && apt-get install -y docker-compose-plugin expect'

echo "📤 Step 2/8: Uploading Supabase configuration..."
/tmp/restore_exec.exp "mkdir -p /root/supabase/docker/volumes"
tar czf /tmp/docker_upload.tar.gz docker/
/tmp/restore_upload.exp /tmp/docker_upload.tar.gz /root/supabase/
/tmp/restore_exec.exp "cd /root/supabase && tar xzf docker_upload.tar.gz && rm docker_upload.tar.gz"
rm /tmp/docker_upload.tar.gz

echo "🐳 Step 3/8: Starting Supabase containers..."
/tmp/restore_exec.exp "cd /root/supabase/docker && docker compose pull && docker compose up -d"

echo "⏳ Step 4/8: Waiting for database to be ready (60s)..."
sleep 60

echo "📥 Step 5/8: Restoring database..."
/tmp/restore_upload.exp database.sql /root/database.sql
/tmp/restore_exec.exp "docker exec -i supabase-db psql -U postgres < /root/database.sql && rm /root/database.sql"

echo "⏰ Step 6/8: Restoring cron jobs and scripts..."
/tmp/restore_upload.exp crontab_backup.txt /root/crontab_backup.txt
/tmp/restore_upload.exp update_disk_stats.sh /root/update_disk_stats.sh 2>/dev/null || true
/tmp/restore_exec.exp "crontab /root/crontab_backup.txt 2>/dev/null || true; chmod +x /root/*.sh 2>/dev/null || true"

echo "🔧 Step 7/8: Setting up Zilean..."
if [ -d "zilean" ]; then
    /tmp/restore_upload.exp zilean/start_zilean.sh /root/start_zilean.sh 2>/dev/null || true
    /tmp/restore_upload.exp zilean/maintain_zilean.sh /root/maintain_zilean.sh 2>/dev/null || true
    /tmp/restore_upload.exp zilean/zilean_heartbeat.sh /root/zilean_heartbeat.sh 2>/dev/null || true
    /tmp/restore_exec.exp "chmod +x /root/*zilean*.sh 2>/dev/null || true"
    echo "✅ Zilean scripts restored. To complete Zilean setup:"
    echo "   1. SSH to server and run: git clone https://github.com/iPromKnight/zilean /root/zilean_src"
    echo "   2. Build and configure per Zilean docs"
fi

echo "🔒 Step 8/8: Setting up Caddy SSL proxy..."
/tmp/restore_exec.exp "cd /root/supabase/docker && docker compose restart caddy-proxy 2>/dev/null || docker run -d --name caddy-proxy --network host -v /root/supabase/docker/Caddyfile:/etc/caddy/Caddyfile caddy:2-alpine"

# Cleanup
rm -f /tmp/restore_exec.exp /tmp/restore_upload.exp

echo ""
echo "============================================"
echo "✅ RESTORE COMPLETE!"
echo "============================================"
echo ""
echo "🌐 Your new server is ready at:"
echo "   https://$NEW_SERVER_IP.nip.io"
echo ""
echo "📋 Next steps:"
echo "   1. Test the server (login, check data)"
echo "   2. Update remote_exec.sh and remote_scp.sh with new IP"
echo "   3. Update AI_BIBLE.md with new server info"
echo "   4. Set up Zilean if needed (see step 7 output)"
echo ""
echo "🔐 Supabase Studio: http://$NEW_SERVER_IP:3000"
echo ""
