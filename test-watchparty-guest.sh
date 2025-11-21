#!/bin/bash

# Watch Party Guest Logging Script
# Run this on the GUEST machine

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
LOGFILE="logs/guest-watchparty-${TIMESTAMP}.log"

# Create logs directory if it doesn't exist
mkdir -p logs

echo "=========================================="
echo "🎬 RedLemon Watch Party - GUEST MODE"
echo "=========================================="
echo "Log file: ${LOGFILE}"
echo ""
echo "Instructions:"
echo "1. Start the app and join the host's room"
echo "2. Wait for host to start the movie"
echo "3. Note if you see a countdown or not"
echo "4. Note when playback actually starts"
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
echo "  grep -E '(PRELOAD|READY|PLAY|countdown|Guest:)' ${LOGFILE}"
echo "=========================================="
