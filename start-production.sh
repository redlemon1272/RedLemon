#!/bin/bash
set -e

echo "🚀 Starting Production Build (Intel Native x86_64)..."

# 1. CLEAN (Optional - for faster re-builds, comment this out if incremental works well)
# swift package clean

# 2. BUILD (Release configuration, Intel Native)
# We don't specify --arch because on Intel it defaults to x86_64.
# Specifying it forces it to NOT try to build universal.
swift build -c release --product RedLemon --arch x86_64

# 3. RUN
echo "✅ Build Complete. Launching..."
./.build/x86_64-apple-macosx/release/RedLemon
