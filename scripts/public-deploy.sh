#!/bin/bash
set -e

# RedLemon Public Deployment Automation
# This script orchestrates the full sync and push to the public repository.

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

PUBLIC_REPO_ROOT="../RedLemon-Public"

echo -e "${BLUE}🚀 Starting RedLemon Public Deployment...${NC}"

# 1. Run the Scrubber (The Sanitization Layer)
echo -e "${BLUE}🧹 Running Sanitization Scrubber...${NC}"
./scripts/sync-to-public.sh

# 2. Prepare Public Repo
cd "$PUBLIC_REPO_ROOT"

# Check if we have a PAT set in environment
if [ -z "$GH_PAT" ]; then
    echo -e "${YELLOW}⚠️  Warning: GH_PAT environment variable not set.${NC}"
    echo "Falling back to standard git authentication (Keychain)."
else
    echo -e "${BLUE}🔐 Using GitHub PAT for authentication...${NC}"
    git remote set-url origin "https://redlemon1272:$GH_PAT@github.com/redlemon1272/RedLemon.git"
fi

# 3. Git Ceremony with Identity Masking
echo -e "${BLUE}📦 Committing changes as public identity...${NC}"
git add .

# CRITICAL OPSEC: Explicitly override author and committer to prevent private identity leakage
# We use the GitHub-provided no-reply email for the public owner.
public_name="RedLemon"
public_email="redlemon1272@users.noreply.github.com"

git -c user.name="$public_name" \
    -c user.email="$public_email" \
    commit --author="$public_name <$public_email>" \
    -m "chore: automated security sync and opsec hardening" || echo "No changes to commit"

echo -e "${BLUE}📤 Pushing to GitHub...${NC}"
# Use --force to ensure the scrubbed history is the only history available
git push origin main --force

echo -e "${GREEN}✅ Public Deployment Successful!${NC}"
echo "RedLemon is now live and sanitized."
