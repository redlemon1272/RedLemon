#!/bin/bash
# Applies the user last seen fix migration to the production database

MIGRATION_FILE="supabase/migrations/20260122100000_user_last_seen_fix.sql"
SERVER_IP="151.243.109.243"
REMOTE_PATH="/tmp/user_last_seen_fix.sql"

echo "🚀 Deploying last seen fix to $SERVER_IP..."

# 1. SCP the file
echo "📦 Uploading migration file..."
expect -c "spawn scp $MIGRATION_FILE root@$SERVER_IP:$REMOTE_PATH; expect \"password:\"; send \"123Scarface123!\r\"; expect eof"

# 2. Execute on DB
echo "Executing migration..."
./remote_exec.sh "cat $REMOTE_PATH | docker exec -i supabase-db psql -U postgres postgres"

# 3. Reload PostgREST Cache
echo "🔄 Reloading PostgREST schema cache..."
./remote_exec.sh "docker exec -i supabase-db psql -U postgres postgres -c \"NOTIFY pgrst, 'reload schema';\""

echo "✅ Last seen fix applied!"
