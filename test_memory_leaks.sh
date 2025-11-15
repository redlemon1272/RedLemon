#!/bin/bash

# Memory Leak Testing Script for RedLemon
# Tests MPV player memory management and leak detection

echo "🧪 RedLemon Memory Leak Test Suite"
echo "=================================="

# Function to check if process is running
check_process() {
    if pgrep -f "RedLemon" > /dev/null; then
        return 0
    else
        return 1
    fi
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

# Function to log memory usage
log_memory() {
    local timestamp=$(date '+%H:%M:%S')
    local memory_mb=$(get_memory $1)
    echo "[$timestamp] Memory: ${memory_mb}MB"
    echo "$timestamp,$memory_mb" >> memory_log.csv
}

echo ""
echo "📋 Test Configuration:"
echo "- Test Duration: 30 minutes"
echo "- Sample Interval: 30 seconds"
echo "- Memory Threshold: 200MB"
echo ""

# Check if RedLemon is running
echo "🔍 Checking for RedLemon process..."
REDLEMON_PID=$(pgrep -f "RedLemon" | head -1)

if [ -z "$REDLEMON_PID" ]; then
    echo "❌ RedLemon is not running!"
    echo "Please start RedLemon first, then run this script."
    exit 1
fi

echo "✅ Found RedLemon (PID: $REDLEMON_PID)"
echo ""

# Initialize memory log
echo "timestamp,memory_mb" > memory_log.csv

# Start memory monitoring
echo "📊 Starting memory monitoring..."
echo "Timestamp     Memory Usage"
echo "------------   ------------"

START_TIME=$(date +%s)
END_TIME=$((START_TIME + 1800))  # 30 minutes
MEMORY_LEAK_DETECTED=false
MAX_MEMORY=0
WARNING_COUNT=0

while [ $(date +%s) -lt $END_TIME ]; do
    CURRENT_TIME=$(date '+%H:%M:%S')
    MEMORY_MB=$(get_memory $REDLEMON_PID)

    # Update max memory
    if [ "$MEMORY_MB" -gt "$MAX_MEMORY" ]; then
        MAX_MEMORY=$MEMORY_MB
    fi

    # Check for memory leak warning
    if [ "$MEMORY_MB" -gt 200 ]; then
        echo "⚠️  $CURRENT_TIME   ${MEMORY_MB}MB - HIGH MEMORY USAGE!"
        WARNING_COUNT=$((WARNING_COUNT + 1))
        MEMORY_LEAK_DETECTED=true
    else
        echo "     $CURRENT_TIME   ${MEMORY_MB}MB"
    fi

    # Log to CSV
    echo "$(date '+%H:%M:%S'),$MEMORY_MB" >> memory_log.csv

    # Check if process is still running
    if ! check_process; then
        echo "❌ RedLemon process died during testing!"
        echo "This indicates a serious memory issue."
        exit 1
    fi

    sleep 30
done

echo ""
echo "📈 Test Results Summary:"
echo "======================"
echo "Test Duration: 30 minutes"
echo "Maximum Memory: ${MAX_MEMORY}MB"
echo "Memory Warnings: $WARNING_COUNT"
echo ""

# Analyze results
if [ "$MEMORY_LEAK_DETECTED" = true ]; then
    echo "⚠️  Memory Leak Detected!"
    echo "- Memory exceeded 200MB threshold $WARNING_COUNT times"
    echo "- Check memory_log.csv for detailed timeline"
    echo ""
    echo "🔧 Recommended Actions:"
    echo "1. Monitor console for '📊 MPV Memory' logs"
    echo "2. Look for '⚠️ High memory usage detected' messages"
    echo "3. Check for proper MPV cleanup in logs"
    echo "4. Verify enhanced deinit is being called"
else
    echo "✅ No Memory Leaks Detected!"
    echo "- Memory usage stayed within acceptable limits"
    echo "- Enhanced cleanup appears to be working"
fi

echo ""
echo "📊 Memory Analysis:"
echo "Memory growth rate: $(echo "scale=2; ($MAX_MEMORY - 50) / 30" | bc)MB/min"  # Assuming 50MB baseline

if [ "$WARNING_COUNT" -gt 5 ]; then
    echo "❌ CRITICAL: Excessive memory warnings detected"
    echo "The memory leak fixes may not be working properly."
elif [ "$WARNING_COUNT" -gt 2 ]; then
    echo "⚠️  WARNING: Some memory issues detected"
    echo "Monitor the application more closely."
else
    echo "✅ Memory usage looks healthy"
fi

echo ""
echo "📋 Next Steps:"
echo "1. Review memory_log.csv for detailed usage patterns"
echo "2. Check RedLemon console logs for cleanup messages"
echo "3. If issues persist, examine MPVViewLayer cleanup"
echo "4. Consider testing with different video formats"

# Clean up
echo ""
echo "🧹 Cleaning up test files..."
# Keep memory_log.csv for analysis

echo "✅ Memory leak test completed!"
echo "Check memory_log.csv for detailed data analysis."
