#!/bin/bash
set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$SCRIPT_DIR"

# Move to project root
cd "$PROJECT_ROOT"

# Detect system information
ARCH_NAME=$(uname -m)
MACOS_VERSION=$(sw_vers -productVersion)
XCODE_VERSION=$(xcodebuild -version | head -1 | awk '{print $2}')

# User-configurable versioning
APP_VERSION="1.0.143"
APP_BUILD="143"

echo "🍋 Building RedLemon.app (DEBUG mode - faster)..."
echo "🔧 System: $ARCH_NAME"
echo "🍎 macOS: $MACOS_VERSION"
echo "🛠️  Xcode: $XCODE_VERSION"

# OpenGL compatibility check
if [[ "$MACOS_VERSION" > "13.0" ]]; then
    echo "⚠️  macOS $MACOS_VERSION detected - OpenGL may not be available"
    echo "🔄 Recommending Metal backend for optimal performance"

    # Check if OpenGL framework is available
    if ! pkgutil --files com.apple.opengl >/dev/null 2>&1; then
        echo "❌ OpenGL framework not available"
        echo "💡 Consider updating to Metal-based rendering for full compatibility"
        # Don't exit here - continue with build but warn user
    else
        echo "✅ OpenGL framework found, but deprecated"
    fi
else
    echo "✅ macOS $MACOS_VERSION - OpenGL should be available"
fi

# Architecture-specific setup
if [[ "$ARCH_NAME" == "arm64" ]]; then
    echo "🔧 Apple Silicon detected - using optimized libraries"
    export LIBRARY_PATH="Frameworks/arm64"
    export SWIFT_BUILD_FLAGS="--arch arm64"
elif [[ "$ARCH_NAME" == "x86_64" ]]; then
    echo "🔧 Intel Mac detected - using standard libraries"
    export LIBRARY_PATH="Frameworks/x86_64"
    export SWIFT_BUILD_FLAGS="--arch x86_64"
else
    echo "⚠️  Unknown architecture $ARCH_NAME - using default settings"
    export LIBRARY_PATH="Frameworks"
fi

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

# Build the project
echo "📦 Building Swift executable (debug)..."
CONFIG_FLAGS="-c debug -Xswiftc -DDEBUG"
if [ "$ARCH_NAME" == "arm64" ]; then
    echo "🔧 Using architecture-specific flags: --arch arm64"
    swift build $CONFIG_FLAGS --arch arm64
elif [ "$ARCH_NAME" == "x86_64" ]; then
    echo "🔧 Using architecture-specific flags: --arch x86_64"
    swift build $CONFIG_FLAGS --arch x86_64
else
    # Universal build not supported by swift build directly easily without lipo
    # Fallback to current arch
    swift build $CONFIG_FLAGS
fi

# Copy executable (debug) - ALWAYS overwrite
echo "🔧 Copying debug executable..."
if [[ -n "$SWIFT_BUILD_FLAGS" ]]; then
    BIN_PATH=$(swift build $SWIFT_BUILD_FLAGS --show-bin-path)
else
    BIN_PATH=$(swift build --show-bin-path)
fi
cp -f "$BIN_PATH/RedLemon" "$MACOS/"
echo "✅ Binary updated at $(date '+%H:%M:%S')"

# Copy frameworks
echo "📚 Copying frameworks..."

# Copy architecture-specific frameworks if they exist
if [[ "$ARCH_NAME" == "arm64" && -d "Frameworks/arm64" ]]; then
    echo "🍎 Using Apple Silicon optimized frameworks"
    cp Frameworks/arm64/*.dylib "$FRAMEWORKS/" 2>/dev/null || true
elif [[ "$ARCH_NAME" == "x86_64" && -d "Frameworks/x86_64" ]]; then
    echo "🖥️  Using Intel optimized frameworks"
    cp Frameworks/x86_64/*.dylib "$FRAMEWORKS/" 2>/dev/null || true
else
    echo "📚 Using default frameworks"
    cp Frameworks/*.dylib "$FRAMEWORKS/" 2>/dev/null || true
fi

# Ensure libmpv is copied regardless of architecture (critical dependency)
if [[ -f "Frameworks/libmpv.2.dylib" ]]; then
    cp Frameworks/libmpv.2.dylib "$FRAMEWORKS/"
    echo "✅ libmpv.2.dylib copied"
else
    echo "❌ libmpv.2.dylib not found - this may cause runtime issues"
fi

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
cat > "$CONTENTS/Info.plist" << PLIST
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
    <string>${APP_VERSION}</string>
    <key>CFBundleVersion</key>
    <!-- ⚠️ AI_BIBLE #30: Versioning Rule - CFBundleVersion MUST be a pure Integer (e.g. 64). Strings break updates. -->
    <string>${APP_BUILD}</string>
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
    <string>https://151.243.109.243.nip.io/updates/appcast.xml</string>
    <key>SUEnableAutomaticChecks</key>
    <true/>
    <key>SUScheduledCheckInterval</key>
    <integer>86400</integer>
    <key>SUPublicEDKey</key>
    <string>oT0UkapQxn9PE5FOU+lpW5aJBuvfvPGICml3hg2pjCw=</string>
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
