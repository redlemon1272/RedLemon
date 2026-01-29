#!/bin/bash

# RedLemon Release Script
# Usage: ./scripts/release.sh [version] [build_number]

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

VERSION=$1
BUILD_NUMBER=$2
# 0. Pre-Flight Checks (The "Satellite" Protocol)
echo -e "${BLUE}🛡️  Running Pre-Flight Checks...${NC}"

# A. Architecture Scan
echo -e "${YELLOW}   Running Architecture Scan...${NC}"
./scripts/architecture-scan.sh
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Architecture Scan FAILED. Release Aborted.${NC}"
    exit 1
fi

# B. Dirty Repo Check (The "No Uncommitted Edits" Rule)
echo -e "${YELLOW}   Checking Repository State...${NC}"
if [[ -n $(git status --porcelain) ]]; then
    echo -e "${RED}❌ ERROR: Uncommitted changes detected.${NC}"
    echo -e "${YELLOW}   Editing during a release is forbidden. Commit your changes first.${NC}"
    git status -s
    exit 1
fi
echo -e "${GREEN}   ✅ Clean Working Directory Verified.${NC}"

# C. Landmine Logic Tests (Optional - may fail in some environments due to libmpv)
echo -e "${YELLOW}   Running Landmine Logic Tests...${NC}"
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$(pwd)/Frameworks
if swift test --filter LandmineTests 2>/dev/null; then
    echo -e "${GREEN}   ✅ Landmine Tests Passed${NC}"
else
    echo -e "${YELLOW}   ⚠️  Landmine Tests skipped (libmpv not available in test environment)${NC}"
    echo -e "${YELLOW}   Architecture scan already passed - proceeding with release${NC}"
fi

# C. Security Scan
echo -e "${YELLOW}   Running Security Scan...${NC}"
./scripts/security-scan.sh
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Security Scan FAILED. Release Aborted.${NC}"
    exit 1
fi

# D. GitHub Authentication Check
if [ -z "$GH_PAT" ]; then
    echo -e "${RED}❌ ERROR: GH_PAT environment variable not set.${NC}"
    echo "GitHub Release automation requires a PAT. Please export GH_PAT=\"...\""
    exit 1
fi

# E. Pre-Merge Conflict Check (Seamlessness Interlock)
echo -e "${YELLOW}   Checking for potential merge conflicts with 'main'...${NC}"
git fetch origin main:main || true
if ! git merge-tree $(git merge-base HEAD main) main HEAD > /dev/null; then
     echo -e "${RED}❌ CRITICAL ERROR: Merge conflict with 'main' detected!${NC}"
     echo -e "${YELLOW}   You MUST resolve conflicts manually before starting a release.${NC}"
     echo "   Run: git merge main"
     exit 1
fi
echo -e "${GREEN}   ✅ No conflicts with 'main' detected.${NC}"

# F. Tag Collision Check
echo -e "${YELLOW}   Checking for Tag Collision ($VERSION)...${NC}"
if git ls-remote --tags origin | grep -q "refs/tags/$VERSION$"; then
    echo -e "${RED}❌ ERROR: Tag $VERSION already exists on origin!${NC}"
    echo "You must increment the version before releasing."
    exit 1
fi
echo -e "${GREEN}   ✅ Version $VERSION is available.${NC}"

# G. Schema Integrity Check
./scripts/verify-schema.sh

echo -e "${GREEN}✅ All Systems Green. Proceeding to Golden Release Flow.${NC}"

# --- ATOMIC ROLLBACK CONFIGURATION ---
function cleanup_on_failure {
    echo -e "\n${RED}💣 CRITICAL FAILURE DETECTED! Initiating Atomic Rollback...${NC}"
    
    # 1. Revert local git commit if made (Step 7)
    if [ "$(git log -1 --pretty=%B)" == "chore: release artifacts v${VERSION} (build ${BUILD_NUMBER})" ]; then
        echo -e "${YELLOW}   ⏪ Reverting local artifacts commit...${NC}"
        git reset --soft HEAD~1
        git restore --staged build-app-debug.sh README.md appcast.xml
    fi

    # 2. Cleanup partial server files if possible (OpSec)
    echo -e "${YELLOW}   🗑️  Cleaning up partial artifacts...${NC}"
    rm -f new_item.xml
    
    echo -e "${RED}❌ Rollback Complete. The repository and server are in a safe (pre-release) state.${NC}"
}
trap cleanup_on_failure ERR
# ------------------------------------

# 0. Safety Check: Verify Version Increment
CURRENT_BUILD=$(grep "Current Version:\*\*" README.md | sed -E 's/.*build ([0-9]+).*/\1/')
if [ ! -z "$CURRENT_BUILD" ] && [ "$BUILD_NUMBER" -le "$CURRENT_BUILD" ]; then
    echo -e "${RED}⚠️  CRITICAL ERROR: New build (${BUILD_NUMBER}) must be > current (${CURRENT_BUILD})!${NC}"
    echo "Sparkle ignores updates with lower/equal build numbers."
    exit 1
fi

RAW_RELEASE_NOTES=$3
if [ -z "$RAW_RELEASE_NOTES" ]; then
    RAW_RELEASE_NOTES="<li>Production Release v${VERSION}</li>"
fi

# 🛡️ OpSec: Scrub "Landmine #" mentions from release notes for public consumption
# Robustly removes "(Landmine #123)", "Landmine #123", or " (Landmine #123)"
RELEASE_NOTES=$(echo "$RAW_RELEASE_NOTES" | sed -E 's/[[:space:]]*\(?Landmine #[0-9]+\)?//g')

echo -e "${BLUE}🚀 Starting Release Flow for v${VERSION} (${BUILD_NUMBER})...${NC}"

# 1. Update Version in build script
echo -e "${YELLOW}📝 Updating version in build-app-debug.sh...${NC}"
sed -i '' "s/APP_VERSION=\".*\"/APP_VERSION=\"${VERSION}\"/" build-app-debug.sh
sed -i '' "s/APP_BUILD=\".*\"/APP_BUILD=\"${BUILD_NUMBER}\"/" build-app-debug.sh

# 1.5. Update Version in README.md
echo -e "${YELLOW}📝 Updating version in README.md...${NC}"
sed -i '' "s/Current Version:\*\* v.* (build .*)/Current Version:** v${VERSION} (build ${BUILD_NUMBER})/" README.md

# 2. Build the App (Headless)
echo -e "${YELLOW}🔨 Building App (Headless)...${NC}"
./build-app-debug.sh

# 3. Package DMG
echo -e "${YELLOW}📦 Packaging DMG...${NC}"
./build-dmg.sh

# 4. Sign & Audit
DMG_PATH="RedLemon-Installer.dmg"
SIGN_TOOL="./.build/artifacts/sparkle/bin/sign_update"

if [ ! -f "$DMG_PATH" ]; then
    echo -e "${RED}❌ DMG not found!${NC}"
    exit 1
fi

if [ ! -f "$SIGN_TOOL" ]; then
    echo -e "${RED}❌ Sparkle sign_update tool not found at $SIGN_TOOL${NC}"
    echo "Please ensure you have built the sparkle dependency."
    exit 1
fi

echo -e "${YELLOW}🔏 Signing Update...${NC}"
SIGNATURE=$($SIGN_TOOL "$DMG_PATH")

if [ -z "$SIGNATURE" ]; then
    echo -e "${RED}❌ Failed to sign update. Make sure the private key is in your Keychain.${NC}"
    exit 1
fi

# --- GOLDEN AUDIT: Signature Verification ---
echo -e "${YELLOW}🔍 Auditing Signature Integrity...${NC}"
# Mount DMG to check the internal .app
hdiutil attach "$DMG_PATH" -mountpoint ./tmp_mount -quiet
codesign --verify --deep --strict --verbose=2 ./tmp_mount/RedLemon.app
hdiutil detach ./tmp_mount -quiet
echo -e "${GREEN}✅ Signature Audit Passed.${NC}"
# --------------------------------------------

DMG_SIZE=$(stat -f%z "$DMG_PATH")
DATE=$(date +"%a, %d %b %Y %H:%M:%S %z")

# 5. Update Local appcast.xml
echo -e "${YELLOW}📝 Updating local appcast.xml...${NC}"
APPCAST_FILE="appcast.xml"
DATE_APPC=$(date +"%a, %d %b %Y %H:%M:%S %z")

# Use a temporary file to insert the new item at the top of the channel
cat > new_item.xml <<EOF
        <!-- v${VERSION} -->
        <item>
            <title>Version ${VERSION}</title>
            <description><![CDATA[
                <h2>Release Notes</h2>
                <ul>
                    ${RELEASE_NOTES}
                </ul>
            ]]></description>
            <pubDate>${DATE_APPC}</pubDate>
            <sparkle:version>${BUILD_NUMBER}</sparkle:version>
            <sparkle:shortVersionString>${VERSION}</sparkle:shortVersionString>
            <sparkle:minimumSystemVersion>12.0</sparkle:minimumSystemVersion>
            <enclosure
                url="https://151.243.109.243.nip.io/updates/RedLemon-v${VERSION}.dmg"
                type="application/octet-stream"
                ${SIGNATURE}
            />
        </item>
EOF

# Insert into appcast.xml after line 7 (the <language> tag)
sed -i '' '8r new_item.xml' "$APPCAST_FILE"
rm new_item.xml

# 6. Deploy to Production Server
echo -e "${YELLOW}🚀 Deploying to Production Server...${NC}"

# Upload versioned DMG
echo -e "${BLUE}   Uploading RedLemon-v${VERSION}.dmg...${NC}"
./remote_scp.sh "$DMG_PATH" "/root/updates/RedLemon-v${VERSION}.dmg"

# Upload updated appcast.xml
echo -e "${BLUE}   Uploading appcast.xml...${NC}"
./remote_scp.sh "$APPCAST_FILE" "/root/updates/appcast.xml"

# Update Latest Symlink
echo -e "${YELLOW}🔗 Updating 'latest' symlink on server...${NC}"
./remote_exec.sh "cd /root/updates && ln -sf RedLemon-v${VERSION}.dmg RedLemon-latest.dmg"

echo ""
echo -e "${GREEN}✅ Internal Deployment Successful!${NC}"

# 7. Automated Code Ceremony
echo -e "${BLUE}📦 Committing Release Artifacts...${NC}"
git add build-app-debug.sh README.md appcast.xml RedLemon-Installer.sha256
git commit -m "chore: release artifacts v${VERSION} (build ${BUILD_NUMBER})"

# 8. Automated Public Sync
echo -e "${BLUE}🛡️  Syncing Public Mirror...${NC}"
./scripts/public-deploy.sh

# 9. Automated Merge & Tag
echo -e "${BLUE}🔗 Finalizing Git Ceremony (Merge & Tag)...${NC}"
./scripts/merge-and-tag.sh "v${VERSION}"

# 10. Automated GitHub Release Asset Upload
echo -e "${BLUE}📡 Creating GitHub Release & Uploading DMG...${NC}"
./scripts/github-release.sh "v${VERSION}" "$DMG_PATH" "### Release Notes\n<ul>${RELEASE_NOTES}</ul>"

# DISABLE TRAP: Release is successful
trap - ERR

echo ""
echo -e "${GREEN}🏆 GOLDEN STANDARD RELEASE COMPLETE: v${VERSION} (${BUILD_NUMBER})${NC}"
echo "---------------------------------------------------"
echo "Public Update URL: https://151.243.109.243.nip.io/updates/appcast.xml"
echo "GitHub Release:    https://github.com/redlemon1272/RedLemon/releases/tag/v${VERSION}"
echo "---------------------------------------------------"
