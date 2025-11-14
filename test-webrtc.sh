#!/bin/bash

# WebRTC Host/Guest Testing Scripts for RedLemon Native
# This script allows you to launch multiple app instances for testing

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_NAME="RedLemon"
APP_PATH="$HOME/Applications/$APP_NAME.app"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_header() {
    echo -e "${BLUE}🧪 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Help message
show_help() {
    echo "RedLemon Native WebRTC Testing Scripts"
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  host          Launch host instance"
    echo "  guest         Launch guest instance"
    echo "  both          Launch both host and guest instances"
    echo "  debug         Launch debug instance (default profile)"
    echo "  stop          Stop all instances"
    echo "  logs          Show logs from all instances"
    echo "  build         Build the app for testing"
    echo "  help          Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 both                    # Launch host and guest"
    echo "  $0 host --port 8081       # Launch host with custom port"
    echo "  $0 guest --timeout 60     # Launch guest with custom timeout"
    echo ""
    echo "Environment Variables:"
    echo "  REDLEMON_BUILD_PATH        Custom path to built app"
    echo "  REDLEMON_LOG_LEVEL        Log level (debug, info, warn, error)"
}

# Find the app bundle
find_app() {
    if [ -n "$REDLEMON_BUILD_PATH" ]; then
        APP_PATH="$REDLEMON_BUILD_PATH"
    elif [ ! -d "$APP_PATH" ]; then
        # Try to find in Xcode DerivedData
        DERIVED_DATA="$HOME/Library/Developer/Xcode/DerivedData"
        if [ -d "$DERIVED_DATA" ]; then
            APP_PATH=$(find "$DERIVED_DATA" -name "$APP_NAME.app" -type d | head -1)
        fi
    fi

    if [ ! -d "$APP_PATH" ]; then
        print_error "App not found at $APP_PATH"
        print_warning "Please build the app first or set REDLEMON_BUILD_PATH"
        echo "Run: $0 build"
        exit 1
    fi

    print_success "Found app at: $APP_PATH"
}

# Launch app instance
launch_instance() {
    local profile=$1
    local extra_args=("${@:2}")

    print_header "Launching $profile instance..."

    # Create unique window title
    local window_title="RedLemon - $profile"

    # Prepare arguments
    local args=("-user-profile" "$profile")
    args+=("${extra_args[@]}")

    echo "Launching: open -n \"$APP_PATH\" --args ${args[*]}"
    echo "Window title: $window_title"

    # Launch the app
    if open -n "$APP_PATH" --args "${args[@]}"; then
        print_success "$profile instance launched successfully"
        print_info "Look for window titled: $window_title"
    else
        print_error "Failed to launch $profile instance"
        exit 1
    fi
}

# Stop all instances
stop_instances() {
    print_header "Stopping all RedLemon instances..."

    # Find all RedLemon processes
    local pids=$(pgrep -f "$APP_NAME" || true)

    if [ -n "$pids" ]; then
        echo "Found processes: $pids"
        echo "$pids" | xargs kill -TERM 2>/dev/null || true
        sleep 2

        # Force kill if still running
        pids=$(pgrep -f "$APP_NAME" || true)
        if [ -n "$pids" ]; then
            echo "Force killing remaining processes..."
            echo "$pids" | xargs kill -KILL 2>/dev/null || true
        fi

        print_success "All instances stopped"
    else
        print_warning "No running instances found"
    fi
}

# Show logs from Console.app
show_logs() {
    print_header "Opening logs in Console.app..."

    # Open Console.app with filter for RedLemon
    open -a "Console" "sudo log stream --predicate 'process == \"RedLemon\"'" 2>/dev/null || {
        open -a "Console"
        print_warning "Please filter for 'RedLemon' in Console.app"
    }
}

# Build the app
build_app() {
    print_header "Building RedLemon for testing..."

    # Change to project directory
    cd "$SCRIPT_DIR"

    # Build for testing
    if xcodebuild -project RedLemon.xcodeproj -scheme RedLemon -configuration Debug build; then
        print_success "Build completed successfully"

        # Try to find the built app
        local built_app=$(find "$HOME/Library/Developer/Xcode/DerivedData" -name "$APP_NAME.app" -type d | head -1)
        if [ -n "$built_app" ]; then
            print_success "Built app found at: $built_app"
            export REDLEMON_BUILD_PATH="$built_app"
        fi
    else
        print_error "Build failed"
        exit 1
    fi
}

# Main script logic
main() {
    case "${1:-help}" in
        "host")
            find_app
            launch_instance "host" "${@:2}"
            ;;
        "guest")
            find_app
            launch_instance "guest" "${@:2}"
            ;;
        "both")
            find_app
            print_header "Launching both host and guest instances..."
            launch_instance "host" "${@:2}"
            sleep 2
            launch_instance "guest" "${@:2}"
            print_success "Both instances launched"
            print_info "You should now have two RedLemon windows:"
            print_info "  - RedLemon - host (for creating rooms)"
            print_info "  - RedLemon - guest (for joining rooms)"
            ;;
        "debug")
            find_app
            launch_instance "debug" "${@:2}"
            ;;
        "stop")
            stop_instances
            ;;
        "logs")
            show_logs
            ;;
        "build")
            build_app
            ;;
        "help"|"-h"|"--help")
            show_help
            ;;
        *)
            print_error "Unknown command: $1"
            echo ""
            show_help
            exit 1
            ;;
    esac
}

# Helper function for info messages
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Run main function with all arguments
main "$@"