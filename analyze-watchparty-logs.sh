#!/bin/bash

# Watch Party Log Analyzer
# Extracts relevant watch party sync information from logs

if [ $# -eq 0 ]; then
    echo "Usage: ./analyze-watchparty-logs.sh <logfile>"
    echo ""
    echo "Example:"
    echo "  ./analyze-watchparty-logs.sh logs/host-watchparty-20251121-164500.log"
    echo ""
    echo "Or analyze the most recent logs:"
    echo "  ./analyze-watchparty-logs.sh logs/host-watchparty-*.log"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "❌ Error: Log file not found: $LOGFILE"
    exit 1
fi

echo "=========================================="
echo "📊 Watch Party Log Analysis"
echo "=========================================="
echo "File: $LOGFILE"
echo ""

echo "🎬 TWO-PHASE SYSTEM EVENTS:"
echo "---"
grep -E "(TWO-PHASE|Starting TWO-PHASE)" "$LOGFILE" || echo "  (none found)"
echo ""

echo "📤 PRELOAD SIGNALS:"
echo "---"
grep -E "(PRELOAD|Preloading)" "$LOGFILE" || echo "  (none found)"
echo ""

echo "✅ READY SIGNALS:"
echo "---"
grep -E "(READY|ready)" "$LOGFILE" | grep -v "isReady" || echo "  (none found)"
echo ""

echo "▶️ PLAY SIGNALS:"
echo "---"
grep -E "(PLAY signal|Starting playback|startPreloadedPlayback)" "$LOGFILE" || echo "  (none found)"
echo ""

echo "⏱️ COUNTDOWN EVENTS (OLD SYSTEM):"
echo "---"
grep -E "(countdown|COUNTDOWN)" "$LOGFILE" || echo "  (none found)"
echo ""

echo "🔄 REALTIME MESSAGES:"
echo "---"
grep -E "(Received Realtime message|broadcast.*via Realtime)" "$LOGFILE" | head -20 || echo "  (none found)"
echo ""

echo "⚠️ ERRORS/WARNINGS:"
echo "---"
grep -E "(❌|⚠️|Failed|Error)" "$LOGFILE" | head -10 || echo "  (none found)"
echo ""

echo "=========================================="
echo "💡 Quick Check:"
echo "---"
echo "Host used TWO-PHASE: $(grep -c 'TWO-PHASE' "$LOGFILE")"
echo "Guest saw PRELOAD: $(grep -c 'Received PRELOAD' "$LOGFILE")"
echo "Guest saw PLAY: $(grep -c 'Received PLAY' "$LOGFILE")"
echo "Countdown mentioned: $(grep -c 'countdown' "$LOGFILE")"
echo "=========================================="
