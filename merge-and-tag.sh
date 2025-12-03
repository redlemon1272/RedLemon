#!/bin/bash

# Ensure we are in the root of the repo
cd "$(dirname "$0")"

# Display help
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: ./merge-and-tag.sh [OPTIONS]"
    echo
    echo "Merges the current branch into main and tags it with a new version and epoch time."
    echo
    echo "Options:"
    echo "  -y    Bypass the confirmation prompt (useful for CI/CD)."
    echo "  -h, --help    Display this help message."
    echo
    exit 0
fi

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    echo "Error: You have uncommitted changes. Please commit or stash them before running this script."
    exit 1
fi

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" == "main" ]; then
    echo "Error: You are already on main. Please run this script from the feature branch you want to merge."
    exit 1
fi

echo "Current branch: $CURRENT_BRANCH"

# Fetch latest tags
git fetch --tags

# Find the latest version tag (assumes format vX.Y.Z)
LATEST_TAG=$(git tag -l "v*" | sort -V | tail -n 1)

if [ -z "$LATEST_TAG" ]; then
    echo "No tags found. Starting with v1.0.0"
    NEW_VERSION="v1.0.0"
else
    echo "Latest tag: $LATEST_TAG"
    # Extract version numbers
    VERSION_BITS=(${LATEST_TAG//./ })
    VNUM=${VERSION_BITS[0]}
    MAJOR=${VERSION_BITS[1]}
    MINOR=${VERSION_BITS[2]}
    
    # Increment minor version (patch level)
    # Removing 'v' prefix if present for calculation
    VNUM="${VNUM#v}"
    
    # Simple increment logic: increment the last number
    # If the tag is v1.0.5, we want v1.0.6
    # If the tag format is different, this might need adjustment, but assuming semantic versioning vX.Y.Z
    
    # Let's try a more robust regex approach to split
    BASE_VERSION=$(echo $LATEST_TAG | sed 's/-.*//') # Remove any existing suffix
    IFS='.' read -ra ADDR <<< "${BASE_VERSION#v}"
    
    MAJOR=${ADDR[0]}
    MINOR=${ADDR[1]}
    PATCH=${ADDR[2]}
    
    NEW_PATCH=$((PATCH + 1))
    NEW_VERSION="v$MAJOR.$MINOR.$NEW_PATCH"
fi

# Get current epoch time
EPOCH=$(date +%s)

# Construct new tag
NEW_TAG="${NEW_VERSION}-${EPOCH}"
echo "New tag will be: $NEW_TAG"

# Check for -y flag to bypass confirmation
AUTO_CONFIRM=false
for arg in "$@"; do
    if [ "$arg" == "-y" ]; then
        AUTO_CONFIRM=true
        break
    fi
done

if [ "$AUTO_CONFIRM" = false ]; then
    # Confirmation
    read -p "Do you want to proceed with merging $CURRENT_BRANCH into main and tagging as $NEW_TAG? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
else
    echo "Auto-confirming merge and tag..."
fi

# Checkout main and pull
echo "Switching to main..."
git checkout main
git pull origin main

# Merge
echo "Merging $CURRENT_BRANCH..."
git merge "$CURRENT_BRANCH"

# Tag
echo "Tagging..."
git tag -a "$NEW_TAG" -m "Release $NEW_TAG merged from $CURRENT_BRANCH"

# Push
echo "Pushing to origin..."
git push origin main
git push origin "$NEW_TAG"

# Switch back
echo "Switching back to $CURRENT_BRANCH..."
git checkout "$CURRENT_BRANCH"

echo "Done! Released $NEW_TAG"
