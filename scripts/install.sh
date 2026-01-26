#!/bin/bash

# RedLemon Magic Installer
# Installs the latest version of RedLemon directly from the official source.

set -e

# Configuration
DOWNLOAD_URL="https://github.com/redlemon1272/RedLemon/releases/download/v1.0.157/RedLemon-v1.0.157.dmg"
APP_NAME="RedLemon.app"
INSTALL_DIR="/Applications"
TEMP_DMG="/tmp/RedLemon-Installer.dmg"
MOUNT_POINT="/Volumes/RedLemon"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🍋 RedLemon Installer${NC}"
echo "--------------------------------"

# 1. Download
echo -e "${BLUE}⬇️  Downloading latest version...${NC}"
curl -L -o "$TEMP_DMG" "$DOWNLOAD_URL" --progress-bar

# 2. Mount
echo -e "${BLUE}💿 Mounting disk image...${NC}"
hdiutil attach "$TEMP_DMG" -mountpoint "$MOUNT_POINT" -quiet -nobrowse

# 3. Install
echo -e "${BLUE}📦 Installing to Applications...${NC}"
if [ -d "$INSTALL_DIR/$APP_NAME" ]; then
    echo "   Removing previous version..."
    rm -rf "$INSTALL_DIR/$APP_NAME"
fi

cp -R "$MOUNT_POINT/$APP_NAME" "$INSTALL_DIR/"

# 4. Cleanup
echo -e "${BLUE}🧹 Cleaning up...${NC}"
hdiutil detach "$MOUNT_POINT" -quiet
rm "$TEMP_DMG"

# 5. Quarantine Bypass (Critical for UX)
echo -e "${BLUE}🔓 Applying Anti-Gravity Protocol...${NC}"
xattr -rd com.apple.quarantine "$INSTALL_DIR/$APP_NAME" 2>/dev/null || true

echo -e "${GREEN}✅ Installed Successfully!${NC}"
echo "   Find RedLemon in your Applications folder."
open "$INSTALL_DIR"
