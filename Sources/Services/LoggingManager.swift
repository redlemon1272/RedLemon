//
//  LoggingManager.swift
//  RedLemon
//
//  Centralized logging system with levels and throttling to reduce log spam
//

import Foundation
import QuartzCore

/// Log levels for filtering debug output
enum LogLevel: Int, CaseIterable {
    case error = 0
    case warn = 1
    case info = 2
    case debug = 3

    var emoji: String {
        switch self {
        case .error: return "❌"
        case .warn: return "⚠️"
        case .info: return "ℹ️"
        case .debug: return "🔍"
        }
    }

    var description: String {
        switch self {
        case .error: return "ERROR"
        case .warn: return "WARN"
        case .info: return "INFO"
        case .debug: return "DEBUG"
        }
    }
}

/// Logging categories for granular control
enum LogCategory: String, CaseIterable {
    case videoRendering = "video"
    case mouseTracking = "mouse"
    case subtitles = "subtitles"
    case watchHistory = "history"
    case network = "network"
    case watchParty = "watchparty"
    case general = "general"
    case social = "social"
    case performance = "perf"       // NEW: For timing diagnostics
    case ui = "ui"                  // NEW: For UI event diagnostics (scroll, render)
}

/// Centralized logging manager with throttling and level control
class LoggingManager: ObservableObject {
    static let shared = LoggingManager()

    @Published var currentLogLevel: LogLevel = .info
    @Published var enableVideoRenderingLogs: Bool = false
    @Published var enableMouseTrackingLogs: Bool = true
    @Published var enableSubtitleLogs: Bool = true
    @Published var enableWatchHistoryLogs: Bool = true
    @Published var enableNetworkLogs: Bool = true
    @Published var enableWatchPartyLogs: Bool = true
    @Published var enableGeneralLogs: Bool = true
    @Published var enableSocialLogs: Bool = true
    @Published var enablePerformanceLogs: Bool = true  // NEW: Always on by default for diagnostics
    @Published var enableUILogs: Bool = true           // NEW: Always on by default for diagnostics

    // Throttling intervals (seconds)
    private let videoRenderingInterval: TimeInterval = 10.0
    private let mouseTrackingInterval: TimeInterval = 30.0
    private let subtitleInterval: TimeInterval = 15.0
    private let watchHistoryInterval: TimeInterval = 60.0

    // Last log times for throttling
    private var lastVideoRenderLogTime: CFTimeInterval = 0
    private var lastMouseTrackingLogTime: CFTimeInterval = 0
    private var lastSubtitleLogTime: CFTimeInterval = 0
    private var lastWatchHistoryLogTime: CFTimeInterval = 0

    // State tracking for smart conditional logging
    private var lastSubtitleTrackCount: Int = -1
    private var lastCurrentSubtitleTrack: Int = -1
    private var lastExitButtonHoverState: Bool = false
    private var lastMouseControlState: (exit: Bool, controls: Bool, chat: Bool) = (false, false, false)

    private init() {
        loadSettings()
    }

    // MARK: - Public Interface

    /// Log a message with specified level and category
    func log(_ level: LogLevel, category: LogCategory, message: String, file: String = #file, function: String = #function, line: Int = #line) {
        // Check if logging is enabled for this category
        guard isCategoryEnabled(category) else { return }

        // Check if level is enabled
        guard level.rawValue <= currentLogLevel.rawValue else { return }

        // Apply throttling for specific categories
        guard shouldLog(category: category, message: message) else { return }

        let filename = (file as NSString).lastPathComponent
        let timestamp = DateFormatter.logTimestamp.string(from: Date())
        let formattedMessage = "\(level.emoji) [\(timestamp)] [\(category.rawValue.uppercased())] [\(filename):\(line)] \(message)"

        // 🚨 Documentation Security Check #11: Always use %@ specifier to prevent crashes from '%' in URLs/JSON
        NSLog("%@", formattedMessage)
    }

    // MARK: - Convenience Methods

    func debug(_ category: LogCategory, message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.debug, category: category, message: message, file: file, function: function, line: line)
    }

    func info(_ category: LogCategory, message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.info, category: category, message: message, file: file, function: function, line: line)
    }

    func warn(_ category: LogCategory, message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.warn, category: category, message: message, file: file, function: function, line: line)
    }

    func error(_ category: LogCategory, message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(.error, category: category, message: message, file: file, function: function, line: line)
    }

    // MARK: - Category-Specific Smart Logging

    /// Log video rendering events with smart throttling
    func videoRendering(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        let currentTime = CACurrentMediaTime()
        if currentTime - lastVideoRenderLogTime > videoRenderingInterval {
            lastVideoRenderLogTime = currentTime
            debug(.videoRendering, message: message, file: file, function: function, line: line)
        }
    }

    /// Log mouse tracking with state change detection
    func mouseTracking(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        let currentTime = CACurrentMediaTime()
        if currentTime - lastMouseTrackingLogTime > mouseTrackingInterval {
            lastMouseTrackingLogTime = currentTime
            debug(.mouseTracking, message: message, file: file, function: function, line: line)
        }
    }

    /// Log subtitle information only when tracks actually change
    func subtitleTracks(_ trackCount: Int, currentTrack: Int, file: String = #file, function: String = #function, line: Int = #line) {
        // Only log if something actually changed
        if trackCount != lastSubtitleTrackCount || currentTrack != lastCurrentSubtitleTrack {
            lastSubtitleTrackCount = trackCount
            lastCurrentSubtitleTrack = currentTrack

            let currentTime = CACurrentMediaTime()
            if currentTime - lastSubtitleLogTime > subtitleInterval {
                lastSubtitleLogTime = currentTime
                info(.subtitles, message: "Tracks: \(trackCount) available, current: \(currentTrack)", file: file, function: function, line: line)
            }
        }
    }

    /// Log watch history with longer throttling
    func watchHistory(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        let currentTime = CACurrentMediaTime()
        if currentTime - lastWatchHistoryLogTime > watchHistoryInterval {
            lastWatchHistoryLogTime = currentTime
            info(.watchHistory, message: message, file: file, function: function, line: line)
        }
    }

    /// Log exit button hover state changes only
    func exitButtonHover(_ isHovered: Bool, file: String = #file, function: String = #function, line: Int = #line) {
        if isHovered != lastExitButtonHoverState {
            lastExitButtonHoverState = isHovered
            debug(.mouseTracking, message: "Exit button hover: \(isHovered ? "ENTER" : "EXIT")", file: file, function: function, line: line)
        }
    }

    /// Log mouse control state changes only
    func mouseControlState(_ exit: Bool, controls: Bool, chat: Bool, file: String = #file, function: String = #function, line: Int = #line) {
        let newState = (exit, controls, chat)
        if newState != lastMouseControlState {
            lastMouseControlState = newState
            debug(.mouseTracking, message: "UI state - Exit: \(exit), Controls: \(controls), Chat: \(chat)", file: file, function: function, line: line)
        }
    }

    // MARK: - Performance & Diagnostic Logging
    
    /// Log a performance timing measurement (always logged - not throttled)
    /// Use this for diagnosing lag and timing issues
    func performance(_ operation: String, durationMs: Double, file: String = #file, function: String = #function, line: Int = #line) {
        let status = durationMs > 100 ? "🔴 SLOW" : (durationMs > 50 ? "🟡 MODERATE" : "🟢 FAST")
        info(.performance, message: "\(status) \(operation): \(String(format: "%.2f", durationMs))ms", file: file, function: function, line: line)
    }
    
    /// Log a scroll event (useful for diagnosing macOS 26 scroll issues)
    func scrollEvent(_ direction: String, forwarded: Bool, location: String, file: String = #file, function: String = #function, line: Int = #line) {
        let action = forwarded ? "FORWARDED to parent" : "HANDLED locally"
        debug(.ui, message: "Scroll \(direction) \(action) [\(location)]", file: file, function: function, line: line)
    }
    
    /// Log a UI render/layout event
    func uiEvent(_ event: String, context: String? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        let contextStr = context != nil ? " [\(context!)]" : ""
        debug(.ui, message: "\(event)\(contextStr)", file: file, function: function, line: line)
    }

    // MARK: - Private Methods

    private func isCategoryEnabled(_ category: LogCategory) -> Bool {
        switch category {
        case .videoRendering: return enableVideoRenderingLogs
        case .mouseTracking: return enableMouseTrackingLogs
        case .subtitles: return enableSubtitleLogs
        case .watchHistory: return enableWatchHistoryLogs
        case .network: return enableNetworkLogs
        case .watchParty: return enableWatchPartyLogs
        case .general: return enableGeneralLogs
        case .social: return enableSocialLogs
        case .performance: return enablePerformanceLogs
        case .ui: return enableUILogs
        }
    }

    private func shouldLog(category: LogCategory, message: String) -> Bool {
        // For non-throttled categories, always log (if level allows)
        switch category {
        case .videoRendering, .mouseTracking, .subtitles, .watchHistory:
            return true // These are handled by their specific methods
        default:
            return true
        }
    }

    // MARK: - Settings Persistence

    private func loadSettings() {
        let defaults = UserDefaults.standard

        currentLogLevel = LogLevel(rawValue: defaults.integer(forKey: "logLevel")) ?? .info
        enableVideoRenderingLogs = defaults.bool(forKey: "enableVideoRenderingLogs")
        enableMouseTrackingLogs = defaults.object(forKey: "enableMouseTrackingLogs") == nil ? true : defaults.bool(forKey: "enableMouseTrackingLogs")
        enableSubtitleLogs = defaults.object(forKey: "enableSubtitleLogs") == nil ? true : defaults.bool(forKey: "enableSubtitleLogs")
        enableWatchHistoryLogs = defaults.object(forKey: "enableWatchHistoryLogs") == nil ? true : defaults.bool(forKey: "enableWatchHistoryLogs")
        enableNetworkLogs = defaults.object(forKey: "enableNetworkLogs") == nil ? true : defaults.bool(forKey: "enableNetworkLogs")
        enableWatchPartyLogs = defaults.object(forKey: "enableWatchPartyLogs") == nil ? true : defaults.bool(forKey: "enableWatchPartyLogs")
        enableGeneralLogs = defaults.object(forKey: "enableGeneralLogs") == nil ? true : defaults.bool(forKey: "enableGeneralLogs")
        enableSocialLogs = defaults.object(forKey: "enableSocialLogs") == nil ? true : defaults.bool(forKey: "enableSocialLogs")
    }

    func saveSettings() {
        let defaults = UserDefaults.standard
        defaults.set(currentLogLevel.rawValue, forKey: "logLevel")
        defaults.set(enableVideoRenderingLogs, forKey: "enableVideoRenderingLogs")
        defaults.set(enableMouseTrackingLogs, forKey: "enableMouseTrackingLogs")
        defaults.set(enableSubtitleLogs, forKey: "enableSubtitleLogs")
        defaults.set(enableWatchHistoryLogs, forKey: "enableWatchHistoryLogs")
        defaults.set(enableNetworkLogs, forKey: "enableNetworkLogs")
        defaults.set(enableWatchPartyLogs, forKey: "enableWatchPartyLogs")
        defaults.set(enableGeneralLogs, forKey: "enableGeneralLogs")
        defaults.set(enableSocialLogs, forKey: "enableSocialLogs")
    }

    func resetToDefaults() {
        currentLogLevel = .info
        enableVideoRenderingLogs = false
        enableMouseTrackingLogs = true
        enableSubtitleLogs = true
        enableWatchHistoryLogs = true
        enableNetworkLogs = true
        enableWatchPartyLogs = true
        enableGeneralLogs = true
        enableSocialLogs = true
        saveSettings()
    }
}

// MARK: - Date Formatter Extension

private extension DateFormatter {
    static let logTimestamp: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter
    }()
}
