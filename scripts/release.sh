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

# 2. Build the App
echo -e "${YELLOW}🔨 Building App...${NC}"
./start-production.sh

# 3. Package DMG
echo -e "${YELLOW}📦 Packaging DMG...${NC}"
./build-dmg.sh

# 4. Sign Update
DMG_PATH="RedLemon-Installer.dmg"
if [ ! -f "$DMG_PATH" ]; then
    echo -e "${RED}❌ DMG not found!${NC}"
    exit 1
fi

echo -e "${YELLOW}🔏 Signing Update...${NC}"
SIGNATURE=$(./.build/artifacts/sparkle/bin/sign_update "$DMG_PATH")

if [ -z "$SIGNATURE" ]; then
    echo -e "${RED}❌ Failed to sign update. Make sure the private key is in your Keychain.${NC}"
    exit 1
fi

DMG_SIZE=$(stat -f%z "$DMG_PATH")
DATE=$(date +"%a, %d %b %Y %H:%M:%S %z")

# 5. Output Appcast XML
echo ""
echo -e "${GREEN}✅ Release Built & Signed!${NC}"
echo ""
echo "---------------------------------------------------"
echo "Add this item to your appcast.xml:"
echo "---------------------------------------------------"
cat <<EOF
        <item>
            <title>Version ${VERSION}</title>
            <description><![CDATA[
                <h2>Release Notes</h2>
                <ul>
                    <li>Update details here...</li>
                </ul>
            ]]></description>
            <pubDate>${DATE}</pubDate>
            <sparkle:version>${VERSION}</sparkle:version>
            <sparkle:shortVersionString>${VERSION}</sparkle:shortVersionString>
            <sparkle:minimumSystemVersion>12.0</sparkle:minimumSystemVersion>
            <enclosure
                url="https://github.com/orangeapple1272/Redlemon/releases/download/v${VERSION}/RedLemon-Installer.dmg"
                length="${DMG_SIZE}"
                type="application/octet-stream"
                sparkle:edSignature="${SIGNATURE}"
            />
        </item>
EOF
echo "---------------------------------------------------"
echo "Next steps:"
echo "1. Commit changes and push tag v${VERSION}"
echo "2. Create GitHub Release v${VERSION}"
echo "3. Upload RedLemon-Installer.dmg to release"
echo "4. Update appcast.xml with the block above"
echo "---------------------------------------------------"
