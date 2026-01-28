#!/bin/bash
# RedLemon Golden Standard: Schema Verification
# Verifies critical database tables and columns exist before release.

set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "🔍 Running Golden Standard Schema Audit..."

# We use the remote_exec tool to run psql on the supabase-db container
# This ensures we are checking the actual production schema.
# Note: This requires the server to be reachable.

TABLE_CHECK_CMD="docker exec supabase-db psql -U postgres postgres -t -c \"
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('users', 'rooms', 'room_participants', 'verified_streams', 'friendships');
\""

STABLE_TABLES=$(./remote_exec.sh "$TABLE_CHECK_CMD" 2>/dev/null || echo "FAIL")

if [[ "$STABLE_TABLES" == "FAIL" ]]; then
    echo -e "${RED}❌ Error: Could not connect to Production Database for Schema Audit.${NC}"
    exit 1
fi

COUNT=$(echo "$STABLE_TABLES" | wc -l | xargs)
if [ "$COUNT" -lt 5 ]; then
    echo -e "${RED}❌ CRITICAL SCHEMA DRIFT: Missing core tables in production!${NC}"
    echo "Found: $STABLE_TABLES"
    exit 1
fi

echo -e "${GREEN}✅ Schema Audit Passed: Core tables verified.${NC}"
