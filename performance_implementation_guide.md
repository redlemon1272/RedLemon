# RedLemon Performance Implementation Guide

## 🎯 Quick Implementation Steps

Since the full file replacements had compilation issues, here are the key changes to implement directly in the existing files:

### 1. **MPVPlayerViewModel.swift** - Enhanced Timer Management

Add these properties after the existing timer declarations:
```swift
// Enhanced timer management for performance
private var activeTimers: [Timer] = []
```

Add these methods before the `// MARK: - Initialization` section:
```swift
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
    print("🗑️ Invalidated all active timers")
}
```

Modify the `cleanup()` method:
```swift
func cleanup() {
    print("🧹 Cleaning up MPV player...")

    // Invalidate all timers first for performance
    invalidateAllTimers()

    // Just stop playback - layer will handle OpenGL cleanup
    mpvWrapper.stop()
}
```

Modify the `deinit` method:
```swift
deinit {
    print("🗑️ MPVPlayerViewModel deinit")

    // Invalidate all timers for performance
    invalidateAllTimers()

    // Stop playback synchronously - it's safe since we're just sending a command
    mpvWrapper.stop()
}
```

### 2. **MPVWrapper.swift** - Memory Pressure Monitoring

Add these properties after the existing timer declarations:
```swift
// Memory pressure monitoring
private var memoryPressureSource: DispatchSourceMemoryPressure?
```

Add these methods before the `// MARK: - Initialization` section:
```swift
private func setupMemoryPressureMonitoring() {
    guard memoryPressureSource == nil else { return }

    memoryPressureSource = DispatchSource.makeMemoryPressureSource(eventMask: .warning, queue: .main)
    memoryPressureSource?.setEventHandler { [weak self] in
        print("⚠️ Memory pressure detected - clearing caches")
        self?.clearVideoBuffers()
    }
    memoryPressureSource?.resume()
    print("📊 Memory pressure monitoring enabled")
}

private func clearVideoBuffers() {
    guard let handle = mpvHandle else { return }

    // Clear MPV video buffers to free memory
    mpv_command_string(handle, "cycle video")
    mpv_command_string(handle, "cycle video") // Return to normal

    print("🧹 Cleared MPV video buffers")
}

private func stopMemoryPressureMonitoring() {
    memoryPressureSource?.cancel()
    memoryPressureSource = nil
    print("📊 Memory pressure monitoring stopped")
}
```

Modify the `initializeOpenGL` method to add:
```swift
// Set up memory pressure monitoring
setupMemoryPressureMonitoring()
```

Modify the `deinit` method:
```swift
deinit {
    // Cancel event polling immediately
    eventPollingTask?.cancel()
    eventPollingTask = nil

    // Force cleanup with delay to ensure task completes
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
        guard let self = self else { return }

        self.timeUpdateTimer?.invalidate()
        self.timeUpdateTimer = nil

        if let handle = self.mpvHandle {
            if self.isInitialized {
                print("🔄 Terminating initialized MPV instance")
                mpv_terminate_destroy(handle)
            } else {
                print("🔄 Destroying uninitialized MPV instance")
                mpv_destroy(handle)
            }
        }

        print("🗑️ MPVWrapper fully cleaned up")
    }

    // Stop memory pressure monitoring
    stopMemoryPressureMonitoring()

    RTCCleanupSSL()
}
```

### 3. **AppState.swift** - Watch History Optimization & Subtitle Cleanup

Add these properties:
```swift
// Enhanced watch history tracking
private var pendingHistoryUpdates: [(Double, Double)] = []
private let historyBatchSize = 5

// Subtitle temp file tracking
private var subtitleTempFiles: [URL] = []
```

Modify the `saveToWatchHistory` method:
```swift
func saveToWatchHistory(timestamp: Double, duration: Double) {
    guard let imdbId = currentWatchItem?.imdbId,
          !imdbId.isEmpty,
          timestamp > 0,
          duration > 0 else {
        return
    }

    // Batch updates instead of immediate save
    pendingHistoryUpdates.append((timestamp, duration))

    if pendingHistoryUpdates.count >= historyBatchSize {
        flushHistoryUpdates()
    }
}

private func flushHistoryUpdates() {
    guard let lastUpdate = pendingHistoryUpdates.last else { return }

    // Process the batched update
    Task { @MainActor in
        // Your existing watch history saving logic here
        // Use lastUpdate.0 for timestamp, lastUpdate.1 for duration
        print("💾 Flushed \(pendingHistoryUpdates.count) watch history updates")
    }

    pendingHistoryUpdates.removeAll()
}
```

Modify the `downloadSubtitle` method to track temp files:
```swift
// After creating the localURL, add tracking
let localURL = tempDir.appendingPathComponent(subtitleFileName)
try subtitleText.write(to: localURL, atomically: true, encoding: .utf8)
subtitleTempFiles.append(localURL) // Track for cleanup
```

Add this cleanup method:
```swift
private func cleanupSubtitleTempFiles() {
    subtitleTempFiles.forEach { url in
        try? FileManager.default.removeItem(at: url)
    }
    subtitleTempFiles.removeAll()
    print("🗑️ Cleaned up subtitle temp files")
}
```

## 🔧 Testing the Implementation

### Test 1: Timer Management
1. Build and run the app
2. Start a video and let it play for 5 minutes
3. Navigate away from player and back
4. Check logs for "🗑️ Invalidated all active timers"

### Test 2: Memory Pressure
1. Build and run on 2015 MacBook Air
2. Open Activity Monitor and watch RedLemon memory usage
3. Play a video for 30+ minutes
4. Check for "⚠️ Memory pressure detected" logs

### Test 3: Performance Comparison
1. Test original vs enhanced version
2. Measure memory usage every 5 minutes
3. Test UI responsiveness during long playback sessions
4. Compare scrolling performance in media browser

## 📊 Expected Results

- **Timer Management**: No timer accumulation, proper cleanup
- **Memory Pressure**: Automatic buffer clearing on low memory
- **Watch History**: Batched saves (every 50 seconds instead of 10)
- **Subtitle Cleanup**: No temp file accumulation
- **Overall**: Consistent performance on older hardware

## 🎯 Success Metrics

The fixes should result in:
- Memory usage stays stable after 20+ minutes
- UI scrolling remains responsive
- No gradual slowdown during extended viewing
- Better performance on 2015 MacBook Air
- Proper resource cleanup on app exit
