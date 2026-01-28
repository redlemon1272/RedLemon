#!/bin/bash
set -e

# RedLemon GitHub Release Automation
# Usage: ./scripts/github-release.sh <vVERSION> <DMG_PATH> "<NOTES>"

VERSION=$1
DMG_PATH=$2
NOTES=$3

if [ -z "$VERSION" ] || [ -z "$DMG_PATH" ] || [ -z "$NOTES" ]; then
    echo "Usage: ./scripts/github-release.sh <vVERSION> <DMG_PATH> \"<NOTES>\""
    exit 1
fi

if [ -z "$GH_PAT" ]; then
    echo "❌ Error: GH_PAT environment variable not set."
    echo "Please export GH_PAT=\"...\" before running."
    exit 1
fi

echo "🚀 Creating GitHub Release for $VERSION..."

# 1. Try Create Release (or Fetch if exists)
RELEASE_RESPONSE=$(curl -L -s -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/redlemon1272/RedLemon/releases \
  -d "{
    \"tag_name\":\"$VERSION\",
    \"target_commitish\":\"main\",
    \"name\":\"$VERSION\",
    \"body\":\"$NOTES\n\n**Download**: [RedLemon.dmg](https://github.com/redlemon1272/RedLemon/releases/latest/download/RedLemon.dmg)\",
    \"draft\":false,
    \"prerelease\":false
  }")

# Check if it failed because it exists
if echo "$RELEASE_RESPONSE" | grep -q "already_exists"; then
    echo "⚠️  Release $VERSION already exists. Fetching info..."
    RELEASE_RESPONSE=$(curl -L -s -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $GH_PAT" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/redlemon1272/RedLemon/releases/tags/$VERSION)
fi

# 2. Extract Upload URL
UPLOAD_URL=$(echo "$RELEASE_RESPONSE" | grep -o 'https://uploads.github.com/[^"]*assets{?name,label}' | sed 's/{?name,label}//')

if [ -z "$UPLOAD_URL" ]; then
    echo "❌ Error: Failed to create/fetch release or get upload URL."
    echo "Response: $RELEASE_RESPONSE"
    exit 1
fi

# 2.5 Delete existing asset if present (to allow overwrite)
ASSET_ID=$(echo "$RELEASE_RESPONSE" | grep -A 5 "\"name\": \"RedLemon.dmg\"" | grep "\"id\"" | head -1 | awk '{print $2}' | tr -d ',')
if [ ! -z "$ASSET_ID" ]; then
    echo "🗑️  Deleting existing RedLemon.dmg (ID: $ASSET_ID) to allow overwrite..."
    curl -L -s -X DELETE -H "Authorization: Bearer $GH_PAT" -H "X-GitHub-Api-Version: 2022-11-28" "https://api.github.com/repos/redlemon1272/RedLemon/releases/assets/$ASSET_ID"
fi

echo "📦 Uploading $DMG_PATH to $VERSION..."

# 3. Upload the Actual DMG
curl -L -s -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GH_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -H "Content-Type: application/octet-stream" \
  "$UPLOAD_URL?name=RedLemon.dmg" \
  --data-binary "@$DMG_PATH"

echo "✅ GitHub Release $VERSION and Asset Uploaded Successfully!"
