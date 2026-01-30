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

# Copy app to DMG directory using ditto to preserve metadata and resource forks
log_info "Copying ${APP_NAME}.app (this may take a moment)..."
ditto "${BUILD_DIR}/${APP_NAME}.app" "${DMG_DIR}/${APP_NAME}.app"

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
🍋 RedLemon v\${VERSION} (Build \${BUILD_NUMBER})
========================================
The Unified Native macOS Media Experience

RedLemon is a high-performance, native macOS application designed for premium media streaming and synchronized group viewing. Built for the modern macOS experience.

🚀 QUICK START
----------------------------------------
1. INSTALL: Drag RedLemon.app into your Applications folder.
2. LAUNCH: Locate the app in Applications. For the first launch, Right-Click (Control-Click) and select 'Open' to authorize the app.
3. ONBOARD: Follow the onboarding flow to set up your identity or 'Restore from Backup' to instantly recover your account, friends, and history.

✨ PREMIUM FEATURES
----------------------------------------
• CINEMATIC PLAYBACK: Powered by an embedded libmpv engine with full hardware acceleration and Pro-Grade subtitle rendering.
• WATCH PARTIES: Experience perfect synchronization with friends. Every seek, pause, and play is broadcasted in real-time via high-performance WebSockets.
• SMART SUBTITLES: Intelligent scoring system that prioritizes high-quality embedded tracks and release-matched content.
• SEAMLESS UPDATES: Integrated Sparkle support ensures you are always running the latest version with zero friction.
• PRIVACY BY DESIGN: No telemetry. RedLemon respects your privacy—all logs and app data are stored silently in your local Application Support directory.

⚙️ REQUIREMENTS
----------------------------------------
• macOS 12.0 (Monterey) or newer.
• Real-Debrid Account (Required for high-speed streaming).
• SubDL API Key (Optional, for expanded subtitle discovery).

❓ TROUBLESHOOTING
----------------------------------------
• INITIAL LAUNCH: If macOS prevents launch, go to System Settings > Privacy & Security and click "Open Anyway".
• STREAM ERRORS: Ensure your Real-Debrid token is active and correctly configured in Settings.
• SYNC ISSUES: For Watch Parties, ensure all participants are on the latest version (check Settings > About).

----------------------------------------
Enjoy the ultimate viewing experience. 🍋
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
