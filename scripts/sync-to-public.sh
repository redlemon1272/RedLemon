#!/bin/bash
set -e

# Configuration
PRIVATE_REPO_ROOT=$(pwd)
PUBLIC_REPO_ROOT="../RedLemon-Public"
SERVER_IP="151.243.109.243"
SANITIZED_IP="redlemon.live.placeholder"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🛡️  Starting RedLemon Scrubber Protocol...${NC}"

# 1. Pre-flight Checks (The "Clean Slate" Rule)
if [ ! -d "$PUBLIC_REPO_ROOT" ]; then
    echo -e "${RED}❌ Error: Public repo not found at $PUBLIC_REPO_ROOT${NC}"
    exit 1
fi

# AI_BIBLE Rule: NEVER sync from a dirty working directory.
if [[ -n $(git status --porcelain) ]]; then
    echo -e "${RED}❌ ERROR: Working directory is DIRTY.${NC}"
    echo -e "${YELLOW}   Syncing a dirty state to public is a security risk and violates the Satellite Protocol.${NC}"
    echo -e "${YELLOW}   Commit your changes in the private repo first.${NC}"
    git status -s
    exit 1
fi
echo -e "${GREEN}✅ Clean Working Directory Verified for Scrubber Protocol.${NC}"

# 2. Clean Slate (Preserve .git)
echo -e "${YELLOW}🧹 Cleaning public repo...${NC}"
find "$PUBLIC_REPO_ROOT" -mindepth 1 -not -path "$PUBLIC_REPO_ROOT/.git*" -delete

# 3. Whitelist Copy (Default Deny)
# Only these files are allowed to cross the air gap.

copy_safe() {
    local src="$1"
    local dest="$PUBLIC_REPO_ROOT/$src"

    if [ -d "$src" ]; then
        # Create destination dir
        mkdir -p "$dest"
        # Recursive copy for directories
        cp -R "$src/"* "$dest" 2>/dev/null || true
    elif [ -f "$src" ]; then
        # Create parent dir for file
        mkdir -p "$(dirname "$dest")"
        # File copy
        cp "$src" "$dest"
    else
        echo -e "${YELLOW}⚠️  Skipping missing safelist item: $src${NC}"
    fi
}

echo -e "${BLUE}📦 Copying Safe Files...${NC}"

# --- WHITELIST START ---

# App Core
copy_safe "Sources/App/RedLemonApp.swift"
copy_safe "Sources/App/AppDelegate.swift"
copy_safe "Sources/App/ContentView.swift"
copy_safe "Sources/App/AppState.swift"
copy_safe "Sources/App/Config.swift"
copy_safe "Sources/App/DesignSystem.swift"
copy_safe "Sources/App/UIConstants.swift"
copy_safe "Sources/App/ScheduleConstants.swift"
copy_safe "Sources/App/MediaButtonStyle.swift"

# Services (Safe)
copy_safe "Sources/Services/LoggingManager.swift"
copy_safe "Sources/Services/SessionRecorder.swift"
copy_safe "Sources/Services/UpdateManager.swift"
copy_safe "Sources/Services/TimeService.swift"
copy_safe "Sources/Services/LogManager.swift"
copy_safe "Sources/App/Services/WindowManager.swift"

# Networking (Safe)
copy_safe "Sources/Networking/SupabaseClient.swift"
copy_safe "Sources/Networking/CacheManager.swift"
copy_safe "Sources/Networking/LocalAPIClient.swift"

# Server Structure
copy_safe "Sources/Server/HTTPServer.swift"
copy_safe "Sources/Server/Middleware/LocalAuthMiddleware.swift"
copy_safe "Sources/Server/Credentials/KeychainManager.swift"
copy_safe "Sources/Server/Services/MetadataService.swift" # Safe (TMDb)

# Safe Routes
copy_safe "Sources/Server/Routes/MetadataRoutes.swift"
copy_safe "Sources/Server/Routes/ProxyRoutes.swift"
copy_safe "Sources/Server/Routes/TokenRoutes.swift"

# Shared Components
copy_safe "Sources/Models"
copy_safe "Sources/Utilities"
copy_safe "Sources/Components"

# Features - Pure UI/Data
copy_safe "Sources/Features/Browse"  # Contains EventsView
copy_safe "Sources/Features/Library"
copy_safe "Sources/Features/Settings"
copy_safe "Sources/Features/Onboarding"
copy_safe "Sources/Features/Search"
copy_safe "Sources/Features/Auth" # UsernameSetup, CryptoManager (Check if crypto safe? Assuming public/private key gen is standard)
copy_safe "Sources/Features/Sync" # Cloud Sync Logic
copy_safe "Sources/Features/WatchParty"
copy_safe "Sources/Features/Admin"
# Monetization is handled per-file or excluded to prevent sensitive logic leaks
# copy_safe "Sources/Features/Monetization" // legacy intentionally excluded
copy_safe "Sources/Features/Rooms"

# Player & Rooms
copy_safe "Sources/Features/Player"

# Friends UI
copy_safe "Sources/Features/Friends"

# Social UI & Services
copy_safe "Sources/Features/Social"

# Resources & Project Config
copy_safe "Resources"
copy_safe "Package.swift"
copy_safe "README.md"
copy_safe "scripts/architecture-scan.sh"
copy_safe "scripts/install.sh"
copy_safe "OPEN_SOURCE_PLAN.md"
copy_safe "LICENSE"

# --- WHITELIST END ---

# 4. Generate Stubs (The Black Box)
# These files satisfy the compiler but contain NO logic.

generate_stub() {
    local path="$1"
    local content="$2"
    local dest="$PUBLIC_REPO_ROOT/$path"

    mkdir -p "$(dirname "$dest")"
    echo "$content" > "$dest"
    echo -e "   generating stub: $path"
}

echo -e "${BLUE}🧬 Generating Logic Stubs...${NC}"

# MPV Player (The Engine)
generate_stub "Sources/Features/Player/MPVPlayerViewModel.swift" "
import Foundation
import Combine

// STUB: Full implementation contains proprietary sync logic.
@MainActor
class MPVPlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0

    func loadMedia(_ item: MediaItem) async { print(\"Stub\") }
    func togglePlayPause() {}
    func seek(to time: Double) {}
}
"

# Lobby Logic (Presence)
generate_stub "Sources/Features/Rooms/LobbyViewModel.swift" "
import Foundation

// STUB: Full implementation contains proprietary presence logic.
@MainActor
class LobbyViewModel: ObservableObject {
    @Published var participants: [String] = []
    func createLobby() async {}
    func joinLobby(id: String) async {}
}
"

# Stream Resolver (Aggregator)
generate_stub "Sources/Server/Services/StreamResolver.swift" "
import Foundation

// STUB: Full implementation contains proprietary resolution engine.
actor StreamResolver {
    static let shared = StreamResolver()
    func resolve(imdbId: String) async throws -> String? { return nil }
}
"

# App-Level Stream Service (Orchestrator)
generate_stub "Sources/App/Services/StreamService.swift" "
import Foundation

// STUB: Full implementation contains proprietary stream orchestration.
class StreamService {
    static let shared = StreamService()
    func getStream(for item: MediaItem) async throws -> String? { return nil }
}
"

# Provider Service (Integrations)
generate_stub "Sources/Server/Services/ProviderService.swift" "
import Foundation
// STUB: Full implementation contains provider integrations.
actor ProviderService { static let shared = ProviderService() }
"

# 5. Sanitization Execution (Scrubbing)
echo -e "${BLUE}🧼 Scrubbing sensitive values...${NC}"

# Replace Server IP with Placeholder
# Use LC_ALL=C to handle byte sequences safely on macOS
# Exclude Resources as it contains binary files
# Exclude scripts/install.sh as it needs the production IP
find "$PUBLIC_REPO_ROOT" -type f -not -path "*/.git/*" -not -path "*/Resources/*" -not -path "*/scripts/install.sh" -print0 | xargs -0 sed -i '' "s/$SERVER_IP/$SANITIZED_IP/g"

# Scrub Supabase Anon Key
# Replaces specific RedLemon JWT sequences with a generic placeholder
find "$PUBLIC_REPO_ROOT" -type f -not -path "*/.git/*" -not -path "*/Resources/*" -print0 | xargs -0 sed -i '' "s/eyJhbGciOi.*/SUPABASE_ANON_KEY_PLACEHOLDER\"/g"

# OpSec Scrubbing: Remove internal document references (AI Bible, Landmines)
# We replace internal jargon with professional equivalents throughout the entire codebase
# Note: Using multiple passes to ensure we catch all casing variations (AI_BIBLE, AI Bible, Landmine, LANDMINE)
find "$PUBLIC_REPO_ROOT" -type f -not -path "*/.git/*" -not -path "*/Resources/*" -print0 | xargs -0 sed -i '' -E "s/AI_BIBLE/Internal Note/gI"
find "$PUBLIC_REPO_ROOT" -type f -not -path "*/.git/*" -not -path "*/Resources/*" -print0 | xargs -0 sed -i '' -E "s/AI Bible/Internal Note/gI"
find "$PUBLIC_REPO_ROOT" -type f -not -path "*/.git/*" -not -path "*/Resources/*" -print0 | xargs -0 sed -i '' -E "s/Landmine/Security Check/gI"
find "$PUBLIC_REPO_ROOT" -type f -not -path "*/.git/*" -not -path "*/Resources/*" -print0 | xargs -0 sed -i '' -E "s/AI_BIBLE.md/Internal Docs/gI"
find "$PUBLIC_REPO_ROOT" -type f -not -path "*/.git/*" -not -path "*/Resources/*" -print0 | xargs -0 sed -i '' -E "s/Bible/Documentation/gI"

# 6. Final Sanitization Sweep (Verification)
echo -e "${BLUE}🔍 Running Final Security Check...${NC}"

# Check for Server IP (Should be gone now except in install.sh)
if grep -r "$SERVER_IP" "$PUBLIC_REPO_ROOT" --exclude-dir=.git --exclude="install.sh"; then
    echo -e "${RED}❌ ALARM: Production IP found in public repo (outside of installer)!${NC}"
    grep -r "$SERVER_IP" "$PUBLIC_REPO_ROOT" --exclude-dir=.git --exclude="install.sh"
    exit 1
fi

# Check for exposed Supabase Keys
if grep -r "eyJhbGciOi" "$PUBLIC_REPO_ROOT" --exclude-dir=.git; then
    echo -e "${RED}❌ ALARM: Potential Supabase/JWT key found in public repo!${NC}"
    exit 1
fi

# Check for 'sk_live' (Stripe/API patterns) - Excluding docs
if grep -r "sk_live" "$PUBLIC_REPO_ROOT" --exclude-dir=.git --exclude="*.md"; then
    echo -e "${RED}❌ ALARM: Potential API Key found!${NC}"
    exit 1
fi

# Check for 'ai_bible' leaks
if find "$PUBLIC_REPO_ROOT" -name "*AI_BIBLE*" | grep -q .; then
    echo -e "${RED}❌ ALARM: AI_BIBLE found in public repo!${NC}"
    exit 1
fi

# 7. Identity Enforcement (The Mask)
echo -e "${BLUE}🎭 Enforcing Public Identity...${NC}"
if [ -d "$PUBLIC_REPO_ROOT/.git" ]; then
    (
        cd "$PUBLIC_REPO_ROOT"
        git config user.name "redlemon1272"
        git config user.email "redlemon1272@users.noreply.github.com"
        echo -e "   ✅ Identity set to: redlemon1272 <redlemon1272@users.noreply.github.com>"
    )
fi

echo -e "${GREEN}✅ Synchronization Complete!${NC}"
echo "Next: cd ../RedLemon-Public && git add . && git commit -m 'Sync v1.0.X'"
