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
# CHECK 7: Realtime Presence IDs (Landmine #47)
# =============================================================================
# Metadata 'phx_ref' is not the authoritative session ID. The passed Map Key is.
print_header "Check 7: Realtime Presence IDs (Landmine #47)"

while IFS=: read -r file line code; do
    if [[ "$code" =~ ^[[:space:]]*// ]]; then continue; fi

    # If code is manually extracting phx_ref from metadata (legacy/buggy pattern)
    if [[ "$code" =~ metadata\?\[\"phx_ref\"\] ]]; then
         report "WARNING" "Landmine #47" "Authoritative Session ID is the Map Key (passed as userId). Avoid using metadata['phx_ref']." "$file" "$line" "$code"
    fi
done < <(grep -rn "metadata?\[\"phx_ref\"\]" "$SOURCES_DIR" --include="*.swift" | grep -v "//")

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
