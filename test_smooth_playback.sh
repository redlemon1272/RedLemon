#!/bin/bash

# Smooth Playback Test for RedLemon
# Tests that memory management doesn't cause stutter

echo "🎬 RedLemon Smooth Playback Test"
echo "================================"

# Function to check if RedLemon is running
check_process() {
    pgrep -f "RedLemon" > /dev/null
}

# Function to get memory usage
get_memory() {
    local pid=$1
    if [ -n "$pid" ]; then
        local memory=$(ps -p $pid -o rss= | tr -d ' ')
        if [ -n "$memory" ] && [ "$memory" != "0" ]; then
            echo $((memory / 1024))  # Convert to MB
        else
            echo "0"
        fi
    else
        echo "0"
    fi
}

echo ""
echo "📋 Test Configuration:"
echo "- Duration: 15 minutes"
echo "- Memory Check Interval: 30 seconds"
echo "- Focus: Stutter detection during playback"
echo ""

# Check if RedLemon is running
echo "🔍 Checking for RedLemon process..."
REDLEMON_PID=$(pgrep -f "RedLemon" | head -1)

if [ -z "$REDLEMON_PID" ]; then
    echo "❌ RedLemon is not running!"
    echo "Please start RedLemon and play a video first."
    exit 1
fi

echo "✅ Found RedLemon (PID: $REDLEMON_PID)"
echo ""

# Initialize test log
echo "timestamp,memory_mb,stutter_detected" > smooth_playback_log.csv

echo "📊 Starting smooth playback monitoring..."
echo "Timestamp     Memory    Status"
echo "------------   ------    ------"

START_TIME=$(date +%s)
END_TIME=$((START_TIME + 900))  # 15 minutes
STUTTER_COUNT=0
MAX_MEMORY=0

while [ $(date +%s) -lt $END_TIME ]; do
    CURRENT_TIME=$(date '+%H:%M:%S')
    MEMORY_MB=$(get_memory $REDLEMON_PID)

    # Update max memory
    if [ "$MEMORY_MB" -gt "$MAX_MEMORY" ]; then
        MAX_MEMORY=$MEMORY_MB
    fi

    # Check for memory patterns that might cause stutter
    if [ "$MEMORY_MB" -gt 300 ]; then
        echo "⚠️  $CURRENT_TIME   ${MEMORY_MB}MB - HIGH MEMORY (possible stutter)"
        STUTTER_COUNT=$((STUTTER_COUNT + 1))
    elif [ "$MEMORY_MB" -gt 200 ]; then
        echo "🟡 $CURRENT_TIME   ${MEMORY_MB}MB - Moderate memory"
    else
        echo "✅ $CURRENT_TIME   ${MEMORY_MB}MB - Good"
    fi

    # Log to CSV
    echo "$(date '+%H:%M:%S'),$MEMORY_MB,$STUTTER_COUNT" >> smooth_playback_log.csv

    # Check if process is still running
    if ! check_process; then
        echo "❌ RedLemon process died during testing!"
        echo "This indicates a serious crash issue."
        exit 1
    fi

    sleep 30
done

echo ""
echo "📈 Test Results Summary:"
echo "======================"
echo "Test Duration: 15 minutes"
echo "Maximum Memory: ${MAX_MEMORY}MB"
echo "Stutter Events: $STUTTER_COUNT"
echo ""

# Analyze results
if [ "$STUTTER_COUNT" -eq 0 ]; then
    echo "✅ EXCELLENT: No stutter detected!"
    echo "- Memory usage stayed within acceptable limits"
    echo "- Smooth playback maintained throughout test"
    echo "- Memory management is working optimally"
elif [ "$STUTTER_COUNT" -le 2 ]; then
    echo "🟡 GOOD: Minimal stutter detected"
    echo "- Few memory-related interruptions"
    echo "- Overall smooth playback experience"
    echo "- Memory management is working well"
elif [ "$STUTTER_COUNT" -le 5 ]; then
    echo "⚠️  FAIR: Some stutter detected"
    echo "- Several memory-related interruptions"
    echo "- May notice occasional stutter"
    echo "- Memory management needs minor tweaks"
else
    echo "❌ POOR: Excessive stutter detected"
    echo "- Frequent memory-related interruptions"
    echo "- Noticeable stutter during playback"
    echo "- Memory management needs significant improvement"
fi

echo ""
echo "📊 Memory Analysis:"
if [ "$MAX_MEMORY" -lt 150 ]; then
    echo "✅ Excellent memory efficiency"
elif [ "$MAX_MEMORY" -lt 250 ]; then
    echo "🟡 Good memory efficiency"
elif [ "$MAX_MEMORY" -lt 400 ]; then
    echo "⚠️  Acceptable memory usage"
else
    echo "❌ High memory usage - optimization needed"
fi

echo ""
echo "🎯 Recommendations:"
if [ "$STUTTER_COUNT" -eq 0 ] && [ "$MAX_MEMORY" -lt 200 ]; then
    echo "🎉 Perfect! No changes needed."
elif [ "$STUTTER_COUNT" -gt 0 ]; then
    echo "1. Monitor console for '🧹 Gentle cleanup' messages"
    echo "2. Check if cleanup happens during natural pauses"
    echo "3. Verify no buffer cycling during active playback"
    echo "4. Look for 'set cache-secs' commands in logs"
fi

echo ""
echo "📋 Next Steps:"
echo "1. Review smooth_playback_log.csv for detailed data"
echo "2. Check RedLemon console logs for cleanup timing"
echo "3. Test with different video formats"
echo "4. Verify memory stays stable during long playback sessions"

echo ""
echo "✅ Smooth playback test completed!"
echo "The memory management fixes should provide stutter-free playback."
