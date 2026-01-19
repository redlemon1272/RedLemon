import Foundation
import Combine

/// Service that listens for new stream reports and notifies the admin.
@MainActor
class AdminRealtimeService: ObservableObject {
    static let shared = AdminRealtimeService()
    
    private let realtimeClient: SupabaseRealtimeClient
    private var postgresHandlerId: UUID?
    private var isSubscribed = false
    
    // Using a weak reference or closure to update AppState
    var onNewReport: (() -> Void)?
    var onNewFeedback: (() -> Void)?
    var onInitialCounts: ((Int, Int) -> Void)?
    
    private init() {
        self.realtimeClient = SupabaseClient.shared.realtimeClient
    }
    
    func start() async {
        guard !isSubscribed else { return }
        
        // Ensure user is admin
        guard SupabaseClient.shared.auth.currentUser?.isAdmin == true else {
            return
        }
        
        NSLog("🛡️ AdminRealtimeService: Starting report listener...")
        
        let reportTopic = "admin:reports"
        let feedbackTopic = "admin:feedback"
        
        // Setup Postgres change listeners
        let reportChanges: [[String: Any]] = [[
            "event": "INSERT",
            "schema": "public",
            "table": "reported_streams"
        ]]
        
        let feedbackChanges: [[String: Any]] = [[
            "event": "INSERT",
            "schema": "public",
            "table": "feedback_reports"
        ]]
        
        do {
            // Register handlers
            self.postgresHandlerId = await realtimeClient.onPostgresChange { [weak self] payload in
                Task { @MainActor in
                    self?.handlePostgresPayload(payload)
                }
            }
            
            // Connect and Join both channels
            try await realtimeClient.connect()
            try await realtimeClient.joinChannel(reportTopic, postgresChanges: reportChanges)
            try await realtimeClient.joinChannel(feedbackTopic, postgresChanges: feedbackChanges)
            
            isSubscribed = true
            NSLog("✅ AdminRealtimeService: Subscribed to reported_streams and feedback_reports")
            
            // 4. Fetch initial counts for "Offline" persistence
            await fetchInitialCounts()
            
        } catch {
            NSLog("❌ AdminRealtimeService error: %@", error.localizedDescription)
        }
    }
    
    func stop() async {
        if let id = postgresHandlerId {
            await realtimeClient.removePostgresChange(id: id)
            postgresHandlerId = nil
        }
        
        try? await realtimeClient.leaveChannel(topic: "admin:reports")
        try? await realtimeClient.leaveChannel(topic: "admin:feedback")
        isSubscribed = false
    }
    
    private func handlePostgresPayload(_ payload: [String: Any]) {
        guard let table = payload["table"] as? String else { return }
        
        if table == "reported_streams" {
            handleNewReport(payload)
        } else if table == "feedback_reports" {
            handleNewFeedback(payload)
        }
    }
    
    private func handleNewReport(_ payload: [String: Any]) {
        NSLog("🚨 AdminRealtimeService: New report detected!")
        
        // Extract basic info for notification if possible
        // Payload format depends on Supabase Realtime output
        var movieTitle = "Unknown Content"
        var reason = "New issue reported"
        
        if let record = payload["new"] as? [String: Any] {
            if let imdbId = record["imdb_id"] as? String {
                movieTitle = "IMDB: \(imdbId)"
            }
            if let reportedReason = record["reason"] as? String {
                reason = reportedReason.components(separatedBy: "\n").first ?? "Issue reported"
            }
        }
        
        // 1. Show native notification
        NotificationManager.shared.showNotification(
            title: "New Stream Report",
            subtitle: movieTitle,
            body: reason,
            categoryIdentifier: "STREAM_REPORT"
        )
        
        // 2. Notify internal listeners (to update UI badges)
        onNewReport?()
    }
    
    private func handleNewFeedback(_ payload: [String: Any]) {
        NSLog("🚨 AdminRealtimeService: New feedback detected!")
        
        var message = "A user submitted feedback"
        var type = "Feedback"
        
        if let record = payload["new"] as? [String: Any] {
            if let feedbackType = record["type"] as? String {
                type = feedbackType
            }
            if let feedbackMessage = record["message"] as? String {
                message = feedbackMessage
            }
        }
        
        // 1. Show native notification
        NotificationManager.shared.showNotification(
            title: "New User Feedback",
            subtitle: type,
            body: message,
            categoryIdentifier: "USER_FEEDBACK"
        )
        
        // 2. Notify internal listeners
        onNewFeedback?()
    }
    
    /// Fetches the current number of pending items from the database.
    /// This ensures admins see a badge on app startup if reports were sent while they were offline.
    func fetchInitialCounts() async {
        do {
            // We fetch the items to count them. Since we limit to 50 anyway in the UI, 
            // this is consistent with "what needs attention".
            async let reportsTask = SupabaseClient.shared.getReportedStreams(limit: 50)
            async let feedbackTask = SupabaseClient.shared.getFeedback(limit: 50)
            
            let (reports, feedback) = try await (reportsTask, feedbackTask)
            let rCount = reports.count
            let fCount = feedback.count
            
            NSLog("📊 AdminRealtimeService: Initial sync complete. Reports: %d, Feedback: %d", rCount, fCount)
            
            onInitialCounts?(rCount, fCount)
        } catch {
            NSLog("⚠️ AdminRealtimeService: Failed to fetch initial counts: %@", error.localizedDescription)
        }
    }
}
