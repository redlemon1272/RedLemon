#!/usr/bin/env bash
set -euo pipefail

# One-shot setup + run for the anonvm Ubuntu host.
# Run as root on the server (SSH in first):
#   ssh -i ~/.ssh/id_ed25519_redlemon root@151.243.109.217
#   cd /opt/watchparty-server
#   chmod +x scripts/setup_and_run.sh
#   ./scripts/setup_and_run.sh
#
# What it does:
# - apt update/upgrade
# - firewall allow 22/80/443/8080
# - install Docker, Node, npm
# - install project deps, build, and start WS server on port 8080

echo "📦 Updating apt and installing prerequisites..."
apt update && apt upgrade -y
apt install -y ufw ca-certificates curl gnupg nodejs npm

echo "🌐 Configuring ufw..."
ufw --force allow 22/tcp
ufw --force allow 80/tcp
ufw --force allow 443/tcp
ufw --force allow 8080/tcp
ufw --force enable

echo "🐳 Installing Docker..."
install -m 0755 -d /etc/apt/keyrings
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
fi
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt update
apt install -y docker-ce docker-ce-cli containerd.io
docker run --rm hello-world || true

echo "🔧 Installing project deps..."
cd /opt/watchparty-server
rm -rf node_modules package-lock.json dist || true
npm install

echo "🏗️ Building..."
npx tsc -p tsconfig.json

echo "🚀 Starting server on ws://0.0.0.0:8080 ..."
node dist/index.js
