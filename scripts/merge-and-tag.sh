#!/bin/bash
set -e

# Configuration
BRANCH_TO_MERGE=$(git rev-parse --abbrev-ref HEAD)
TARGET_BRANCH="main"
VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Usage: ./scripts/merge-and-tag.sh <version_tag>"
    echo "Example: ./scripts/merge-and-tag.sh v1.0.71"
    exit 1
fi

echo "🚀 Starting Merge & Tag Flow..."
echo "🔹 Current Branch: $BRANCH_TO_MERGE"
echo "🔹 Target Branch: $TARGET_BRANCH"
echo "🔹 Tag: $VERSION"

# Confirm clean state
if [[ -n $(git status -s) ]]; then
    echo "❌ Error: Working directory not clean. Please commit changes first."
    exit 1
fi

# Fetch latest
echo "📥 Fetching origin..."
git fetch origin

# Checkout target
echo "🔄 Checking out $TARGET_BRANCH..."
git checkout $TARGET_BRANCH
git pull origin $TARGET_BRANCH

# Merge
echo "🔀 Merging $BRANCH_TO_MERGE into $TARGET_BRANCH..."
if ! git merge $BRANCH_TO_MERGE --no-edit; then
    echo "--------------------------------------------------------"
    echo "❌ CRITICAL ERROR: MERGE CONFLICT DETECTED"
    echo "⚠️  AI ASSISTANT WARNING: Bible Rule 19.8 enforced."
    echo "🛑 STOP IMMEDIATELY. DO NOT attempt to resolve conflict markers."
    echo "🛑 Manual USER intervention required."
    echo "--------------------------------------------------------"
    exit 1
fi

# Tag
echo "🏷️ Tagging $VERSION..."
git tag -a $VERSION -m "Release $VERSION"

# Push
echo "⬆️ Pushing to origin..."
git push origin $TARGET_BRANCH
git push origin $VERSION

# Switch back
echo "🔙 Switching back to $BRANCH_TO_MERGE..."
git checkout $BRANCH_TO_MERGE

echo "✅ Merge & Tag Complete!"
