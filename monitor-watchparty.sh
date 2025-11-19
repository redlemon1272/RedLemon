#!/bin/bash

# RedLemon Watch Party Monitoring Script
# Monitors the watchparty WebSocket server and provides real-time status

set -euo pipefail

# Configuration
SERVER_HOST="151.243.109.217"
SERVER_USER="root"
SSH_KEY="${HOME}/.ssh/id_ed25519_redlemon"
SERVICE_NAME="watchparty"
LOG_FILE="/tmp/watchparty-monitor.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] $1" >> "${LOG_FILE}"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [SUCCESS] $1" >> "${LOG_FILE}"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [WARNING] $1" >> "${LOG_FILE}"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1" >> "${LOG_FILE}"
}

# Initialize log file
mkdir -p "$(dirname "${LOG_FILE}")"
touch "${LOG_FILE}"

# Test server connectivity
test_connectivity() {
    local host="$1"
    local port="$2"
    local timeout="${3:-5}"

    if timeout "$timeout" bash -c "</dev/tcp/$host/$port" 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Check service status
check_service_status() {
    log_info "Checking service status..."

    local status_output
    status_output=$(ssh -i "${SSH_KEY}" -o ConnectTimeout=10 "${SERVER_USER}@${SERVER_HOST}" "systemctl is-active ${SERVICE_NAME}" 2>/dev/null || echo "failed")

    case "$status_output" in
        "active")
            log_success "Service is running"
            return 0
            ;;
        "inactive"|"dead")
            log_warning "Service is stopped"
            return 1
            ;;
        "failed")
            log_error "Service has failed"
            return 2
            ;;
        *)
            log_warning "Service status unknown: $status_output"
            return 3
            ;;
    esac
}

# Check HTTP endpoint
check_http_health() {
    log_info "Checking HTTP health endpoint..."

    local response_code
    response_code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "http://${SERVER_HOST}:8080/healthz" 2>/dev/null || echo "000")

    case "$response_code" in
        "200")
            log_success "HTTP health check passed (200 OK)"
            return 0
            ;;
        "000")
            log_error "HTTP health check failed - connection error"
            return 2
            ;;
        *)
            log_warning "HTTP health check returned status: $response_code"
            return 1
            ;;
    esac
}

# Check WebSocket connection
check_websocket_health() {
    log_info "Checking WebSocket connection..."

    # Create a temporary Node.js script to test WebSocket
    local temp_script="/tmp/ws_test_$$"
    cat > "$temp_script" << 'EOF'
const WebSocket = require('ws');

const ws = new WebSocket('ws://151.243.109.217:8080', {
    handshakeTimeout: 5000,
});

let connected = false;
let error = null;

ws.on('open', () => {
    connected = true;
    ws.close();
});

ws.on('error', (err) => {
    error = err.message;
});

ws.on('close', () => {
    if (connected) {
        console.log('WEBSOCKET_SUCCESS');
        process.exit(0);
    } else if (error) {
        console.log('WEBSOCKET_ERROR:', error);
        process.exit(1);
    } else {
        console.log('WEBSOCKET_ERROR: Connection closed unexpectedly');
        process.exit(1);
    }
});

setTimeout(() => {
    console.log('WEBSOCKET_ERROR: Connection timeout');
    process.exit(1);
}, 5000);
EOF

    # Run the test if Node.js is available
    if command -v node &> /dev/null && command -v npm &> /dev/null; then
        if ! npm list -g ws &> /dev/null; then
            npm install -g ws > /dev/null 2>&1 || true
        fi

        local result
        result=$(timeout 10 node "$temp_script" 2>/dev/null || echo "WEBSOCKET_ERROR: Script failed")

        rm -f "$temp_script"

        if [[ "$result" == *"SUCCESS"* ]]; then
            log_success "WebSocket health check passed"
            return 0
        else
            log_error "WebSocket health check failed: ${result#WEBSOCKET_ERROR: }"
            return 2
        fi
    else
        log_warning "Node.js not available for WebSocket test"
        return 1
    fi
}

# Check system resources
check_system_resources() {
    log_info "Checking system resources..."

    local ssh_cmd="ssh -i '${SSH_KEY}' -o ConnectTimeout=10 '${SERVER_USER}@${SERVER_HOST}'"

    # Check CPU usage
    local cpu_usage
    cpu_usage=$($ssh_cmd "top -bn1 | grep 'Cpu(s)' | awk '{print \$2}' | sed 's/%us,//' 2>/dev/null || echo 'unknown'")

    # Check memory usage
    local mem_info
    mem_info=$($ssh_cmd "free -m | awk 'NR==2{printf \"%.1f\", \$3*100/\$2}' 2>/dev/null || echo 'unknown'")

    # Check disk usage
    local disk_usage
    disk_usage=$($ssh_cmd "df -h / | awk 'NR==2{print \$5}' | sed 's/%//' 2>/dev/null || echo 'unknown'")

    # Check load average
    local load_avg
    load_avg=$($ssh_cmd "uptime | awk -F'load average:' '{print \$2}' | awk '{print \$1}' | sed 's/,//' 2>/dev/null || echo 'unknown'")

    echo "  CPU Usage: ${cpu_usage}%"
    echo "  Memory Usage: ${mem_info}%"
    echo "  Disk Usage: ${disk_usage}%"
    echo "  Load Average: ${load_avg}"

    # Check for alerts
    local alert=0

    if [[ "$cpu_usage" != "unknown" && "${cpu_usage%.*}" -gt 80 ]]; then
        log_warning "High CPU usage: ${cpu_usage}%"
        alert=1
    fi

    if [[ "$mem_info" != "unknown" && "${mem_info%.*}" -gt 85 ]]; then
        log_warning "High memory usage: ${mem_info}%"
        alert=1
    fi

    if [[ "$disk_usage" != "unknown" && "$disk_usage" -gt 90 ]]; then
        log_warning "High disk usage: ${disk_usage}%"
        alert=1
    fi

    if [[ "$load_avg" != "unknown" ]]; then
        local load_num=${load_avg%.*}
        if [[ "$load_num" -gt 2 ]]; then
            log_warning "High load average: ${load_avg}"
            alert=1
        fi
    fi

    return $alert
}

# Check recent service logs for errors
check_recent_errors() {
    log_info "Checking for recent errors..."

    local error_count
    error_count=$(ssh -i "${SSH_KEY}" -o ConnectTimeout=10 "${SERVER_USER}@${SERVER_HOST}" \
        "journalctl -u ${SERVICE_NAME} --since '5 minutes ago' --no-pager | grep -i 'error\|exception\|failed' | wc -l" 2>/dev/null || echo "0")

    if [[ "$error_count" -gt 0 ]]; then
        log_warning "Found $error_count error(s) in recent logs"

        # Show recent errors
        echo "Recent errors:"
        ssh -i "${SSH_KEY}" -o ConnectTimeout=10 "${SERVER_USER}@${SERVER_HOST}" \
            "journalctl -u ${SERVICE_NAME} --since '5 minutes ago' --no-pager | grep -i 'error\|exception\|failed' | tail -5" 2>/dev/null || true
        return 1
    else
        log_success "No errors found in recent logs"
        return 0
    fi
}

# Get service uptime
get_service_uptime() {
    local uptime
    uptime=$(ssh -i "${SSH_KEY}" -o ConnectTimeout=10 "${SERVER_USER}@${SERVER_HOST}" \
        "systemctl show ${SERVICE_NAME} --property=ActiveEnterTimestamp --value" 2>/dev/null || echo "unknown")

    if [[ "$uptime" != "unknown" ]]; then
        # Convert to human readable format (basic implementation)
        local uptime_seconds
        uptime_seconds=$(date -d "$uptime" +%s 2>/dev/null || echo "0")
        local now_seconds
        now_seconds=$(date +%s)
        local diff_seconds=$((now_seconds - uptime_seconds))

        local days=$((diff_seconds / 86400))
        local hours=$(((diff_seconds % 86400) / 3600))
        local minutes=$(((diff_seconds % 3600) / 60))

        if [[ $days -gt 0 ]]; then
            echo "Service uptime: ${days}d ${hours}h ${minutes}m"
        elif [[ $hours -gt 0 ]]; then
            echo "Service uptime: ${hours}h ${minutes}m"
        else
            echo "Service uptime: ${minutes}m"
        fi
    else
        echo "Service uptime: unknown"
    fi
}

# Generate status report
generate_status_report() {
    echo ""
    echo "=================================="
    echo "RedLemon Watch Party Status Report"
    echo "=================================="
    echo "Timestamp: $(date)"
    echo "Server: ${SERVER_HOST}"
    echo ""

    # Service status
    local service_status
    if check_service_status; then
        service_status="ONLINE"
    else
        service_status="OFFLINE"
    fi
    echo "Service Status: $service_status"

    # Service uptime
    echo "$(get_service_uptime)"

    # Health checks
    echo ""
    echo "Health Checks:"

    local overall_status=0

    check_http_health || overall_status=$?
    check_websocket_health || overall_status=$?

    # System resources
    echo ""
    echo "System Resources:"
    check_system_resources || overall_status=$?

    # Recent errors
    echo ""
    check_recent_errors || true

    # Overall status
    echo ""
    if [[ $overall_status -eq 0 ]]; then
        log_success "Overall Status: HEALTHY"
    else
        log_warning "Overall Status: ISSUES DETECTED"
    fi

    echo "=================================="

    return $overall_status
}

# Continuous monitoring mode
monitor_continuous() {
    local interval="${1:-60}" # Default 60 seconds

    log_info "Starting continuous monitoring (interval: ${interval}s)"
    log_info "Press Ctrl+C to stop"
    echo ""

    while true; do
        clear
        generate_status_report

        echo ""
        log_info "Next check in ${interval} seconds... ($(date '+%H:%M:%S'))"
        sleep "$interval"
    done
}

# Show recent logs
show_logs() {
    local lines="${1:-50}"
    log_info "Showing last ${lines} lines of service logs:"
    ssh -i "${SSH_KEY}" -o ConnectTimeout=10 "${SERVER_USER}@${SERVER_HOST}" \
        "journalctl -u ${SERVICE_NAME} -n ${lines} --no-pager" || log_error "Failed to fetch logs"
}

# Show system metrics
show_metrics() {
    log_info "System Metrics:"
    ssh -i "${SSH_KEY}" -o ConnectTimeout=10 "${SERVER_USER}@${SERVER_HOST}" << 'EOF'
        echo "=== System Information ==="
        uname -a
        echo ""

        echo "=== CPU Information ==="
        lscpu | grep -E "(Model name|CPU\(s\)|Thread)" | head -3
        echo ""

        echo "=== Memory Information ==="
        free -h
        echo ""

        echo "=== Disk Usage ==="
        df -h | grep -E "(/$|/opt)"
        echo ""

        echo "=== Network Connections ==="
        netstat -an | grep :8080 | head -10 || echo "No connections on port 8080"
        echo ""

        echo "=== Process Information ==="
        ps aux | grep -E "(node|watchparty)" | grep -v grep || echo "No watchparty processes found"
EOF
}

# Restart service if needed
restart_service() {
    log_info "Attempting to restart ${SERVICE_NAME} service..."

    if ssh -i "${SSH_KEY}" -o ConnectTimeout=10 "${SERVER_USER}@${SERVER_HOST}" "systemctl restart ${SERVICE_NAME}"; then
        log_success "Service restart initiated"
        sleep 3

        # Check status after restart
        if check_service_status; then
            log_success "Service restart successful"
        else
            log_error "Service restart failed"
            return 1
        fi
    else
        log_error "Failed to restart service"
        return 1
    fi
}

# Show usage
show_usage() {
    echo "RedLemon Watch Party Monitoring Script"
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  status        - Show current service status"
    echo "  health        - Run all health checks"
    echo "  monitor       - Continuous monitoring (default: 60s interval)"
    echo "  logs [N]      - Show last N log lines (default: 50)"
    echo "  metrics       - Show detailed system metrics"
    echo "  restart       - Restart the service"
    echo "  uptime        - Show service uptime"
    echo ""
    echo "Options:"
    echo "  monitor [N]   - Monitor with N second interval (default: 60)"
    echo ""
    echo "Examples:"
    echo "  $0 status          # Quick status check"
    echo "  $0 monitor 30      # Monitor every 30 seconds"
    echo "  $0 logs 100        # Show last 100 log lines"
    echo ""
    echo "Configuration:"
    echo "  Server: ${SERVER_HOST}"
    echo "  User: ${SERVER_USER}"
    echo "  SSH Key: ${SSH_KEY}"
    echo "  Log File: ${LOG_FILE}"
}

# Main script logic
main() {
    case "${1:-}" in
        "status")
            generate_status_report
            ;;
        "health")
            check_service_status
            check_http_health
            check_websocket_health
            check_system_resources
            check_recent_errors
            ;;
        "monitor")
            monitor_continuous "${2:-60}"
            ;;
        "logs")
            show_logs "${2:-50}"
            ;;
        "metrics")
            show_metrics
            ;;
        "restart")
            restart_service
            ;;
        "uptime")
            get_service_uptime
            ;;
        *)
            show_usage
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
