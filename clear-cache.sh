#!/bin/bash

# Clear ONLY the RedLemon event movie cache
# This preserves your settings (Real-Debrid key, SubDL key, username, etc.)

echo "🧹 Clearing RedLemon event movie cache..."

# Get the current cycle number to find the exact cache key
# The cache key format is: eventMovies_v5_exciting_genres_cycle_X

# List all keys that match the event movie cache pattern
defaults read com.danielnoble.RedLemon 2>/dev/null | grep "eventMovies_" | while read -r line; do
    # Extract the key name (remove quotes and semicolon)
    key=$(echo "$line" | sed 's/[";]//g' | awk '{print $1}')
    if [ ! -z "$key" ]; then
        echo "   Removing cache key: $key"
        defaults delete com.danielnoble.RedLemon "$key" 2>/dev/null
    fi
done

echo "✅ Event movie cache cleared!"
echo "   Your settings (Real-Debrid, SubDL, username) are preserved"
echo "   Next app launch will fetch movies with new genre filters"
echo ""
echo "💡 Tip: Quit the app, run this script, then relaunch to see new movies"
