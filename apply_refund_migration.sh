#!/bin/bash
# Applies the room creation refund grace period to the production database
MIGRATION_FILE="supabase/migrations/20260123010000_room_creation_refund.sql"
SERVER_IP="151.243.109.243"
REMOTE_PATH="/tmp/room_refund.sql"

echo "🚀 Deploying room refund migration to $SERVER_IP..."

# 1. SCP the file
echo "📦 Uploading migration file..."
expect -c "spawn scp $MIGRATION_FILE root@$SERVER_IP:$REMOTE_PATH; expect \"password:\"; send \"123Scarface123!\r\"; expect eof"

# 2. Execute on DB
echo "🏗️ Executing migration on remote database..."
./remote_exec.sh "cat $REMOTE_PATH | docker exec -i supabase-db psql -U postgres postgres"

echo "✅ Refund policy applied! Users now have a 30-minute grace period."
