import AppKit
import Foundation

/// Manages window state, fullscreen toggling, and resizing
@MainActor
class WindowManager: ObservableObject {
    static let shared = WindowManager()
    
    private init() {}
    
    func enterFullscreen() {
        LoggingManager.shared.debug(.videoRendering, message: "🖥️ WindowManager: enterFullscreen() called")
        
        // Try all windows
        let windows = NSApplication.shared.windows
        
        guard let window = windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? windows.first else {
            LoggingManager.shared.error(.videoRendering, message: "WindowManager: No window found to enter fullscreen!")
            return
        }
        
        LoggingManager.shared.debug(.videoRendering, message: "Window: \(window.description)")
        LoggingManager.shared.debug(.videoRendering, message: "Is fullscreen: \(window.styleMask.contains(.fullScreen))")
        
        if !window.styleMask.contains(.fullScreen) {
            LoggingManager.shared.info(.videoRendering, message: "WindowManager: Toggling fullscreen ON")
            window.toggleFullScreen(nil)
        } else {
            LoggingManager.shared.debug(.videoRendering, message: "WindowManager: Already in fullscreen")
        }
    }
    
    func exitFullscreen() {
        LoggingManager.shared.debug(.videoRendering, message: "🖥️ WindowManager: exitFullscreen() called")
        
        // Try all windows
        let windows = NSApplication.shared.windows
        
        guard let window = windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? windows.first else {
            LoggingManager.shared.error(.videoRendering, message: "WindowManager: No window found to exit fullscreen!")
            return
        }
        
        if window.styleMask.contains(.fullScreen) {
            LoggingManager.shared.info(.videoRendering, message: "WindowManager: Toggling fullscreen OFF")
            window.toggleFullScreen(nil)
        } else {
            LoggingManager.shared.debug(.videoRendering, message: "WindowManager: Already windowed mode")
        }
    }
    
    func restoreWindowSize() {
        LoggingManager.shared.debug(.videoRendering, message: "🪟 WindowManager: restoreWindowSize() called - restoring to expanded size")
        
        guard let window = NSApplication.shared.windows.first(where: { $0.isVisible && $0.isKeyWindow }) ?? NSApplication.shared.windows.first else {
            LoggingManager.shared.error(.videoRendering, message: "WindowManager: No window found to restore!")
            return
        }
        
        // Don't restore if in fullscreen
        if window.styleMask.contains(.fullScreen) {
            LoggingManager.shared.debug(.videoRendering, message: "WindowManager: Window is fullscreen, skipping restore")
            return
        }
        
        // Restore to expanded size (visible screen frame)
        guard let screen = window.screen ?? NSScreen.main else {
            LoggingManager.shared.error(.videoRendering, message: "WindowManager: No screen found!")
            return
        }
        
        let visibleFrame = screen.visibleFrame
        LoggingManager.shared.debug(.videoRendering, message: "📐 WindowManager: Restoring to expanded size: \(visibleFrame)")
        window.setFrame(visibleFrame, display: true, animate: true)
        LoggingManager.shared.info(.videoRendering, message: "WindowManager: Window restored to expanded size")
    }
}
