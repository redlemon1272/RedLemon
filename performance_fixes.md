# RedLemon Performance Fixes

## 🔍 Log Analysis Results

The exported log file only contains Console.app headers, indicating the RedLemon process logs weren't captured properly. This is common with macOS Console.app filtering.

## 🛠️ Recommended Fixes for Solo Watching Performance

Based on code analysis, here are targeted fixes to prevent memory leaks during solo playback:

### 1. **Enhanced MPV Timer Management**

**Issue**: Multiple timers running continuously without proper cleanup
**Fix**: Centralized timer cleanup in MPVPlayerViewModel

```swift
// Add to MPVPlayerViewModel
private var activeTimers: [Timer] = []

private func scheduleTimer(interval: TimeInterval, handler: @escaping () -> Void) -> Timer {
    let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { _ in
        handler()
    })
    activeTimers.append(timer)
    return timer
}

private func invalidateAllTimers() {
    activeTimers.forEach { $0.invalidate() }
    activeTimers.removeAll()
}
```

### 2. **Memory Pressure Monitoring**

**Issue**: No detection of memory pressure on older hardware
**Fix**: Add memory monitoring to MPVWrapper

```swift
// Add to MPVWrapper
private func setupMemoryPressureMonitoring() {
    let source = DispatchSource.makeMemoryPressureSource(eventMask: .warning, queue: .main)
    source.setEventHandler { [weak self] in
        print("⚠️ Memory pressure detected - clearing caches")
        self?.clearVideoBuffers()
    }
    source.resume()
}

private func clearVideoBuffers() {
    // Clear MPV video buffers
    mpv_command_string(mpvHandle, "cycle video")
    mpv_command_string(mpvHandle, "cycle video") // Return to normal
}
```

### 3. **Enhanced Event Polling Cleanup**

**Issue**: eventPollingTask may not cancel properly
**Fix**: Improved task cancellation

```swift
// Modify MPVWrapper deinit
deinit {
    // Cancel event polling immediately
    eventPollingTask?.cancel()

    // Force cleanup
    timeUpdateTimer?.invalidate()
    timeUpdateTimer = nil

    if let handle = mpvHandle {
        if isInitialized {
            mpv_terminate_destroy(handle)
        } else {
            mpv_destroy(handle)
        }
    }

    RTCCleanupSSL()
    print("🗑️ MPVWrapper fully cleaned up")
}
```

### 4. **Watch History Optimization**

**Issue**: Saving history every 10 seconds may accumulate
**Fix**: Batch updates and cleanup

```swift
// Modify MPVPlayerViewModel
private var pendingHistoryUpdates: [(Double, Double)] = []
private let historyBatchSize = 5

private func saveWatchHistory() {
    guard currentTime > 0 && duration > 0 else { return }

    // Batch updates instead of immediate save
    pendingHistoryUpdates.append((currentTime, duration))

    if pendingHistoryUpdates.count >= historyBatchSize {
        flushHistoryUpdates()
    }
}

private func flushHistoryUpdates() {
    guard let lastUpdate = pendingHistoryUpdates.last else { return }
    appState?.saveToWatchHistory(timestamp: lastUpdate.0, duration: lastUpdate.1)
    pendingHistoryUpdates.removeAll()
}

// Call flushHistoryUpdates() in cleanup()
```

### 5. **Subtitle Resource Cleanup**

**Issue**: Temporary subtitle files may accumulate
**Fix**: Automatic cleanup

```swift
// Add to AppState
private var subtitleTempFiles: [URL] = []

// Modify downloadSubtitle method
let localURL = tempDir.appendingPathComponent(subtitleFileName)
try subtitleText.write(to: localURL, atomically: true, encoding: .utf8)
subtitleTempFiles.append(localURL)

// Add cleanup method
private func cleanupSubtitleTempFiles() {
    subtitleTempFiles.forEach { url in
        try? FileManager.default.removeItem(at: url)
    }
    subtitleTempFiles.removeAll()
}
```

## 🔧 Proper Log Collection

For future testing, use this command to capture RedLemon logs:

```bash
# Better log capture command
log stream --predicate 'subsystem == "com.redlemon.app" or processImagePath contains "RedLemon"' --style compact > redlemon_detailed.log
```

Or use Console.app with these steps:
1. Search "RedLemon"
2. Select "All Messages" from sidebar
3. Click "Start Streaming" before testing
4. Save with "File → Save As → Log"

## 📊 Memory Monitoring Addition

Add this to MPVPlayerViewModel for real-time monitoring:

```swift
private func startMemoryMonitoring() {
    Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { _ in
        let info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4

        let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_,
                         task_flavor_t(MACH_TASK_BASIC_INFO),
                         $0,
                         &count)
            }
        }

        if kerr == KERN_SUCCESS {
            let usedMB = Double(info.resident_size) / 1024.0 / 1024.0
            print("📊 Memory usage: \(String(format: "%.1f", usedMB))MB")
        }
    }
}
```

## 🎯 Expected Results

These fixes should:
- Eliminate timer accumulation
- Detect and respond to memory pressure
- Properly clean up MPV resources
- Batch expensive operations
- Monitor memory usage in real-time

**Result**: Consistent performance during extended viewing sessions, even on 2015 MacBook Air.

## 🧪 Testing Protocol

1. Apply fixes
2. Monitor memory usage with added logging
3. Test 60+ minute playback sessions
4. Compare before/after memory growth patterns
