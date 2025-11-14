#!/bin/bash
# RedLemon Native - System Cleanup Script
# Run this when VS Code gets sluggish on MacBook Air 2015

set -e

echo "🧹 Starting cleanup for RedLemon-Native..."
echo ""

# Check for corrupted .build checkouts (missing source files)
if [ -d ".build/checkouts" ]; then
    CORRUPT=false
    for dir in .build/checkouts/*; do
        if [ -d "$dir/Sources" ]; then
            # Check if Sources directory is empty or has missing files
            if [ -z "$(find "$dir/Sources" -name "*.swift" 2>/dev/null)" ]; then
                CORRUPT=true
                break
            fi
        fi
    done

    if [ "$CORRUPT" = true ]; then
        echo "⚠️  Detected corrupted Swift package checkouts"
        SIZE=$(du -sh .build 2>/dev/null | cut -f1)
        rm -rf .build
        echo "✅ Deleted corrupted .build cache ($SIZE)"
        echo "   Run 'swift package resolve' to re-download packages"
    else
        # Normal cleanup - only remove if not corrupted
        SIZE=$(du -sh .build 2>/dev/null | cut -f1)
        rm -rf .build
        echo "✅ Deleted .build cache ($SIZE)"
    fi
elif [ -d ".build" ]; then
    SIZE=$(du -sh .build 2>/dev/null | cut -f1)
    rm -rf .build
    echo "✅ Deleted .build cache ($SIZE)"
fi

# Remove Python cache
find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null
find . -name "*.pyc" -delete 2>/dev/null
echo "✅ Cleared Python cache"

# Clear Xcode DerivedData
if [ -d "$HOME/Library/Developer/Xcode/DerivedData" ]; then
    SIZE=$(du -sh "$HOME/Library/Developer/Xcode/DerivedData" 2>/dev/null | cut -f1)
    rm -rf "$HOME/Library/Developer/Xcode/DerivedData"/*
    echo "✅ Cleared Xcode DerivedData ($SIZE)"
fi

# Clean VS Code cache
if [ -d "$HOME/Library/Application Support/Code/Cache" ]; then
    SIZE=$(du -sh "$HOME/Library/Application Support/Code/Cache" 2>/dev/null | cut -f1)
    rm -rf "$HOME/Library/Application Support/Code/Cache"/*
    rm -rf "$HOME/Library/Application Support/Code/CachedData"/*
    echo "✅ Cleared VS Code cache ($SIZE)"
fi

# Clean Homebrew cache
echo "🍺 Cleaning Homebrew cache..."
brew cleanup --prune=all -q 2>/dev/null
echo "✅ Homebrew cache cleaned"

# Purge system memory
echo "🧠 Purging inactive memory..."
if command -v sudo >/dev/null 2>&1; then
    if sudo -n true 2>/dev/null; then
        sudo purge 2>/dev/null && echo "✅ Memory purged" || echo "⚠️  Could not purge memory (requires sudo)"
    else
        echo "⚠️  Sudo password required to purge memory"
    fi
else
    echo "⚠️  Sudo not available, skipping memory purge"
fi

# Clear system logs (optional - uncomment if needed)
# sudo rm -rf /private/var/log/*

echo ""
echo "📊 System Status:"
echo "Free Memory: $(top -l 1 | grep PhysMem | awk '{print $6}')"
echo "Disk Space: $(df -h . | tail -1 | awk '{print $4}' | sed 's/i//')"
echo ""
echo "💡 Tips for better performance:"
echo "  • Close unused browser tabs (Chrome uses ~200MB per tab)"
echo "  • Quit apps you're not using (Activity Monitor → Quit)"
echo "  • Restart VS Code to clear memory: Cmd+Q, then reopen"
echo "  • Disable heavy extensions: Cmd+Shift+X, search & disable"
echo "  • Use Safari instead of Chrome (lighter on memory)"
echo "  • Close other editors/IDEs"
echo ""
echo "⚡ VS Code Extensions to Disable on Low RAM:"
echo "  • GitLens (very heavy)"
echo "  • Prettier (use on save only)"
echo "  • ESLint (disable auto-fix)"
echo "  • Python extension (if not needed)"
echo ""
echo "🔄 If still slow, try:"
echo "  1. Reload VS Code window: Cmd+Shift+P → 'Reload Window'"
echo "  2. Close unused editor tabs"
echo "  3. Restart Mac if VS Code has been open for days"
echo ""
echo "✅ Cleanup complete!"
