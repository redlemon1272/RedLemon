# Supabase to Self-Hosted Migration Plan

## Overview

Migrate from Supabase cloud to self-hosted PostgreSQL + PostgREST on AnonVM server to reduce costs and increase control.

## Current Architecture

```
RedLemon App (macOS)
    ↓
Supabase Cloud (supabase.co)
    ├── PostgreSQL (Database)
    ├── PostgREST (API)
    ├── Auth (Authentication)
    └── Realtime (WebSocket subscriptions)
```

## Target Architecture

```
RedLemon App (macOS)
    ↓
AnonVM Server (your-domain.com)
    ├── PostgreSQL (Port 5432)
    ├── PostgREST (Port 3001)
    ├── Supabase Auth (Port 3002)
    ├── Supabase Realtime (Port 3003)
    ├── uWebSockets (Port 3000) - existing
    └── Nginx (Port 80/443) - reverse proxy
```

## Prerequisites

### Server Requirements
- **RAM:** 4GB minimum, 8GB recommended
- **CPU:** 2 cores minimum, 4 cores recommended
- **Storage:** 50GB minimum, 100GB recommended
- **OS:** Ubuntu 22.04 LTS or similar

### Access Requirements
- SSH access to AnonVM server
- Domain name with DNS control
- Supabase project admin access
- Current database credentials

## Phase 1: Data Export from Supabase

### Step 1.1: Export Database Schema and Data

```bash
# Install Supabase CLI locally
brew install supabase/tap/supabase

# Login to Supabase
supabase login

# Link to your project
supabase link --project-ref YOUR_PROJECT_REF

# Export database schema
supabase db dump --schema public > schema.sql

# Export data
supabase db dump --data-only > data.sql

# Export auth users (if using Supabase Auth)
supabase db dump --schema auth > auth_schema.sql
```

### Step 1.2: Document Current Configuration

Create a backup of:
- Database connection strings
- API keys and secrets
- Auth configuration (JWT secrets, providers)
- Storage bucket configuration
- Realtime channel subscriptions
- Row Level Security (RLS) policies

```bash
# Save current environment variables
cat > supabase_config_backup.env << EOF
SUPABASE_URL=your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-key
JWT_SECRET=your-jwt-secret
EOF
```

## Phase 2: Server Setup

### Step 2.1: Install PostgreSQL

```bash
# SSH into AnonVM server
ssh user@your-anonvm-server

# Update system
sudo apt update && sudo apt upgrade -y

# Install PostgreSQL 15
sudo apt install -y postgresql-15 postgresql-contrib-15

# Start and enable PostgreSQL
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Create database and user
sudo -u postgres psql << EOF
CREATE DATABASE redlemon;
CREATE USER redlemon_user WITH ENCRYPTED PASSWORD 'your_secure_password';
GRANT ALL PRIVILEGES ON DATABASE redlemon TO redlemon_user;
\c redlemon
GRANT ALL ON SCHEMA public TO redlemon_user;
EOF
```

### Step 2.2: Configure PostgreSQL for Remote Access

```bash
# Edit postgresql.conf
sudo nano /etc/postgresql/15/main/postgresql.conf

# Change:
listen_addresses = 'localhost'  # to:
listen_addresses = '*'

# Edit pg_hba.conf
sudo nano /etc/postgresql/15/main/pg_hba.conf

# Add:
host    redlemon    redlemon_user    0.0.0.0/0    scram-sha-256

# Restart PostgreSQL
sudo systemctl restart postgresql
```

### Step 2.3: Install PostgREST

```bash
# Download PostgREST
cd /opt
sudo wget https://github.com/PostgREST/postgrest/releases/download/v11.2.2/postgrest-v11.2.2-linux-static-x64.tar.xz
sudo tar -xf postgrest-v11.2.2-linux-static-x64.tar.xz
sudo mv postgrest /usr/local/bin/
sudo chmod +x /usr/local/bin/postgrest

# Create PostgREST configuration
sudo mkdir -p /etc/postgrest
sudo nano /etc/postgrest/config.conf
```

PostgREST config (`/etc/postgrest/config.conf`):
```conf
db-uri = "postgres://redlemon_user:your_secure_password@localhost:5432/redlemon"
db-schemas = "public"
db-anon-role = "redlemon_user"
server-host = "127.0.0.1"
server-port = 3001
jwt-secret = "your-jwt-secret-from-supabase"
```

### Step 2.4: Create PostgREST Systemd Service

```bash
sudo nano /etc/systemd/system/postgrest.service
```

```ini
[Unit]
Description=PostgREST API Server
After=postgresql.service
Requires=postgresql.service

[Service]
Type=simple
User=postgres
ExecStart=/usr/local/bin/postgrest /etc/postgrest/config.conf
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

```bash
# Enable and start PostgREST
sudo systemctl daemon-reload
sudo systemctl enable postgrest
sudo systemctl start postgrest
sudo systemctl status postgrest
```

### Step 2.5: Install Supabase Realtime (Optional)

```bash
# Install Docker if not already installed
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker

# Create Realtime configuration
mkdir -p ~/supabase-realtime
cd ~/supabase-realtime

# Create docker-compose.yml
cat > docker-compose.yml << EOF
version: '3.8'
services:
  realtime:
    image: supabase/realtime:latest
    ports:
      - "3003:4000"
    environment:
      DB_HOST: host.docker.internal
      DB_PORT: 5432
      DB_NAME: redlemon
      DB_USER: redlemon_user
      DB_PASSWORD: your_secure_password
      DB_SSL: "false"
      PORT: 4000
      JWT_SECRET: your-jwt-secret-from-supabase
    extra_hosts:
      - "host.docker.internal:host-gateway"
EOF

# Start Realtime
docker-compose up -d
```

## Phase 3: Data Migration

### Step 3.1: Import Schema

```bash
# Copy schema.sql to server
scp schema.sql user@your-anonvm-server:~/

# SSH into server and import
ssh user@your-anonvm-server
sudo -u postgres psql -d redlemon -f ~/schema.sql
```

### Step 3.2: Import Data

```bash
# Import data
sudo -u postgres psql -d redlemon -f ~/data.sql

# Verify data
sudo -u postgres psql -d redlemon -c "SELECT COUNT(*) FROM users;"
sudo -u postgres psql -d redlemon -c "SELECT COUNT(*) FROM watch_history;"
```

### Step 3.3: Import Auth Data (if applicable)

```bash
# Import auth schema
sudo -u postgres psql -d redlemon -f ~/auth_schema.sql
```

## Phase 4: Nginx Configuration

### Step 4.1: Install Nginx

```bash
sudo apt install -y nginx certbot python3-certbot-nginx
```

### Step 4.2: Configure Reverse Proxy

```bash
sudo nano /etc/nginx/sites-available/redlemon
```

```nginx
# API endpoint (PostgREST)
server {
    listen 80;
    server_name api.your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:3001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}

# Realtime endpoint
server {
    listen 80;
    server_name realtime.your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:3003;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
}

# Watch Party WebSocket (existing)
server {
    listen 80;
    server_name ws.your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
}
```

```bash
# Enable site
sudo ln -s /etc/nginx/sites-available/redlemon /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx

# Get SSL certificates
sudo certbot --nginx -d api.your-domain.com
sudo certbot --nginx -d realtime.your-domain.com
sudo certbot --nginx -d ws.your-domain.com
```

## Phase 5: Update RedLemon App

### Step 5.1: Update Environment Variables

Update your RedLemon app configuration:

```swift
// Before (Supabase Cloud)
let supabaseURL = "https://your-project.supabase.co"
let supabaseAnonKey = "your-anon-key"

// After (Self-Hosted)
let supabaseURL = "https://api.your-domain.com"
let supabaseAnonKey = "your-anon-key" // Keep same JWT secret
```

### Step 5.2: Test Connection

```swift
// Test database connection
let response = try await supabase
    .from("users")
    .select()
    .limit(1)
    .execute()

print("✅ Database connection successful")
```

## Phase 6: Testing & Validation

### Step 6.1: Functional Tests

- [ ] User authentication works
- [ ] Database queries return correct data
- [ ] Watch history saves properly
- [ ] Friendships sync correctly
- [ ] Watch party connections work
- [ ] Realtime subscriptions work (if used)

### Step 6.2: Performance Tests

```bash
# Test API response time
curl -w "@curl-format.txt" -o /dev/null -s "https://api.your-domain.com/users?limit=1"

# Monitor PostgreSQL performance
sudo -u postgres psql -d redlemon -c "SELECT * FROM pg_stat_activity;"
```

### Step 6.3: Backup Verification

```bash
# Create automated backup script
sudo nano /usr/local/bin/backup-redlemon-db.sh
```

```bash
#!/bin/bash
BACKUP_DIR="/var/backups/redlemon"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR
sudo -u postgres pg_dump redlemon | gzip > $BACKUP_DIR/redlemon_$DATE.sql.gz

# Keep only last 7 days
find $BACKUP_DIR -name "redlemon_*.sql.gz" -mtime +7 -delete
```

```bash
sudo chmod +x /usr/local/bin/backup-redlemon-db.sh

# Add to crontab (daily at 2 AM)
sudo crontab -e
# Add: 0 2 * * * /usr/local/bin/backup-redlemon-db.sh
```

## Phase 7: Cutover

### Step 7.1: Planned Downtime

1. Announce maintenance window to users
2. Stop accepting new writes to Supabase
3. Export final data snapshot
4. Import to self-hosted database
5. Update DNS/app configuration
6. Test thoroughly
7. Monitor for issues

### Step 7.2: Rollback Plan

If issues occur:
1. Revert DNS changes
2. Point app back to Supabase cloud
3. Investigate issues
4. Fix and retry migration

## Post-Migration

### Monitoring

```bash
# Install monitoring tools
sudo apt install -y prometheus grafana

# Monitor PostgreSQL
sudo apt install -y postgresql-15-pg-stat-statements
```

### Optimization

```bash
# Tune PostgreSQL for your workload
sudo nano /etc/postgresql/15/main/postgresql.conf

# Recommended settings for 8GB RAM server:
shared_buffers = 2GB
effective_cache_size = 6GB
maintenance_work_mem = 512MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
effective_io_concurrency = 200
work_mem = 10MB
min_wal_size = 1GB
max_wal_size = 4GB
```

## Cost Savings

**Before (Supabase Cloud):**
- Pro Plan: $25/month
- Total: $25/month

**After (Self-Hosted):**
- AnonVM Server: (existing, no additional cost)
- Total: $0/month additional

**Annual Savings:** $300/year

## Next Steps

After successful migration:
1. ✅ Supabase migrated
2. 📋 Set up BTCPay Server (see BTCPAY_SETUP.md)
3. 📋 Implement hosting monetization
4. 📋 Build user dashboard
