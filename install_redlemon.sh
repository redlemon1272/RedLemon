#!/bin/bash

# RedLemon "Magic" Installer
# Bypasses macOS Quarantine by using curl instead of a browser.

install_redlemon() {
# 1. Define Variables
URL="https://151.243.109.243.nip.io/updates/RedLemon-latest.dmg"
DMG_PATH="/tmp/RedLemon-Installer.dmg"
MOUNT_POINT="/tmp/RedLemon-Mount"
APP_NAME="RedLemon.app"

# Determine Destination (User-specific fallback for Silicon/Read-only perms)
if [ -w "/Applications" ]; then
    DEST_DIR="/Applications"
else
    DEST_DIR="$HOME/Applications"
    mkdir -p "$DEST_DIR"
fi

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
echo -e "${BLUE}📦 Installing to $DEST_DIR...${NC}"

# Remove existing app if present
if [ -d "$DEST_DIR/$APP_NAME" ]; then
    echo "   Removing old version..."
    rm -rf "$DEST_DIR/$APP_NAME"
fi

# Use ditto to preserve extended attributes and resource forks
ditto "$MOUNT_POINT/$APP_NAME" "$DEST_DIR/$APP_NAME"

# 5. Force Finder Refresh & Metadata Cleanup
echo -e "${BLUE}🔄 Refreshing system metadata...${NC}"
# Safe Quarantine Removal (preserves ad-hoc signatures)
xattr -rd com.apple.quarantine "$DEST_DIR/$APP_NAME" 2>/dev/null || true

# Clear Finder cache bits that can cause 'Prohibited' signs
xattr -d com.apple.FinderInfo "$DEST_DIR/$APP_NAME" 2>/dev/null || true

# Aggressive refresh to clear 'Prohibited' sign and load icons
touch "$DEST_DIR/$APP_NAME"
touch "$DEST_DIR/$APP_NAME/Contents"
touch "$DEST_DIR/$APP_NAME/Contents/Info.plist"
touch "$DEST_DIR/$APP_NAME/Contents/MacOS/RedLemon"
touch "$DEST_DIR/$APP_NAME/Contents/Resources"
touch "$DEST_DIR/$APP_NAME/Contents/Resources/AppIcon.icns"

# Force Launch Services to re-register the app (The "Magic" Bullet)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f "$DEST_DIR/$APP_NAME"

# Trigger a background scan of the bundle to populate Finder cache
ls -R "$DEST_DIR/$APP_NAME" > /dev/null 2>&1

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
