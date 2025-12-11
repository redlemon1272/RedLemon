#!/bin/bash

# Quick WebRTC Testing - Launch Host and Guest
# Simple script for rapid testing

set -e

APP_PATH="$HOME/Applications/RedLemon.app"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🧪 Quick WebRTC Test Setup${NC}"
echo "================================"

# Check if app exists
if [ ! -d "$APP_PATH" ]; then
    echo -e "${YELLOW}⚠️  App not found at $APP_PATH${NC}"
    echo "Please build the app first or update APP_PATH in this script"
    exit 1
fi

echo -e "${GREEN}✅ Found app at: $APP_PATH${NC}"
echo ""

# Launch Host
echo -e "${BLUE}🚀 Launching Host...${NC}"
open -n "$APP_PATH" --args -user-profile host
sleep 3

# Launch Guest
echo -e "${BLUE}🚀 Launching Guest...${NC}"
open -n "$APP_PATH" --args -user-profile guest

echo ""
echo -e "${GREEN}✅ Both instances launched!${NC}"
echo ""
echo "You should now have two RedLemon windows:"
echo "  1. RedLemon - Host (create a room)"
echo "  2. RedLemon - Guest (join the room)"
echo ""
echo "Testing Instructions:"
echo "  1. In Host window: Create a room and select media"
echo "  2. In Guest window: Join the same room"
echo "  3. Check Console.app for WebRTC connection logs"
echo ""
echo "📝 To view logs: open Console.app and search for 'RedLemon'"