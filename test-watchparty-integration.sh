#!/bin/bash

# RedLemon Watch Party Integration Test Script
# Tests end-to-end functionality of the watchparty system

set -euo pipefail

# Configuration
SERVER_HOST="151.243.109.217"
SERVER_PORT="8080"
TEST_ROOM_ID="test-room-$(date +%s)"
TEST_USER_ID="test-user-$(date +%s)"
TEST_TOKEN="test-jwt-token"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test results
TESTS_PASSED=0
TESTS_FAILED=0
TESTS_TOTAL=0

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[PASS]${NC} $1"
    ((TESTS_PASSED++))
}

log_error() {
    echo -e "${RED}[FAIL]${NC} $1"
    ((TESTS_FAILED++))
}

log_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# Test utility functions
run_test() {
    local test_name="$1"
    local test_command="$2"

    ((TESTS_TOTAL++))
    log_info "Running test: $test_name"

    if eval "$test_command" > /dev/null 2>&1; then
        log_success "$test_name"
        return 0
    else
        log_error "$test_name"
        return 1
    fi
}

# Test network connectivity
test_connectivity() {
    log_info "Testing network connectivity..."

    # Test basic connectivity
    if timeout 10 bash -c "</dev/tcp/${SERVER_HOST}/${SERVER_PORT}" 2>/dev/null; then
        log_success "Server is reachable on port ${SERVER_PORT}"
    else
        log_error "Server is not reachable on port ${SERVER_PORT}"
        return 1
    fi

    # Test HTTP health endpoint
    local http_status
    http_status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "http://${SERVER_HOST}:${SERVER_PORT}/healthz" 2>/dev/null || echo "000")

    if [[ "$http_status" == "200" ]]; then
        log_success "HTTP health endpoint is responding"
    else
        log_error "HTTP health endpoint failed (status: $http_status)"
        return 1
    fi
}

# Test WebSocket connection
test_websocket_connection() {
    log_info "Testing WebSocket connection..."

    # Create a test script
    local test_script="/tmp/ws_test_$$"
    cat > "$test_script" << 'EOF'
const WebSocket = require('ws');

const ws = new WebSocket('ws://151.243.109.217:8080', {
    handshakeTimeout: 10000,
});

let connected = false;
let authenticated = false;
let receivedMessage = false;

ws.on('open', () => {
    connected = true;
    console.log('WebSocket connected');

    // Send auth message
    const authMessage = {
        type: 'auth',
        token: 'test-jwt-token',
        roomId: 'test-room-123',
        role: 'guest',
        lastSeq: 0
    };

    ws.send(JSON.stringify(authMessage));
    console.log('Auth message sent');
});

ws.on('message', (data) => {
    receivedMessage = true;
    const message = JSON.parse(data.toString());
    console.log('Received message:', message);

    if (message.type === 'auth_ok') {
        authenticated = true;
        console.log('Authentication successful');
    }
});

ws.on('error', (error) => {
    console.error('WebSocket error:', error.message);
    process.exit(1);
});

ws.on('close', () => {
    if (connected && authenticated) {
        console.log('WEBSOCKET_TEST_SUCCESS');
        process.exit(0);
    } else {
        console.log('WEBSOCKET_TEST_FAILED');
        process.exit(1);
    }
});

setTimeout(() => {
    console.log('WEBSOCKET_TEST_TIMEOUT');
    process.exit(1);
}, 15000);
EOF

    # Run the test if Node.js is available
    if command -v node &> /dev/null; then
        if ! npm list -g ws &> /dev/null; then
            npm install -g ws > /dev/null 2>&1 || true
        fi

        local result
        result=$(timeout 20 node "$test_script" 2>/dev/null || echo "TIMEOUT")
        rm -f "$test_script"

        if [[ "$result" == *"SUCCESS"* ]]; then
            log_success "WebSocket connection and authentication test passed"
            return 0
        else
            log_error "WebSocket connection test failed: $result"
            return 1
        fi
    else
        log_warning "Node.js not available for WebSocket testing"
        return 1
    fi
}

# Test message broadcasting
test_message_broadcasting() {
    log_info "Testing message broadcasting..."

    local test_script="/tmp/broadcast_test_$$"
    cat > "$test_script" << 'EOF'
const WebSocket = require('ws');

let client1, client2;
let testPassed = false;
let messageReceived = false;

// First client (sender)
client1 = new WebSocket('ws://151.243.109.217:8080');
client1.on('open', () => {
    client1.send(JSON.stringify({
        type: 'auth',
        token: 'test-jwt-token',
        roomId: 'test-room-123',
        role: 'guest'
    }));
});

client1.on('message', (data) => {
    const message = JSON.parse(data.toString());
    if (message.type === 'auth_ok') {
        // Send a play message after authentication
        setTimeout(() => {
            client1.send(JSON.stringify({
                type: 'play',
                positionMs: 12345
            }));
        }, 1000);
    }
});

// Second client (receiver)
client2 = new WebSocket('ws://151.243.109.217:8080');
client2.on('open', () => {
    client2.send(JSON.stringify({
        type: 'auth',
        token: 'test-jwt-token',
        roomId: 'test-room-123',
        role: 'guest'
    }));
});

client2.on('message', (data) => {
    const message = JSON.parse(data.toString());
    if (message.type === 'state' && message.event === 'play') {
        messageReceived = true;
        console.log('BROADCAST_TEST_SUCCESS');
        client1.close();
        client2.close();
        process.exit(0);
    }
});

client1.on('error', () => process.exit(1));
client2.on('error', () => process.exit(1));

setTimeout(() => {
    console.log('BROADCAST_TEST_FAILED');
    process.exit(1);
}, 20000);
EOF

    if command -v node &> /dev/null; then
        local result
        result=$(timeout 25 node "$test_script" 2>/dev/null || echo "TIMEOUT")
        rm -f "$test_script"

        if [[ "$result" == *"SUCCESS"* ]]; then
            log_success "Message broadcasting test passed"
            return 0
        else
            log_error "Message broadcasting test failed: $result"
            return 1
        fi
    else
        log_warning "Node.js not available for broadcasting test"
        return 1
    fi
}

# Test Swift WebSocketTransport integration
test_swift_integration() {
    log_info "Testing Swift WebSocketTransport integration..."

    # Check if Swift files exist
    local swift_files=(
        "Sources/Features/WatchParty/WebSocketTransport.swift"
        "Sources/Features/WatchParty/WatchPartyManager.swift"
        "Sources/Features/Settings/WatchPartySettingsView.swift"
    )

    for file in "${swift_files[@]}"; do
        if [[ -f "$file" ]]; then
            log_success "Found Swift file: $file"
        else
            log_error "Missing Swift file: $file"
            return 1
        fi
    done

    # Check if Swift files compile (basic syntax check)
    if command -v swiftc &> /dev/null; then
        for file in "${swift_files[@]}"; do
            if swiftc -parse "$file" 2>/dev/null; then
                log_success "Swift file syntax valid: $file"
            else
                log_error "Swift file syntax error: $file"
                return 1
            fi
        done
    else
        log_warning "Swift compiler not available for syntax checking"
    fi
}

# Test server deployment files
test_deployment_files() {
    log_info "Testing deployment files..."

    # Check deployment script
    if [[ -f "deploy-watchparty.sh" && -x "deploy-watchparty.sh" ]]; then
        log_success "Deployment script exists and is executable"
    else
        log_error "Deployment script missing or not executable"
        return 1
    fi

    # Check monitoring script
    if [[ -f "monitor-watchparty.sh" && -x "monitor-watchparty.sh" ]]; then
        log_success "Monitoring script exists and is executable"
    else
        log_error "Monitoring script missing or not executable"
        return 1
    fi

    # Check server files
    if [[ -f "watchparty-server/src/index.ts" ]]; then
        log_success "TypeScript server file exists"
    else
        log_error "TypeScript server file missing"
        return 1
    fi

    # Check package.json
    if [[ -f "watchparty-server/package.json" ]]; then
        log_success "Server package.json exists"
    else
        log_error "Server package.json missing"
        return 1
    fi
}

# Test configuration consistency
test_configuration() {
    log_info "Testing configuration consistency..."

    # Check server port configuration
    local server_port
    server_port=$(grep -E "PORT.*8080" watchparty-server/src/index.ts 2>/dev/null | head -1 || echo "")
    if [[ "$server_port" == *"8080"* ]]; then
        log_success "Server port configuration is consistent"
    else
        log_error "Server port configuration inconsistent"
        return 1
    fi

    # Check deployment script configuration
    local deploy_host
    deploy_host=$(grep "SERVER_HOST=" deploy-watchparty.sh | head -1 | cut -d'"' -f2 || echo "")
    if [[ "$deploy_host" == "$SERVER_HOST" ]]; then
        log_success "Deployment script host configuration is consistent"
    else
        log_warning "Deployment script host may need updating"
    fi

    # Check monitoring script configuration
    local monitor_host
    monitor_host=$(grep "SERVER_HOST=" monitor-watchparty.sh | head -1 | cut -d'"' -f2 || echo "")
    if [[ "$monitor_host" == "$SERVER_HOST" ]]; then
        log_success "Monitoring script host configuration is consistent"
    else
        log_warning "Monitoring script host may need updating"
    fi
}

# Test JWT verification logic
test_jwt_verification() {
    log_info "Testing JWT verification logic..."

    # Check if JWT verification functions exist
    if grep -q "verifyToken" watchparty-server/src/index.ts; then
        log_success "JWT verification function exists"
    else
        log_error "JWT verification function missing"
        return 1
    fi

    # Check if JWKS fetching exists
    if grep -q "fetchJWKS" watchparty-server/src/index.ts; then
        log_success "JWKS fetching function exists"
    else
        log_error "JWKS fetching function missing"
        return 1
    fi

    # Check for bypass mode
    if grep -q "AUTH_BYPASS" watchparty-server/src/index.ts; then
        log_success "Auth bypass mode configured"
    else
        log_warning "Auth bypass mode may be missing"
    fi
}

# Test reconnection logic
test_reconnection_logic() {
    log_info "Testing reconnection logic..."

    # Check Swift reconnection implementation
    if grep -q "reconnect" Sources/Features/WatchParty/WebSocketTransport.swift; then
        log_success "WebSocket reconnection logic exists in Swift"
    else
        log_error "WebSocket reconnection logic missing in Swift"
        return 1
    fi

    # Check for exponential backoff
    if grep -q "exponential" Sources/Features/WatchParty/WebSocketTransport.swift; then
        log_success "Exponential backoff implemented"
    else
        log_warning "Exponential backoff may not be implemented"
    fi
}

# Test protocol translation
test_protocol_translation() {
    log_info "Testing protocol translation..."

    # Check for message translation
    if grep -q "translate" Sources/Features/WatchParty/WebSocketTransport.swift; then
        log_success "Protocol translation exists"
    else
        log_warning "Protocol translation may be incomplete"
    fi

    # Check for sync message handling
    if grep -q "SyncMessage" Sources/Features/WatchParty/WatchPartyManager.swift; then
        log_success "SyncMessage handling exists"
    else
        log_warning "SyncMessage handling may be incomplete"
    fi
}

# Generate test report
generate_test_report() {
    echo ""
    echo "=================================="
    echo "Integration Test Results"
    echo "=================================="
    echo "Tests Run: $TESTS_TOTAL"
    echo "Tests Passed: $TESTS_PASSED"
    echo "Tests Failed: $TESTS_FAILED"
    echo "Success Rate: $(( TESTS_PASSED * 100 / TESTS_TOTAL ))%"
    echo ""

    if [[ $TESTS_FAILED -eq 0 ]]; then
        log_success "All tests passed! ✅"
        echo "The watchparty system is ready for deployment."
    else
        log_error "Some tests failed! ❌"
        echo "Please address the failing tests before deployment."
    fi

    echo "=================================="

    return $TESTS_FAILED
}

# Main test execution
main() {
    echo "RedLemon Watch Party Integration Tests"
    echo "=================================="
    echo "Testing server: ${SERVER_HOST}:${SERVER_PORT}"
    echo ""

    # Run all tests
    test_connectivity || true
    test_websocket_connection || true
    test_message_broadcasting || true
    test_swift_integration || true
    test_deployment_files || true
    test_configuration || true
    test_jwt_verification || true
    test_reconnection_logic || true
    test_protocol_translation || true

    # Generate report
    generate_test_report
}

# Run tests
main "$@"
