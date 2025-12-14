import Foundation

/// Centralized logging service for RedLemon
/// Handles local file logging and (optional) remote error reporting
class LogManager {
    static let shared = LogManager()
    
    private let fileManager = FileManager.default
    private let logFileName = "app_logs.txt"
    private var logFileURL: URL?
    private let sessionId = UUID().uuidString
    
    private init() {
        setupLogFile()
    }
    
    private func setupLogFile() {
        guard let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        logFileURL = documentsPath.appendingPathComponent(logFileName)
        
        // Rotate logs if too large (e.g., > 5MB)
        if let url = logFileURL,
           let attrs = try? fileManager.attributesOfItem(atPath: url.path),
           let size = attrs[.size] as? UInt64,
           size > 5_000_000 {
            try? fileManager.removeItem(at: url)
        }
    }
    
    // MARK: - Public API
    
    func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: "DEBUG", message: message, file: file, function: function, line: line)
    }
    
    func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: "INFO", message: message, file: file, function: function, line: line)
    }
    
    func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: "WARNING", message: message, file: file, function: function, line: line)
    }
    
    func error(_ message: String, error: Error? = nil, file: String = #file, function: String = #function, line: Int = #line) {
        var fullMessage = message
        if let error = error {
            fullMessage += " | Error: \(error.localizedDescription)"
        }
        log(level: "ERROR", message: fullMessage, file: file, function: function, line: line)
        
        // Capture immutable copy for Task
        let messageForUpload = fullMessage
        let uploadedSessionId = self.sessionId
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"
        
        // Queue for Supabase upload
        Task {
            do {
                // Prevent infinite recursion if SupabaseClient itself fails
                // We assume SupabaseClient.insertLog won't call LogManager.error for its own failures
                // (It throws, and we catch it here)
                try await SupabaseClient.shared.insertLog(
                    level: "ERROR",
                    message: messageForUpload,
                    metadata: [
                        "file": (file as NSString).lastPathComponent,
                        "function": function,
                        "line": line,
                        "error_description": error?.localizedDescription ?? "nil",
                        "os_version": ProcessInfo.processInfo.operatingSystemVersionString,
                        "host_name": ProcessInfo.processInfo.hostName,
                        "session_id": uploadedSessionId,
                        "app_version": appVersion,
                        "build": buildNumber
                    ]
                )
            } catch {
                // Fallback to console only - DO NOT call LogManager.error here
                print("❌ LogManager: Failed to upload error log: \(error)")
            }
        }
    }
    
    // MARK: - Internal Logging
    
    private func log(level: String, message: String, file: String, function: String, line: Int) {
        let fileName = (file as NSString).lastPathComponent
        let timestamp = ISO8601DateFormatter().string(from: Date())
        let logEntry = "[\(timestamp)] [\(level)] [\(fileName):\(line)] \(message)\n"
        
        // Print to console (Xcode)
        print(logEntry.trimmingCharacters(in: .newlines))
        
        // Append to local file
        if let url = logFileURL {
            if let data = logEntry.data(using: .utf8) {
                if fileManager.fileExists(atPath: url.path) {
                    if let fileHandle = try? FileHandle(forWritingTo: url) {
                        fileHandle.seekToEndOfFile()
                        fileHandle.write(data)
                        fileHandle.closeFile()
                    }
                } else {
                    try? data.write(to: url)
                }
            }
        }
    }
    
    /// Retrieve recent logs for Admin Dashboard
    func getRecentLogs() -> String {
        guard let url = logFileURL else { return "No log file available." }
        return (try? String(contentsOf: url)) ?? "Empty logs."
    }
}
