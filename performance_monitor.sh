#!/bin/bash

# Performance Monitoring Script for RedLemon
# This script helps diagnose performance issues and monitors memory usage

echo "🔍 RedLemon Performance Monitor"
echo "==============================="
echo ""

# Function to check if RedLemon is running
check_redlemon_running() {
    if pgrep -f "RedLemon" > /dev/null; then
        echo "✅ RedLemon is running"
        return 0
    else
        echo "❌ RedLemon is not running"
        return 1
    fi
}

# Function to get memory usage
get_memory_usage() {
    local pid=$(pgrep -f "RedLemon" | head -1)
    if [ ! -z "$pid" ]; then
        local memory=$(ps -p $pid -o rss= | tr -d ' ')
        local memory_mb=$((memory / 1024))
        echo "$memory_mb MB"
    else
        echo "N/A"
    fi
}

# Function to get CPU usage
get_cpu_usage() {
    local pid=$(pgrep -f "RedLemon" | head -1)
    if [ ! -z "$pid" ]; then
        local cpu=$(ps -p $pid -o %cpu= | tr -d ' ')
        echo "${cpu}%"
    else
        echo "N/A"
    fi
}

# Function to get system info
get_system_info() {
    echo "🖥️ System Information:"
    echo "   macOS Version: $(sw_vers -productVersion)"
    echo "   Model: $(system_profiler SPHardwareDataType | grep "Model Name" | cut -d: -f2 | xargs)"
    echo "   RAM: $(system_profiler SPHardwareDataType | grep "Memory" | cut -d: -f2 | xargs)"
    echo "   Cores: $(sysctl -n hw.ncpu)"
    echo ""
}

# Function to monitor performance over time
monitor_performance() {
    echo "📊 Starting performance monitoring (Press Ctrl+C to stop)..."
    echo "Timestamp\tMemory\tCPU"

    while true; do
        local timestamp=$(date '+%H:%M:%S')
        local memory=$(get_memory_usage)
        local cpu=$(get_cpu_usage)
        echo "$timestamp\t$memory\t$cpu"
        sleep 5
    done
}

# Function to check for common performance issues
check_performance_issues() {
    echo "🔍 Checking for common performance issues..."

    if ! check_redlemon_running > /dev/null 2>&1; then
        echo "ℹ️  RedLemon is not running - start the app to monitor performance metrics"
        echo ""
        return
    fi

    local memory=$(get_memory_usage)
    if [[ "$memory" != "N/A" ]]; then
        local memory_num=$(echo "$memory" | cut -d' ' -f1)
        if [ "$memory_num" -gt 1000 ]; then
            echo "⚠️  High memory usage detected: $memory"
        elif [ "$memory_num" -gt 500 ]; then
            echo "⚠️  Moderate memory usage: $memory"
        else
            echo "✅ Memory usage is normal: $memory"
        fi
    else
        echo "ℹ️  Could not determine memory usage"
    fi

    local cpu=$(get_cpu_usage)
    if [[ "$cpu" != "N/A" ]]; then
        local cpu_num=$(echo "$cpu" | cut -d'%' -f1 | awk '{printf "%.0f", $1}')
        if [ "$cpu_num" -gt 80 ]; then
            echo "⚠️  High CPU usage detected: $cpu"
        elif [ "$cpu_num" -gt 50 ]; then
            echo "⚠️  Moderate CPU usage: $cpu"
        else
            echo "✅ CPU usage is normal: $cpu"
        fi
    else
        echo "ℹ️  Could not determine CPU usage"
    fi

    echo ""
}

# Function to check cache files
check_cache_files() {
    echo "🗂️  Checking cache files..."

    # Check for common cache directories
    local cache_dirs=(
        "$HOME/Library/Caches/com.redlemon.RedLemon"
        "$HOME/Library/Application Support/RedLemon"
        "/tmp/redlemon-*"
    )

    for dir in "${cache_dirs[@]}"; do
        if [ -d "$dir" ]; then
            local size=$(du -sh "$dir" 2>/dev/null | cut -f1)
            echo "   📁 $dir: $size"
        elif compgen -G "$dir" > /dev/null 2>&1; then
            for matched in $dir; do
                if [ -d "$matched" ]; then
                    local size=$(du -sh "$matched" 2>/dev/null | cut -f1)
                    echo "   📁 $matched: $size"
                fi
            done
        fi
    done
    echo ""
}

# Function to provide performance recommendations
provide_recommendations() {
    echo "💡 Performance Recommendations:"
    echo ""

    local memory=$(get_memory_usage)
    if [[ "$memory" != "N/A" ]]; then
        local memory_num=$(echo "$memory" | cut -d' ' -f1)
        if [ "$memory_num" -gt 500 ]; then
            echo "🔧 High memory usage detected:"
            echo "   • Try switching to 'Best Performance' mode in Settings"
            echo "   • Restart RedLemon to clear accumulated memory"
            echo "   • Check for memory leaks in the console logs"
            echo ""
        fi
    fi

    echo "🔧 General optimization tips:"
    echo "   • Keep RedLemon updated to the latest version"
    echo "   • Restart the app periodically if you notice slowdowns"
    echo "   • Use 'Auto' performance mode for adaptive optimization"
    echo "   • Monitor Activity Monitor for other resource-heavy apps"
    echo ""
}

# Function to generate performance report
generate_report() {
    echo "📋 Generating Performance Report..."
    echo ""

    get_system_info
    check_redlemon_running
    check_performance_issues
    check_cache_files
    provide_recommendations
}

# Main script logic
case "${1:-report}" in
    "monitor")
        if check_redlemon_running; then
            monitor_performance
        else
            echo "Please start RedLemon first before monitoring."
            exit 1
        fi
        ;;
    "report")
        generate_report
        ;;
    "check")
        check_redlemon_running
        check_performance_issues
        ;;
    "cache")
        check_cache_files
        ;;
    "help"|"-h"|"--help")
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  monitor  - Monitor performance in real-time"
        echo "  report   - Generate comprehensive performance report"
        echo "  check    - Quick performance check"
        echo "  cache    - Check cache file sizes"
        echo "  help     - Show this help message"
        echo ""
        echo "Examples:"
        echo "  $0 report    # Generate full performance report"
        echo "  $0 monitor   # Monitor performance live"
        echo "  $0 check     # Quick health check"
        ;;
    *)
        echo "Unknown command: $1"
        echo "Use '$0 help' for available commands"
        exit 1
        ;;
esac
