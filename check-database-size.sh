#!/bin/bash

# RedLemon Database Size Monitor
# Checks Supabase database size and warns if approaching limits

echo "📊 RedLemon Database Size Monitor"
echo "=================================="
echo ""

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Get Supabase credentials from Config.swift
SUPABASE_URL=$(grep 'supabaseURL' Sources/App/Config.swift | sed -n 's/.*"\(.*\)".*/\1/p')
SUPABASE_KEY=$(grep 'supabaseAnonKey' Sources/App/Config.swift | sed -n 's/.*"\(.*\)".*/\1/p')

if [ -z "$SUPABASE_URL" ] || [ -z "$SUPABASE_KEY" ]; then
    echo "❌ Could not find Supabase credentials in Config.swift"
    exit 1
fi

echo "📡 Connecting to Supabase..."
echo "   URL: $SUPABASE_URL"
echo ""

# Function to query Supabase
query_supabase() {
    local query=$1
    curl -s -X POST "${SUPABASE_URL}/rest/v1/rpc/$query" \
        -H "apikey: $SUPABASE_KEY" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $SUPABASE_KEY"
}

# Check table sizes
echo "📋 Table Sizes:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Count records in each table
echo ""
echo "🔢 Record Counts:"

for table in users rooms room_participants chat_messages webrtc_signaling watch_history friendships friend_requests user_activity; do
    count=$(curl -s "${SUPABASE_URL}/rest/v1/${table}?select=count" \
        -H "apikey: $SUPABASE_KEY" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $SUPABASE_KEY" \
        -H "Prefer: count=exact" \
        -I | grep -i "content-range" | sed -n 's/.*\/\([0-9]*\).*/\1/p')

    printf "   %-25s %s\n" "$table:" "$count records"
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Estimate database size (rough calculation)
# Average record sizes (in bytes):
# - users: ~200
# - rooms: ~500
# - room_participants: ~100
# - chat_messages: ~300 (biggest!)
# - webrtc_signaling: ~1000
# - watch_history: ~200
# - friendships: ~100
# - friend_requests: ~150
# - user_activity: ~200

users_count=$(curl -s "${SUPABASE_URL}/rest/v1/users?select=count" -H "apikey: $SUPABASE_KEY" -H "Prefer: count=exact" -I | grep -i "content-range" | sed -n 's/.*\/\([0-9]*\).*/\1/p')
rooms_count=$(curl -s "${SUPABASE_URL}/rest/v1/rooms?select=count" -H "apikey: $SUPABASE_KEY" -H "Prefer: count=exact" -I | grep -i "content-range" | sed -n 's/.*\/\([0-9]*\).*/\1/p')
chat_count=$(curl -s "${SUPABASE_URL}/rest/v1/chat_messages?select=count" -H "apikey: $SUPABASE_KEY" -H "Prefer: count=exact" -I | grep -i "content-range" | sed -n 's/.*\/\([0-9]*\).*/\1/p')

# Rough estimate (in MB)
estimated_size=$(( (users_count * 200 + rooms_count * 500 + chat_count * 300) / 1024 / 1024 ))

echo "📊 Estimated Database Size: ~${estimated_size}MB"
echo ""

# Warning thresholds
if [ $estimated_size -gt 40 ]; then
    echo -e "${RED}⚠️  WARNING: Approaching 50MB limit!${NC}"
    echo "   Consider running aggressive cleanup"
elif [ $estimated_size -gt 30 ]; then
    echo -e "${YELLOW}⚠️  CAUTION: Over 30MB used${NC}"
    echo "   Monitor closely"
else
    echo -e "${GREEN}✅ Database size healthy${NC}"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "💡 Tips:"
echo "   • Chat messages are the biggest space consumer"
echo "   • Run cleanup: Go to Supabase SQL Editor"
echo "   • Execute: SELECT run_all_cleanup();"
echo "   • Check cron jobs: SELECT * FROM cron.job;"
echo ""
echo "📖 See: docs/migrations/004_aggressive_cleanup_50mb_limit.sql"
echo ""
