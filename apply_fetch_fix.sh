#!/bin/bash
# Applies the signature relaxation fix to the production database

MIGRATION_FILE="supabase/migrations/20260126_relax_fetch_signatures.sql"
SERVER_IP="151.243.109.243"
REMOTE_PATH="/tmp/relax_signatures.sql"

echo "🚀 Deploying fix migration to $SERVER_IP..."

# 1. SCP the file
echo "📦 Uploading migration file..."
# Use existing scp pattern from apply_fix_migration.sh (assuming password is consistent)
expect -c "spawn scp $MIGRATION_FILE root@$SERVER_IP:$REMOTE_PATH; expect \"password:\"; send \"123Scarface123!\r\"; expect eof"

# 2. Execute on DB
echo "Executiing migration..."
./remote_exec.sh "cat $REMOTE_PATH | docker exec -i supabase-db psql -U postgres postgres"

echo "✅ Fix applied!"
