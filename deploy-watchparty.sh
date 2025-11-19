#!/bin/bash

# RedLemon Watch Party Unified Deployment Script
# Manages deployment, updates, and monitoring for the watchparty WebSocket server

set -euo pipefail

# Configuration
SERVER_HOST="151.243.109.217"
SERVER_USER="root"
SSH_KEY="${HOME}/.ssh/id_ed25519_redlemon"
DEPLOY_PATH="/opt/watchparty-server"
SERVICE_NAME="watchparty"
REPO_URL="https://github.com/orangeapple1272/Redlemon.git"
LOCAL_REPO_PATH="$(pwd)"
DOMAIN="151.243.109.217.nip.io"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if required tools are available
check_dependencies() {
    log_info "Checking dependencies..."

    local missing_deps=()

    if ! command -v ssh &> /dev/null; then
        missing_deps+=("ssh")
    fi

    if ! command -v scp &> /dev/null; then
        missing_deps+=("scp")
    fi

    if ! command -v git &> /dev/null; then
        missing_deps+=("git")
    fi

    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "Missing dependencies: ${missing_deps[*]}"
        log_info "Please install the missing dependencies and try again."
        exit 1
    fi

    log_success "All dependencies are available"
}

# Test SSH connection
test_ssh() {
    log_info "Testing SSH connection to ${SERVER_HOST}..."

    if ssh -i "${SSH_KEY}" -o ConnectTimeout=10 -o BatchMode=yes "${SERVER_USER}@${SERVER_HOST}" "echo 'SSH connection successful'" 2>/dev/null; then
        log_success "SSH connection test passed"
        return 0
    else
        log_error "SSH connection test failed"
        log_info "Please check:"
        log_info "1. SSH key exists at ${SSH_KEY}"
        log_info "2. Server is accessible at ${SERVER_HOST}"
        log_info "3. SSH key is authorized on the server"
        return 1
    fi
}

# Setup server environment
setup_server() {
    log_info "Setting up server environment..."

    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" << EOF
        # Create deployment directory
        sudo mkdir -p "${DEPLOY_PATH}"
        sudo chown -R root:root "${DEPLOY_PATH}"

        # Install system dependencies if missing
        if ! command -v node &> /dev/null; then
            echo "Installing Node.js..."
            curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
            sudo apt-get install -y nodejs
        fi

        # Install TypeScript globally
        if ! command -v tsc &> /dev/null; then
            echo "Installing TypeScript..."
            npm install -g typescript
        fi

        if ! command -v docker &> /dev/null; then
            echo "Installing Docker..."
            curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            sudo usermod -aG docker root
        fi

        # Install Caddy
        if ! command -v caddy &> /dev/null; then
            echo "Installing Caddy..."
            sudo apt-get install -y debian-keyring debian-archive-keyring apt-transport-https curl
            curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
            curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
            sudo apt-get update
            sudo apt-get install -y caddy
        fi
        
        # Ensure Caddy directory exists and service is enabled
        sudo mkdir -p /etc/caddy
        sudo systemctl enable caddy
        sudo systemctl start caddy || true

        # Create systemd service directory
        sudo mkdir -p /etc/systemd/system

        # Create logs directory
        sudo mkdir -p /var/log/watchparty
        sudo chown -R root:root /var/log/watchparty

        echo "Server environment setup complete"
EOF

    if [ $? -eq 0 ]; then
        log_success "Server environment setup complete"
    else
        log_error "Server environment setup failed"
        return 1
    fi
}

# Deploy application
deploy_app() {
    log_info "Deploying watchparty application..."

    # Create temporary directory for deployment
    local temp_dir=$(mktemp -d)

    # Copy server code to temporary directory
    cp -r "${LOCAL_REPO_PATH}/watchparty-server"/* "${temp_dir}/"

    # Create environment file
    cat > "${temp_dir}/.env" << EOL
# Watch Party Server Configuration
PORT=18081
MAX_MESSAGE_BYTES=8192
LOG_LEVEL=info
AUTH_BYPASS=false

# Supabase Configuration (replace with your values)
SUPABASE_PROJECT_ID=your-project-id
SUPABASE_JWKS_URL=https://your-project.supabase.co/auth/v1/.well-known/jwks.json
SUPABASE_ISSUER=https://your-project.supabase.co/auth/v1

# Optional: Redis for multi-node deployments
# REDIS_URL=redis://localhost:6379
EOL

    # Copy to server
    log_info "Copying files to server..."
    scp -i "${SSH_KEY}" -r "${temp_dir}"/* "${SERVER_USER}@${SERVER_HOST}:${DEPLOY_PATH}/"

    # Cleanup temporary directory
    rm -rf "${temp_dir}"

    # Build and run Docker container
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" << EOF
        cd "${DEPLOY_PATH}"
        
        # Stop existing container if running
        docker stop ${SERVICE_NAME} 2>/dev/null || true
        docker rm ${SERVICE_NAME} 2>/dev/null || true
        
        # Build image
        docker build -t ${SERVICE_NAME} .
        
        # Run container
        docker run -d \
            --name ${SERVICE_NAME} \
            --restart unless-stopped \
            -p 18081:18081 \
            --env-file .env \
            ${SERVICE_NAME}
            
        # Configure Caddy
        cat > /etc/caddy/Caddyfile << CADDY
${DOMAIN} {
    reverse_proxy localhost:18081
}
CADDY

        # Reload Caddy
        systemctl reload caddy
EOF

    if [ $? -eq 0 ]; then
        log_success "Application deployment complete"
    else
        log_error "Application deployment failed"
        return 1
    fi
}

# Create systemd service (Legacy - now using Docker)
create_service() {
    log_info "Skipping systemd service creation (using Docker)"
}

# Service management functions
start_service() {
    log_info "Starting ${SERVICE_NAME} service..."
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" "docker start ${SERVICE_NAME}"

    if [ $? -eq 0 ]; then
        log_success "Service started successfully"
        sleep 2
        show_status
    else
        log_error "Failed to start service"
        return 1
    fi
}

stop_service() {
    log_info "Stopping ${SERVICE_NAME} service..."
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" "docker stop ${SERVICE_NAME}"

    if [ $? -eq 0 ]; then
        log_success "Service stopped successfully"
    else
        log_error "Failed to stop service"
        return 1
    fi
}

restart_service() {
    log_info "Restarting ${SERVICE_NAME} service..."
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" "docker restart ${SERVICE_NAME}"

    if [ $? -eq 0 ]; then
        log_success "Service restarted successfully"
        sleep 2
        show_status
    else
        log_error "Failed to restart service"
        return 1
    fi
}

show_status() {
    log_info "Service status:"
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" "docker ps -f name=${SERVICE_NAME}"

    log_info "Recent logs:"
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" "docker logs --tail 20 ${SERVICE_NAME}"
}

show_logs() {
    local lines=${1:-50}
    log_info "Showing last ${lines} log lines:"
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" "docker logs --tail ${lines} -f ${SERVICE_NAME}"
}

health_check() {
    log_info "Performing health check..."

    # Test HTTP health endpoint
    if curl -f -s "https://${DOMAIN}/healthz" > /dev/null; then
        log_success "HTTP health check passed (https://${DOMAIN}/healthz)"
    else
        log_error "HTTP health check failed (https://${DOMAIN}/healthz)"
        return 1
    fi

    # Test WebSocket connection
    log_info "Testing WebSocket connection..."
    timeout 10 node -e "
        const WebSocket = require('ws');
        const ws = new WebSocket('wss://${DOMAIN}');

        ws.on('open', () => {
            console.log('WebSocket connection successful');
            ws.close();
            process.exit(0);
        });

        ws.on('error', (error) => {
            console.error('WebSocket connection failed:', error.message);
            process.exit(1);
        });

        setTimeout(() => {
            console.error('WebSocket connection timeout');
            process.exit(1);
        }, 5000);
    " 2>/dev/null

    if [ $? -eq 0 ]; then
        log_success "WebSocket health check passed"
    else
        log_warning "WebSocket health check failed"
    fi
}

update_app() {
    log_info "Updating application..."

    # Backup current version
    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" << EOF
        cd "${DEPLOY_PATH}"
        if [ -d ".git" ]; then
            git log --oneline -1 > /tmp/last_commit.txt 2>/dev/null || true
        fi
EOF

    # Deploy new version
    if deploy_app; then
        restart_service
        health_check

        log_success "Application update complete"
    else
        log_error "Application update failed"
        return 1
    fi
}

backup_data() {
    log_info "Creating backup..."

    local backup_dir="/tmp/watchparty-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "${backup_dir}"

    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" << EOF
        # Create backup
        mkdir -p "${backup_dir}"
        cp -r "${DEPLOY_PATH}" "${backup_dir}/app" 2>/dev/null || true
        journalctl -u ${SERVICE_NAME} > "${backup_dir}/logs.txt" 2>/dev/null || true

        # Compress backup
        tar -czf "${backup_dir}.tar.gz" -C "$(dirname "${backup_dir}")" "$(basename "${backup_dir}")"
        rm -rf "${backup_dir}"

        echo "Backup created: ${backup_dir}.tar.gz"
EOF

    if [ $? -eq 0 ]; then
        log_success "Backup completed"
    else
        log_error "Backup failed"
        return 1
    fi
}

cleanup() {
    log_info "Cleaning up old deployments..."

    ssh -i "${SSH_KEY}" "${SERVER_USER}@${SERVER_HOST}" << EOF
        # Keep only last 3 versions
        cd "${DEPLOY_PATH%/*}"
        ls -t | tail -n +4 | xargs -r rm -rf 2>/dev/null || true

        # Clean old logs (keep last 7 days)
        find /var/log/watchparty -name "*.log" -mtime +7 -delete 2>/dev/null || true

        journalctl --vacuum-time=7d

        echo "Cleanup complete"
EOF

    log_success "Cleanup completed"
}

# Show usage
show_usage() {
    echo "RedLemon Watch Party Deployment Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  setup     - Initial server setup and dependencies"
    echo "  deploy    - Deploy the application"
    echo "  start     - Start the service"
    echo "  stop      - Stop the service"
    echo "  restart   - Restart the service"
    echo "  status    - Show service status and logs"
    echo "  logs      - Show service logs (default: 50 lines)"
    echo "  health    - Perform health check"
    echo "  update    - Update the application"
    echo "  backup    - Create backup"
    echo "  cleanup   - Clean up old deployments and logs"
    echo ""
    echo "Examples:"
    echo "  $0 setup           # Initial setup"
    echo "  $0 deploy          # Deploy application"
    echo "  $0 start           # Start service"
    echo "  $0 logs 100       # Show last 100 log lines"
    echo ""
    echo "Configuration:"
    echo "  Server: ${SERVER_HOST}"
    echo "  User: ${SERVER_USER}"
    echo "  Deploy Path: ${DEPLOY_PATH}"
    echo "  SSH Key: ${SSH_KEY}"
}

# Main script logic
main() {
    # Check dependencies first
    check_dependencies

    case "${1:-}" in
        "setup")
            test_ssh || exit 1
            setup_server || exit 1
            ;;
        "deploy")
            test_ssh || exit 1
            deploy_app || exit 1
            create_service || exit 1
            start_service || exit 1
            health_check
            ;;
        "start")
            test_ssh || exit 1
            start_service || exit 1
            ;;
        "stop")
            test_ssh || exit 1
            stop_service || exit 1
            ;;
        "restart")
            test_ssh || exit 1
            restart_service || exit 1
            ;;
        "status")
            test_ssh || exit 1
            show_status
            ;;
        "logs")
            test_ssh || exit 1
            show_logs "${2:-50}"
            ;;
        "health")
            health_check
            ;;
        "update")
            test_ssh || exit 1
            update_app || exit 1
            ;;
        "backup")
            test_ssh || exit 1
            backup_data || exit 1
            ;;
        "cleanup")
            test_ssh || exit 1
            cleanup || exit 1
            ;;
        "full-deploy")
            log_info "Performing full deployment (setup + deploy)..."
            test_ssh || exit 1
            setup_server || exit 1
            deploy_app || exit 1
            create_service || exit 1
            start_service || exit 1
            health_check
            log_success "Full deployment complete!"
            ;;
        *)
            show_usage
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
