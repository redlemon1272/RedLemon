#!/bin/bash

# Make this script executable
chmod +x "$0"

# Log Cleanup Script
# This script finds and deletes all log files in the RedLemon project

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== RedLemon Log Cleanup Script ===${NC}"
echo

# Find all log files
echo -e "${YELLOW}Scanning for log files...${NC}"

# Find log files in current directory and subdirectories
log_files=()
while IFS= read -r -d '' file; do
    log_files+=("$file")
done < <(find . -name "*.log" -type f -print0)

# Count files and calculate total size
file_count=${#log_files[@]}
total_size=0

if [ $file_count -eq 0 ]; then
    echo -e "${GREEN}No log files found. Nothing to clean up!${NC}"
    exit 0
fi

# Calculate total size
for file in "${log_files[@]}"; do
    if [ -f "$file" ]; then
        size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null || echo 0)
        total_size=$((total_size + size))
    fi
done

# Convert size to human readable format
human_size() {
    local size=$1
    if [ $size -lt 1024 ]; then
        echo "${size}B"
    elif [ $size -lt 1048576 ]; then
        echo "$(( size / 1024 ))K"
    elif [ $size -lt 1073741824 ]; then
        echo "$(( size / 1048576 ))M"
    else
        echo "$(( size / 1073741824 ))G"
    fi
}

total_size_hr=$(human_size $total_size)

echo -e "${BLUE}Found ${file_count} log files using ${total_size_hr} of space:${NC}"
echo

# Display the files to be deleted
for file in "${log_files[@]}"; do
    if [ -f "$file" ]; then
        size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null || echo 0)
        size_hr=$(human_size $size)
        echo -e "  ${YELLOW}•${NC} $file (${size_hr})"
    fi
done

echo
echo -e "${RED}WARNING: This will permanently delete all log files!${NC}"
echo -e "${RED}Make sure you don't need any of these logs before proceeding.${NC}"
echo

# Ask for confirmation
read -p "Are you sure you want to delete all $file_count log files? (y/N): " -n 1 -r
echo
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Deleting log files...${NC}"

    deleted_count=0
    deleted_size=0

    # Delete files
    for file in "${log_files[@]}"; do
        if [ -f "$file" ]; then
            size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null || echo 0)
            if rm "$file" 2>/dev/null; then
                echo -e "  ${GREEN}✓${NC} Deleted: $file"
                deleted_count=$((deleted_count + 1))
                deleted_size=$((deleted_size + size))
            else
                echo -e "  ${RED}✗${NC} Failed to delete: $file"
            fi
        fi
    done

    deleted_size_hr=$(human_size $deleted_size)
    echo
    echo -e "${GREEN}=== Cleanup Complete ===${NC}"
    echo -e "${GREEN}Successfully deleted $deleted_count log files${NC}"
    echo -e "${GREEN}Freed up ${deleted_size_hr} of disk space${NC}"

else
    echo -e "${BLUE}Cleanup cancelled. No files were deleted.${NC}"
fi
