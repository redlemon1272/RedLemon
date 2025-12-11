
import sys

def check_braces(filename):
    try:
        with open(filename, 'r') as f:
            lines = f.readlines()
    except Exception as e:
        print(f"Error reading file: {e}")
        return

    level = 0
    class_started = False
    
    for i, line in enumerate(lines):
        # Naive brace counting (ignores comments/strings for simplicity, but usually sufficient for swift if code is formatted)
        # To be more robust, we should strip comments/strings.
        
        # Strip simple comments
        clean_line = line.split('//')[0]
        
        for char in clean_line:
            if char == '{':
                level += 1
                if not class_started and 'class LobbyViewModel' in line:
                    class_started = True
                    print(f"Class started at line {i+1}, level is {level}")
            elif char == '}':
                level -= 1
        
        if 'func ' in line:
            print(f"Function definition at line {i+1}: '{line.strip()}' at Level {level}")

    print(f"Final level: {level}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 check_braces.py <filename>")
    else:
        check_braces(sys.argv[1])
