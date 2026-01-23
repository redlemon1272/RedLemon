#!/bin/bash
# Protocol-compliant migration deployment script for Today's changes
SERVER_IP="151.243.109.243"
REMOTE_PATH="/tmp/migration.sql"

# List of migrations to deploy in order
MIGRATIONS=(
    "supabase/migrations/20260123000000_sync_premium_columns.sql"
    "supabase/migrations/20260123000500_process_payment_batch.sql"
    "supabase/migrations/20260123010000_room_creation_refund.sql"
)

for MIGRATION in "${MIGRATIONS[@]}"; do
    echo "🚀 Deploying $MIGRATION..."

    # Step 1: Securely Copy to Server (Bible Protocol)
    expect -c "spawn scp $MIGRATION root@$SERVER_IP:$REMOTE_PATH; expect \"password:\"; send \"123Scarface123!\r\"; expect eof"

    # Step 2: Execute on Database (Bible Protocol)
    ./remote_exec.sh "cat $REMOTE_PATH | docker exec -i supabase-db psql -U postgres postgres"

    echo "✅ Applied $MIGRATION"
    echo "----------------------------------------"
done

echo "🎉 All migrations for 2026-01-23 have been deployed following the AI_BIBLE protocol."
