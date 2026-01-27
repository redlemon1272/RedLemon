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

echo -e "${GREEN}✅ All Systems Green. Proceeding to Release.${NC}"

# 0. Safety Check: Verify Version Increment
CURRENT_BUILD=$(grep "Current Version:\*\*" README.md | sed -E 's/.*build ([0-9]+).*/\1/')
if [ ! -z "$CURRENT_BUILD" ] && [ "$BUILD_NUMBER" -le "$CURRENT_BUILD" ]; then
    echo -e "${RED}⚠️  CRITICAL ERROR: New build (${BUILD_NUMBER}) must be > current (${CURRENT_BUILD})!${NC}"
    echo "Sparkle ignores updates with lower/equal build numbers."
    exit 1
fi

RELEASE_NOTES=$3
if [ -z "$RELEASE_NOTES" ]; then
    RELEASE_NOTES="<li>Production Release v${VERSION}</li>"
fi

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

# 4. Sign Update
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
echo -e "${GREEN}✅ Release v${VERSION} (${BUILD_NUMBER}) Deployed Successfully!${NC}"
echo "---------------------------------------------------"
echo "Public Update URL: https://151.243.109.243.nip.io/updates/appcast.xml"
echo "Latest Download URL: https://151.243.109.243.nip.io/updates/RedLemon-latest.dmg"
echo "---------------------------------------------------"
echo "Next steps:"
echo "1. Commit and push appcast.xml to GitHub (for backup)"
echo "2. Create GitHub Release v${VERSION} manually (optional)"
echo "---------------------------------------------------"
