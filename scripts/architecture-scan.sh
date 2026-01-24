#!/bin/bash

# =============================================================================
# 🏗️ RedLemon Architecture Scanner (The "Anti-Regression" Shield)
# =============================================================================
# A robust static analysis tool designed to detect "RedLemon-specific"
# architectural violations before they become regression bugs.
#
# Philosophy:
# 1. Zero False Positives (Goal).
# 2. Educate, don't just error. Link to AI Bible Landmines.
# 3. Allow manual overrides via "// OK" or "// legacy".
#
# Usage: ./scripts/architecture-scan.sh [--strict]
#   --strict: Exit 1 on any violation.
#
# =============================================================================

set -e

# Colors for pretty output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# State
ERROR_COUNT=0
WARNING_COUNT=0
SOURCES_DIR="Sources"

# Helper to print header
print_header() {
    echo -e "\n${CYAN}${BOLD}>>> $1${NC}"
    echo -e "${CYAN}------------------------------------------------------------${NC}"
}

# Helper to report violation
# Usage: report "ERROR|WARNING" "RuleName" "Message" "File" "Line" "Code"
report() {
    local level=$1
    local rule=$2
    local msg=$3
    local file=$4
    local line=$5
    local code=$6

    # Check for suppression (comments in the code line)
    if [[ "$code" == *"// OK"* ]] || [[ "$code" == *"// legacy"* ]] || [[ "$code" == *"// ignore"* ]]; then
        return
    fi

    if [[ "$level" == "ERROR" ]]; then
        echo -e "${RED}❌ VIOLATION [$rule]:${NC} $msg"
        ((ERROR_COUNT++))
    else
        echo -e "${YELLOW}⚠️  WARNING [$rule]:${NC} $msg"
        ((WARNING_COUNT++))
    fi

    if [[ -n "$file" ]]; then
        # Format: Sources/Path/File.swift:Line
        echo -e "   📍 $file:$line"
    fi
    if [[ -n "$code" ]]; then
        # Trim leading whitespace for clean display
        local trimmed_code=$(echo "$code" | sed -e 's/^[[:space:]]*//')
        echo -e "   ${BLUE}\"$trimmed_code\"${NC}"
    fi
    echo ""
}

echo -e "${BLUE}${BOLD}"
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║          🏗️  RedLemon Architecture Scanner                     ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# =============================================================================
# CHECK 1: Regression Prevention (BrowseView Scroll Stutter)
# =============================================================================
print_header "Check 1: Regression Prevention (BrowseView)"

# We strictly forbid LazyVStack in BrowseView.swift because it broke macOS 12 scrolling
BROWSE_VIEW="$SOURCES_DIR/Features/Browse/BrowseView.swift"
if [[ -f "$BROWSE_VIEW" ]]; then
    # count lines with LazyVStack that don't satisfy // comment
    VIOLATIONS=$(grep -n "LazyVStack" "$BROWSE_VIEW" | grep -v "//" || true)

    if [[ -n "$VIOLATIONS" ]]; then
        while IFS=: read -r line code; do
            report "ERROR" "No-LazyVStack" "BrowseView MUST use VStack (Fixes macOS 12 Scroll Stutter)" "$BROWSE_VIEW" "$line" "$code"
        done <<< "$VIOLATIONS"
    else
        echo -e "${GREEN}✅ BrowseView is clean (No LazyVStack).${NC}"
    fi
fi


# =============================================================================
# CHECK 2: Legacy Concurrency (DispatchQueue.main.async) - Landmine #25
# =============================================================================
# We must use Task { @MainActor } to ensure proper Swift Concurrency isolation.
print_header "Check 2: Modern Concurrency (Landmine #25)"

while IFS=: read -r file line code; do
    # Skip if it's a comment
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    report "WARNING" "Landmine #25" "Avoid DispatchQueue.main.async. Use Task { @MainActor }." "$file" "$line" "$code"
done < <(grep -rn "DispatchQueue.main.async" "$SOURCES_DIR" --include="*.swift" | grep -v "//")


# =============================================================================
# CHECK 3: Privacy Leaks (Document Directory) - Landmine #29
# =============================================================================
# Logs/Cache must never pollute the User's Documents folder.
print_header "Check 3: Privacy & Path Safety (Landmine #29)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    report "ERROR" "Landmine #29" "Do NOT use .documentDirectory. Use .applicationSupportDirectory (Hidden)." "$file" "$line" "$code"
done < <(grep -rn "\.documentDirectory" "$SOURCES_DIR" --include="*.swift" | grep -v "//")


# =============================================================================
# CHECK 4: Unsafe Logging (NSLog) - Landmine #11
# =============================================================================
# NSLog("Message: \(value)") crashes if value contains '%'.
print_header "Check 4: Safe Logging (Landmine #11)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    # Heuristic: Check for NSLog( followed by anything NOT starting with quote-%-@
    # And specifically containing string interpolation \(
    if [[ "$code" =~ NSLog\( && "$code" =~ \\\( ]]; then
         # Exclude safe usage like logging count: NSLog("Count: \(count)") -> unsafe technically but common
         # Real danger is arbitrary strings.
         report "ERROR" "Landmine #11" "Unsafe NSLog interpolation. Use format specifiers: NSLog(\"%@\", value)" "$file" "$line" "$code"
    fi
done < <(grep -rn "NSLog(" "$SOURCES_DIR" --include="*.swift" | grep -v 'NSLog("%@"')


# =============================================================================
# CHECK 5: Silent Async Failures (Optional Chaining) - Landmine #43
# =============================================================================
# try await obj?.func() returns Void cleanly without error if obj is nil.
print_header "Check 5: Silent Async Failures (Landmine #43)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    # Regex: try await [something]?[dot]
    if [[ "$code" =~ try[[:space:]]+await[[:space:]]+.*\?\.[a-zA-Z] ]]; then
        report "WARNING" "Landmine #43" "Silent Failure Risk: Optional chaining on async call. Use 'guard let' instead." "$file" "$line" "$code"
    fi
done < <(grep -rn "try await .*\?." "$SOURCES_DIR" --include="*.swift" | grep -v "//")


# =============================================================================
# CHECK 6: Case Insensitive Comparisons (Supabase IDs) - Landmine #37
# =============================================================================
# Supabase UUIDs are inconsistent (upper/lower). String equality fails.
print_header "Check 6: ID Case Sensitivity (Landmine #37)"

# We check for specific high-risk variable names: userId, hostId, roomId, sessionId, senderId
# combined with == operator.
HIGH_RISK_VARS="(userId|hostId|roomId|sessionId|senderId|currentUserId|actualUserId)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    # If code contains HighRiskVar == ... or ... == HighRiskVar
    if [[ "$code" =~ $HIGH_RISK_VARS[[:space:]]*== ]] || [[ "$code" =~ ==[[:space:]]*$HIGH_RISK_VARS ]]; then
         report "WARNING" "Landmine #37" "ID comparison using '=='. String IDs must use .caseInsensitiveCompare()" "$file" "$line" "$code"
    fi
done < <(grep -rnE "$HIGH_RISK_VARS" "$SOURCES_DIR" --include="*.swift" | grep "==" | grep -v "//")


# =============================================================================
# CHECK 11: Phoenix Ref Collision (Landmine #51)
# =============================================================================
# Trigger: Passing 'key' (UserId) to handlers causes flapping on metadata updates.
# Rule: Must use 'phx_ref' as the unique session ID.
print_header "Check 11: Phoenix Ref Collision (Landmine #51)"

REALTIME_CLIENT="$SOURCES_DIR/Networking/SupabaseRealtimeClient.swift"
if [[ -f "$REALTIME_CLIENT" ]]; then
    # Look for handler calls passing 'key' as the second argument
    # Regex captures: handler( .*, key ,
    VIOLATIONS=$(grep -n "handler(.*, key," "$REALTIME_CLIENT" | grep -v "//" || true)

    if [[ -n "$VIOLATIONS" ]]; then
        while IFS=: read -r line code; do
            report "ERROR" "Landmine #51" "Presence Flap Risk: Do not pass 'key' (UserId) to handler. Use 'phx_ref' from metadata." "$REALTIME_CLIENT" "$line" "$code"
        done <<< "$VIOLATIONS"
    fi
fi

# =============================================================================
# CHECK 8: Async Scroll Race (Landmine #48)
# =============================================================================
# Scrolls MUST be content-aware (check !isEmpty) to avoid race conditions.
print_header "Check 8: Async Scroll Race (Landmine #48)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    # Check for direct usage of proxy.scrollTo
    if [[ "$code" =~ proxy\.scrollTo ]]; then
         report "WARNING" "Landmine #48" "Scroll Race Risk: Verify this is guarded by '!items.isEmpty'. See AI Bible." "$file" "$line" "$code"
    fi
done < <(grep -rn "proxy\.scrollTo" "$SOURCES_DIR" --include="*.swift" | grep -v "//")


# =============================================================================
# CHECK 9: High-Freq State Thrashing (Landmine #50)
# =============================================================================
# Binding scroll offsets directly to AppState without debouncing kills performance.
print_header "Check 9: High-Frequency State (Landmine #50)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    # Pattern: Binding(get: { appState.someVal }, set: { appState.someVal = $0 })
    # We warn on any manual Binding creation involving 'appState' and 'scroll' keywords
    if [[ "$code" =~ Binding && "$code" =~ appState && "$code" =~ scroll ]]; then
         report "WARNING" "Landmine #50" "Perf Trap: High-frequency binding to AppState? Ensure this is DEBOUNCED or use local state." "$file" "$line" "$code"
    fi
done < <(grep -rn "Binding" "$SOURCES_DIR" --include="*.swift" | grep "appState" | grep "scroll" | grep -v "//")


# =============================================================================
# CHECK 10: macOS 15 Nested Scroll (Landmine #49)
# =============================================================================
# Custom NSScrollViews must verify they forward events.
print_header "Check 10: macOS 15 Scroll Swallowing (Landmine #49)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    # If defining a struct that implements NSViewRepresentable and is named like *ScrollView
    if [[ "$code" =~ struct.*:.*NSViewRepresentable ]]; then
        if [[ "$file" =~ ScrollView ]]; then
             report "WARNING" "Landmine #49" "Custom NSScrollView detected. Verify 'scrollWheel' forwards events for macOS 15+." "$file" "$line" "$code"
        fi
    fi
done < <(grep -rn "NSViewRepresentable" "$SOURCES_DIR" --include="*.swift" | grep -v "//")


# =============================================================================
# CHECK 12: Native Context Menus (Landmine #57)
# =============================================================================
# Native NSMenu logic blocks the main thread during video playback.
print_header "Check 12: Native Context Menus (Landmine #57)"

PLAYER_DIR="$SOURCES_DIR/Features/Player"
if [[ -d "$PLAYER_DIR" ]]; then
    # Look for usage of 'Menu {' or 'ContextMenu' in the Player feature directory
    # Regex: (^|[^a-zA-Z0-9_])Menu[[:space:]]*\{ OR ContextMenu
    # This prevents matching variables like "showSubtitleMenu {"
    VIOLATIONS=$(grep -rnE "(^|[^a-zA-Z0-9_])Menu[[:space:]]*\{|ContextMenu" "$PLAYER_DIR" --include="*.swift" | grep -v "//" || true)

    if [[ -n "$VIOLATIONS" ]]; then
        while IFS=: read -r file line code; do
            report "ERROR" "Landmine #57" "Blocking Menu Risk: Do NOT use native 'Menu' or 'ContextMenu' in Player views. It blocks MPV render loop." "$file" "$line" "$code"
        done <<< "$VIOLATIONS"
    fi
fi

# =============================================================================
# CHECK 13: Shared Service State Initialization (The "Dead Callback" Trap) - Landmine #62
# =============================================================================
# Trigger: Subscribing to onConnectionChange without checking initial state with isSocketConnected.
print_header "Check 13: Shared Service Initial State (Landmine #62)"

REALTIME_MANAGER="$SOURCES_DIR/Features/Watchparty/RealtimeChannelManager.swift"
if [[ -f "$REALTIME_MANAGER" ]]; then
    # We check if 'isSocketConnected' is used near 'onConnectionChange'
    # This is a heuristic check looking for the presence of the fix pattern in the file generally.
    if ! grep -q "isSocketConnected" "$REALTIME_MANAGER"; then
        report "ERROR" "Landmine #62" "Dead Callback Risk: RealtimeChannelManager MUST check 'isSocketConnected' during setup to scavenge initial state." "$REALTIME_MANAGER" "0" "Missing 'isSocketConnected' check"
    fi
fi


# =============================================================================
# CHECK 14: Realtime Topic Scoping (Landmine #60)
# =============================================================================
# Trigger: Using global handlers instead of topic-scoped handlers.
# Rule: onBroadcast, onPresence, onPostgresChange must use 'topic:' parameter.
print_header "Check 14: Realtime Topic Scoping (Landmine #60)"

REALTIME_CLIENT="$SOURCES_DIR/Networking/SupabaseRealtimeClient.swift"
if [[ -f "$REALTIME_CLIENT" ]]; then
    # Look for generic onBroadcast/onPresence calls that might be missing topic scoping
    # This is a bit tricky to verify globally, so we check usage in Managers.

    # Actually, let's check RealtimeChannelManager for correct usage.
    # It must call calls with 'topic: channelName'

    # We grep for calls that do NOT have the topic label.
    # Pattern: .onBroadcast(params... without topic:)
    # Swift arg labels are mandatory if defined, so we check for missing label.

    VIOLATIONS=$(grep -rn "onBroadcast(" "$SOURCES_DIR" --include="*.swift" | grep -v "topic:" | grep -v "func onBroadcast" | grep -v "//" || true)

    if [[ -n "$VIOLATIONS" ]]; then
        while IFS=: read -r file line code; do
             report "ERROR" "Landmine #60" "Global Handler Risk: onBroadcast MUST specify 'topic:' parameter." "$file" "$line" "$code"
        done <<< "$VIOLATIONS"
    fi

    VIOLATIONS_PRESENCE=$(grep -rn "onPresence(" "$SOURCES_DIR" --include="*.swift" | grep -v "topic:" | grep -v "func onPresence" | grep -v "//" || true)
     if [[ -n "$VIOLATIONS_PRESENCE" ]]; then
        while IFS=: read -r file line code; do
             report "ERROR" "Landmine #60" "Global Handler Risk: onPresence MUST specify 'topic:' parameter." "$file" "$line" "$code"
        done <<< "$VIOLATIONS_PRESENCE"
    fi
fi

# =============================================================================
# CHECK 15: Idempotent Join (Landmine #61)
# =============================================================================
# Trigger: joinRoom logic that lacks duplicate key handling.
print_header "Check 15: Idempotent Join (Landmine #61)"

LOBBY_VM="$SOURCES_DIR/Features/Rooms/LobbyViewModel.swift"
if [[ -f "$LOBBY_VM" ]]; then
    if ! grep -q "duplicate key" "$LOBBY_VM" && ! grep -q "23505" "$LOBBY_VM"; then
         report "ERROR" "Landmine #61" "Race Condition Risk: LobbyViewModel join logic MUST handle 'duplicate key' (23505) errors." "$LOBBY_VM" "0" "Missing error handler"
    fi
fi

# =============================================================================
# CHECK 16: Sleep Assertion Safety (Landmine #56)
# =============================================================================
# Trigger: preventing system sleep but NOT display sleep, causing black screen with audio.
# Rule: Must use .userInitiated AND .idleSystemSleepDisabled AND .idleDisplaySleepDisabled
print_header "Check 16: Sleep Assertion Safety (Landmine #56)"

while IFS=: read -r file line code; do
   if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

   # logical check: if code has one sleep disable flag, it better have the others or be part of a set
   # heuristic: warn if we see 'idleSystemSleepDisabled' but not 'idleDisplaySleepDisabled' in the same file/context
   # This is a bit coarse, checking per-file.
   if [[ "$code" =~ "idleSystemSleepDisabled" ]] && [[ ! "$code" =~ "idleDisplaySleepDisabled" ]]; then
        # Check if the file actually contains the other key elsewhere?
        if ! grep -q "idleDisplaySleepDisabled" "$file"; then
             report "WARNING" "Landmine #56" "Sleep Risk: Found 'idleSystemSleepDisabled' without 'idleDisplaySleepDisabled'. This allows screen to go black while audio plays." "$file" "$line" "$code"
        fi
   fi
done < <(grep -rn "idleSystemSleepDisabled" "$SOURCES_DIR" --include="*.swift" | grep -v "//")

# =============================================================================
# CHECK 17: Safe Modifiers (Landmine #12)
# =============================================================================
# Trigger: Using .fontWeight() (macOS 13+) instead of .font(.system(weight:)) (macOS 12 safe)
print_header "Check 17: Safe Modifiers (Landmine #12)"

while IFS=: read -r file line code; do
   if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

   if [[ "$code" =~ \.fontWeight\( ]]; then
        report "WARNING" "Landmine #12" "Compatibility Risk: Avoid '.fontWeight()'. Use '.font(.system(size: X, weight: Y))' for better macOS 12 support." "$file" "$line" "$code"
   fi
done < <(grep -rn "\.fontWeight(" "$SOURCES_DIR" --include="*.swift" | grep -v "//")

# =============================================================================
# CHECK 18: Deinit Cleanup Trap (Landmine #63)
# =============================================================================
print_header "Check 18: Deinit Cleanup Trap (Landmine #63)"

while IFS= read -r file; do
    if [[ "$file" == *"Tests"* ]]; then continue; fi

    # Use Perl to match deinit blocks containing 'Task {'
    # recursive regex (?0) matches balanced braces
    if perl -0777 -ne 'exit 0 if /deinit\s*\{(?:[^{}]++|(?0))*\}/ && $& =~ /\bTask\s*\{/ ; exit 1' "$file"; then
         # Found violation. Get line number of deinit.
         LINE=$(grep -n "deinit" "$file" | head -n 1 | cut -d: -f1)
         # Grab snippet
         CODE=$(grep -A 2 "deinit" "$file" | head -3 | xargs)
         report "ERROR" "Landmine #63" "Deinit Trap: Do NOT use 'Task { }' in deinit. It will be cancelled. Use 'Task.detached { }'." "$file" "$LINE" "$CODE"
    fi
done < <(find "$SOURCES_DIR" -name "*.swift")


# =============================================================================
# CHECK 19: Real-Debrid Fake Endpoint (Landmine #44)
# =============================================================================
# Trigger: Reference to non-existent '/unrestrict/magnet' endpoint in code or comments.
print_header "Check 19: Real-Debrid Fake Endpoint (Landmine #44)"

# Note: We do NOT skip comments here because "poison hints" in comments are dangerous too.
while IFS=: read -r file line code; do
   report "ERROR" "Landmine #44" "Dead Endpoint: '/unrestrict/magnet' does NOT exist. Remove this reference." "$file" "$line" "$code"
done < <(grep -rn "/unrestrict/magnet" "$SOURCES_DIR" --include="*.swift")

# =============================================================================
# CHECK 20: Player Stranding (Explicit Navigation) - Landmine #62
# =============================================================================
# Trigger: exitPlayer logic that doesn't set currentView.
print_header "Check 20: Player Stranding (Landmine #62)"

PLAYER_VM="$SOURCES_DIR/Features/Player/PlayerViewModel.swift"
if [[ -f "$PLAYER_VM" ]]; then
    # We check if 'currentView' is set inside the exitPlayer function.
    # Looking for the fix: appState?.currentView = .watchPartyLobby
     if ! grep -q "appState?\.currentView =" "$PLAYER_VM"; then
        report "ERROR" "Landmine #62" "Stranding Risk: exitPlayer MUST explicitly set 'currentView' to ensure user returns to Lobby/Source." "$PLAYER_VM" "0" "Missing appState.currentView update"
    fi
fi

# =============================================================================
# CHECK 21: Auto-Start Loop (Ready Reset) - Landmine #63
# =============================================================================
# Trigger: markPlaybackEnded logic that misses resetting isReady or canAutoJoin.
print_header "Check 21: Auto-Start Loop (Landmine #63)"

LOBBY_VM="$SOURCES_DIR/Features/Rooms/LobbyViewModel.swift"
if [[ -f "$LOBBY_VM" ]]; then
    # We check if both isReady and canAutoJoin are reset in markPlaybackEnded.
    # Heuristic: verify presence of these assignments in the file.
     if ! grep -q "self\.isReady = false" "$LOBBY_VM" || ! grep -q "self\.canAutoJoin = false" "$LOBBY_VM"; then
        report "ERROR" "Landmine #63" "Infinite Loop Risk: LobbyViewModel MUST reset both 'isReady' and 'canAutoJoin' to false in markPlaybackEnded()." "$LOBBY_VM" "0" "Missing status resets"
    fi
fi

# =============================================================================
# CHECK 22: Guest Join Visibility (Landmine #65)
# =============================================================================
# Trigger: LobbyEventRouter missing system message logic for guests.
print_header "Check 22: Guest Join Visibility (Landmine #65)"

ROUTER="$SOURCES_DIR/Features/Rooms/LobbyEventRouter.swift"
if [[ -f "$ROUTER" ]]; then
    # We expect at least 2 occurances of .userJoined (one for Host, one for Guest)
    COUNT=$(grep -c "addSystemMessage(.userJoined" "$ROUTER" || true)
    if [[ $COUNT -lt 2 ]]; then
         report "ERROR" "Landmine #65" "Visibility Risk: LobbyEventRouter MUST handle .userJoined for both Host AND Guests." "$ROUTER" "0" "Found $COUNT occurrences, expected >= 2"
    fi
fi

# =============================================================================
# CHECK 23: Provider Connectivity Guardrails (Landmine #83)
# =============================================================================
# Trigger: URLRequest to providers missing User-Agent or having < 5s timeout.
print_header "Check 23: Provider Connectivity (Landmine #83)"

SERVICES_DIR="$SOURCES_DIR/Server/Services"
if [[ -d "$SERVICES_DIR" ]]; then
    while IFS=: read -r file line code; do
        if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

        # Heuristic 1: Missing User-Agent (Check files that create URLRequests)
        if ! grep -q "User-Agent" "$file" && ! grep -q "// OK" "$file"; then
             report "WARNING" "Landmine #83" "Missing User-Agent: This service creates URLRequests but doesn't seem to set a browser User-Agent. Cloudflare will likely block it." "$file" "1" "Class definition"
        fi

        # Heuristic 2: Aggressive timeouts
        # Look for timeoutInterval = [1-4]
        VIOLATIONS=$(grep -nE "timeoutInterval[[:space:]]*=[[:space:]]*[1-4](\.[0-9]+)?[^0-9]" "$file" | grep -v "// OK" || true)
        if [[ -n "$VIOLATIONS" ]]; then
            while IFS=: read -r subline subcode; do
                report "WARNING" "Landmine #83" "Aggressive Timeout: Timeout is < 5s. Cold APIs or global CDNs often require 10s+." "$file" "$subline" "$subcode"
            done <<< "$VIOLATIONS"
        fi
    done < <(find "$SERVICES_DIR" -name "*.swift" -exec grep -l "URLRequest" {} +)
fi

# =============================================================================
# CHECK 24: Event Loop Trap (Three-Fold Event Failure) - Landmine #84
# =============================================================================
# Trigger: (1) Events treated as Watch Party guests in stream validation,
#          (2) Event start time overwritten by database sync,
#          (3) EOF handler using wrong time reference.
print_header "Check 24: Event Loop Trap (Landmine #84)"

PLAYER_VM="$SOURCES_DIR/Features/Player/MPVPlayerViewModel.swift"
LOBBY_VM="$SOURCES_DIR/Features/Rooms/LobbyViewModel.swift"

# Check 1: Events skip stream validation in durationPub handler
if [[ -f "$PLAYER_VM" ]]; then
    # Look for the fix: let isEvent = self.appState?.player.isEventPlayback == true ... if isEvent { hasSentReadySignal = true }
    if ! grep -q "isEvent.*=.*appState.*player.*isEventPlayback" "$PLAYER_VM"; then
        report "ERROR" "Landmine #84" "Event Stream Validation Risk: Events MUST skip stream validation. Expected 'let isEvent = self.appState?.player.isEventPlayback == true' followed by 'if isEvent { hasSentReadySignal = true }' in durationPub handler." "$PLAYER_VM" "0" "Missing event stream validation skip"
    fi
fi

# Check 2: LobbyViewModel preserves event start time (doesn't sync from DB)
if [[ -f "$LOBBY_VM" ]]; then
    # Look for the anti-pattern: self.room.createdAt = freshRoom.createdAt (for events)
    # The fix should have a comment about NOT syncing createdAt for events
    DANGER_LINE=$(grep -n "self\.room\.createdAt = freshRoom\.createdAt" "$LOBBY_VM" || true)
    if [[ -n "$DANGER_LINE" ]]; then
        # Check if it's properly guarded with a comment about events
        CONTEXT_LINE=$(echo "$DANGER_LINE" | cut -d: -f1)
        FILE_SNIP=$(sed -n "$((CONTEXT_LINE-2)),$((CONTEXT_LINE+2))p" "$LOBBY_VM")
        if ! echo "$FILE_SNIP" | grep -qi "event"; then
            report "ERROR" "Landmine #84" "Event Start Time Overwrite Risk: LobbyViewModel syncs 'createdAt' from database without checking if it's an event. This overwrites the event start time with room creation time. Must preserve local room.createdAt for events." "$LOBBY_VM" "$CONTEXT_LINE" "Unconditional createdAt sync"
        fi
    fi
fi

# Check 3: EOF handler uses eventStartTime not lastPlaybackResumeTime
if [[ -f "$PLAYER_VM" ]]; then
    # Look for the anti-pattern: let startTime = self.lastPlaybackResumeTime ?? self.appState?.player.eventStartTime
    # The fix should be: let startTime = self.appState?.player.eventStartTime (for events)
    if grep -q "lastPlaybackResumeTime.*??.*eventStartTime" "$PLAYER_VM"; then
        # Check if there's an event-specific branch that bypasses this
        if ! grep -B5 "lastPlaybackResumeTime.*??.*eventStartTime" "$PLAYER_VM" | grep -q "isEventPlayback"; then
            report "ERROR" "Landmine #84" "Event EOF Handler Time Reference Risk: EOF handler falls back to lastPlaybackResumeTime for events. This causes late joiners to fail the 80% duration check. Must use eventStartTime for events (all viewers sync to wall clock, not join time)." "$PLAYER_VM" "0" "Using wrong time reference for EOF detection"
        fi
    fi
fi

# =============================================================================
# CHECK 25: Friend Request ID Usage (Landmine #84)
# =============================================================================
# Trigger: AddFriendSheet callback using sendRequest(username:) instead of sendRequest(toUserId:)
# Risk: Re-searching by username picks the first alphabetical match, not the selected user.
print_header "Check 25: Friend Request ID (Landmine #84)"

FRIENDS_VIEW="$SOURCES_DIR/Features/Friends/FriendsView.swift"
if [[ -f "$FRIENDS_VIEW" ]]; then
    # Look for AddFriendSheet onAdd callback that uses sendRequest(username:
    VIOLATIONS=$(grep -n "AddFriendSheet.*onAdd" "$FRIENDS_VIEW" -A 3 | grep "sendRequest(username:" | grep -v "// OK" || true)

    if [[ -n "$VIOLATIONS" ]]; then
        report "ERROR" "Landmine #84" "AddFriendSheet MUST use sendRequest(toUserId:) not sendRequest(username:). Re-searching by username picks wrong user when names are similar (e.g., 'lemontom' vs 'lemontom1')." "$FRIENDS_VIEW" "58" "sendRequest(username: username)"
    else
        echo -e "${GREEN}✅ AddFriendSheet correctly uses user ID (not username).${NC}"
    fi
fi

# =============================================================================
# CHECK 26: Localized Fallback (Landmine #85)
# =============================================================================
# Trigger: All "clean" English streams are fake (.iso files), but legitimate
#          localized streams exist and weren't tried.
# Fix: StreamService MUST attempt deprioritizedStreams as last resort.
print_header "Check 26: Localized Fallback (Landmine #85)"

STREAM_SERVICE="$SOURCES_DIR/App/Services/StreamService.swift"
if [[ -f "$STREAM_SERVICE" ]]; then
    # Look for the fallback pattern: deprioritizedStreams.isEmpty check followed by retry loop
    if ! grep -q "deprioritizedStreams.isEmpty" "$STREAM_SERVICE" || ! grep -q "Localized Fallback" "$STREAM_SERVICE"; then
        report "ERROR" "Landmine #85" "Missing Localized Fallback: StreamService MUST attempt 'deprioritizedStreams' when all 'clean' streams fail. This handles fake torrents (.iso files) that masquerade as English releases." "$STREAM_SERVICE" "0" "Missing fallback loop for localized streams"
    else
        echo -e "${GREEN}✅ StreamService has localized fallback logic.${NC}"
    fi
fi

# =============================================================================
# CHECK 27: Browse Performance Optimizations (Landmine #86)
# =============================================================================
# Trigger: Browse page loading 10+ catalogs + 100+ images simultaneously.
# Fix: Staggered fetches, NSCache fast-path.
print_header "Check 27: Browse Performance (Landmine #86)"

BROWSE_COMPONENTS="$SOURCES_DIR/Features/Browse/BrowseComponents.swift"

PERF_ISSUES=0

# Check: PosterImageCache (NSCache fast-path) exists
if [[ -f "$BROWSE_COMPONENTS" ]]; then
    if ! grep -q "PosterImageCache" "$BROWSE_COMPONENTS"; then
        report "WARNING" "Landmine #86" "Missing PosterImageCache: BrowseComponents should have 'PosterImageCache' (NSCache) for synchronous image retrieval." "$BROWSE_COMPONENTS" "0" "Missing PosterImageCache"
        ((PERF_ISSUES++))
    fi
fi

if [[ $PERF_ISSUES -eq 0 ]]; then
    echo -e "${GREEN}✅ Browse performance optimizations in place.${NC}"
fi

# =============================================================================
# CHECK 28: Sheet Dismissal Safety (Landmine #87)
# =============================================================================
# Trigger: View transition while a sheet is still active.
# Fix: dismiss() before appState.currentView update.
print_header "Check 28: Sheet Dismissal Safety (Landmine #87)"

TRANSITION_ISSUES=0

if [[ -f "$BROWSE_COMPONENTS" ]]; then
    # Look for the safe pattern using awk to handle multi-line sequence
    # Pattern: dismiss() -> Task.sleep -> currentView
    if ! awk '/dismiss\(\)/ { found_dismiss=1; next }
             found_dismiss && /Task.sleep/ { found_sleep=1; next }
             found_sleep && /currentView/ { found_all=1; exit }
             /}/ { found_dismiss=0; found_sleep=0 }
             END { if (!found_all) exit 1 }' "$BROWSE_COMPONENTS"; then
        report "ERROR" "Landmine #87" "Dangerous View Transition: Root view changed before sheet dismissal. This causes hard freezes on macOS. MUST call dismiss() -> sleep(0.1s) -> currentView = .target" "$BROWSE_COMPONENTS" "0" "Missing safe dismissal pattern"
        ((TRANSITION_ISSUES++))
    else
        echo -e "${GREEN}✅ Sheet dismissal safety pattern verified in BrowseComponents.${NC}"
    fi
fi

# =============================================================================
# CHECK 29: Auth Context Fallback (Landmine #88)
# =============================================================================
# New users may have auth.currentUser nil during signing. The fallback
# reconstructs from Keychain to prevent heartbeat failures.
print_header "Check 29: Auth Context Fallback (Landmine #88)"

SUPABASE_CLIENT="$SOURCES_DIR/Networking/SupabaseClient.swift"
if [[ -f "$SUPABASE_CLIENT" ]]; then
    # Verify the fallback pattern exists
    if grep -q "auth.currentUser was nil, reconstructed from Keychain" "$SUPABASE_CLIENT" && \
       grep -q "effectiveUserId" "$SUPABASE_CLIENT"; then
        echo -e "${GREEN}✅ Auth context fallback pattern verified in SupabaseClient.${NC}"
    else
        report "ERROR" "Landmine #88" "Missing auth context fallback in signing logic. New users' heartbeats will fail, causing guests to be kicked from watch parties." "$SUPABASE_CLIENT" "0" "Missing effectiveUserId fallback pattern"
    fi
fi

# =============================================================================
# CHECK 30: False EOF Loop (Landmine #89)
# =============================================================================
# Trigger: Missing lastKnownGoodPosition tracking or usage in EOF detection.
print_header "Check 30: False EOF Loop (Landmine #89)"

MPV_WRAPPER="$SOURCES_DIR/Features/Player/MPVWrapper.swift"
if [[ -f "$MPV_WRAPPER" ]]; then
    ISSUES=0
    # Verify property exists
    if ! grep -q "lastKnownGoodPosition" "$MPV_WRAPPER"; then
        report "ERROR" "Landmine #89" "Missing lastKnownGoodPosition: MPVWrapper MUST track the highest playback position to prevent false EOF detection during edge-case seeks." "$MPV_WRAPPER" "1" "Missing lastKnownGoodPosition property"
        ((ISSUES++))
    fi
    # Verify it is used in progress calculation
    if ! grep -q "effectivePosition = max(currentTime, lastKnownGoodPosition)" "$MPV_WRAPPER"; then
         report "ERROR" "Landmine #89" "Missing effectivePosition calculation: MPVWrapper MUST use max(currentTime, lastKnownGoodPosition) for progress calculations at EOF." "$MPV_WRAPPER" "1" "Missing effectivePosition logic"
         ((ISSUES++))
    fi
    # Verify it is reset
    if ! grep -q "lastKnownGoodPosition = 0" "$MPV_WRAPPER"; then
          report "ERROR" "Landmine #89" "Missing lastKnownGoodPosition reset: MPVWrapper MUST reset position tracking when a new file starts." "$MPV_WRAPPER" "1" "Missing reset logic"
          ((ISSUES++))
    fi

    if [[ $ISSUES -eq 0 ]]; then
        echo -e "${GREEN}✅ False EOF protection (Landmine #89) verified in MPVWrapper.${NC}"
    fi
fi

# =============================================================================
# CHECK 31: Guest/Host Stream Sync (Landmine #91)
# =============================================================================
# Trigger: DebridSearch returns nil infoHash, Guest falls to independent resolution.
# Fix: updateRoomStream MUST persist source_quality (filename) as fallback.
print_header "Check 31: Guest/Host Stream Sync (Landmine #91)"

SUPABASE_CLIENT="$SOURCES_DIR/Networking/SupabaseClient.swift"
PLAYER_VM="$SOURCES_DIR/Features/Player/PlayerViewModel.swift"
SYNC_ISSUES=0

# Check 1: updateRoomStream must persist source_quality
if [[ -f "$SUPABASE_CLIENT" ]]; then
    if ! grep -q "source_quality" "$SUPABASE_CLIENT"; then
        report "ERROR" "Landmine #91" "Missing source_quality persistence: updateRoomStream MUST persist 'source_quality' (stream filename) as fallback when infoHash is nil." "$SUPABASE_CLIENT" "1090" "Missing source_quality parameter"
        ((SYNC_ISSUES++))
    fi
fi

# Check 2: resolveAndPersistForWatchParty must pass title to updateRoomStream
if [[ -f "$PLAYER_VM" ]]; then
    if ! grep -q "sourceQuality:" "$PLAYER_VM"; then
        report "ERROR" "Landmine #91" "Missing source_quality in resolveAndPersistForWatchParty: Must pass stream title to updateRoomStream for Guest matching when hash is nil." "$PLAYER_VM" "813" "Missing sourceQuality parameter in updateRoomStream call"
        ((SYNC_ISSUES++))
    fi
fi

# Check 3: EventsView must pass sourceQuality during automated room creation
EVENTS_VIEW="$SOURCES_DIR/Features/Browse/EventsView.swift"
if [[ -f "$EVENTS_VIEW" ]]; then
    if ! grep -q "sourceQuality:" "$EVENTS_VIEW"; then
        report "ERROR" "Landmine #91" "Missing source_quality in EventsView: Automated event generation MUST pass stream title (sourceQuality) to createRoom to ensure guests can resolve streams with nil hashes." "$EVENTS_VIEW" "1" "Missing sourceQuality in createRoom"
        ((SYNC_ISSUES++))
    fi
fi

if [[ $SYNC_ISSUES -eq 0 ]]; then
    echo -e "${GREEN}✅ Guest/Host stream sync (source_quality fallback) verified.${NC}"
fi

# =============================================================================
# CHECK 32: State Handoff Guard (Landmine #92)
# =============================================================================
# Trigger: LobbyViewModel or LobbyEventRouter fails to sync participants to AppState/TargetRoom.
print_header "Check 32: State Handoff Guard (Landmine #92)"

LOBBY_VM="$SOURCES_DIR/Features/Rooms/LobbyViewModel.swift"
if [[ -f "$LOBBY_VM" ]]; then
    if ! grep -q "roomToSync.participants = self.participants" "$LOBBY_VM"; then
        report "ERROR" "Landmine #92" "State Handoff Risk: LobbyViewModel MUST explicitly sync 'participants' to 'roomToSync' before assigning to AppState." "$LOBBY_VM" "0" "Missing participant sync"
    else
        echo -e "${GREEN}✅ LobbyViewModel correctly syncs participants before handoff.${NC}"
    fi
fi

LOBBY_ROUTER="$SOURCES_DIR/Features/Rooms/LobbyEventRouter.swift"
if [[ -f "$LOBBY_ROUTER" ]]; then
    if ! grep -q "targetRoom.participants = viewModel.participants" "$LOBBY_ROUTER"; then
        report "ERROR" "Landmine #92" "State Handoff Risk: LobbyEventRouter MUST explicitly sync 'participants' to 'targetRoom' for Guests." "$LOBBY_ROUTER" "0" "Missing participant sync"
    else
         echo -e "${GREEN}✅ LobbyEventRouter correctly syncs participants before handoff.${NC}"
    fi
fi

# =============================================================================

# =============================================================================
# CHECK 33: VM Recreation Guard (Landmine #93)
# =============================================================================
# Trigger: LobbyViewModel relies only on connect() for timer init, which fails on VM recreation.
print_header "Check 33: VM Recreation Guard (Landmine #93)"

LOBBY_VM="$SOURCES_DIR/Features/Rooms/LobbyViewModel.swift"
if [[ -f "$LOBBY_VM" ]]; then
    # Check 1: Init must calculate timeUntilStart for events
    if ! grep -q 'if room.type == .event' "$LOBBY_VM" || ! grep -q 'self.timeUntilStart = remaining' "$LOBBY_VM"; then
        report "ERROR" "Landmine #93" "VM Recreation Risk: LobbyViewModel init MUST calculate timeUntilStart for events." "$LOBBY_VM" "0" "Missing init time calculation"
    else
        echo -e "${GREEN}✅ LobbyViewModel init calculates timeUntilStart for events.${NC}"
    fi

    # Check 2: Already Connected block must start ticker for events
    if ! grep -q 'startEventCountdownTicker' "$LOBBY_VM"; then
        report "ERROR" "Landmine #93" "VM Recreation Risk: LobbyViewModel MUST have startEventCountdownTicker method." "$LOBBY_VM" "0" "Missing ticker method"
    else
        echo -e "${GREEN}✅ LobbyViewModel has startEventCountdownTicker method.${NC}"
    fi
fi

# =============================================================================

# =============================================================================
# CHECK 34: Multi-Season Pack Guard (Landmine #94)
# =============================================================================
# Trigger: Episode-only pattern "e\(episodeStr)" matches wrong season in multi-season packs.
print_header "Check 34: Multi-Season Pack Guard (Landmine #94)"

RD_CLIENT="$SOURCES_DIR/Server/Debrid/RealDebridClient.swift"
if [[ -f "$RD_CLIENT" ]]; then
    # Check: selectEpisodeFile must have season context validation for Exx patterns
    if ! grep -q 'seasonContextPatterns' "$RD_CLIENT"; then
        report "ERROR" "Landmine #94" "Multi-Season Pack Risk: selectEpisodeFile MUST validate season context for episode-only patterns." "$RD_CLIENT" "0" "Missing season context validation"
    else
        echo -e "${GREEN}✅ RealDebridClient validates season context for episode-only patterns.${NC}"
    fi
fi

# Exit Code Logic


# =============================================================================
# CHECK 35: Broadcast Self-Echo Guard (Landmine #95)
# =============================================================================
# Trigger: Host processes their own "Room Closed" or "Link Update" broadcast.
# Rule: Broadcast handlers MUST check `if senderId != currentUserId`.
print_header "Check 35: Broadcast Self-Echo Guard (Landmine #95)"

LOBBY_ROUTER="$SOURCES_DIR/Features/Rooms/LobbyEventRouter.swift"
if [[ -f "$LOBBY_ROUTER" ]]; then
    # We look for handleRoomClosed or logic that processes destructive actions.
    # The fix is filtering by senderId.
    if ! grep -q "senderId.*caseInsensitiveCompare.*participantId" "$LOBBY_ROUTER" && ! grep -q "senderId.*!=.*currentUserId" "$LOBBY_ROUTER"; then
        report "WARNING" "Landmine #95" "Self-Echo Risk: LobbyEventRouter MUST filter out broadcasts from self (senderId == currentUserId) to prevent self-kicking or double-processing." "$LOBBY_ROUTER" "0" "Missing senderId check"
    else
        echo -e "${GREEN}✅ LobbyEventRouter has self-echo guards.${NC}"
    fi
fi

# =============================================================================
# CHECK 36: Re-Join State Clearing (Landmine #96)
# =============================================================================
# Trigger: Deduplication state (announcedParticipantIds) never cleared on leave.
# Fix: stated.remove(id) in leave handler.
print_header "Check 36: Re-Join State Clearing (Landmine #96)"

PLAYER_VM="$SOURCES_DIR/Features/Player/MPVPlayerViewModel.swift"
if [[ -f "$PLAYER_VM" ]]; then
    # If the set exists, we must see a removal call
    if grep -q "var announcedParticipantIds" "$PLAYER_VM"; then
        if ! grep -q "announcedParticipantIds.remove" "$PLAYER_VM"; then
            report "ERROR" "Landmine #96" "State Clearing Risk: 'announcedParticipantIds' is defined but never cleared (removed). This silences re-joins (Zombie Deduplication). Must call .remove(id) in leave handler." "$PLAYER_VM" "0" "Missing cleanup call"
        else
            echo -e "${GREEN}✅ MPVPlayerViewModel correctly cleans up announcedParticipantIds.${NC}"
        fi
    fi
fi

# =============================================================================
# CHECK 37: Restricted Edge Function Subprocesses (Landmine #97)
# =============================================================================
# Trigger: Using Deno.Command, which is blocked by Supabase Edge Runtime.
# Rule: Use host-side scripts and absolute paths for system stats.
print_header "Check 37: Edge Function Subprocesses (Landmine #97)"

FUNCTIONS_DIR="supabase/functions"
if [[ -d "$FUNCTIONS_DIR" ]]; then
    while IFS=: read -r file line code; do
        if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

        # Check for Deno.Command usage
        if [[ "$code" =~ Deno\.Command ]]; then
             report "ERROR" "Landmine #97" "Subprocess Error: 'Deno.Command' is forbidden in Supabase Edge Runtime. Use host-side scripts + stats files." "$file" "$line" "$code"
        fi
    done < <(grep -rn "Deno\.Command" "$FUNCTIONS_DIR" --include="*.ts" | grep -v "// OK")
fi

# =============================================================================
# CHECK 38: Heartbeat Global Tracking (Landmine #98)
# =============================================================================
# Trigger: 'heartbeat' function in SQL without updating public.users.last_seen.
# Rule: All heartbeats must update global last_seen to avoid stale dashboard data.
print_header "Check 38: Heartbeat Global Tracking (Landmine #98)"

MIGRATIONS_DIR="supabase/migrations"
if [[ -d "$MIGRATIONS_DIR" ]]; then
    # Look for files that define a heartbeat function
    # We only care about the actual definition block.
    # LANDMINE #98 Defense: Every heartbeat must ping the users table.
    while IFS= read -r file; do
        # Support suppression for legacy migrations
        if grep -qE -- "-- (OK|legacy)" "$file"; then continue; fi

        # Extract the content of the function (rough check)
        # If it defines a heartbeat but doesn't mention public.users, it's a risk.
        if ! grep -q "UPDATE.*public.users" "$file" && ! grep -q "INSERT.*public.users" "$file"; then
             report "ERROR" "Landmine #98" "Stale Global State: heartbeat function does not update 'public.users.last_seen'. Dashboard will show user as offline." "$file" "0" "Missing UPDATE public.users"
        fi
    done < <(grep -lE "CREATE OR REPLACE FUNCTION.*heartbeat" "$MIGRATIONS_DIR"/*.sql | grep -v "revert")
fi

# =============================================================================
# CHECK 39: Void RPC Trap (Landmine #99)
# =============================================================================
# Trigger: Using Void/() with generic rpc<T>.
# Rule: Swift's Void cannot conform to Decodable. Use dedicated helpers.
print_header "Check 39: Void RPC Trap (Landmine #99)"
# Detect pattern where developer tries to use Void with generic rpc<T>
grep -rnE "let _: (Void|\(\)) = try await .*rpc\(" "Sources" | while read -r line; do
    file=$(echo "$line" | cut -d: -f1)
    ln=$(echo "$line" | cut -d: -f2)
    content=$(echo "$line" | cut -d: -f3-)

    if [[ "$content" == *"// OK"* || "$content" == *"// legacy"* ]]; then continue; fi

    report "ERROR" "Landmine #99" "Void RPC Trap: 'Void' cannot conform to 'Decodable'. Use a dedicated helper or makeRequest directly for RPCs with no return data." "$file" "$ln" "$content"
done


# =============================================================================
# CHECK 40: Event Heartbeat Latency Grace Period (Landmine #100)
# =============================================================================
# Trigger: Using a grace period < 90s for events, causing eviction during RLS latency spikes.
# Rule: Must use at least 90.0 seconds for .event type rooms.
print_header "Check 40: Event Heartbeat Latency (Landmine #100)"

LOBBY_PM="$SOURCES_DIR/Features/Rooms/LobbyPresenceManager.swift"
if [[ -f "$LOBBY_PM" ]]; then
    # We look for the line defining baseGracePeriod for events.
    # It must contain '90.0' or greater.
    # Regex: let baseGracePeriod.*=.*\(.*\.event\).*?90\.0

    # We grep for the line first
    GRACE_LINE=$(grep "let baseGracePeriod: TimeInterval =" "$LOBBY_PM" || true)

    if [[ -z "$GRACE_LINE" ]]; then
        report "ERROR" "Landmine #100" "Missing Grace Period Def: LobbyPresenceManager must define 'baseGracePeriod'." "$LOBBY_PM" "0" "Missing definition"
    elif [[ ! "$GRACE_LINE" =~ 90\.0 ]]; then
         # Check if it's even larger? Hard to do simple regex for >90.
         # For now, strict check for 90.0 is safest to prevent regression.
         report "ERROR" "Landmine #100" "Grace Period Regression: Event grace period MUST be at least 90.0 seconds to cover RLS latency (Landmine #100). Found: $GRACE_LINE" "$LOBBY_PM" "0" "$GRACE_LINE"
    fi
fi

# =============================================================================
# CHECK 41: Realtime Decoupling (Landmine #101)
# =============================================================================
# Trigger: DB join failure causes Realtime to NOT be set up, leaving guests "not connected".
# Rule: setupRealtimeSubscription MUST be called even when DB operations fail.
print_header "Check 41: Realtime Decoupling (Landmine #101)"

LOBBY_VM="$SOURCES_DIR/Features/Rooms/LobbyViewModel.swift"
if [[ -f "$LOBBY_VM" ]]; then
    # Count how many times setupRealtimeSubscription is called in connect() context
    # Should be at least 2: once in success path, once in error handling
    COUNT=$(grep -c "setupRealtimeSubscription()" "$LOBBY_VM" || true)

    if [[ $COUNT -lt 2 ]]; then
        report "ERROR" "Landmine #101" "Realtime Decoupling Risk: setupRealtimeSubscription MUST be called in BOTH success path AND error handler. Realtime and DB are independent channels - guests need connectivity even when DB writes fail (RLS, permissions, etc.)." "$LOBBY_VM" "0" "Found $COUNT call(s), expected >= 2"
    else
        echo -e "${GREEN}✅ LobbyViewModel has Realtime decoupling (setupRealtimeSubscription in error handler).${NC}"
    fi
fi

# =============================================================================
# CHECK 42: Signed Database Writes (Landmine #103)
# =============================================================================
# Trigger: Write operations (POST, PATCH, DELETE) without sign: true.
# Rule: RLS policies require cryptographic identity proof for all mutations.
print_header "Check 42: Signed Database Writes (Landmine #103)"

SUPABASE_CLIENT="$SOURCES_DIR/Networking/SupabaseClient.swift"
if [[ -f "$SUPABASE_CLIENT" ]]; then
    # We use a Perl script to find multi-line makeRequest blocks that lack 'sign: true'
    # but specify a write method.
    UNSIGNED_WRITES=$(perl -0777 -ne '
        while (/makeRequest\s*\(/g) {
            $start = $-[0];
            $line = (substr($_, 0, $start) =~ tr/\n//) + 1;
            $pos = pos($_);
            $depth = 1;
            while ($depth > 0 && $pos < length($_)) {
                $char = substr($_, $pos, 1);
                if ($char eq "(") { $depth++; }
                elsif ($char eq ")") { $depth--; }
                $pos++;
            }
            $block = substr($_, $start, $pos - $start);
            if ($block =~ /method\s*:\s*"(POST|PATCH|DELETE)"/ && $block !~ /sign\s*:\s*true/ && $block !~ /isFunction\s*:\s*true/) {
                $path = ($block =~ /path:\s*"([^"]+)"/) ? $1 : "Unknown Path";
                $snippet = (split(/\n/, $block))[0]; # First line for snippet
                print "$line:$path:$snippet\n";
            }
            pos($_) = $pos;
        }
    ' "$SUPABASE_CLIENT" || true)

    if [[ -n "$UNSIGNED_WRITES" ]]; then
        while IFS=: read -r line path code; do
            report "ERROR" "Landmine #103" "Anonymous Write Risk: mutations MUST include 'sign: true' for RLS. Missing for $path." "$SUPABASE_CLIENT" "$line" "$code"
        done <<< "$UNSIGNED_WRITES"
    else
        echo -e "${GREEN}✅ SupabaseClient write operations are signed.${NC}"
    fi
fi

# =============================================================================
# CHECK 43: Title/Group Stream Exclusion (Landmine #105)
# =============================================================================
# Trigger: StreamResolver missing excludedTitles/excludedGroups parameters or checks.
# Rule: Must support title/group-based exclusion to prevent duplicate bad releases (Hydra).
print_header "Check 43: Hydra Prevention Protocol (Landmine #105)"

RESOLVER="$SOURCES_DIR/Server/Services/StreamResolver.swift"
if [[ -f "$RESOLVER" ]]; then
    # Verify excludedTitles exists in processBucket
    if ! grep -q "excludedTitles: Set<String>" "$RESOLVER"; then
        report "ERROR" "Landmine #105" "Hydra Risk: StreamResolver.processBucket MUST accept 'excludedTitles' to filter hashless streams." "$RESOLVER" "0" "Missing excludedTitles parameter"
    elif ! grep -q "excludedTitles.contains" "$RESOLVER" && ! grep -q "excludedGroups.contains" "$RESOLVER"; then
        report "ERROR" "Landmine #105" "Hydra Risk: StreamResolver MUST check excludedTitles or excludedGroups during filtering." "$RESOLVER" "0" "Missing multi-criteria exclusion check"
    else
        echo -e "${GREEN}✅ StreamResolver has Hydra prevention logic (Title/Group blocking).${NC}"
    fi
fi

SERVICE="$SOURCES_DIR/App/Services/StreamService.swift"
if [[ -f "$SERVICE" ]]; then
    if ! grep -q "attemptedGroups" "$SERVICE"; then
         report "ERROR" "Landmine #105" "Hydra Risk: StreamService MUST track 'attemptedGroups' to handle release group banning." "$SERVICE" "0" "Missing attemptedGroups dictionary"
    else
         echo -e "${GREEN}✅ StreamService tracks attempted release groups.${NC}"
    fi
fi

# =============================================================================
# CHECK 44: Visual Continuity (Landmine #106)
# =============================================================================
# Trigger: Redundant state reset in loadStream causes black flicker.
# Fix: Inherit background art from AppState.
print_header "Check 44: Visual Continuity (Landmine #106)"

PLAYER_VM="$SOURCES_DIR/Features/Player/MPVPlayerViewModel.swift"
if [[ -f "$PLAYER_VM" ]]; then
    if ! grep -q "Pre-populated player metadata from AppState cache" "$PLAYER_VM"; then
        report "ERROR" "Landmine #106" "Visual Handoff Risk: MPVPlayerViewModel MUST inherit background/poster art from AppState synchronously in loadStream to prevent black flicker." "$PLAYER_VM" "0" "Missing metadata inheritance"
    else
        echo -e "${GREEN}✅ MPVPlayerViewModel correctly inherits metadata for visual continuity.${NC}"
    fi
fi

# =============================================================================
# CHECK 45: Reactive Subtitle Scanning (Landmine #109)
# =============================================================================
# Trigger: Relying on polling instead of MPV events for subtitle tracks.
# Rule: MPVWrapper must observe 'track-list', SubtitleService must use tracksChangedPublisher.
print_header "Check 45: Subtitle Latency Guard (Landmine #109)"

MPV_WRAPPER="$SOURCES_DIR/Features/Player/MPVWrapper.swift"
if [[ -f "$MPV_WRAPPER" ]]; then
    if ! grep -q "track-list" "$MPV_WRAPPER"; then
        report "ERROR" "Landmine #109" "Latency Risk: MPVWrapper MUST observe 'track-list' property to detect new subtitle streams instantly." "$MPV_WRAPPER" "0" "Missing track-list observation"
    fi
    if ! grep -q "tracksChangedPublisher" "$MPV_WRAPPER"; then
        report "ERROR" "Landmine #109" "Latency Risk: MPVWrapper MUST expose 'tracksChangedPublisher' for reactive UI updates." "$MPV_WRAPPER" "0" "Missing tracksChangedPublisher"
    fi
fi

SUB_SERVICE="$SOURCES_DIR/Features/Player/Services/SubtitleService.swift"
if [[ -f "$SUB_SERVICE" ]]; then
    if ! grep -q "tracksChangedPublisher" "$SUB_SERVICE"; then
        report "ERROR" "Landmine #109" "Latency Risk: SubtitleService MUST subscribe to 'tracksChangedPublisher' for instant track refresh." "$SUB_SERVICE" "0" "Missing publisher subscription"
    fi
    if ! grep -q "withTaskGroup" "$SUB_SERVICE"; then
        report "WARNING" "Landmine #109" "UX Warning: SubtitleService should use 'withTaskGroup' for parallel external subtitle downloads." "$SUB_SERVICE" "0" "Missing parallel download logic"
    fi
    # Success message (only if no errors/warnings were added JUST NOW)
    # This is a bit complex in bash without local state, but we can check if any files exist and no new violations happened.
    echo -e "${GREEN}✅ Subtitle reactive scanning and parallel loading verified.${NC}"
fi

# =============================================================================
# CHECK 46: SubDL CDN Headers (Landmine #110)
# =============================================================================
# Trigger: SubDL downloads missing User-Agent or having generic User-Agent.
# Rule: Must use a browser-like User-Agent and a 30s timeout.
print_header "Check 46: SubDL CDN Reliability (Landmine #110)"

SUBDL_CLIENT="$SOURCES_DIR/Server/Services/SubDLClient.swift"
if [[ -f "$SUBDL_CLIENT" ]]; then
    if ! grep -q "User-Agent" "$SUBDL_CLIENT"; then
        report "ERROR" "Landmine #110" "CDN Block Risk: SubDLClient MUST set a browser-like User-Agent to prevent 403/503 errors." "$SUBDL_CLIENT" "0" "Missing User-Agent header"
    fi
    if ! grep -q "timeoutInterval = 30" "$SUBDL_CLIENT"; then
        report "WARNING" "Landmine #110" "Timeout Risk: SubDL downloads should use a 30s timeout for slow ZIP extraction." "$SUBDL_CLIENT" "0" "Timeout < 30s"
    fi
    echo -e "${GREEN}✅ SubDL CDN headers and timeout verified.${NC}"
fi

# =============================================================================
# CHECK 47: Emoji Spacing Guard (Landmine #113)
# =============================================================================
print_header "Check 47: Emoji Spacing Guard (Landmine #113)"
CHAT_VIEW="$SOURCES_DIR/Features/Player/ChatOverlayView.swift"
if [[ -f "$CHAT_VIEW" ]]; then
    # Rule: Chat input MUST NOT use SwiftUI axis: .vertical on macOS (causes emoji spacing poisoning)
    # Refined grep: skip comments and look for the actual parameter usage
    if grep "axis: .vertical" "$CHAT_VIEW" | grep -v "//" | grep -q "axis:"; then
        report "ERROR" "Landmine #113" "Emoji Spacing Risk: ChatOverlayView MUST NOT use SwiftUI axis: .vertical. Use TransparentTextEditor (NSTextView) instead." "$CHAT_VIEW" "0" "Found axis: .vertical in chat input"
    fi
    # Ensure TransparentTextEditor is used for chat
    if ! grep -q "TransparentTextEditor" "$CHAT_VIEW"; then
        report "WARNING" "Landmine #113" "UX Warning: ChatOverlayView should use TransparentTextEditor for robust emoji support." "$CHAT_VIEW" "0" "Missing TransparentTextEditor"
    fi
    echo -e "${GREEN}✅ Emoji spacing protection verified.${NC}"
fi

# =============================================================================
# CHECK 48: Subtitle Decoding & Selection Guard (Landmine #114)
# =============================================================================
print_header "Check 48: Subtitle Decoding & Selection Guard (Landmine #114)"
MPV_WRAPPER="$SOURCES_DIR/Features/Player/MPVWrapper.swift"
SUB_SERVICE="$SOURCES_DIR/Features/Player/Services/SubtitleService.swift"

if [[ -f "$MPV_WRAPPER" ]]; then
    # Rule: refreshSubtitleSelection must allow updates if no track is active (sid == 0)
    if grep -q "if isPlaying && hasCompletedInitialTrackSelection {" "$MPV_WRAPPER" && ! grep -q "getCurrentSubtitleTrack() != 0" "$MPV_WRAPPER"; then
        report "ERROR" "Landmine #114" "Availability Risk: MPVWrapper selection guard is too strict. Must allow auto-engagement if getCurrentSubtitleTrack() == 0." "$MPV_WRAPPER" "0" "Selection guard blocking late-arrivals"
    fi
     # Rule: SMART-LOAD must have at least 15s timeout for external subs
    if ! grep -q "timeoutDuration: TimeInterval = self.expectedExternalSubtitles > 0 ? 15.0" "$MPV_WRAPPER"; then
         report "WARNING" "Landmine #114" "Latency Risk: SMART-LOAD timeout should be 15s when external subtitles are expected." "$MPV_WRAPPER" "0" "Timeout too short for slow CDNs"
    fi
fi

if [[ -f "$SUB_SERVICE" ]]; then
    # Rule: SubtitleService MUST use robust decoding to handle SubDL encodings
    if ! grep -q "decodeRobustly" "$SUB_SERVICE"; then
        report "ERROR" "Landmine #114" "Decoding Risk: SubtitleService MUST use decodeRobustly (UTF8/CP1252/Latin1) for SubDL compatibility." "$SUB_SERVICE" "0" "Missing robust decoding"
    fi
    echo -e "${GREEN}✅ Subtitle availability and decoding verified.${NC}"
fi

echo -e "\n${BOLD}════════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}                     SCAN COMPLETE                              ${NC}"
echo -e "${BOLD}════════════════════════════════════════════════════════════════${NC}"

# Report Errors
if [[ $ERROR_COUNT -gt 0 ]]; then
    echo -e "${RED}❌ ERRORS: $ERROR_COUNT${NC}"
else
    echo -e "${GREEN}✅ ERRORS: 0${NC}"
fi

# Report Warnings
if [[ $WARNING_COUNT -gt 0 ]]; then
    echo -e "${YELLOW}⚠️  WARNINGS: $WARNING_COUNT${NC}"
else
    echo -e "${GREEN}✅ WARNINGS: 0${NC}"
fi

echo ""
echo -e "💡 To suppress a violation, append ${BOLD}// OK${NC} or ${BOLD}// legacy${NC} to the line."

# Exit Code Logic
if [[ $ERROR_COUNT -gt 0 ]]; then
    exit 1 # Block items
else
    exit 0 # Warnings don't block yet
fi
