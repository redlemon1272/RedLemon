#!/bin/bash

# RedLemon "Magic" Installer
# Bypasses macOS Quarantine by using curl instead of a browser.

install_redlemon() {
# 1. Define Variables
URL="https://151.243.109.243.nip.io/updates/RedLemon-latest.dmg"
DMG_PATH="/tmp/RedLemon-Installer.dmg"
MOUNT_POINT="/tmp/RedLemon-Mount"
APP_NAME="RedLemon.app"
DEST_DIR="/Applications"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🍋 RedLemon Magic Installer${NC}"
echo "-----------------------------------"

# 2. Download
echo -e "${BLUE}⬇️  Downloading RedLemon...${NC}"
curl -L -o "$DMG_PATH" "$URL" --progress-bar

if [ ! -f "$DMG_PATH" ]; then
    echo "❌ Download failed."
    exit 1
fi

# 3. Mount DMG
echo -e "${BLUE}💿 Mounting Disk Image...${NC}"
hdiutil attach "$DMG_PATH" -mountpoint "$MOUNT_POINT" -quiet -nobrowse

# 4. Install
echo -e "${BLUE}📦 Installing to /Applications...${NC}"

# Remove existing app if present
if [ -d "$DEST_DIR/$APP_NAME" ]; then
    echo "   Removing old version..."
    rm -rf "$DEST_DIR/$APP_NAME"
fi

# Copy new app
cp -R "$MOUNT_POINT/$APP_NAME" "$DEST_DIR/"

# 5. NUCLEAR OPTION: Remove Quarantine Attributes
# This is technically redundant because curl doesn't set them, 
# but we do it to be absolutely certain.
echo -e "${BLUE}🛡️  Removing Quarantine Attributes...${NC}"
xattr -cr "$DEST_DIR/$APP_NAME"

# 6. Cleanup
echo -e "${BLUE}🧹 Cleaning up...${NC}"
hdiutil detach "$MOUNT_POINT" -quiet
rm "$DMG_PATH"

# 7. Launch
echo -e "${GREEN}✅ Installation Complete! Launching RedLemon...${NC}"
open "$DEST_DIR/$APP_NAME"

echo ""
echo "Enjoy your stream! 🍿"
}

# Run the installer
install_redlemon
