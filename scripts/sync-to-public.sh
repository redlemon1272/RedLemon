#!/bin/bash

# =============================================================================
# 🍋 RedLemon Public Sync Tool (The Scrubber)
# =============================================================================
# Purpose: Synchronizes the private RedLemon-Native repo with the public
#          GitHub repository by stripping closed-source components and
#          sanitizing sensitive data.
# 
# Follows: OPEN_SOURCE_PLAN.md
# =============================================================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Paths
PUBLIC_REPO_DIR="../RedLemon-Public" # Expected sibling directory
PRIVATE_REPO_DIR=$(pwd)
SERVER_IP="151.243.109.243"

echo -e "${BLUE}🚀 Starting Public Sync Strategy...${NC}"

# 1. Verify Public Repo Target
if [ ! -d "$PUBLIC_REPO_DIR/.git" ]; then
    echo -e "${RED}❌ Error: Public repository directory not found at $PUBLIC_REPO_DIR${NC}"
    echo "Please clone the public repo to the sibling folder first."
    exit 1
fi

# 2. Define Whitelist (Only these directories/files are copied)
# Based on OPEN_SOURCE_PLAN.md
OPEN_PATHS=(
    "Sources/App"
    "Sources/Features/Browse"
    "Sources/Features/Player/MPVWrapper.swift"
    "Sources/Features/Player/PlayerView.swift"
    "Sources/Features/Player/PlayerControlsView.swift"
    "Sources/Features/Lobby/LobbyView.swift"
    "Sources/Features/Lobby/LobbyComponents.swift"
    "Sources/Features/Social/SocialView.swift"
    "Sources/Features/Social/FriendsComponents.swift"
    "Sources/Features/Settings"
    "Sources/Features/Onboarding"
    "Sources/Features/Admin/AdminDashboardView.swift"
    "Sources/Features/Payments/PaymentView.swift"
    "Sources/Features/Events/EventsView.swift"
    "Sources/Server/HTTPServer.swift"
    "Sources/Server/LocalAuthMiddleware.swift"
    "Sources/Server/LocalAPIClient.swift"
    "Sources/Server/Routes/MetadataRoutes.swift"
    "Sources/Server/Routes/ProxyRoutes.swift"
    "Sources/Server/Routes/TokenRoutes.swift"
    "Sources/Server/Services/MetadataService.swift"
    "Sources/Server/Credentials/KeychainManager.swift"
    "Sources/Server/Credentials/AccountExportManager.swift"
    "Sources/Networking/SupabaseClient.swift"
    "Sources/Networking/CacheManager.swift"
    "Sources/Networking/UpdateManager.swift"
    "Sources/Services/LoggingManager.swift"
    "Sources/Services/SessionRecorder.swift"
    "Sources/Services/NotificationManager.swift"
    "Sources/Shared"
    "Resources"
    "scripts/architecture-scan.sh"
    "scripts/install.sh"
    "README.md"
    "OPEN_SOURCE_PLAN.md"
    "appcast.xml"
)

# 3. Clean Public Repo (Except .git)
echo -e "${YELLOW}🧹 Cleaning public repository...${NC}"
find "$PUBLIC_REPO_DIR" -maxdepth 1 ! -name ".git" ! -name "." -exec rm -rf {} +

# 4. Copy Whitelisted Files
echo -e "${YELLOW}📁 Copying whitelisted files...${NC}"
for path in "${OPEN_PATHS[@]}"; do
    if [ -e "$path" ]; then
        # Create parent directory if it doesn't exist
        dest_dir=$(dirname "$PUBLIC_REPO_DIR/$path")
        mkdir -p "$dest_dir"
        cp -R "$path" "$PUBLIC_REPO_DIR/$path"
    else
        echo -e "${RED}⚠️  Warning: Path not found - $path${NC}"
    fi
done

# 5. Generate Stubs for CLOSED Components
echo -e "${YELLOW}🧩 Generating stubs for closed components...${NC}"

# Helper function to create a stub
create_stub() {
    local file=$1
    local content=$2
    local full_path="$PUBLIC_REPO_DIR/$file"
    mkdir -p "$(dirname "$full_path")"
    echo -e "$content" > "$full_path"
    echo "   ✅ Created stub: $file"
}

# Example Stub: MPVPlayerViewModel
create_stub "Sources/Features/Player/MPVPlayerViewModel.swift" \
"import Foundation\nimport Combine\n\n@MainActor\nclass MPVPlayerViewModel: ObservableObject {\n    @Published var isPlaying: Bool = false\n    @Published var currentTime: Double = 0\n    @Published var duration: Double = 0\n\n    func loadStream(url: String, metadata: Any) async throws {\n        // STUB: Full implementation is closed source.\n        throw NSError(domain: \"RedLemon\", code: 403, userInfo: [NSLocalizedDescriptionKey: \"Stream playback requires the private Core Engine.\"])\n    }\n}"

# Example Stub: LobbyViewModel
create_stub "Sources/Features/Rooms/LobbyViewModel.swift" \
"import Foundation\nimport Combine\n\n@MainActor\nclass LobbyViewModel: ObservableObject {\n    @Published var participants: [Any] = []\n    @Published var room: Any? = nil\n\n    func connect() async {\n        // STUB: Watch-party sync logic is closed source.\n    }\n}"

# 6. Sanitization (IP Removal)
echo -e "${YELLOW}🧼 Sanitizing sensitive data...${NC}"
# Replace server IP with placeholder
grep -r "$SERVER_IP" "$PUBLIC_REPO_DIR" --exclude-dir=".git" -l | while read -r file; do
    sed -i '' "s/$SERVER_IP/redlemon.live.placeholder/g" "$file"
    echo "   ✅ Sanitized: $(basename "$file")"
done

# 7. Final Verification
echo -e "${GREEN}✨ Sync Complete!${NC}"
echo "-------------------------------------------------------"
echo "Target: $PUBLIC_REPO_DIR"
echo "Files Copied: $(find "$PUBLIC_REPO_DIR" -type f | grep -v "/.git/" | wc -l)"
echo "Next Steps:"
echo "1. CD to $PUBLIC_REPO_DIR"
echo "2. Review changes: git status"
echo "3. Commit and Push to GitHub"
echo "-------------------------------------------------------"
