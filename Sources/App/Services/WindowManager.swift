import AppKit
import Foundation

/// Manages window state, fullscreen toggling, and resizing
@MainActor
class WindowManager: ObservableObject {
    static let shared = WindowManager()
    
    private init() {}
    
    func enterFullscreen() {
        NSLog("🖥️ WindowManager: enterFullscreen() called")
        
        // Try all windows
        let windows = NSApplication.shared.windows
        
        guard let window = windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? windows.first else {
            NSLog("   ❌ WindowManager: No window found!")
            return
        }
        
        NSLog("   Window: %@", window.description)
        NSLog("   Is fullscreen: %d", window.styleMask.contains(.fullScreen) ? 1 : 0)
        
        if !window.styleMask.contains(.fullScreen) {
            NSLog("   ✅ WindowManager: Toggling fullscreen ON")
            window.toggleFullScreen(nil)
        } else {
            NSLog("   ⚠️ WindowManager: Already in fullscreen")
        }
    }
    
    func exitFullscreen() {
        NSLog("🖥️ WindowManager: exitFullscreen() called")
        
        // Try all windows
        let windows = NSApplication.shared.windows
        
        guard let window = windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? windows.first else {
            NSLog("   ❌ WindowManager: No window found!")
            return
        }
        
        if window.styleMask.contains(.fullScreen) {
            NSLog("   ✅ WindowManager: Toggling fullscreen OFF")
            window.toggleFullScreen(nil)
        } else {
            NSLog("   ⚠️ WindowManager: Already windowed mode")
        }
    }
    
    func restoreWindowSize() {
        NSLog("🪟 WindowManager: restoreWindowSize() called - restoring to expanded size")
        
        guard let window = NSApplication.shared.windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? NSApplication.shared.windows.first else {
            NSLog("   ❌ WindowManager: No window found!")
            return
        }
        
        // Don't restore if in fullscreen
        if window.styleMask.contains(.fullScreen) {
            NSLog("   ⚠️ WindowManager: Window is fullscreen, skipping restore")
            return
        }
        
        // Restore to expanded size (visible screen frame)
        guard let screen = window.screen ?? NSScreen.main else {
            NSLog("   ❌ WindowManager: No screen found!")
            return
        }
        
        let visibleFrame = screen.visibleFrame
        NSLog("   📐 WindowManager: Restoring to expanded size: \(visibleFrame)")
        window.setFrame(visibleFrame, display: true, animate: true)
        NSLog("   ✅ WindowManager: Window restored to expanded size")
    }
}
