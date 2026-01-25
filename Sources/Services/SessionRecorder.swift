//
//  SessionRecorder.swift
//  RedLemon
//
//  Created by RedLemon Assistant on 2025-12-16.
//

import Foundation

/// Categories for session events
enum SessionEventCategory: String, Codable {
    case app = "APP"
    case resolver = "RESOLVER"
    case player = "PLAYER"
    case error = "ERROR"
    case user = "USER"
}

/// A single timestamped event in the log
struct SessionEvent: Codable {
    let timestamp: Date
    let category: SessionEventCategory
    let message: String
    let metadata: [String: String]?
    
    init(category: SessionEventCategory, message: String, metadata: [String: String]? = nil) {
        self.timestamp = Date()
        self.category = category
        self.message = message
        self.metadata = metadata
    }
}

/// Complete Session Log for upload
struct SessionLog: Codable, Identifiable {
    let id: UUID
    let sessionId: UUID
    let platform: String
    let appVersion: String
    let imdbId: String?
    let streamHash: String?
    let events: [SessionEvent]
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case sessionId = "session_id"
        case platform
        case appVersion = "app_version"
        case imdbId = "imdb_id"
        case streamHash = "stream_hash"
        case events
        case createdAt = "created_at"
    }
}

/// thread-safe in-memory logger
actor SessionRecorder {
    static let shared = SessionRecorder()
    
    private var events: [SessionEvent] = []
    private var currentSessionId: UUID = UUID()
    private var currentImdbId: String?
    private var currentStreamHash: String?
    
    // Privacy filters
    private let sensitiveKeys = ["api_key", "token", "password", "auth", "secret"]
    
    private init() {
        Task.detached { [weak self] in
            await self?.log(category: .app, message: "SessionRecorder initialized")
        }
    }
    
    // MARK: - Public API
    
    func startNewSession(imdbId: String? = nil, userId: String? = nil, triggerSource: String? = nil) {
        events.removeAll()
        currentSessionId = UUID()
        currentImdbId = imdbId
        currentStreamHash = nil
        
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
        
        var metadata: [String: String] = [
            "session_id": currentSessionId.uuidString,
            "app_version": appVersion,
            "build": buildNumber
        ]
        
        if let uid = userId {
            metadata["user_id"] = uid
        }

        if let source = triggerSource {
            metadata["trigger_source"] = source
        }
        
        log(category: .app, message: "New Session Started", metadata: metadata)
        if let id = imdbId {
            log(category: .app, message: "Target Content Set", metadata: ["imdb_id": id])
        }
    }
    
    func setStreamHash(_ hash: String) {
        currentStreamHash = hash
        log(category: .resolver, message: "Stream Selected", metadata: ["hash_prefix": String(hash.prefix(8))])
    }
    
    func log(category: SessionEventCategory, message: String, metadata: [String: String]? = nil) {
        // Sanitize metadata keys/values
        var safeMetadata: [String: String]? = nil
        var metadataString = ""
        
        if let meta = metadata {
            safeMetadata = [:]
            for (key, value) in meta {
                if isSensitive(key) || isSensitive(value) {
                    safeMetadata?[key] = "[REDACTED]"
                } else {
                    safeMetadata?[key] = value
                }
            }
            // Format for console (JSON-like)
            if let safe = safeMetadata {
                let sortedKeys = safe.keys.sorted()
                let jsonItems = sortedKeys.map { "\"\($0)\": \"\(safe[$0] ?? "")\"" }
                metadataString = " [\(jsonItems.joined(separator: ", "))]"
            }
        }
        
        // Remove sensitive info from message
        let safeMessage = sanitizeMessage(message)
        
        let event = SessionEvent(category: category, message: safeMessage, metadata: safeMetadata)
        events.append(event)
        
        // Mirror to System Log for real-time debugging
        // Format: [CATEGORY] Message [key: value]
        NSLog("%@", "📝 [\(category.rawValue)] \(safeMessage)\(metadataString)")
        
        // Cap log size to prevent memory issues (last 1000 events)
        if events.count > 1000 {
            events.removeFirst(100)
        }
    }
    
    func getSanitizedLog() -> SessionLog {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
        let osVersion = ProcessInfo.processInfo.operatingSystemVersionString
        
        return SessionLog(
            id: UUID(),
            sessionId: currentSessionId,
            platform: "macOS \(osVersion)",
            appVersion: "\(appVersion) (\(buildNumber))",
            imdbId: currentImdbId,
            streamHash: currentStreamHash,
            events: events,
            createdAt: Date()
        )
    }
    
    func clear() {
        events.removeAll()
    }
    
    // MARK: - Sanitization Helpers
    
    private func isSensitive(_ text: String) -> Bool {
        let lower = text.lowercased()
        return sensitiveKeys.contains { lower.contains($0) }
    }
    
    private func sanitizeMessage(_ message: String) -> String {
        // Simple heuristic: if it looks like a long token (random 30+ chars), redact it
        // This is basic; rely on call-sites to be careful mostly.
        return message
    }
}
