#!/bin/bash

# RedLemon DMG Builder
# Creates a distributable .dmg file for macOS
# Part of the Release Workflow documented in AI_BIBLE.md Part 11

set -e

# Colors (consistent with other scripts)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging functions (consistent with start-production.sh)
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

echo ""
echo -e "${BLUE}📀 RedLemon DMG Builder${NC}"
echo "======================="
echo ""

# Configuration
APP_NAME="RedLemon"
BUILD_DIR="build"
DMG_DIR="dmg-build"
FINAL_DMG_NAME="RedLemon-Installer.dmg"
CHECKSUMS_FILE="RedLemon-Installer.sha256"

# Validate app exists before proceeding
if [ ! -d "${BUILD_DIR}/${APP_NAME}.app" ]; then
    log_error "${APP_NAME}.app not found in ${BUILD_DIR}/"
    echo "   Run ./start-production.sh first to build the app."
    exit 1
fi

# Get version from Info.plist (robust extraction)
VERSION=$(defaults read "$(pwd)/${BUILD_DIR}/${APP_NAME}.app/Contents/Info.plist" CFBundleShortVersionString 2>/dev/null || echo "1.0.0")
BUILD_NUMBER=$(defaults read "$(pwd)/${BUILD_DIR}/${APP_NAME}.app/Contents/Info.plist" CFBundleVersion 2>/dev/null || echo "1")

log_info "Building DMG for ${APP_NAME} v${VERSION} (build ${BUILD_NUMBER})"

# Clean previous builds
log_info "Cleaning previous DMG builds..."
rm -rf "${DMG_DIR}"
rm -f "${FINAL_DMG_NAME}"
rm -f "${CHECKSUMS_FILE}"

# Create DMG staging directory
log_info "Creating DMG structure..."
mkdir -p "${DMG_DIR}"

# Copy app to DMG directory
log_info "Copying ${APP_NAME}.app (this may take a moment)..."
cp -R "${BUILD_DIR}/${APP_NAME}.app" "${DMG_DIR}/"

# Verify copy succeeded
if [ ! -d "${DMG_DIR}/${APP_NAME}.app" ]; then
    log_error "Failed to copy ${APP_NAME}.app to staging directory"
    exit 1
fi

# Create Applications symlink for easy installation
log_info "Creating Applications shortcut..."
ln -s /Applications "${DMG_DIR}/Applications"

# Create README with version-specific info
log_info "Creating README..."
cat > "${DMG_DIR}/README.txt" << EOF
RedLemon v${VERSION} (Build ${BUILD_NUMBER})
====================================

Installation:
1. Drag RedLemon.app to the Applications folder
2. Open RedLemon from Applications
3. If you see a security warning:
   - Go to System Settings > Privacy & Security
   - Click "Open Anyway" next to RedLemon

First Launch:
1. Enter your username (no password required)
2. Add your Real-Debrid API token in Settings
3. Optionally add SubDL API key for subtitles

Features:
• Stream movies and TV shows with Real-Debrid
• Watch parties with friends (real-time sync)
• Automatic updates via Sparkle
• Smart subtitle selection (embedded preferred)
• Live movie events with synchronized playback

Requirements:
• macOS 12.0 (Monterey) or later
• Real-Debrid account (https://real-debrid.com)
• Internet connection

Troubleshooting:
• App won't open? Check Privacy & Security settings
• No streams found? Verify Real-Debrid token in Settings
• Subtitles missing? Add SubDL API key in Settings

Support:
• GitHub: https://github.com/orangeapple1272/Redlemon
• Report issues via GitHub Issues

Enjoy! 🍋
EOF

# Create DMG with optimized settings
log_info "Creating DMG image..."
echo "   This may take 30-60 seconds..."

# Use UDBZ for better compression (vs UDZO)
hdiutil create -volname "${APP_NAME}" \
    -srcfolder "${DMG_DIR}" \
    -ov -format UDBZ \
    -fs HFS+ \
    "${FINAL_DMG_NAME}"

# Verify DMG was created
if [ ! -f "${FINAL_DMG_NAME}" ]; then
    log_error "DMG creation failed!"
    exit 1
fi

# Generate SHA256 checksum for verification
log_info "Generating SHA256 checksum..."
shasum -a 256 "${FINAL_DMG_NAME}" > "${CHECKSUMS_FILE}"
CHECKSUM=$(cat "${CHECKSUMS_FILE}" | awk '{print $1}')

# Cleanup staging directory
log_info "Cleaning up temporary files..."
rm -rf "${DMG_DIR}"

# Get DMG details
DMG_SIZE=$(du -h "${FINAL_DMG_NAME}" | awk '{print $1}')
DMG_SIZE_BYTES=$(stat -f%z "${FINAL_DMG_NAME}")

# Success output
echo ""
log_success "DMG created successfully!"
echo ""
echo -e "${BLUE}📊 Build Details:${NC}"
echo "   App:      ${APP_NAME}.app"
echo "   Version:  ${VERSION} (build ${BUILD_NUMBER})"
echo "   DMG:      ${FINAL_DMG_NAME}"
echo "   Size:     ${DMG_SIZE} (${DMG_SIZE_BYTES} bytes)"
echo "   SHA256:   ${CHECKSUM:0:16}..."
echo ""
echo -e "${BLUE}📍 Output Files:${NC}"
echo "   $(pwd)/${FINAL_DMG_NAME}"
echo "   $(pwd)/${CHECKSUMS_FILE}"
echo ""
echo -e "${BLUE}🚀 Next Steps (per AI_BIBLE.md Part 11):${NC}"
echo "   1. Test locally: open ${FINAL_DMG_NAME}"
echo "   2. Sign for release: ./scripts/release.sh ${VERSION} ${BUILD_NUMBER}"
echo "   3. Upload to GitHub Releases"
echo "   4. Update appcast.xml"
echo ""
log_success "Ready for distribution!"
