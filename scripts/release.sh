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

if [ -z "$VERSION" ] || [ -z "$BUILD_NUMBER" ]; then
    echo "Usage: ./scripts/release.sh <version> <build_number>"
    echo "Example: ./scripts/release.sh 1.0.15 15"
    exit 1
fi

echo -e "${BLUE}🚀 Starting Release Flow for v${VERSION} (${BUILD_NUMBER})...${NC}"

# 1. Update Version in build script
echo -e "${YELLOW}📝 Updating version in build-app-debug.sh...${NC}"
sed -i '' "s/APP_VERSION=\".*\"/APP_VERSION=\"${VERSION}\"/" build-app-debug.sh
sed -i '' "s/APP_BUILD=\".*\"/APP_BUILD=\"${BUILD_NUMBER}\"/" build-app-debug.sh

# 1.5. Update Version in README.md
echo -e "${YELLOW}📝 Updating version in README.md...${NC}"
sed -i '' "s/Current Version:** v.* (build .*)/Current Version:** v${VERSION} (build ${BUILD_NUMBER})/" README.md

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
                    <li>Production Release v${VERSION}</li>
                </ul>
            ]]></description>
            <pubDate>${DATE_APPC}</pubDate>
            <sparkle:version>${VERSION}</sparkle:version>
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

echo ""
echo -e "${GREEN}✅ Release v${VERSION} (${BUILD_NUMBER}) Deployed Successfully!${NC}"
echo "---------------------------------------------------"
echo "Public Update URL: https://151.243.109.243.nip.io/updates/appcast.xml"
echo "---------------------------------------------------"
echo "Next steps:"
echo "1. Commit and push appcast.xml to GitHub (for backup)"
echo "2. Create GitHub Release v${VERSION} manually (optional)"
echo "---------------------------------------------------"
