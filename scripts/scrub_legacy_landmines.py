import re
import sys

def scrub_landmines(content):
    # Pattern to match variations of (Landmine #XX) or Landmine #XX
    # Handles parentheses, spaces, and multiple digits
    patterns = [
        r'\s*\(Landmine\s*#\d+\)',
        r'\s*Landmine\s*#\d+\s*',
        r'\s*\(Landmine\s*#\d+\s*and\s*#\d+\)',
        r'\s*\(Landmine\s*#\d+ check\)',
        r'\s*\(Landmine\s*#\d+ Main Thread Block\)'
    ]
    
    scrubbed = content
    for p in patterns:
        scrubbed = re.sub(p, '', scrubbed, flags=re.IGNORECASE)
    
    return scrubbed

def main():
    file_path = 'appcast.xml'
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    new_content = scrub_landmines(content)
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print(f"Scrubbed Landmine references from {file_path}")

if __name__ == "__main__":
    main()
