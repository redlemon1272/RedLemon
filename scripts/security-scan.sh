#!/bin/bash

# =============================================================================
# RedLemon Security Scanner
# =============================================================================
# A static analysis script to catch common security vulnerabilities in Swift code.
# Run this after builds or before releases to identify potential security issues.
# Inspired by "Is Vibe Coding Safe?" (ArXiv:2512.03262) finding 80% AI vulnerability rate.
#
# Usage: ./scripts/security-scan.sh [--strict]
#   --strict: Exit with error code if ANY issues found (not just critical)
#
# Exit codes:
#   0: No issues found
#   1: Critical issues found
#   2: Warnings found (only with --strict)
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Counters
CRITICAL_COUNT=0
WARNING_COUNT=0
INFO_COUNT=0

# Parse arguments
STRICT_MODE=false
if [[ "$1" == "--strict" ]]; then
    STRICT_MODE=true
fi

# Initialize
SOURCES_DIR="Sources"
if [[ ! -d "$SOURCES_DIR" ]]; then
    echo -e "${RED}❌ Sources directory not found. Run from project root.${NC}"
    exit 1
fi

echo -e "${BLUE}${BOLD}"
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║              🔍 RedLemon Security Scanner                      ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo "Scanning: $(pwd)/$SOURCES_DIR"
echo "Mode: $([ "$STRICT_MODE" = true ] && echo "STRICT" || echo "Normal")"
echo ""

# -----------------------------------------------------------------------------
# Helper function to report issues
# -----------------------------------------------------------------------------
report_issue() {
    local severity=$1  # CRITICAL, WARNING, INFO
    local message=$2
    local file=$3
    local line=$4
    local code=$5
    
    # Check for suppression (comments in the code line)
    if [[ "$code" == *"// OK"* ]] || [[ "$code" == *"// legacy"* ]] || [[ "$code" == *"// ignore"* ]]; then
        return
    fi
    
    case $severity in
        CRITICAL)
            echo -e "${RED}❌ CRITICAL:${NC} $message"
            ((CRITICAL_COUNT++))
            ;;
        WARNING)
            echo -e "${YELLOW}⚠️  WARNING:${NC} $message"
            ((WARNING_COUNT++))
            ;;
        INFO)
            echo -e "${BLUE}ℹ️  INFO:${NC} $message"
            ((INFO_COUNT++))
            ;;
    esac
    
    if [[ -n "$file" ]]; then
        echo -e "   ${BOLD}→ $file${NC}${line:+:$line}"
    fi
    if [[ -n "$code" ]]; then
        echo -e "   ${BLUE}$code${NC}"
    fi
    echo ""
}

# -----------------------------------------------------------------------------
# Check 1: Hardcoded Secrets
# Look for patterns that suggest hardcoded API keys, tokens, passwords
# -----------------------------------------------------------------------------
echo -e "${BOLD}[1/19] Checking for hardcoded secrets...${NC}"

# API keys (common patterns)
while IFS=: read -r file line content; do
    # Skip test files and comments
    if [[ "$file" == *"Test"* ]] || [[ "$content" == *"//"* && "$content" != *"="* ]]; then
        continue
    fi
    report_issue "CRITICAL" "Possible hardcoded API key" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E '(api[_-]?key|apiKey|API_KEY)\s*[:=]\s*"[^"]{10,}"' "$SOURCES_DIR" 2>/dev/null || true)

# Bearer tokens
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "CRITICAL" "Hardcoded Bearer token" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E 'Bearer\s+[A-Za-z0-9_-]{20,}' "$SOURCES_DIR" 2>/dev/null || true)

# Private keys (sk-, pk-, etc)
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]] || [[ "$content" == *"example"* ]] || [[ "$content" == *"placeholder"* ]]; then continue; fi
    report_issue "CRITICAL" "Possible hardcoded private key" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E '"(sk|pk|secret|private)[_-][A-Za-z0-9]{16,}"' "$SOURCES_DIR" 2>/dev/null || true)

# Password assignments (but not password fields or prompts)
while IFS=: read -r file line content; do
    # Skip UI-related password references and prompts
    if [[ "$content" == *"TextField"* ]] || [[ "$content" == *"placeholder"* ]] || [[ "$content" == *"label"* ]] || [[ "$content" == *"Password:"* ]]; then
        continue
    fi
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "WARNING" "Possible hardcoded password" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E 'password\s*=\s*"[^"]{4,}"' "$SOURCES_DIR" 2>/dev/null | grep -v "SecureField" | grep -v "isSecure" || true)

# -----------------------------------------------------------------------------
# Check 2: Insecure Logging (AI Bible Landmine #11)
# NSLog without format specifier can crash if string contains %
# -----------------------------------------------------------------------------
echo -e "${BOLD}[2/19] Checking for insecure logging (Landmine #11)...${NC}"

# Logging sensitive keywords
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "WARNING" "Potentially logging sensitive data" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -e 'print.*password' -e 'print.*token' -e 'print.*secret' -e 'NSLog.*password' -e 'NSLog.*token' "$SOURCES_DIR" 2>/dev/null | grep -v "REDACTED" | grep -v "\\*\\*\\*\\*" || true)

# -----------------------------------------------------------------------------
# Check 3: HTTP URLs (should be HTTPS except localhost)
# -----------------------------------------------------------------------------
echo -e "${BOLD}[3/19] Checking for insecure HTTP URLs...${NC}"

while IFS=: read -r file line content; do
    # Skip localhost, 127.0.0.1, and test files
    if [[ "$content" == *"localhost"* ]] || [[ "$content" == *"127.0.0.1"* ]] || [[ "$file" == *"Test"* ]]; then
        continue
    fi
    # Skip comments
    if [[ "$content" =~ ^[[:space:]]*//.* ]]; then
        continue
    fi
    report_issue "WARNING" "Insecure HTTP URL (should be HTTPS)" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" 'http://' "$SOURCES_DIR" 2>/dev/null | grep -v "https://" || true)

# -----------------------------------------------------------------------------
# Check 4: UserDefaults for Sensitive Data
# Sensitive data should use Keychain, not UserDefaults
# -----------------------------------------------------------------------------
echo -e "${BOLD}[4/19] Checking for sensitive data in UserDefaults...${NC}"

while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "CRITICAL" "Storing sensitive data in UserDefaults (use Keychain)" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E 'UserDefaults.*\b(token|password|secret|apiKey|credentials|privateKey)\b' "$SOURCES_DIR" 2>/dev/null || true)

# -----------------------------------------------------------------------------
# Check 5: Disabled SSL/TLS Validation
# -----------------------------------------------------------------------------
echo -e "${BOLD}[5/19] Checking for disabled SSL validation...${NC}"

while IFS=: read -r file line content; do
    report_issue "CRITICAL" "Potentially disabled SSL validation" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E '(allowsExpiredSSLCertificates|allowsAnyHTTPSCertificate|validatesDomainName\s*=\s*false|NSAllowsArbitraryLoads)' "$SOURCES_DIR" 2>/dev/null || true)

# URLSession delegate that might bypass validation
while IFS=: read -r file line content; do
    report_issue "WARNING" "URLSession auth challenge handler - verify it validates certificates" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" 'urlSession.*didReceive.*challenge' "$SOURCES_DIR" 2>/dev/null || true)

# -----------------------------------------------------------------------------
# Check 6: SQL Injection Risks
# Look for string interpolation in SQL queries
# -----------------------------------------------------------------------------
echo -e "${BOLD}[6/19] Checking for SQL injection patterns...${NC}"

while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "WARNING" "Possible SQL injection - use parameterized queries" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E '(SELECT|INSERT|UPDATE|DELETE|WHERE).*\\(' "$SOURCES_DIR" 2>/dev/null || true)

# -----------------------------------------------------------------------------
# Check 7: Keychain Access Level
# Check for proper keychain accessibility settings
# -----------------------------------------------------------------------------
echo -e "${BOLD}[7/19] Checking Keychain access patterns...${NC}"

# Look for keychain usage without proper accessibility
KEYCHAIN_USES=$(grep -rn --include="*.swift" 'SecItemAdd\|SecItemUpdate\|kSecAttr' "$SOURCES_DIR" 2>/dev/null | wc -l)
KEYCHAIN_ACCESSIBLE=$(grep -rn --include="*.swift" 'kSecAttrAccessible' "$SOURCES_DIR" 2>/dev/null | wc -l)

if [[ $KEYCHAIN_USES -gt 0 && $KEYCHAIN_ACCESSIBLE -eq 0 ]]; then
    report_issue "INFO" "Keychain used but kSecAttrAccessible not found - verify accessibility settings" "" "" ""
fi

# Check for kSecAttrAccessibleAlways (insecure)
while IFS=: read -r file line content; do
    report_issue "WARNING" "Using kSecAttrAccessibleAlways - data accessible when device locked" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" 'kSecAttrAccessibleAlways[^U]' "$SOURCES_DIR" 2>/dev/null || true)

# -----------------------------------------------------------------------------
# Check 8: Force Unwrapping in Critical Code
# Excessive ! in auth/payment code can cause crashes
# -----------------------------------------------------------------------------
echo -e "${BOLD}[8/19] Checking for risky force unwrapping in auth code...${NC}"

# Find files with auth/payment in name and check for excessive force unwraps
for pattern in "Auth" "Payment" "Keychain" "Token" "Credential"; do
    for file in $(find "$SOURCES_DIR" -name "*${pattern}*.swift" -type f 2>/dev/null); do
        # Count force unwraps - warn if many in security-critical files
        FU_COUNT=$(grep -c '!' "$file" 2>/dev/null || echo "0")
        FU_COUNT=$(echo "$FU_COUNT" | tr -d '[:space:]')
        if [[ "$FU_COUNT" =~ ^[0-9]+$ ]] && [[ $FU_COUNT -gt 20 ]]; then
            report_issue "INFO" "High force-unwrap count ($FU_COUNT) in security-critical file" "$file" "" ""
        fi
    done
done

# -----------------------------------------------------------------------------
# Check 9: Cryptographic Issues
# Weak algorithms, predictable random, etc.
# -----------------------------------------------------------------------------
echo -e "${BOLD}[9/19] Checking for cryptographic issues...${NC}"

# Weak hash algorithms
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "WARNING" "Using MD5/SHA1 - consider SHA256 or stronger" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -E '\b(MD5|SHA1)\b' "$SOURCES_DIR" 2>/dev/null | grep -v "// OK" || true)

# arc4random without bounds (okay, but check for random key generation)
while IFS=: read -r file line content; do
    if [[ "$content" == *"key"* ]] || [[ "$content" == *"token"* ]] || [[ "$content" == *"secret"* ]]; then
        report_issue "WARNING" "Using arc4random for security-critical value - use SecRandomCopyBytes" "$file" "$line" "$content"
    fi
done < <(grep -rn --include="*.swift" 'arc4random' "$SOURCES_DIR" 2>/dev/null || true)

# -----------------------------------------------------------------------------
# Check 10: Input Validation
# Look for URL creation from user input without validation
# -----------------------------------------------------------------------------
echo -e "${BOLD}[10/19] Checking for input validation issues...${NC}"

# URL from string without validation
while IFS=: read -r file line content; do
    # Skip static URLs and test files
    if [[ "$content" == *'"http'* ]] || [[ "$file" == *"Test"* ]]; then
        continue
    fi
    # Only warn if it looks like dynamic URL construction
    if [[ "$content" == *'URL(string:'* ]] && [[ "$content" == *'\('* ]]; then
        report_issue "INFO" "Dynamic URL construction - ensure input is validated" "$file" "$line" "$content"
    fi
done < <(grep -rn --include="*.swift" 'URL(string:' "$SOURCES_DIR" 2>/dev/null | head -10 || true)

# -----------------------------------------------------------------------------
# Check 11: Path Traversal
# Look for file operations that could be exploited with ../
# -----------------------------------------------------------------------------
echo -e "${BOLD}[11/19] Checking for path traversal risks...${NC}"

# File operations with string interpolation (potential path traversal)
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    # Check if it's using interpolated paths
    if [[ "$content" == *'\('* ]]; then
        report_issue "WARNING" "Dynamic file path - ensure user input is sanitized for path traversal" "$file" "$line" "$content"
    fi
done < <(grep -rn --include="*.swift" -e 'FileManager.*contentsOfDirectory' -e 'FileManager.*createFile' -e 'Data(contentsOf:' "$SOURCES_DIR" 2>/dev/null | grep -F '(' | head -5 || true)

# Check for path operations that don't sanitize
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "INFO" "File write operation - verify path is sanitized" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -e 'write(to:' -e 'write(toFile:' "$SOURCES_DIR" 2>/dev/null | grep -F '(' | head -3 || true)

# -----------------------------------------------------------------------------
# Check 12: Command Injection
# Look for Process/shell commands with user input
# -----------------------------------------------------------------------------
echo -e "${BOLD}[12/19] Checking for command injection risks...${NC}"

# Process with arguments from variables
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "WARNING" "Process execution - ensure arguments are sanitized" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" 'Process()' "$SOURCES_DIR" 2>/dev/null | head -5 || true)

# Shell command execution
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "CRITICAL" "Shell command execution - HIGH RISK for command injection" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -e 'shell(' -e '/bin/sh' -e '/bin/bash' -e 'NSTask' "$SOURCES_DIR" 2>/dev/null || true)

# -----------------------------------------------------------------------------
# Check 13: Debug Code in Production
# Look for debug-only code that shouldn't be in release
# -----------------------------------------------------------------------------
echo -e "${BOLD}[13/19] Checking for debug code patterns...${NC}"

# Debug print statements (common debug patterns)
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "INFO" "Debug print statement - consider removing for release" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -e 'print("DEBUG' -e 'print("TODO' -e 'print("FIXME' -e 'debugPrint(' "$SOURCES_DIR" 2>/dev/null | head -5 || true)

# Hardcoded test credentials
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "CRITICAL" "Possible test/debug credentials" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -e 'test@' -e 'testuser' -e 'testpassword' -e 'admin123' -e 'password123' "$SOURCES_DIR" 2>/dev/null | grep -v "// test" || true)

# -----------------------------------------------------------------------------
# Check 14: Force Try in Security-Critical Code
# try! can crash the app if an error occurs
# -----------------------------------------------------------------------------
echo -e "${BOLD}[14/19] Checking for try! in security code...${NC}"

# Find try! in files with security-related names
for file in $(find "$SOURCES_DIR" -name "*.swift" -type f \( -name "*Auth*" -o -name "*Token*" -o -name "*Key*" -o -name "*Credential*" -o -name "*Payment*" -o -name "*Supabase*" \) 2>/dev/null); do
    while IFS=: read -r line_num content; do
        report_issue "WARNING" "try! in security-critical file - consider proper error handling" "$file" "$line_num" "$content"
    done < <(grep -n 'try!' "$file" 2>/dev/null | head -3 || true)
done

# -----------------------------------------------------------------------------
# Check 15: Deep Link / URL Scheme Handling
# Ensure URL schemes validate input
# -----------------------------------------------------------------------------
echo -e "${BOLD}[15/19] Checking for deep link handling...${NC}"

# URL scheme handlers
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "INFO" "URL scheme handler - ensure deep link input is validated" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -e 'openURL' -e 'handleOpen' -e 'application.*open.*url' "$SOURCES_DIR" 2>/dev/null | head -3 || true)

# -----------------------------------------------------------------------------
# Check 16: Temporary File Security
# Temp files with sensitive data
# -----------------------------------------------------------------------------
echo -e "${BOLD}[16/19] Checking for temporary file security...${NC}"

# Writing to /tmp or temporary directories
while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "WARNING" "Writing to temp directory - ensure sensitive data is cleaned up" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" -e 'NSTemporaryDirectory' -e '"/tmp/' -e 'temporaryDirectory' "$SOURCES_DIR" 2>/dev/null | head -5 || true)

# -----------------------------------------------------------------------------
# Check 17: Timing Side-Channel Risks (Paper Finding)
# Look for early returns in authentication code
# -----------------------------------------------------------------------------
echo -e "${BOLD}[17/19] Checking for timing side-channel risks...${NC}"

# Find likely auth functions with early returns
# Note: Complex to do purely in bash, looking for simple patterns
while IFS= read -r file; do
    if [[ -f "$file" ]]; then
        grep -n "return" "$file" | while read -r line; do
            if [[ "$line" == *"if "* ]] && [[ "$line" == *"return false"* ]]; then
                 report_issue "INFO" "Potential timing side-channel (early return in auth)" "$file" "" "$line"
            fi
        done
    fi
done < <(find "$SOURCES_DIR" -type f \( -name "*Auth*.swift" -o -name "*Login*.swift" -o -name "*Verify*.swift" \) 2>/dev/null)

# -----------------------------------------------------------------------------
# Check 18: Insecure Deserialization
# NSKeyedUnarchiver without secure coding
# -----------------------------------------------------------------------------
echo -e "${BOLD}[18/19] Checking for insecure deserialization...${NC}"

while IFS=: read -r file line content; do
    if [[ "$file" == *"Test"* ]]; then continue; fi
    report_issue "CRITICAL" "NSKeyedUnarchiver without secure coding - use unarchivedObject(ofClass:from:)" "$file" "$line" "$content"
done < <(grep -rn --include="*.swift" 'unarchiveObject(with:' "$SOURCES_DIR" 2>/dev/null || true)
# -----------------------------------------------------------------------------
# Check 19: Internal Protocol Leakage
# Look for "Landmine #" mentions in public-facing files
# -----------------------------------------------------------------------------
echo -e "${BOLD}[19/19] Checking for internal landmine leaks...${NC}"

PUBLIC_FILES=("appcast.xml" "README.md" "CHANGELOG.md" "SECURITY.md" "INSTALL.md")
for pfile in "${PUBLIC_FILES[@]}"; do
    if [[ -f "$pfile" ]]; then
        while IFS=: read -r line content; do
            report_issue "WARNING" "Internal 'Landmine' reference leaked in public file" "$pfile" "$line" "$content"
        done < <(grep -n "Landmine #" "$pfile" 2>/dev/null || true)
    fi
done

# =============================================================================
# Summary
# =============================================================================
echo ""
echo -e "${BOLD}════════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}                        SCAN COMPLETE                           ${NC}"
echo -e "${BOLD}════════════════════════════════════════════════════════════════${NC}"
echo ""

if [[ $CRITICAL_COUNT -gt 0 ]]; then
    echo -e "${RED}❌ Critical Issues: $CRITICAL_COUNT${NC}"
else
    echo -e "${GREEN}✅ Critical Issues: 0${NC}"
fi

if [[ $WARNING_COUNT -gt 0 ]]; then
    echo -e "${YELLOW}⚠️  Warnings: $WARNING_COUNT${NC}"
else
    echo -e "${GREEN}✅ Warnings: 0${NC}"
fi

if [[ $INFO_COUNT -gt 0 ]]; then
    echo -e "${BLUE}ℹ️  Info: $INFO_COUNT${NC}"
else
    echo -e "${GREEN}✅ Info: 0${NC}"
fi

echo ""

# Exit with appropriate code
if [[ $CRITICAL_COUNT -gt 0 ]]; then
    echo -e "${RED}${BOLD}⛔ FAILED: Critical security issues found!${NC}"
    echo "   Please fix critical issues before release."
    exit 1
elif [[ $WARNING_COUNT -gt 0 && "$STRICT_MODE" = true ]]; then
    echo -e "${YELLOW}${BOLD}⚠️  STRICT MODE: Warnings found${NC}"
    echo "   Run without --strict to allow warnings."
    exit 2
else
    echo -e "${GREEN}${BOLD}✅ PASSED: No blocking security issues found.${NC}"
    exit 0
fi
