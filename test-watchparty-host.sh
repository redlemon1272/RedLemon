#!/bin/bash

# Watch Party Host Logging Script
# Run this on the HOST machine

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
LOGFILE="logs/host-watchparty-${TIMESTAMP}.log"

# Create logs directory if it doesn't exist
mkdir -p logs

echo "=========================================="
echo "🎬 RedLemon Watch Party - HOST MODE"
echo "=========================================="
echo "Log file: ${LOGFILE}"
echo ""
echo "Instructions:"
echo "1. Start the app and create a watch party room"
echo "2. Wait for guest to join"
echo "3. Click 'Start Movie' button"
echo "4. Note if you see a countdown or not"
echo "5. Press Ctrl+C when done testing"
echo ""
echo "Starting RedLemon with logging..."
echo "=========================================="
echo ""

# Run the app and capture all output
./start-production.sh 2>&1 | tee "${LOGFILE}"

echo ""
echo "=========================================="
echo "✅ Log saved to: ${LOGFILE}"
echo ""
echo "To view watch party specific logs, run:"
echo "  grep -E '(TWO-PHASE|PRELOAD|READY|PLAY|countdown|Host:)' ${LOGFILE}"
echo "=========================================="
