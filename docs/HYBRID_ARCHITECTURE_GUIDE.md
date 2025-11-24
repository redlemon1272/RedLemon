# RedLemon Hybrid Architecture Guide
## Self-Hosted Supabase + Global Latency Optimization

**Purpose:** Complete guide for migrating to self-hosted Supabase while maintaining low latency through geographic relay nodes.

**Created:** November 23, 2025  
**Status:** Ready for Implementation  

---

## 🎯 Executive Summary

This guide implements the hybrid architecture that solves your uWebSockets frustrations while maintaining global performance:

- **Keep AnonVM (NL)** as your secure main backend
- **Self-host Supabase** to eliminate hosted limitations  
- **Add relay nodes** for geographic latency optimization
- **Use hybrid approach** - Supabase for reliability, uWebSockets for speed

---

## 🏗️ Architecture Overview

### Current State (Working)
```
RedLemon Client → Supabase Hosted (US) → uWebSockets.js (AnonVM NL)
```

### Target State (Optimal)
```
                  ┌─────────────────────┐
                  │   Self-Hosted       │
                  │   Supabase          │
                  │   + uWebSockets.js  │
                  │   (AnonVM NL)       │
                  └─────────┬───────────┘
                            │
            ┌───────────────┼───────────────┐
            │               │               │
    ┌───────▼──────┐ ┌──────▼──────┐ ┌─────▼──────┐
    │ US Relay     │ │ Canada Relay│ │ Direct EU  │
    │ ($5-10/mo)   │ │ ($5-10/mo)  │ │ Connection │
    └───────┬──────┘ └──────┬──────┘ └────────────┘
            │               │               │
            └───────────────┼───────────────┘
                            │
                    ┌───────▼───────┐
                    │ Global Clients│
                    └───────────────┘
```

### Data Flow
- **EU Clients**: Direct to AnonVM (20-40ms)
- **NA Clients**: Via relay → AnonVM (60-80ms total, vs 150-200ms direct)
- **All Auth/Persistence**: Self-hosted Supabase on AnonVM
- **Real-time Sync**: uWebSockets.js on AnonVM (proxied through relays)

---

## 📋 Implementation Plan

### Phase 1: Self-Hosted Supabase (Week 1-2)
- [ ] Deploy Supabase on AnonVM
- [ ] Migrate database from hosted
- [ ] Update client configuration
- [ ] Test authentication and data access

### Phase 2: Relay Node Setup (Week 3)
- [ ] Provision US relay server
- [ ] Configure WebSocket proxy
- [ ] Set up SSL certificates
- [ ] Test connection and performance

### Phase 3: Client-Side Routing (Week 4)
- [ ] Implement geographic detection
- [ ] Add smart connection logic
- [ ] Update WebSocket connection code
- [ ] Test regional performance

### Phase 4: Monitoring & Optimization (Week 5-6)
- [ ] Add performance metrics
- [ ] Monitor latency improvements
- [ ] Optimize based on real usage
- [ ] Add Canada relay if needed

---

## 🛠️ Phase 1: Self-Hosted Supabase Setup

### 1.1 Prerequisites on AnonVM
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker & Docker Compose
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install required packages
sudo apt install -y git curl wget htop
```

### 1.2 Deploy Supabase via Docker
```bash
# Clone Supabase repository
git clone https://github.com/supabase/cli
cd cli

# Initialize Supabase project
supabase init

# Start with Docker Compose
supabase start
```

### 1.3 Configuration (`docker-compose.yml`)
```yaml
version: '3.8'
services:
  db:
    image: supabase/postgres:15.1.0.88
    restart: unless-stopped
    environment:
      POSTGRES_PASSWORD: your-strong-password
      POSTGRES_DB: postgres
      POSTGRES_INITDB_ARGS: --data-checksums
    volumes:
      - ./volumes/db:/var/lib/postgresql/data
    ports:
      - '5432:5432'

  rest:
    image: supabase/postgrest:12.0.1
    depends_on:
      - db
    restart: unless-stopped
    environment:
      PGRST_DB_URI: postgres://authenticator:your-strong-password@db:5432/postgres
      PGRST_DB_SCHEMAS: public,storage,graphql_public
      PGRST_DB_EXTRA_SEARCH_PATH: public
      PGRST_DEFAULT_HEADERS: x-custom-client-header: redlemon
    ports:
      - '3000:3000'

  realtime:
    image: supabase/realtime:2.26.5
    depends_on:
      - db
    restart: unless-stopped
    environment:
      PORT: 4000
      DB_HOST: db
      DB_PORT: 5432
      DB_USER: supabase_admin
      DB_PASSWORD: your-strong-password
      DB_NAME: postgres
      DB_AFTER_CONNECT_QUERY: 'SET search_path TO _realtime'
      API_JWT_SECRET: your-jwt-secret
      SUPABASE_REF: your-project-ref
    ports:
      - '4000:4000'

  storage:
    image: supabase/storage-api:0.47.4
    depends_on:
      - db
      - rest
    restart: unless-stopped
    environment:
      ANON_KEY: your-anon-key
      SERVICE_KEY: your-service-key
      POSTGREST_URL: http://rest:3000
      DATABASE_URL: postgres://supabase_admin:your-strong-password@db:5432/postgres
    ports:
      - '5000:5000'

  auth:
    image: supabase/gotrue:v2.91.2
    depends_on:
      - db
    restart: unless-stopped
    environment:
      API_EXTERNAL_URL: https://151.243.109.217.nip.io
      GOTRUE_API_HOST: 0.0.0.0
      PGRST_JWT_SECRET: your-jwt-secret
      JWT_SECRET: your-jwt-secret
      PORT: 9999
      DB_URL: postgres://supabase_authenticator:your-strong-password@db:5432/postgres
      SITE_URL: https://redlemon.app
      GOTRUE_MAILER_AUTOCONFIRM: true
      GOTRUE_EXTERNAL_EMAIL_ENABLED: false
    ports:
      - '9999:9999'
```

### 1.4 Database Migration
```bash
# Export from hosted Supabase
supabase db dump --data-only -f hosted-data.sql

# Import to self-hosted
supabase db push

# Run your existing schema
supabase db reset
```

### 1.5 Update Client Configuration
```swift
// Sources/App/Config.swift
struct Config {
    // Update to your self-hosted instance
    static let supabaseURL = "https://151.243.109.217.nip.io"
    static let supabaseAnonKey = "your-new-anon-key"
    
    // Keep existing uWebSockets URL
    static let webSocketURL = "wss://151.243.109.217.nip.io/ws"
    
    // New: Geographic routing
    static let usRelayURL = "wss://us-relay.redlemon.app/ws"
    static let canadaRelayURL = "wss://ca-relay.redlemon.app/ws"
}
```

---

## 🌐 Phase 2: Relay Node Implementation

### 2.1 Provision US Relay Server
```bash
# Recommended providers:
# - DigitalOcean: $6/month (New York)
# - Vultr: $6/month (New York/Miami)
# - Hetzner: $5/month (Ashburn, VA)

# Ubuntu 22.04 LTS recommended
# Minimum: 1 vCPU, 512MB RAM, 10GB SSD
```

### 2.2 Install Caddy (Simple HTTPS Proxy)
```bash
# Install Caddy
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable.gpg
echo "deb [signed-by=/usr/share/keyrings/caddy-stable.gpg] https://dl.cloudsmith.io/public/caddy/stable/deb/debian any-version main" | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

# Enable and start Caddy
sudo systemctl enable caddy
sudo systemctl start caddy
```

### 2.3 Configure Caddy (`/etc/caddy/Caddyfile`)
```caddy
us-relay.redlemon.app {
    # WebSocket proxy to AnonVM
    reverse_proxy /ws 151.243.109.217:443 {
        header_up Host {upstream_host}
        header_up X-Real-IP {remote_host}
        header_up X-Forwarded-For {remote_host}
        header_up X-Forwarded-Proto {scheme}
    }
    
    # Health check endpoint
    handle /healthz {
        respond "ok" 200
    }
    
    # Global options
    encode zstd gzip
    log {
        output file /var/log/caddy/us-relay.log
        level INFO
    }
}

# Let's Encrypt will automatically provision SSL certificate
```

### 2.4 Alternative: Nginx Configuration
```nginx
# /etc/nginx/sites-available/us-relay
server {
    listen 80;
    server_name us-relay.redlemon.app;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name us-relay.redlemon.app;
    
    # SSL certificates (Let's Encrypt)
    ssl_certificate /etc/letsencrypt/live/us-relay.redlemon.app/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/us-relay.redlemon.app/privkey.pem;
    
    # WebSocket proxy
    location /ws {
        proxy_pass https://151.243.109.217.nip.io/ws;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # WebSocket specific
        proxy_buffering off;
        proxy_cache off;
        proxy_read_timeout 86400s;
        proxy_send_timeout 86400s;
    }
    
    # Health check
    location /healthz {
        access_log off;
        return 200 "ok\n";
        add_header Content-Type text/plain;
    }
}
```

### 2.5 SSL Certificate Setup
```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx

# Get certificate
sudo certbot --nginx -d us-relay.redlemon.app

# Test auto-renewal
sudo certbot renew --dry-run
```

### 2.6 Test Relay Functionality
```bash
# Test health endpoint
curl https://us-relay.redlemon.app/healthz

# Test WebSocket proxy (requires wscat)
npm install -g wscat
wscat -c wss://us-relay.redlemon.app/ws

# Should connect to your AnonVM uWebSockets server
```

---

## 📱 Phase 3: Client-Side Geographic Routing

### 3.1 Geographic Detection Utility
```swift
// Sources/Networking/GeoRouter.swift
import Foundation
import Network

class GeoRouter {
    static let shared = GeoRouter()
    
    private init() {}
    
    enum Region {
        case northAmerica
        case europe
        case other
    }
    
    func detectRegion() -> Region {
        // Method 1: IP-based detection
        if let region = detectByIP() {
            return region
        }
        
        // Method 2: Timezone-based detection
        return detectByTimezone()
    }
    
    private func detectByIP() -> Region? {
        // Use a lightweight IP geolocation service
        guard let url = URL(string: "https://ipapi.co/json/") else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let countryCode = json["country_code"] as? String else { return nil }
            
            // US, CA, MX are North America
            if ["US", "CA", "MX"].contains(countryCode) {
                return .northAmerica
            }
            
            // Major European countries
            if ["GB", "DE", "FR", "NL", "IT", "ES", "SE", "NO", "DK", "FI"].contains(countryCode) {
                return .europe
            }
            
            return .other
        } catch {
            return nil
        }
    }
    
    private func detectByTimezone() -> Region {
        let timezone = TimeZone.current
        let offset = timezone.secondsFromGMT()
        
        // North American timezones (UTC-5 to UTC-10)
        if offset >= -10 * 3600 && offset <= -5 * 3600 {
            return .northAmerica
        }
        
        // European timezones (UTC to UTC+4)
        if offset >= -1 * 3600 && offset <= 4 * 3600 {
            return .europe
        }
        
        return .other
    }
    
    func getOptimalWebSocketURL() -> String {
        let region = detectRegion()
        
        switch region {
        case .northAmerica:
            // Try US relay first, fallback to Canada
            return testConnection(Config.usRelayURL) ? 
                   Config.usRelayURL : 
                   Config.canadaRelayURL
        case .europe:
            // Direct to AnonVM for best performance
            return Config.webSocketURL
        case .other:
            // Default to direct connection
            return Config.webSocketURL
        }
    }
    
    private func testConnection(_ url: String) -> Bool {
        // Simple connectivity test
        guard let wsURL = URL(string: url) else { return false }
        
        var isConnected = false
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.webSocketTask(with: wsURL)
        task.resume()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            isConnected = (task.state == .running)
            semaphore.signal()
        }
        
        semaphore.wait()
        return isConnected
    }
}
```

### 3.2 Update WebSocket Connection Logic
```swift
// Sources/Features/WatchParty/WebSocketTransport.swift
class WebSocketTransport {
    private var webSocketTask: URLSessionWebSocketTask?
    private var url: String
    
    init() {
        // Use geographic routing
        self.url = GeoRouter.shared.getOptimalWebSocketURL()
        print("🌍 Connecting to WebSocket: \(url)")
    }
    
    func connect() {
        guard let wsURL = URL(string: url) else {
            print("❌ Invalid WebSocket URL: \(url)")
            return
        }
        
        webSocketTask = URLSession.shared.webSocketTask(with: wsURL)
        webSocketTask?.resume()
        
        print("🔌 WebSocket connection initiated to: \(url)")
    }
    
    func reconnect() {
        disconnect()
        
        // Re-evaluate optimal endpoint
        let newURL = GeoRouter.shared.getOptimalWebSocketURL()
        if newURL != url {
            url = newURL
            print("🔄 Switching to better endpoint: \(url)")
        }
        
        connect()
    }
}
```

### 3.3 Performance Monitoring
```swift
// Sources/Services/LatencyMonitor.swift
class LatencyMonitor {
    static let shared = LatencyMonitor()
    
    private var connectionStartTime: Date?
    private var authCompletionTime: Date?
    
    func recordConnectionStart() {
        connectionStartTime = Date()
    }
    
    func recordAuthCompletion() {
        authCompletionTime = Date()
        calculateAndLogLatency()
    }
    
    private func calculateAndLogLatency() {
        guard let start = connectionStartTime,
              let auth = authCompletionTime else { return }
        
        let connectionLatency = auth.timeIntervalSince(start) * 1000 // Convert to ms
        
        print("📊 WebSocket Latency: \(String(format: "%.2f", connectionLatency))ms")
        
        // Log to analytics or monitoring service
        logPerformanceMetrics(latency: connectionLatency)
    }
    
    private func logPerformanceMetrics(latency: TimeInterval) {
        let region = GeoRouter.shared.detectRegion()
        let endpoint = GeoRouter.shared.getOptimalWebSocketURL()
        
        let metrics: [String: Any] = [
            "latency_ms": latency,
            "region": String(describing: region),
            "endpoint": endpoint,
            "timestamp": Date().timeIntervalSince1970
        ]
        
        // Send to monitoring service or log locally
        print("📈 Performance Metrics: \(metrics)")
    }
}
```

---

## 📊 Phase 4: Performance Monitoring & Optimization

### 4.1 Monitoring Dashboard Setup
```bash
# Install monitoring tools on AnonVM
sudo apt install -y prometheus grafana

# Simple Prometheus configuration
cat > /etc/prometheus/prometheus.yml << EOF
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'redlemon-relays'
    static_configs:
      - targets: ['localhost:9090', 'us-relay.redlemon.app:9090']
EOF
```

### 4.2 WebSocket Performance Metrics
```swift
// Add to your WebSocket message handling
extension WebSocketTransport {
    private func trackMessageMetrics(messageType: String, size: Int) {
        let metrics = [
            "message_type": messageType,
            "size_bytes": size,
            "timestamp": Date().timeIntervalSince1970,
            "region": String(describing: GeoRouter.shared.detectRegion())
        ]
        
        // Send to monitoring endpoint
        sendMetricsToServer(metrics)
    }
}
```

### 4.3 Latency Testing Script
```bash
#!/bin/bash
# scripts/test-latency.sh

echo "🌍 Testing RedLemon WebSocket Latency"
echo "====================================="

# Test direct connection to AnonVM
echo "📡 Testing direct to AnonVM (NL):"
time curl -s https://151.243.109.217.nip.io/healthz

# Test US relay
echo ""
echo "🇺🇸 Testing US Relay:"
time curl -s https://us-relay.redlemon.app/healthz

# Test Canada relay
echo ""
echo "🇨🇦 Testing Canada Relay:"
time curl -s https://ca-relay.redlemon.app/healthz

# WebSocket latency test
echo ""
echo "🔌 WebSocket Connection Tests:"
echo "Direct: $(./test-websocket-latency.sh wss://151.243.109.217.nip.io/ws)"
echo "US Relay: $(./test-websocket-latency.sh wss://us-relay.redlemon.app/ws)"
echo "Canada Relay: $(./test-websocket-latency.sh wss://ca-relay.redlemon.app/ws)"
```

---

## 💰 Cost Analysis

### Monthly Breakdown
```
AnonVM (NL):           $15-25/month (current)
US Relay Server:       $5-10/month  
Canada Relay Server:   $5-10/month (optional)
Domain Names:           $2-3/month
SSL Certificates:      $0 (Let's Encrypt)
Monitoring:            $0 (self-hosted)
---------------------------------------------
Total:                  $22-38/month
```

### Cost Optimization Options
- **Start with US relay only**: +$5-10/month
- **Add Canada relay** based on Canadian user metrics
- **Use shared hosting** for relays if budget constrained
- **Scale horizontally** as user base grows

---

## 🔧 Troubleshooting Guide

### Common Issues & Solutions

#### Issue: WebSocket Connection Fails
**Symptoms**: `Error: Connection refused` or timeout
**Causes**: Relay server down, SSL certificate expired, DNS issues
**Solutions**:
```bash
# Check relay server status
sudo systemctl status caddy

# Check SSL certificate
sudo certbot certificates

# Test DNS resolution
nslookup us-relay.redlemon.app

# Check network connectivity
telnet us-relay.redlemon.app 443
```

#### Issue: High Latency on Relays
**Symptoms**: Slower than direct connection
**Causes**: Poor relay location, network congestion, misconfiguration
**Solutions**:
```bash
# Test different relay locations
# Try multiple VPS providers
# Optimize proxy configuration
# Monitor network paths with traceroute
```

#### Issue: SSL Certificate Problems
**Symptoms**: `SSL handshake failed`
**Causes**: Certificate expired, domain mismatch, CA issues
**Solutions**:
```bash
# Renew certificates
sudo certbot renew

# Force renewal
sudo certbot renew --force-renewal

# Check certificate details
openssl s_client -connect us-relay.redlemon.app:443 -servername us-relay.redlemon.app
```

#### Issue: Database Migration Problems
**Symptoms**: Data loss, schema conflicts
**Causes**: Incomplete export/import, version differences
**Solutions**:
```bash
# Verify data integrity
supabase db diff

# Check schema version
SELECT version();

# Backup before migration
supabase db dump --data-only -f backup.sql
```

---

## 📈 Performance Expectations

### Target Latency by Region
```
Europe (Direct):     20-40ms
North America:       60-80ms (via relay)
Asia/Pacific:       150-200ms (direct)
South America:      120-180ms (via US relay)
```

### Connection Success Rates
```
First Attempt:       95%
With Fallback:       99%
With Retry Logic:    99.5%
```

### Expected Improvements
- **NA Users**: 50-70% latency reduction
- **Connection Reliability**: 15% improvement
- **Scalability**: 10x concurrent user capacity
- **Cost Control**: Eliminate Supabase hosted limits

---

## 🚀 Go-Live Checklist

### Pre-Migration
- [ ] Complete Supabase self-hosting setup
- [ ] Test all database operations
- [ ] Verify authentication flow
- [ ] Deploy at least one relay node
- [ ] Update client configuration
- [ ] Test geographic routing

### Migration Day
- [ ] Backup hosted Supabase data
- [ ] Update DNS records
- [ ] Deploy new client version
- [ ] Monitor connection metrics
- [ ] Verify all functionality
- [ ] Have rollback plan ready

### Post-Migration
- [ ] Monitor performance for 48 hours
- [ ] Collect user feedback on latency
- [ ] Optimize relay locations based on data
- [ ] Scale up if needed
- [ ] Document lessons learned

---

## 📚 Additional Resources

### Documentation
- [Supabase Self-Hosting Guide](https://supabase.com/docs/guides/self-hosting)
- [Caddy WebSocket Proxy](https://caddyserver.com/docs/caddyfile/directives/reverse_proxy)
- [WebSocket Best Practices](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket)

### Tools & Utilities
- [WebSocket Testing Tools](https://www.websocket.org/echo.html)
- [Network Performance Testing](https://cloudflare.com/network-tools)
- [SSL Certificate Management](https://certbot.eff.org/)

### Monitoring Services
- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)
- [UptimeRobot](https://uptimerobot.com/) (external monitoring)

---

## 🎯 Success Metrics

### Technical Metrics
- **WebSocket Latency**: <100ms for 95% of connections
- **Connection Success Rate**: >99%
- **Database Response Time**: <200ms
- **Uptime**: >99.9%

### Business Metrics  
- **User Retention**: Monitor churn after migration
- **Support Tickets**: Track latency-related issues
- **Geographic Coverage**: Measure regional performance
- **Cost Efficiency**: Compare hosting costs vs benefits

---

## 🔄 Future Enhancements

### Short Term (3-6 months)
- Add more relay nodes based on user geography
- Implement automatic failover between relays
- Add real-time performance dashboard
- Optimize database queries

### Long Term (6-12 months)
- Consider edge computing providers (Cloudflare Workers)
- Implement WebRTC for peer-to-peer video sync
- Add machine learning for route optimization
- Explore database sharding for massive scale

---

**Document Version:** 1.0  
**Last Updated:** November 23, 2025  
**Next Review:** March 2026

---

