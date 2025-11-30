#!/bin/bash

# RedLemon Production Startup Script
# Enhanced with build resilience and error recovery

# Get the directory where this script is located (works anywhere)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Detect system information for modern Mac compatibility
ARCH_NAME=$(uname -m)
MACOS_VERSION=$(sw_vers -productVersion)
XCODE_VERSION=$(xcodebuild -version | head -1 | awk '{print $2}')

# Configuration
BUILD_SCRIPT="$SCRIPT_DIR/build-app-debug.sh"
MAX_RETRIES=3
CLEAN_BUILD_THRESHOLD=2

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
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

# Utility functions
clean_build_environment() {
    log_info "Performing deep clean of build environment..."
    cd "$SCRIPT_DIR"

    # Remove Swift build artifacts
    rm -rf .build
    rm -rf build/RedLemon.app

    # Clean any residual processes
    pkill -9 RedLemon 2>/dev/null || true

    # Clear any temporary files
    find . -name "*.tmp" -delete 2>/dev/null || true
    find . -name ".DS_Store" -delete 2>/dev/null || true

    log_success "Build environment cleaned"
}

validate_environment() {
    log_info "Validating build environment..."

    # Check Swift installation
    if ! command -v swift >/dev/null 2>&1; then
        log_error "Swift not found. Please install Xcode or Swift toolchain."
        return 1
    fi

    # Check Swift version
    SWIFT_VERSION=$(swift --version | head -n1 | grep -o '[0-9]\+\.[0-9]\+')
    if [[ -z "$SWIFT_VERSION" ]]; then
        log_warning "Could not determine Swift version"
    else
        log_info "Swift version: $SWIFT_VERSION"
    fi

    # Check required tools
    for tool in lsof xattr codesign; do
        if ! command -v $tool >/dev/null 2>&1; then
            log_error "$tool not found. This script requires $tool to function properly."
            return 1
        fi
    done

    # Check build script exists
    if [ ! -f "$BUILD_SCRIPT" ]; then
        log_error "build-app-debug.sh not found at $BUILD_SCRIPT"
        return 1
    fi

    # Check Package.swift
    if [ ! -f "$SCRIPT_DIR/Package.swift" ]; then
        log_error "Package.swift not found in $SCRIPT_DIR"
        return 1
    fi

    # Check Node.js version for watchparty server
    if ! command -v node > /dev/null 2>&1; then
        log_error "Node.js not found. Please install Node.js 20 LTS from https://nodejs.org/"
        return 1
    fi

    NODE_VERSION=$(node --version | grep -o '[0-9]\+' | head -n1)
    if [ "$NODE_VERSION" -lt 20 ] || [ "$NODE_VERSION" -ge 26 ]; then
        log_error "Node.js version $NODE_VERSION is not supported. Please use Node.js 20-25."
        log_error "Current version: $(node --version)"
        log_error "Install Node 20 LTS: https://nodejs.org/"
        return 1
    fi
    log_info "Node.js version: $(node --version) ✓"

    log_success "Environment validation passed"
    return 0
}

resolve_packages() {
    log_info "Resolving Swift packages..."
    cd "$SCRIPT_DIR"

    if ! swift package resolve; then
        log_error "Failed to resolve Swift packages"
        return 1
    fi

    log_success "Package resolution completed"
    return 0
}

build_with_retry() {
    local attempt=1
    local last_error=""

    while [ $attempt -le $MAX_RETRIES ]; do
        log_info "Build attempt $attempt of $MAX_RETRIES..."

        # Clean build on repeated failures
        if [ $attempt -gt $CLEAN_BUILD_THRESHOLD ]; then
            log_warning "Multiple build failures detected, performing clean build..."
            clean_build_environment
            resolve_packages
        fi

        cd "$SCRIPT_DIR"
        if "$BUILD_SCRIPT"; then
            log_success "Build completed successfully on attempt $attempt"
            return 0
        fi

        last_error=$?
        log_error "Build failed on attempt $attempt (exit code: $last_error)"

        # Analyze specific build errors
        if [ $attempt -eq $MAX_RETRIES ]; then
            analyze_build_failure
        fi

        attempt=$((attempt + 1))
        sleep 2
    done

    log_error "Build failed after $MAX_RETRIES attempts"
    return $last_error
}

analyze_build_failure() {
    log_info "Analyzing build failure patterns..."

    # Check for common issues
    if grep -q "swift-collections" "$SCRIPT_DIR/.build/debug.yaml" 2>/dev/null; then
        log_warning "Detected swift-collections related issues. This may require dependency version updates."
    fi

    if grep -q "OrderedCollections" "$SCRIPT_DIR/.build/debug.yaml" 2>/dev/null; then
        log_warning "Detected OrderedCollections compilation issues. A clean build may resolve this."
    fi

    # Check for disk space issues
    AVAILABLE_SPACE=$(df -h "$SCRIPT_DIR" | awk 'NR==2 {print $4}')
    log_info "Available disk space: $AVAILABLE_SPACE"

    # Suggest solutions
    echo ""
    log_info "Suggested solutions:"
    echo "   1. Run: rm -rf .build && ./start-production.sh"
    echo "   2. Update Xcode/Swift toolchain"
    echo "   3. Check dependency compatibility in Package.swift"
    echo "   4. Verify sufficient disk space"
    echo ""
}

launch_app() {
    local http_port=${REDLEMON_PORT:-47253}
    local watchparty_port=18081
    local log_file="${SCRIPT_DIR}/redlemon-$(date +%Y%m%d-%H%M%S).log"

    log_info "Preparing to launch RedLemon with watchparty server..."

    # Start watchparty server first
    log_info "Building and starting watchparty server..."
    cd "$SCRIPT_DIR/watchparty-server"

    # Ensure dependencies are installed and up to date
    if [ ! -d "node_modules" ] || [ "package.json" -nt "node_modules" ]; then
        log_info "Installing/Updating watchparty dependencies..."
        if ! npm install; then
            log_error "Failed to install watchparty dependencies"
            return 1
        fi
        # Touch node_modules to update its timestamp
        touch node_modules
    fi

    # Build TypeScript if needed
    if [ ! -d "dist" ] || [ "src/index.ts" -nt "dist/index.js" ] || [ ! -f "dist/index.js" ]; then
        log_info "Building watchparty server..."
        if ! npm run build; then
            log_warning "Build failed. Attempting clean install (fixes architecture mismatches)..."
            rm -rf node_modules package-lock.json
            npm install
            if ! npm run build; then
                log_error "Failed to build watchparty server after clean install"
                return 1
            fi
        fi
    fi

    # Start watchparty server in background
    export WATCHPARTY_PORT=$watchparty_port
    export SUPABASE_URL=$SUPABASE_URL
    export SUPABASE_SERVICE_ROLE_KEY=$SUPABASE_SERVICE_ROLE_KEY
    npm start &
    WATCHPARTY_PID=$!

    # Verify watchparty server started
    sleep 3
    if ! curl -s "http://localhost:$watchparty_port/healthz" > /dev/null; then
        log_error "Watchparty server failed to start on port $watchparty_port"
        return 1
    fi

    log_success "Watchparty server started on port $watchparty_port (PID: $WATCHPARTY_PID)"
    cd "$SCRIPT_DIR"

    # Remove quarantine flag
    log_info "Removing quarantine flag..."
    xattr -d com.apple.quarantine "$SCRIPT_DIR/build/RedLemon.app" 2>/dev/null || true

    # Verify app binary exists
    if [ ! -f "$SCRIPT_DIR/build/RedLemon.app/Contents/MacOS/RedLemon" ]; then
        log_error "RedLemon binary not found at $SCRIPT_DIR/build/RedLemon.app/Contents/MacOS/RedLemon"
        return 1
    fi

    # Launch with environment variables and proper output handling
    log_info "Launching RedLemon on port $http_port..."
    log_info "Watchparty server running on port $watchparty_port"
    log_info "Application logs will be displayed below and saved to: $log_file"
    cd "$SCRIPT_DIR"
    export REDLEMON_PORT=$http_port
    export WATCHPARTY_PORT=$watchparty_port

    # Start app in foreground with output duplication to log file
    # This ensures logs appear in real-time in terminal while also being saved
    ./build/RedLemon.app/Contents/MacOS/RedLemon 2>&1 | tee "$log_file"
}

cleanup() {
    log_info "Stopping any remaining RedLemon and WatchParty processes..."
    pkill -f RedLemon 2>/dev/null || true
    pkill -f "npm start" 2>/dev/null || true
    lsof -ti:${REDLEMON_PORT:-47253} 2>/dev/null | xargs kill -9 2>/dev/null || true
    lsof -ti:18081 2>/dev/null | xargs kill -9 2>/dev/null || true
    lsof -ti:8080 2>/dev/null | xargs kill -9 2>/dev/null || true
    lsof -ti:3000 2>/dev/null | xargs kill -9 2>/dev/null || true
    log_success "Cleanup completed"
    exit 0
}

# Main execution
main() {
    echo "🚀 RedLemon - Production Mode (Enhanced)"
    echo "🔧 System: $ARCH_NAME"
    echo "🍎 macOS: $MACOS_VERSION"
    echo "🛠️  Xcode: $XCODE_VERSION"
    echo "=========================================="
    echo ""
    echo "📁 Project: $SCRIPT_DIR"
    echo "📡 Configuration:"
    echo "   HTTP Server:  Port ${REDLEMON_PORT:-47253} (production-safe)"
    echo "   Backend:      Supabase PostgreSQL"
    echo "   Auth Method:  Username-based"
    echo "   Max Retries:  $MAX_RETRIES"

    # OpenGL compatibility check for modern macOS
    if [[ "$MACOS_VERSION" > "13.0" ]]; then
        echo ""
        echo "⚠️  macOS $MACOS_VERSION detected - OpenGL may not be available"
        echo "🔄 Recommending Metal backend for optimal performance"

        # Check if OpenGL framework is available
        if ! pkgutil --files com.apple.opengl >/dev/null 2>&1; then
            echo "❌ OpenGL framework not available"
            echo "💡 Consider updating to Metal-based rendering for full compatibility"
        else
            echo "✅ OpenGL framework found, but deprecated"
        fi
    else
        echo ""
        echo "✅ macOS $MACOS_VERSION - OpenGL should be available"
    fi
    echo ""

    # Initial cleanup of existing processes
    log_info "Cleaning up existing processes..."
    lsof -ti:3000 2>/dev/null | xargs kill -9 2>/dev/null || true
    lsof -ti:8080 2>/dev/null | xargs kill -9 2>/dev/null || true
    lsof -ti:${REDLEMON_PORT:-47253} 2>/dev/null | xargs kill -9 2>/dev/null || true
    pkill -9 RedLemon 2>/dev/null || true
    sleep 1

    # Set up signal handlers for clean shutdown
    trap cleanup SIGINT SIGTERM

    # Validate environment
    if ! validate_environment; then
        log_error "Environment validation failed"
        exit 1
    fi

    # Resolve packages if needed
    if [ ! -d "$SCRIPT_DIR/.build" ]; then
        if ! resolve_packages; then
            log_error "Package resolution failed"
            exit 1
        fi
    fi

    # Build with retry logic
    if ! build_with_retry; then
        log_error "Build failed after all retry attempts"
        exit 1
    fi

    log_success "Build completed successfully"
    echo ""

    echo ""
    log_success "RedLemon is starting in PRODUCTION MODE!"
    echo ""
    echo "📊 Services:"
    echo "   ✅ Backend:           Supabase PostgreSQL"
    echo "   ✅ WatchParty Server:  Port 18081 (WebSocket)"
    echo "   🔐 Authentication:    Username-based"
    echo ""
    echo "📝 Application output will appear below in real-time:"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    # Launch the application (this will block until app exits)
    launch_app
}

# Run main function
main "$@"
