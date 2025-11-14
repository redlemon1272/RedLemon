#!/bin/bash

# RedLemon DMG Builder
# Creates a distributable .dmg file for macOS

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}📀 RedLemon DMG Builder${NC}"
echo "======================="

# Configuration
APP_NAME="RedLemon"
BUILD_DIR="build"
DMG_DIR="dmg-build"
FINAL_DMG_NAME="RedLemon-Installer.dmg"

# Get version
VERSION=$(defaults read "$(pwd)/${BUILD_DIR}/${APP_NAME}.app/Contents/Info.plist" CFBundleShortVersionString 2>/dev/null || echo "1.0.0")
BUILD_NUMBER=$(defaults read "$(pwd)/${BUILD_DIR}/${APP_NAME}.app/Contents/Info.plist" CFBundleVersion 2>/dev/null || echo "1")

echo -e "${YELLOW}📋 Version: ${VERSION} (build ${BUILD_NUMBER})${NC}"

# Check if app exists
if [ ! -d "${BUILD_DIR}/${APP_NAME}.app" ]; then
    echo -e "${RED}❌ ${APP_NAME}.app not found in ${BUILD_DIR}/${NC}"
    echo "   Run ./start-production.sh first"
    exit 1
fi

# Clean previous builds
echo -e "${YELLOW}🧹 Cleaning previous DMG builds...${NC}"
rm -rf "${DMG_DIR}"
rm -f "${FINAL_DMG_NAME}"

# Create DMG staging directory
echo -e "${YELLOW}📁 Creating DMG structure...${NC}"
mkdir -p "${DMG_DIR}"

# Copy app to DMG directory
echo -e "${YELLOW}📦 Copying ${APP_NAME}.app...${NC}"
cp -R "${BUILD_DIR}/${APP_NAME}.app" "${DMG_DIR}/"

# Create Applications symlink for easy installation
echo -e "${YELLOW}🔗 Creating Applications shortcut...${NC}"
ln -s /Applications "${DMG_DIR}/Applications"

# Create a README
echo -e "${YELLOW}📝 Creating README...${NC}"
cat > "${DMG_DIR}/README.txt" << EOF
RedLemon v${VERSION}
==================

Installation:
1. Drag RedLemon.app to the Applications folder
2. Open RedLemon from Applications
3. If you see a security warning, go to System Preferences > Security & Privacy and click "Open Anyway"

Features:
- Stream movies and TV shows with Real-Debrid
- Watch parties with friends
- Auto-updates via Sparkle (GitHub-hosted)
- Subtitle support

Requirements:
- macOS 12.0 or later
- Real-Debrid account (https://real-debrid.com)

Support:
- Report issues on GitHub
- Join our community

Enjoy! 🍋
EOF

# Create DMG
echo -e "${YELLOW}💿 Creating DMG image...${NC}"
echo "   This may take a minute..."

hdiutil create -volname "${APP_NAME}" \
    -srcfolder "${DMG_DIR}" \
    -ov -format UDZO \
    "${FINAL_DMG_NAME}"

# Cleanup
echo -e "${YELLOW}🧹 Cleaning up temporary files...${NC}"
rm -rf "${DMG_DIR}"

# Get DMG size
DMG_SIZE=$(du -h "${FINAL_DMG_NAME}" | awk '{print $1}')

echo ""
echo -e "${GREEN}✅ DMG created successfully!${NC}"
echo ""
echo -e "${BLUE}📊 Details:${NC}"
echo "   Name: ${FINAL_DMG_NAME}"
echo "   Size: ${DMG_SIZE}"
echo "   Version: ${VERSION} (build ${BUILD_NUMBER})"
echo ""
echo -e "${BLUE}📍 Location:${NC}"
echo "   $(pwd)/${FINAL_DMG_NAME}"
echo ""
echo -e "${GREEN}🎉 Ready to distribute!${NC}"
echo ""
echo "You can now:"
echo "  1. Test: open ${FINAL_DMG_NAME}"
echo "  2. Distribute to users"
echo "  3. Upload to your website or GitHub releases"
