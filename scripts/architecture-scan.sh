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
# CHECK 13: Event Chat Thrashing (Landmine #58)
# =============================================================================
# Direct appending of chat messages blocks the main thread.
print_header "Check 13: Event Chat Thrashing (Landmine #58)"

MPV_VM="$SOURCES_DIR/Features/Player/MPVPlayerViewModel.swift"
if [[ -f "$MPV_VM" ]]; then
    # Look for singular 'messages.append(' NOT followed by 'contentsOf' or 'pending'
    # Use grep to find all appends to 'messages'
    VIOLATIONS=$(grep -n "messages.append(" "$MPV_VM" | grep -v "contentsOf" | grep -v "pending" | grep -v "//" || true)

    if [[ -n "$VIOLATIONS" ]]; then
        while IFS=: read -r line code; do
            report "ERROR" "Landmine #58" "Chat Thrashing Risk: Do NOT append single messages to UI. Use a batched 'pending' array and flush with 'append(contentsOf:)'." "$MPV_VM" "$line" "$code"
        done <<< "$VIOLATIONS"
    fi
fi


# =============================================================================
# SUMMARY
# =============================================================================
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
