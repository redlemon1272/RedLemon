#!/bin/bash

# Find the last commit that started with "Release v"
# We assume the standard format "Release v1.0.X (Build Y)"
LAST_RELEASE_HASH=$(git log --grep="Release v" --format="%H" -n 1)

if [ -z "$LAST_RELEASE_HASH" ]; then
    echo "<li>Initial Release</li>"
    exit 0
fi

# Get all commits since that release, exclude "Merge" commits
# Format as HTML list items for Sparkle
# We reject lines that are just "Release v..." (in case we are running this ON the release commit)
git log $LAST_RELEASE_HASH..HEAD --no-merges --pretty=format:"<li>%s</li>" | grep -v "Release v"

echo "" # Final newline
