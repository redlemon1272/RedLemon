#!/bin/bash
# =============================================================================
# 🍋 RedLemon Wallet Rotation Protocol (Emergency & Routine)
# =============================================================================
# This script automates the safe transition from one wallet to another.
# It addresses "The Zombie Wallet Trap" (Landmine #153).
# =============================================================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🛡️  Starting Wallet Rotation Protocol...${NC}"

# 1. Inputs (Arguments)
NEW_BTC_XPUB=$1
NEW_EVM_XPUB=$2
NEW_EVM_XPRV=$3

if [[ -z "$NEW_BTC_XPUB" || -z "$NEW_EVM_XPUB" || -z "$NEW_EVM_XPRV" ]]; then
    echo -e "${RED}❌ Error: Missing arguments.${NC}"
    echo "Usage: ./rotate-wallet.sh <BTC_XPUB> <EVM_XPUB> <EVM_XPRV>"
    exit 1
fi

# 2. Update Remote .env
echo -e "${YELLOW}📝 Updating remote .env...${NC}"
./remote_exec.sh "sed -i 's/^XPUB_BTC=.*/XPUB_BTC=$NEW_BTC_XPUB/' /root/supabase/docker/.env && \
                  sed -i 's/^XPUB_EVM=.*/XPUB_EVM=$NEW_EVM_XPUB/' /root/supabase/docker/.env && \
                  sed -i 's/^XPRV_EVM=.*/XPRV_EVM=$NEW_EVM_XPRV/' /root/supabase/docker/.env"

# 3. Deep Recycle Containers
echo -e "${YELLOW}♻️  Deep recycling containers (Flush ENV)...${NC}"
./remote_exec.sh "cd /root/supabase/docker && docker compose down && docker compose up -d"

# 4. Flush Zombie Pools (Mandatory for security)
# This forces every user to generate a NEW address from the NEW wallet.
echo -e "${YELLOW}🧹 Flushing zombie payment pools...${NC}"
./remote_exec.sh "docker exec supabase-db psql -U postgres postgres -c \"\
    UPDATE key_derivation_indices SET next_index = 0; \
    DELETE FROM payment_pools; \
    ANALYZE payment_pools;\""

# 5. Smoke Test
echo -e "${BLUE}🔍 Running smoke test...${NC}"
TEST_ADDR=$(./remote_exec.sh "docker exec supabase-edge-functions env | grep XPUB_EVM")
echo -e "${GREEN}✅ Verification: Server reports $TEST_ADDR${NC}"

echo -e "\n${GREEN}✨ WALLET ROTATION COMPLETE${NC}"
echo -e "💡 Remember to update the AI_BIBLE.md with the new credentials."
