#!/bin/bash

# RedLemon Performance Fixes Application Script
# This script applies the performance fixes to prevent memory leaks

echo "🔧 Applying RedLemon performance fixes..."

# Backup original files
echo "📋 Creating backups..."
cp "Sources/Features/Player/MPVPlayerViewModel.swift" "Sources/Features/Player/MPVPlayerViewModel.swift.backup"
cp "Sources/Features/Player/MPVWrapper.swift" "Sources/Features/Player/MPVWrapper.swift.backup"

# Fix 1: Enhanced timer management in MPVPlayerViewModel
echo "⏰ Adding enhanced timer management..."

# Add timer tracking property
sed -i '' '/watchHistoryTimer: Timer?/a\
\
    // Enhanced timer management for performance\
    private var activeTimers: [Timer] = []\
' Sources/Features/Player/MPVPlayerViewModel.swift

# Add timer management methods before cleanup
sed -i '' '/MARK: - Cleanup/i\
// MARK: - Enhanced Timer Management\
\
private func scheduleTimer(interval: TimeInterval, handler: @escaping () -> Void) -> Timer {\
    let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: { _ in\
        handler()\
    })\
    activeTimers.append(timer)\
    return timer\
}\
\
private func invalidateAllTimers() {\
    activeTimers.forEach { $0.invalidate() }\
    activeTimers.removeAll()\
    print("🗑️ Invalidated all active timers")\
}\
' Sources/Features/Player/MPVPlayerViewModel.swift

# Enhance cleanup method
sed -i '' 's/func cleanup() {/a\
func cleanup() {\
    print("🧹 Cleaning up MPV player...")\
\
    // Invalidate all timers first for performance\
    invalidateAllTimers()\
\
    // Just stop playback - the layer will handle OpenGL cleanup\
    mpvWrapper.stop()\
}' Sources/Features/Player/MPVPlayerViewModel.swift

# Enhance deinit method
sed -i '' 's/deinit {/a\
deinit {\
    print("🗑️ MPVPlayerViewModel deinit")\
\
    // Invalidate all timers for performance\
    invalidateAllTimers()\
\
    // Stop playback synchronously - it'\''s safe since we'\''re just sending a command\
    mpvWrapper.stop()\
}' Sources/Features/Player/MPVPlayerViewModel.swift

# Fix 2: Memory pressure monitoring in MPVWrapper
echo "💾 Adding memory pressure monitoring..."

# Add memory pressure property
sed -i '' '/private var timeUpdateTimer: Timer?/a\
private var timeUpdateTimer: Timer?\
\
// Memory pressure monitoring\
private var memoryPressureSource: DispatchSourceMemoryPressure?\
' Sources/Features/Player/MPVWrapper.swift

# Add memory pressure methods before initialization
sed -i '' '/MARK: - Initialization/i\
// MARK: - Memory Pressure Monitoring\
\
private func setupMemoryPressureMonitoring() {\
    guard memoryPressureSource == nil else { return }\
\
    memoryPressureSource = DispatchSource.makeMemoryPressureSource(eventMask: .warning, queue: .main)\
    memoryPressureSource?.setEventHandler { [weak self] in\
        print("⚠️ Memory pressure detected - clearing caches")\
        self?.clearVideoBuffers()\
    }\
    memoryPressureSource?.resume()\
    print("📊 Memory pressure monitoring enabled")\
}\
\
private func clearVideoBuffers() {\
    guard let handle = mpvHandle else { return }\
\
    // Clear MPV video buffers to free memory\
    mpv_command_string(handle, "cycle video")\
    mpv_command_string(handle, "cycle video") // Return to normal\
\
    print("🧹 Cleared MPV video buffers")\
}\
\
private func stopMemoryPressureMonitoring() {\
    memoryPressureSource?.cancel()\
    memoryPressureSource = nil\
    print("📊 Memory pressure monitoring stopped")\
}\
' Sources/Features/Player/MPVWrapper.swift

# Add memory pressure setup to initialization
sed -i '' 's/func initializeOpenGL/i\
// Set up memory pressure monitoring\
    setupMemoryPressureMonitoring()\
\
' Sources/Features/Player/MPVWrapper.swift

# Enhance deinit method
sed -i '' 's/deinit {/a\
deinit {\
    // Cancel event polling immediately\
    eventPollingTask?.cancel()\
    eventPollingTask = nil\
\
    // Force cleanup with delay to ensure task completes\
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in\
        guard let self = self else { return }\
\
        self.timeUpdateTimer?.invalidate()\
        self.timeUpdateTimer = nil\
\
        if let handle = self.mpvHandle {\
            if self.isInitialized {\
                print("🔄 Terminating initialized MPV instance")\
                mpv_terminate_destroy(handle)\
            } else {\
                print("🔄 Destroying uninitialized MPV instance")\
                mpv_destroy(handle)\
            }\
        }\
\
        print("🗑️ MPVWrapper fully cleaned up")\
    }\
\
    // Stop memory pressure monitoring\
    stopMemoryPressureMonitoring()\
\
    RTCCleanupSSL()\
}' Sources/Features/Player/MPVWrapper.swift

echo "✅ Performance fixes applied successfully!"
echo ""
echo "📊 Summary of changes:"
echo "   • Enhanced timer management in MPVPlayerViewModel"
echo "   • Memory pressure monitoring in MPVWrapper"
echo "   • Improved resource cleanup in both classes"
echo "   • Backups created as .backup files"
echo ""
echo "🧪 To test: Build and run the app, then monitor memory usage"
echo "   during extended viewing sessions (30+ minutes)"
