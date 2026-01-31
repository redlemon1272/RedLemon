#!/bin/bash
# install_hooks.sh
# Installs a "Safety Net" pre-commit hook into the PUBLIC repository.
# This makes it impossible to commit restricted keywords even if an AI or Human tries to.

PUBLIC_REPO="../RedLemon-Public"
HOOK_DIR="$PUBLIC_REPO/.git/hooks"
PRE_COMMIT="$HOOK_DIR/pre-commit"

if [ ! -d "$PUBLIC_REPO/.git" ]; then
    echo "❌ Error: Public repo git directory not found at $PUBLIC_REPO/.git"
    exit 1
fi

echo "🛡️ Installing Iron-Clad Security Hook into $PUBLIC_REPO..."

mkdir -p "$HOOK_DIR"

cat > "$PRE_COMMIT" << 'EOF'
#!/bin/bash
# 🛑 REDLEMON SECURITY HOOK
# Block commits containing sensitive keywords or files.

RED='\033[0;31m'
NC='\033[0m'

# 1. Undesirable Filenames
FORBIDDEN_FILES="(AI_BIBLE|SelfHosted_Manual|REDDIT_LAUNCH_PLAN|guestconsolelog)"
if git diff --cached --name-only | grep -E "$FORBIDDEN_FILES"; then
    echo -e "${RED}🛑 SECURITY BLOCK: Attempting to commit internal documentation!${NC}"
    echo "Files matched: $FORBIDDEN_FILES"
    exit 1
fi

# 2. Content Scans (Grepping staged changes)
# We look for: IP Address, XPRV keys, "AI BIBLE" phrases, and the specific Mnemonic start
SERVER_IP="151\.243\.109\.243"
MNEMONIC_START="motion stand mad"
PAT_PATTERN="github_pat_"

# Get list of files being committed
FILES=$(git diff --cached --name-only)

ERROR=0

for FILE in $FILES; do
    # Skip deleting files
    if [ ! -f "$FILE" ]; then continue; fi
    
    # Scan for IP
    if grep -qE "$SERVER_IP" "$FILE"; then
         if [[ "$FILE" != *"install.sh"* ]]; then
            echo -e "${RED}🛑 SECURITY BLOCK: Found Production IP in $FILE${NC}"
            ERROR=1
         fi
    fi

    # Scan for XPRV
    if grep -q "xprv" "$FILE"; then
        echo -e "${RED}🛑 SECURITY BLOCK: Found Extended Private Key (xprv) in $FILE${NC}"
        ERROR=1
    fi

    # Scan for Database Passwords (heuristic)
    if grep -q "uzCXxI6gs7I6tRXMCKJdCzh8" "$FILE"; then
        echo -e "${RED}🛑 SECURITY BLOCK: Found DB Password in $FILE${NC}"
        ERROR=1
    fi

    # Scan for Mnemonic
    if grep -q "$MNEMONIC_START" "$FILE"; then
        echo -e "${RED}🛑 SECURITY BLOCK: Found Production Mnemonic in $FILE${NC}"
        ERROR=1
    fi

    # Scan for "AI_BIBLE" mentions (Internal Jargon)
    if grep -iEq "AI_BIBLE|AI Bible|Landmine #" "$FILE"; then
        echo -e "${RED}🛑 SECURITY BLOCK: Found Internal Jargon (AI Bible/Landmine) in $FILE${NC}"
        ERROR=1
    fi
    
    # Scan for PAT
    if grep -q "$PAT_PATTERN" "$FILE"; then
        echo -e "${RED}🛑 SECURITY BLOCK: Found GitHub PAT in $FILE${NC}"
        ERROR=1
    fi
done

if [ $ERROR -eq 1 ]; then
    echo -e "${RED}❌ Commit rejected by RedLemon Security Protocol.${NC}"
    exit 1
fi

exit 0
EOF

chmod +x "$PRE_COMMIT"

echo "✅ Hook Installed at $PRE_COMMIT"
echo "   - Blocks filenames: AI_BIBLE, SelfHosted_Manual"
echo "   - Blocks content: Server IP, xprv, DB Pass, Mnemonic, 'AI Bible', GitHub PATs"
