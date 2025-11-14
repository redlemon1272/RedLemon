# Performance Optimization Guide
## MacBook Air 2015 (4GB RAM)

### 🚀 QUICK WINS (Do These Now!)
1. **Reload VS Code Window**: `Cmd+Shift+P` → "Reload Window" (clears memory without closing tabs)
2. **Use Workspace File**: `code RedLemon.code-workspace` instead of opening folder
3. **Close Unused Tabs**: Right-click tab → "Close Others" or `Cmd+K W`
4. **Check Extensions**: `Cmd+Shift+X` → Disable GitLens, Prettier, ESLint if installed

### 🎯 Current Status
**Memory:** ~107MB free (⚠️ LOW!)
**VS Code Usage:** ~1GB (33% of available RAM!)
**Cleaned:** ~3.7GB freed (1.4GB Swift cache + 336MB Xcode + 2GB Homebrew)

---

## ✅ What Was Cleaned

### Automatic Cleanup Done:
1. **Swift build cache** (.build/) - 1.4GB freed
   - Regenerates on next build automatically

2. **Xcode DerivedData** - 336MB freed
   - Safe to delete, regenerates as needed

3. **Homebrew cache** - ~2GB freed
   - Old package downloads, not needed

**Total freed: ~3.7GB** 🎉

---

## 🔧 VS Code Optimization

### Heavy Extensions Found:
- **Pylance** (87MB) - Python language server
- **GitHub Copilot** (73MB) - AI coding assistant (THIS ONE!)
- **Svelte** (55MB) - Svelte language support
- **Copilot Chat** (38MB) - AI chat
- **Python** (35MB) - Python extension

### Recommendations:

#### Option 1: Disable Unused Extensions (Recommended)
For this Swift project, you don't need Python extensions:
```
VS Code → Extensions → Search "Python" → Disable (not Uninstall)
Same for "Svelte" if not using
```
**Savings: ~180MB in memory, faster startup**

#### Option 2: Use Lighter Alternatives
- Consider disabling Copilot when not coding (toggle on/off)
- Use native Swift development tools (Xcode) for heavy lifting

---

## 🚀 Performance Tips

### Daily Habits:
1. **Restart VS Code** when sluggish (clears memory leaks)
2. **Close unused files** in editor (each open file uses RAM)
3. **Limit terminal tabs** to 2-3 max
4. **Close browser tabs** (Chrome/Safari use lots of RAM)

### Project-Specific:
```bash
# Run cleanup script when sluggish:
bash cleanup.sh

# Check what's using memory:
top -o MEM | head -n 20
```

### Build Optimization:
```bash
# Use incremental builds (faster):
swift build  # Instead of full rebuild

# Clean only when needed:
rm -rf .build  # Forces full rebuild
```

---

## 🧹 Cleanup Script Usage

**Created:** `cleanup.sh` in project root

**Run anytime to free space:**
```bash
bash cleanup.sh
```

**What it does:**
- Removes `.build` (Swift cache)
- Clears Xcode DerivedData
- Runs `brew cleanup`
- Shows memory status

**Safe to run:** Yes! All cleaned files regenerate automatically.

---

## 📊 Memory Management

### Current Bottlenecks:
- **VS Code**: ~1GB (434MB main renderer + helpers)
- **macOS**: ~1.1GB wired memory
- **Available**: Only ~81MB free

### Kill Memory Hogs:
```bash
# Find top memory users:
ps aux | sort -k4 -r | head -n 10

# Quit VS Code helpers (if frozen):
pkill -f "Code Helper"

# Restart VS Code completely
```

---

## 🎯 When to Optimize

### Signs you need cleanup:
- ✅ VS Code feels sluggish
- ✅ Typing has lag
- ✅ Builds are slow
- ✅ Fans running constantly
- ✅ Beachball cursor

### Quick Fixes:
1. Close all terminal tabs
2. Close unused editor tabs
3. Restart VS Code
4. Run `cleanup.sh`
5. Restart Mac (if really bad)

---

## 🔮 Future Considerations

### If Performance Still Poor:
1. **Upgrade RAM** (if possible on your model)
2. **Use Xcode instead of VS Code** for Swift
3. **External SSD** for build cache
4. **Disable file watchers** in VS Code settings
5. **Limit extensions** to essentials only

### VS Code Settings to Tweak:
```json
{
  "files.watcherExclude": {
    "**/.build/**": true,
    "**/build/**": true
  },
  "search.exclude": {
    "**/.build/**": true,
    "**/build/**": true
  },
  "files.autoSave": "off"  // Reduces disk writes
}
```

---

## 📝 Notes

- MacBook Air 2015 has 4GB RAM (non-upgradeable)
- Modern dev tools expect 8-16GB
- Your setup is surprisingly functional given constraints!
- Keep cleaning regularly for best performance

---

**Last Updated:** November 1, 2025
**System:** MacBook Air 2015, 4GB RAM, macOS
