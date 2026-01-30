#!/bin/bash

# RedLemon Bootstrap Installer
# Installs the latest version of RedLemon directly from the official source.

set -e

# Configuration
DOWNLOAD_URL="https://github.com/redlemon1272/RedLemon/releases/latest/download/RedLemon.dmg"
APP_NAME="RedLemon.app"
TEMP_DMG="/tmp/RedLemon-Installer.dmg"
MOUNT_POINT="/Volumes/RedLemon"

# Determine Destination (User-specific fallback for Silicon/Read-only perms)
if [ -w "/Applications" ]; then
    INSTALL_DIR="/Applications"
else
    INSTALL_DIR="$HOME/Applications"
    mkdir -p "$INSTALL_DIR"
fi

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🍋 RedLemon Installer${NC}"
echo "--------------------------------"

# 1. Download
echo -e "${BLUE}⬇️  Downloading latest version...${NC}"
curl -f -L -o "$TEMP_DMG" "$DOWNLOAD_URL" --progress-bar

# 2. Mount
echo -e "${BLUE}💿 Mounting disk image...${NC}"
hdiutil attach "$TEMP_DMG" -mountpoint "$MOUNT_POINT" -quiet -nobrowse

# 3. Install
echo -e "${BLUE}📦 Installing to $INSTALL_DIR...${NC}"
if [ -d "$INSTALL_DIR/$APP_NAME" ]; then
    echo "   Removing previous version..."
    rm -rf "$INSTALL_DIR/$APP_NAME"
fi

# Use ditto to preserve extended attributes and resource forks (crucial for icons/Gatekeeper)
ditto "$MOUNT_POINT/$APP_NAME" "$INSTALL_DIR/$APP_NAME"

# 4. Force Finder Refresh & Metadata Cleanup (The "Clinical" Detail)
echo -e "${BLUE}🔄 Refreshing system metadata...${NC}"
# Safe Quarantine Removal (preserves ad-hoc signatures)
xattr -rd com.apple.quarantine "$INSTALL_DIR/$APP_NAME" 2>/dev/null || true

# Clear Finder cache bits that can cause 'Prohibited' signs
xattr -d com.apple.FinderInfo "$INSTALL_DIR/$APP_NAME" 2>/dev/null || true

# Aggressive refresh to clear 'Prohibited' sign and load icons
touch "$INSTALL_DIR/$APP_NAME"
touch "$INSTALL_DIR/$APP_NAME/Contents"
touch "$INSTALL_DIR/$APP_NAME/Contents/Info.plist"
touch "$INSTALL_DIR/$APP_NAME/Contents/MacOS/RedLemon"
touch "$INSTALL_DIR/$APP_NAME/Contents/Resources"
touch "$INSTALL_DIR/$APP_NAME/Contents/Resources/AppIcon.icns"

# Force Launch Services to re-register the app (The "Magic" Bullet)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f "$INSTALL_DIR/$APP_NAME"

# Trigger a background scan of the bundle to populate Finder cache
ls -R "$INSTALL_DIR/$APP_NAME" > /dev/null 2>&1

# 5. Cleanup
echo -e "${BLUE}🧹 Cleaning up...${NC}"
hdiutil detach "$MOUNT_POINT" -quiet
rm "$TEMP_DMG"

echo -e "${GREEN}✅ Installed Successfully!${NC}"
echo "   Find RedLemon in your Applications folder."
open "$INSTALL_DIR"
