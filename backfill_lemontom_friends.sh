#!/bin/bash

# Backfill lemontom friendships for all existing users
# This adds lemontom as a friend to all users who don't already have this friendship

SUPABASE_URL="https://nhvsojszwfvcinkyvzmf.supabase.co"
ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5odnNvanN6d2Z2Y2lua3l2em1mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI1NjE5MTYsImV4cCI6MjA3ODEzNzkxNn0.1u8C04lu1r_Jsy7m8bdGD-dT33Ml1EautcPNib93bWw"

echo "🍋 Backfilling lemontom friendships..."
echo ""

# Get lemontom's ID
LEMONTOM_ID=$(curl -s "${SUPABASE_URL}/rest/v1/users?select=id&username=eq.lemontom" \
  -H "apikey: ${ANON_KEY}" \
  -H "Authorization: Bearer ${ANON_KEY}" | \
  grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -z "$LEMONTOM_ID" ]; then
  echo "❌ Error: lemontom user not found"
  exit 1
fi

echo "✅ Found lemontom (ID: ${LEMONTOM_ID})"
echo ""

# Get all users except lemontom
ALL_USERS=$(curl -s "${SUPABASE_URL}/rest/v1/users?select=id,username&username=neq.lemontom" \
  -H "apikey: ${ANON_KEY}" \
  -H "Authorization: Bearer ${ANON_KEY}")

# Parse user IDs and usernames
USER_COUNT=$(echo "$ALL_USERS" | grep -o '"id"' | wc -l | tr -d ' ')
echo "📊 Found ${USER_COUNT} users (excluding lemontom)"
echo ""

# Extract IDs using grep and process each
echo "$ALL_USERS" | grep -o '"id":"[^"]*","username":"[^"]*"' | while IFS= read -r line; do
  USER_ID=$(echo "$line" | grep -o '"id":"[^"]*"' | cut -d'"' -f4)
  USERNAME=$(echo "$line" | grep -o '"username":"[^"]*"' | cut -d'"' -f4)
  
  echo "Processing user: ${USERNAME} (${USER_ID})"
  
  # Check if friendship already exists
  EXISTING=$(curl -s "${SUPABASE_URL}/rest/v1/friendships?select=id&or=(and(user_id_1.eq.${USER_ID},user_id_2.eq.${LEMONTOM_ID}),and(user_id_1.eq.${LEMONTOM_ID},user_id_2.eq.${USER_ID}))" \
    -H "apikey: ${ANON_KEY}" \
    -H "Authorization: Bearer ${ANON_KEY}")
  
  if echo "$EXISTING" | grep -q '"id"'; then
    echo "  ⏭️  Already friends with lemontom, skipping"
  else
    # Create friendship (user -> lemontom)
    curl -s -X POST "${SUPABASE_URL}/rest/v1/friendships" \
      -H "apikey: ${ANON_KEY}" \
      -H "Authorization: Bearer ${ANON_KEY}" \
      -H "Content-Type: application/json" \
      -H "Prefer: return=minimal" \
      -d "{\"user_id_1\":\"${USER_ID}\",\"user_id_2\":\"${LEMONTOM_ID}\",\"status\":\"accepted\"}" > /dev/null
    
    # Create friendship (lemontom -> user)
    curl -s -X POST "${SUPABASE_URL}/rest/v1/friendships" \
      -H "apikey: ${ANON_KEY}" \
      -H "Authorization: Bearer ${ANON_KEY}" \
      -H "Content-Type: application/json" \
      -H "Prefer: return=minimal" \
      -d "{\"user_id_1\":\"${LEMONTOM_ID}\",\"user_id_2\":\"${USER_ID}\",\"status\":\"accepted\"}" > /dev/null
    
    echo "  ✅ Added lemontom as friend"
  fi
  echo ""
done

echo "🎉 Backfill complete!"
