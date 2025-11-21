# BTCPay Server Setup Guide

## Overview

Set up BTCPay Server on AnonVM to monetize RedLemon hosting services with cryptocurrency payments (Bitcoin, Ethereum L2s, Monero, and more).

## Supported Cryptocurrencies

### **Recommended for RedLemon:**

1. **Bitcoin (BTC)** + Lightning Network
   - Instant payments via Lightning
   - Low fees (~1 sat)
   - Most widely adopted

2. **Ethereum Layer 2s** (Base, Arbitrum, Optimism)
   - Near-instant confirmations
   - Extremely low fees ($0.01-0.10)
   - Growing adoption
   - **Best for small recurring payments**

3. **Monero (XMR)**
   - Maximum privacy
   - Untraceable transactions
   - Aligns with RedLemon's privacy-first ethos

4. **Litecoin (LTC)** + Lightning
   - Faster than Bitcoin on-chain
   - Lightning support
   - Reliable fallback

### **Why Layer 2s are Perfect for Subscriptions:**
- ✅ Instant confirmations (2-5 seconds)
- ✅ Extremely low fees (often < $0.05)
- ✅ No need to run full node
- ✅ Easy integration via Infura/Alchemy
- ✅ Stablecoin support (USDC, USDT)

## Architecture

```
RedLemon Monetization Stack
├── PostgreSQL (User data)
├── PostgREST (API)
├── BTCPay Server (Payments)
│   ├── Bitcoin + Lightning (BTC)
│   ├── Ethereum L2s (Base, Arbitrum)
│   ├── Monero (XMR)
│   ├── Litecoin + Lightning (LTC)
│   └── Web Interface
└── Nginx (Reverse proxy)
```

## Prerequisites

- Completed Supabase migration
- AnonVM server with:
  - 8GB RAM minimum (for lightweight mode)
  - 100GB storage minimum
  - Docker installed
  - Domain name configured
- Ethereum RPC provider account (Infura/Alchemy - free tier)

## Installation Options

### Option 1: Lightweight Mode (Recommended)

Uses external Bitcoin node, minimal resource usage.

**Pros:**
- Low resource usage (~1-2GB RAM)
- Quick setup
- No blockchain sync required

**Cons:**
- Depends on external node
- Less privacy

### Option 2: Full Node Mode

Runs full Bitcoin node on server.

**Pros:**
- Complete sovereignty
- Maximum privacy
- No external dependencies

**Cons:**
- High resource usage (~500GB disk, 4GB RAM)
- Long initial sync (~1-2 weeks)
- Requires powerful server

## Recommended Setup: Lightweight Mode

### Step 1: Install BTCPay Server

```bash
# SSH into AnonVM server
ssh user@your-anonvm-server

# Create BTCPay directory
mkdir -p ~/btcpayserver
cd ~/btcpayserver

# Download BTCPay Server installer
git clone https://github.com/btcpayserver/btcpayserver-docker
cd btcpayserver-docker

# Set environment variables
export BTCPAY_HOST="pay.your-domain.com"
export REVERSEPROXY_HTTP_PORT="23080"
export REVERSEPROXY_HTTPS_PORT="23443"
export NBITCOIN_NETWORK="mainnet"
export BTCPAYGEN_CRYPTO1="btc"
export BTCPAYGEN_CRYPTO2="ltc"
export BTCPAYGEN_CRYPTO3="xmr"
export BTCPAYGEN_LIGHTNING="lnd"
export BTCPAYGEN_REVERSEPROXY="nginx"

# Use external Bitcoin node (lightweight mode)
export BTCPAYGEN_ADDITIONAL_FRAGMENTS="opt-save-storage-s"

# Run installer
./btcpay-setup.sh -i
```

### Step 2: Configure Ethereum Layer 2 Support

BTCPay Server supports Ethereum and L2s via external RPC providers.

#### Step 2.1: Get RPC Provider API Keys

**Option 1: Alchemy (Recommended)**
```bash
# Sign up at https://www.alchemy.com (free tier)
# Create apps for:
# - Base Mainnet
# - Arbitrum One
# - Optimism Mainnet

# Save your API keys:
ALCHEMY_BASE_RPC="https://base-mainnet.g.alchemy.com/v2/YOUR_API_KEY"
ALCHEMY_ARBITRUM_RPC="https://arb-mainnet.g.alchemy.com/v2/YOUR_API_KEY"
ALCHEMY_OPTIMISM_RPC="https://opt-mainnet.g.alchemy.com/v2/YOUR_API_KEY"
```

**Option 2: Infura**
```bash
# Sign up at https://infura.io (free tier)
# Create project and get endpoints

INFURA_BASE_RPC="https://base-mainnet.infura.io/v3/YOUR_PROJECT_ID"
INFURA_ARBITRUM_RPC="https://arbitrum-mainnet.infura.io/v3/YOUR_PROJECT_ID"
INFURA_OPTIMISM_RPC="https://optimism-mainnet.infura.io/v3/YOUR_PROJECT_ID"
```

**Option 3: Public RPCs (Not recommended for production)**
```bash
# Free public endpoints (may be rate-limited)
BASE_RPC="https://mainnet.base.org"
ARBITRUM_RPC="https://arb1.arbitrum.io/rpc"
OPTIMISM_RPC="https://mainnet.optimism.io"
```

#### Step 2.2: Configure Ethereum in BTCPay

```bash
# Access BTCPay container
docker exec -it btcpayserver_btcpayserver_1 bash

# Edit environment file
nano /etc/btcpayserver/env

# Add Ethereum L2 configuration:
BTCPAY_CHAINS="btc,eth"
BTCPAY_ETH_RPC="https://base-mainnet.g.alchemy.com/v2/YOUR_API_KEY"
BTCPAY_ETH_NETWORK="base"  # or "arbitrum", "optimism"

# For multiple L2s, you can configure them separately in the web UI
```

#### Step 2.3: Enable Stablecoins (USDC, USDT)

Stablecoins on L2s are perfect for subscriptions (no volatility):

```bash
# In BTCPay web interface:
# 1. Go to Store → Settings → Rates
# 2. Set preferred exchange rate source
# 3. Enable "Allow users to pay in stablecoins"

# Supported stablecoins on Base/Arbitrum:
# - USDC (USD Coin)
# - USDT (Tether)
# - DAI (Dai Stablecoin)
```

### Step 3: Configure External Bitcoin Node

For lightweight mode, use a trusted external node:

```bash
# Edit docker-compose
nano ~/btcpayserver/btcpayserver-docker/docker-compose.generated.yml

# Add external node configuration
# Under bitcoind service, add:
environment:
  - BITCOIN_EXTRA_ARGS=-connect=trusted-node.example.com:8333
```

**Trusted Node Options:**
- Your own node elsewhere
- Blockstream.info node
- Mempool.space node
- Friend's node

### Step 3: Configure Lightning Network

```bash
# LND will be installed automatically
# Configure channels after setup:

# Access LND container
docker exec -it btcpayserver_lnd_bitcoin bash

# Create Lightning wallet
lncli create

# Fund Lightning wallet
lncli newaddress p2wkh

# Open channels (after funding)
lncli openchannel <node_pubkey> <amount_sats>
```

### Step 4: Configure Nginx Reverse Proxy

```bash
# BTCPay comes with its own nginx, but we'll integrate with main nginx
sudo nano /etc/nginx/sites-available/redlemon
```

Add to existing config:

```nginx
# BTCPay Server
server {
    listen 80;
    server_name pay.your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:23080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

```bash
# Test and reload nginx
sudo nginx -t
sudo systemctl reload nginx

# Get SSL certificate
sudo certbot --nginx -d pay.your-domain.com
```

### Step 5: Initial BTCPay Configuration

1. **Access BTCPay Web Interface:**
   ```
   https://pay.your-domain.com
   ```

2. **Create Admin Account:**
   - Email: your-email@example.com
   - Password: (strong password)
   - Confirm password

3. **Create Store:**
   - Store Name: "RedLemon Hosting"
   - Default Currency: USD (or BTC)

4. **Configure Payment Methods:**
   - Enable Bitcoin (on-chain)
   - Enable Lightning Network
   - Set confirmation requirements (1-2 confirmations recommended)

5. **Generate API Keys:**
   - Go to Account → API Keys
   - Create new API key with permissions:
     - `btcpay.store.canmodifyinvoices`
     - `btcpay.store.canviewinvoices`
   - Save API key securely

## Integration with RedLemon

### Step 6: Create Hosting Plans

Define hosting tiers with multiple payment options:

```json
{
  "plans": [
    {
      "name": "Basic",
      "pricing": {
        "usd": 5,
        "btc": "auto",
        "usdc_base": 5,
        "usdc_arbitrum": 5
      },
      "duration": "monthly",
      "features": [
        "Watch Party hosting",
        "Up to 10 concurrent users",
        "Standard support"
      ]
    },
    {
      "name": "Pro",
      "pricing": {
        "usd": 10,
        "btc": "auto",
        "usdc_base": 10,
        "usdc_arbitrum": 10
      },
      "duration": "monthly",
      "features": [
        "Watch Party hosting",
        "Up to 50 concurrent users",
        "Priority support",
        "Custom branding"
      ]
    },
    {
      "name": "Enterprise",
      "pricing": {
        "usd": 25,
        "btc": "auto",
        "usdc_base": 25,
        "usdc_arbitrum": 25
      },
      "duration": "monthly",
      "features": [
        "Watch Party hosting",
        "Unlimited users",
        "24/7 support",
        "Custom domain",
        "Dedicated resources"
      ]
    }
  ]
}
```

### Payment Method Recommendations

**For Users:**
1. **USDC on Base** - Best for most users (fast, cheap, stable)
2. **Bitcoin Lightning** - Best for Bitcoin holders (instant, low fees)
3. **Monero** - Best for privacy (untraceable)
4. **USDC on Arbitrum** - Alternative L2 option

**Fee Comparison:**
- Base/Arbitrum: ~$0.01-0.05 per transaction
- Lightning: ~$0.001-0.01 per transaction
- Bitcoin on-chain: ~$1-5 per transaction
- Monero: ~$0.02-0.10 per transaction

### Step 7: Database Schema for Subscriptions

```sql
-- Create subscriptions table
CREATE TABLE subscriptions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    plan_name TEXT NOT NULL,
    status TEXT NOT NULL, -- 'active', 'expired', 'cancelled'
    btcpay_invoice_id TEXT,
    amount_usd DECIMAL(10, 2),
    amount_btc DECIMAL(16, 8),
    start_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    end_date TIMESTAMP WITH TIME ZONE,
    auto_renew BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create payments table
CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subscription_id UUID REFERENCES subscriptions(id) ON DELETE CASCADE,
    btcpay_invoice_id TEXT UNIQUE NOT NULL,
    amount_usd DECIMAL(10, 2),
    amount_btc DECIMAL(16, 8),
    status TEXT NOT NULL, -- 'pending', 'paid', 'expired', 'invalid'
    payment_method TEXT, -- 'bitcoin', 'lightning'
    paid_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes
CREATE INDEX idx_subscriptions_user_id ON subscriptions(user_id);
CREATE INDEX idx_subscriptions_status ON subscriptions(status);
CREATE INDEX idx_payments_invoice_id ON payments(btcpay_invoice_id);
CREATE INDEX idx_payments_status ON payments(status);
```

### Step 8: BTCPay Webhook Integration

Create webhook handler in your server:

```swift
// Sources/Server/Routes/PaymentRoutes.swift
import Vapor

func registerPaymentRoutes(_ app: Application) {
    // BTCPay webhook endpoint
    app.post("api", "payments", "webhook") { req async throws -> Response in
        let webhook = try req.content.decode(BTCPayWebhook.self)
        
        print("📧 BTCPay webhook received: \(webhook.type)")
        
        switch webhook.type {
        case "InvoiceSettled":
            // Payment confirmed
            try await handlePaymentConfirmed(webhook: webhook, req: req)
            
        case "InvoiceExpired":
            // Payment expired
            try await handlePaymentExpired(webhook: webhook, req: req)
            
        case "InvoiceInvalid":
            // Payment invalid
            try await handlePaymentInvalid(webhook: webhook, req: req)
            
        default:
            print("⚠️ Unknown webhook type: \(webhook.type)")
        }
        
        return Response(status: .ok)
    }
    
    // Create invoice endpoint
    app.post("api", "payments", "create-invoice") { req async throws -> Response in
        let request = try req.content.decode(CreateInvoiceRequest.self)
        
        // Create BTCPay invoice
        let invoice = try await createBTCPayInvoice(
            amount: request.amount,
            currency: request.currency,
            orderId: request.orderId,
            buyerEmail: request.email
        )
        
        return try await invoice.encodeResponse(for: req)
    }
}

struct BTCPayWebhook: Codable {
    let type: String
    let invoiceId: String
    let storeId: String
}

struct CreateInvoiceRequest: Codable {
    let amount: Decimal
    let currency: String
    let orderId: String
    let email: String
}
```

### Step 9: Configure BTCPay Webhooks

In BTCPay web interface:

1. Go to Store → Settings → Webhooks
2. Add new webhook:
   - Payload URL: `https://api.your-domain.com/api/payments/webhook`
   - Secret: (generate strong secret)
   - Events: Select all invoice events
3. Save webhook

### Step 10: Create Payment Flow in RedLemon App

```swift
// Sources/Features/Subscription/SubscriptionView.swift
struct SubscriptionView: View {
    @State private var selectedPlan: HostingPlan?
    @State private var showingPayment = false
    
    var body: some View {
        VStack {
            Text("Choose Your Hosting Plan")
                .font(.title)
            
            ForEach(HostingPlan.allPlans) { plan in
                PlanCard(plan: plan) {
                    selectedPlan = plan
                    showingPayment = true
                }
            }
        }
        .sheet(isPresented: $showingPayment) {
            if let plan = selectedPlan {
                PaymentView(plan: plan)
            }
        }
    }
}

struct PaymentView: View {
    let plan: HostingPlan
    @State private var invoiceURL: String?
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Creating invoice...")
            } else if let url = invoiceURL {
                // Show QR code and payment instructions
                BTCPayInvoiceView(url: url)
            } else {
                Button("Pay with Bitcoin") {
                    createInvoice()
                }
            }
        }
        .onAppear {
            createInvoice()
        }
    }
    
    func createInvoice() {
        isLoading = true
        
        Task {
            do {
                let invoice = try await LocalAPIClient.shared.createPaymentInvoice(
                    plan: plan
                )
                await MainActor.run {
                    invoiceURL = invoice.checkoutLink
                    isLoading = false
                }
            } catch {
                print("❌ Failed to create invoice: \(error)")
                isLoading = false
            }
        }
    }
}
```

## Testing

### Step 11: Test Payments

1. **Create Test Invoice:**
   ```bash
   curl -X POST https://pay.your-domain.com/api/v1/stores/{storeId}/invoices \
     -H "Authorization: token YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "amount": "5.00",
       "currency": "USD",
       "orderId": "test-001"
     }'
   ```

2. **Pay Invoice:**
   - Use testnet Bitcoin for testing
   - Or use mainnet with small amounts

3. **Verify Webhook:**
   - Check server logs for webhook receipt
   - Verify database updates

## Monitoring & Maintenance

### Step 12: Set Up Monitoring

```bash
# Monitor BTCPay logs
docker logs -f btcpayserver_btcpayserver_1

# Monitor LND
docker logs -f btcpayserver_lnd_bitcoin

# Check Lightning channels
docker exec btcpayserver_lnd_bitcoin lncli listchannels

# Check Bitcoin balance
docker exec btcpayserver_lnd_bitcoin lncli walletbalance
```

### Step 13: Backup Strategy

```bash
# Backup BTCPay data
docker exec btcpayserver_btcpayserver_1 backup

# Backup LND wallet
docker exec btcpayserver_lnd_bitcoin lncli exportchanbackup

# Store backups securely (encrypted, off-site)
```

## Security Considerations

1. **API Keys:**
   - Store securely in environment variables
   - Never commit to git
   - Rotate regularly

2. **Webhook Secrets:**
   - Verify webhook signatures
   - Use HTTPS only
   - Validate payload

3. **Lightning Channels:**
   - Don't store large amounts in hot wallet
   - Use watchtowers for channel monitoring
   - Regular backups of channel state

4. **Server Security:**
   - Keep system updated
   - Use firewall (UFW)
   - Enable fail2ban
   - Regular security audits

## Cost Analysis

### Monthly Costs

**Infrastructure:**
- AnonVM Server: $0 (existing)
- Domain: $1/month
- SSL Certificates: $0 (Let's Encrypt)

**Total: ~$1/month**

### Revenue Potential

**Conservative Estimate:**
- 10 Basic users × $5 = $50/month
- 5 Pro users × $10 = $50/month
- 2 Enterprise users × $25 = $50/month

**Total: $150/month**

**Net Profit: $149/month ($1,788/year)**

## Next Steps

1. ✅ Complete Supabase migration
2. ✅ Install BTCPay Server
3. 📋 Build subscription management UI
4. 📋 Implement auto-renewal system
5. 📋 Create user dashboard
6. 📋 Add usage analytics
7. 📋 Launch beta program

## Resources

- [BTCPay Server Docs](https://docs.btcpayserver.org/)
- [Lightning Network Guide](https://docs.lightning.engineering/)
- [Bitcoin Core Documentation](https://bitcoin.org/en/bitcoin-core/)
- [RedLemon Discord](https://discord.gg/redlemon) (for support)
