#!/bin/bash
set -e
echo "🍋 Building RedLemon.app (DEBUG mode - faster)..."

# Check if .build exists, if not resolve packages first
if [ ! -d ".build" ]; then
    echo "📦 No .build directory found, resolving Swift packages..."
    swift package resolve
fi

# Create .app structure FIRST
APP_DIR="build/RedLemon.app"
CONTENTS="$APP_DIR/Contents"
MACOS="$CONTENTS/MacOS"
FRAMEWORKS="$CONTENTS/Frameworks"
RESOURCES="$CONTENTS/Resources"

echo "📁 Ensuring .app bundle structure exists..."
mkdir -p "$MACOS" "$FRAMEWORKS" "$RESOURCES"

# Build debug executable
echo "📦 Building Swift executable (debug)..."
swift build

# Copy executable (debug) - ALWAYS overwrite
echo "🔧 Copying debug executable..."
BIN_PATH=$(swift build --show-bin-path)
cp -f "$BIN_PATH/RedLemon" "$MACOS/"
echo "✅ Binary updated at $(date '+%H:%M:%S')"

# Copy frameworks
echo "📚 Copying frameworks..."
cp Frameworks/*.dylib "$FRAMEWORKS/"

# Copy Sparkle framework
echo "📦 Copying Sparkle.framework..."
if [ -d "$BIN_PATH/Sparkle.framework" ]; then
    rm -rf "$FRAMEWORKS/Sparkle.framework"
    cp -R "$BIN_PATH/Sparkle.framework" "$FRAMEWORKS/"
    echo "✅ Sparkle.framework copied"
else
    echo "⚠️  Sparkle.framework not found in $BIN_PATH"
fi

# Copy resources (internet-identity.html)
echo "📄 Copying resources..."
if [ -f "Sources/Features/Auth/internet-identity.html" ]; then
    mkdir -p "$RESOURCES/Features/Auth"
    cp "Sources/Features/Auth/internet-identity.html" "$RESOURCES/Features/Auth/"
    echo "✅ Copied internet-identity.html"
fi

# Copy app icon
if [ -f "Resources/AppIcon.icns" ]; then
    cp "Resources/AppIcon.icns" "$RESOURCES/"
    echo "✅ Copied AppIcon.icns"
fi

# Fix library paths
echo "🔗 Fixing library paths..."
install_name_tool -change "@rpath/libmpv.2.dylib" "@executable_path/../Frameworks/libmpv.2.dylib" "$MACOS/RedLemon" 2>/dev/null || true

# Create Info.plist
cat > "$CONTENTS/Info.plist" << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>RedLemon</string>
    <key>CFBundleIdentifier</key>
    <string>com.redlemon.app</string>
    <key>CFBundleName</key>
    <string>RedLemon</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0.14</string>
    <key>CFBundleVersion</key>
    <string>14</string>
    <key>CFBundleIconFile</key>
    <string>AppIcon</string>
    <key>LSMinimumSystemVersion</key>
    <string>12.0</string>
    <key>NSHighResolutionCapable</key>
    <true/>
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLName</key>
            <string>com.redlemon.auth</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>redlemon</string>
            </array>
        </dict>
    </array>
    <key>SUFeedURL</key>
    <string>https://raw.githubusercontent.com/orangeapple1272/Redlemon/main/appcast.xml</string>
    <key>SUEnableAutomaticChecks</key>
    <true/>
    <key>SUScheduledCheckInterval</key>
    <integer>86400</integer>
    <key>SUAllowsInsecureUpdates</key>
    <true/>
</dict>
</plist>
PLIST

# Ad-hoc code signing (required for Sparkle to work, even in development)
# This uses a self-signed signature that macOS will accept for local testing
# For distribution, you'll need a proper Developer ID certificate
echo "🔏 Code signing app with ad-hoc signature..."
codesign --force --deep --sign - "$APP_DIR"
echo "✅ App signed"

# ICP proxy removed - no longer needed (using Sparkle for updates, Supabase for backend)

# Remove quarantine flag to prevent repeated password prompts
echo "🔓 Removing quarantine flag..."
xattr -d com.apple.quarantine "$APP_DIR" 2>/dev/null || true

echo ""
echo "✅ RedLemon.app built successfully!"
echo "📍 Location: build/RedLemon.app"
echo "▶️  Run with: open build/RedLemon.app"
