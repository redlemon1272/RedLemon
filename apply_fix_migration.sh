#!/bin/bash
# Applies the hosting streak removal fix to the production database

MIGRATION_FILE="supabase/migrations/20260118200000_fix_admin_grant_premium.sql"
SERVER_IP="151.243.109.243"
REMOTE_PATH="/tmp/fix_admin_grant.sql"

echo "🚀 Deploying fix migration to $SERVER_IP..."

# 1. SCP the file
echo "📦 Uploading migration file..."
expect -c "spawn scp $MIGRATION_FILE root@$SERVER_IP:$REMOTE_PATH; expect \"password:\"; send \"123Scarface123!\r\"; expect eof"

# 2. Execute on DB
echo "Executiing migration..."
./remote_exec.sh "cat $REMOTE_PATH | docker exec -i supabase-db psql -U postgres postgres"

echo "✅ Fix applied!"
