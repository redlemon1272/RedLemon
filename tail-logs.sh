#!/bin/bash

# Define potential log directories
LOG_DIRS=(
    "$HOME/Library/Application Support/RedLemon"
    "$HOME/Library/Application Support/com.orangeapple.RedLemon"
)

LATEST_LOG=""

for DIR in "${LOG_DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Check for Timestamped logs first (redlemon-*.log)
        FOUND=$(ls -t "$DIR"/redlemon-*.log 2>/dev/null | head -1)
        
        # If not found, check for generic app_logs.txt
        if [ -z "$FOUND" ]; then
            FOUND=$(ls -t "$DIR"/app_logs.txt 2>/dev/null | head -1)
        fi
        
        if [ -n "$FOUND" ]; then
            LATEST_LOG="$FOUND"
            break
        fi
    fi
done

if [ -z "$LATEST_LOG" ]; then
    echo "❌ No logs found in:"
    printf "  - %s\n" "${LOG_DIRS[@]}"
    echo ""
    echo "💡 Tip: Launch the app at least once to generate logs."
    exit 1
fi

echo "📋 Tailing latest log: $(basename "$LATEST_LOG")"
echo "📂 Found at: $LATEST_LOG"
echo "----------------------------------------"

# Tail the file
tail -f "$LATEST_LOG"
