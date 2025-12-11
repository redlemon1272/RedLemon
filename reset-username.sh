#!/bin/bash

# Test script for username reset functionality
# This script demonstrates how to use the new UserResetManager

echo "🧪 Testing Redlemon Username Reset Functionality"
echo "=================================================="

# Check if app is built
if [ ! -d "build" ]; then
    echo "❌ Build directory not found. Please build the app first:"
    echo "   swift build"
    exit 1
fi

echo "✅ Build directory found"
echo ""
echo "📋 Instructions to test username reset:"
echo ""
echo "1. Run the Redlemon app"
echo "2. Go to Settings"
echo "3. Look for 'Reset User Data' section"
echo "4. Click 'Erase All Data' button"
echo "5. Confirm the reset in the dialog"
echo "6. App should show username setup screen"
echo "7. Create a new username"
echo ""
echo "🔍 What happens behind the scenes:"
echo "   - Clears UserDefaults username"
echo "   - Clears watch history"
echo "   - Clears keychain data"
echo "   - Sets force username setup flag"
echo "   - Shows username setup dialog"
echo ""
echo "⚠️  Note: The 'lemontom' user in the database will remain"
echo "   (Only local data is erased for safety)"
echo ""
echo "🚀 Ready to test!"
