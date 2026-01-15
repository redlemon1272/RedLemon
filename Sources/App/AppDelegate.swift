import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    private var cacheCleanupTimer: Timer?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Set default window size on app launch - use expanded size as default
        if let window = NSApplication.shared.windows.first {
            if let screen = window.screen ?? NSScreen.main {
                let screenFrame = screen.visibleFrame
                // Use full screen visible frame as default (expanded state)
                window.setFrame(screenFrame, display: true, animate: false)
                NSLog("🪟 Set initial window to expanded size: %@", String(describing: screenFrame))
            }
        }

        // Start periodic cache cleanup (every 30 minutes)
        startCacheCleanupTimer()

        // Check for updates in background (Sparkle auto-update)
        Task {
            await MainActor.run {
                UpdateManager.shared.checkForUpdatesInBackground()
            }
        }
    }

    func application(_ application: NSApplication, open urls: [URL]) {
        for url in urls {
            NSLog("🔗 AppDelegate received URL: %@", url.absoluteString)
            // URL will be handled by RedLemonApp.handleURL via onOpenURL
        }
    }

    func applicationWillTerminate(_ notification: Notification) {
        cacheCleanupTimer?.invalidate()
    }

    private func startCacheCleanupTimer() {
        cacheCleanupTimer = Timer.scheduledTimer(withTimeInterval: 1800, repeats: true) { _ in
            Task {
                await CacheManager.shared.clearExpired()
            }
        }
        NSLog("✅ Cache cleanup timer started (runs every 30 minutes)")
    }
}
