#!/bin/bash

# RedLemon Fresh Build Script
# Ensures latest code is pulled before building

echo "🔄 Pulling latest code from git..."
git pull origin main-4-GLM

if [ $? -ne 0 ]; then
    echo "❌ Git pull failed. Please check your git status."
    exit 1
fi

echo "✅ Latest code pulled"
echo ""
echo "🧹 Cleaning build folder..."
rm -rf build
rm -rf .build

echo ""
echo "🔨 Building RedLemon..."
swift build -c release

if [ $? -ne 0 ]; then
    echo "❌ Build failed"
    exit 1
fi

echo ""
echo "✅ Build complete!"
echo ""
echo "🚀 Launching RedLemon..."
./start-production.sh
