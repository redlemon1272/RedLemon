import Foundation
import Combine

/// Service that listens for new stream reports and notifies the admin.
@MainActor
class AdminRealtimeService: ObservableObject {
    static let shared = AdminRealtimeService()
    
    private var reportClient: SupabaseRealtimeClient?
    private var feedbackClient: SupabaseRealtimeClient?
    private var alertClient: SupabaseRealtimeClient?
    private var reportHandlerId: UUID?
    private var feedbackHandlerId: UUID?
    private var alertHandlerId: UUID?
    private var isSubscribed = false
    
    // Using a weak reference or closure to update AppState
    var onNewReport: (() -> Void)?
    var onNewFeedback: (() -> Void)?
    var onInitialCounts: ((Int, Int) -> Void)?
    
    private init() {}
    
    func start() async {
        guard !isSubscribed else { return }
        
        // Ensure user is admin
        guard SupabaseClient.shared.auth.currentUser?.isAdmin == true else {
            return
        }
        
        NSLog("🛡️ AdminRealtimeService: Starting authenticated listeners...")
        
        let reportTopic = "reported_streams"
        let feedbackTopic = "feedback_reports"
        let alertTopic = "admin:alerts"
        
        // Create dedicated clients (matches SocialService pattern)
        let rClient = SupabaseRealtimeClient(
            realtimeURL: Config.supabaseURL,
            apiKey: Config.supabaseAnonKey
        )
        let fClient = SupabaseRealtimeClient(
            realtimeURL: Config.supabaseURL,
            apiKey: Config.supabaseAnonKey
        )
        let aClient = SupabaseRealtimeClient(
            realtimeURL: Config.supabaseURL,
            apiKey: Config.supabaseAnonKey
        )
        
        self.reportClient = rClient
        self.feedbackClient = fClient
        self.alertClient = aClient
        
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
            // 1. Register Postgres handlers
            self.reportHandlerId = await rClient.onPostgresChange(topic: reportTopic) { [weak self] payload in
                Task { @MainActor in
                    self?.handleNewReport(payload)
                }
            }
            
            self.feedbackHandlerId = await fClient.onPostgresChange(topic: feedbackTopic) { [weak self] payload in
                Task { @MainActor in
                    self?.handleNewFeedback(payload)
                }
            }
            
            // 2. Register Broadcast handlers (High-speed fallback)
            self.alertHandlerId = await aClient.onBroadcast(topic: alertTopic, event: "new_report") { [weak self] _, _ in
                Task { @MainActor in
                    NSLog("📡 AdminRealtimeService: Broadcast alert received (new_report)")
                    self?.onNewReport?()
                }
            }
            
            _ = await aClient.onBroadcast(topic: alertTopic, event: "new_feedback") { [weak self] _, _ in
                Task { @MainActor in
                    NSLog("📡 AdminRealtimeService: Broadcast alert received (new_feedback)")
                    self?.onNewFeedback?()
                }
            }
            
            // Connect and Join
            try await rClient.connect()
            try await rClient.joinChannel(reportTopic, postgresChanges: reportChanges)
            
            try await fClient.connect()
            try await fClient.joinChannel(feedbackTopic, postgresChanges: feedbackChanges)
            
            try await aClient.connect()
            try await aClient.joinChannel(alertTopic)
            
            isSubscribed = true
            NSLog("✅ AdminRealtimeService: Subscribed to reported_streams, feedback_reports, and broadcast alerts")
            
            // 4. Fetch initial counts for "Offline" persistence
            await fetchInitialCounts()
            
        } catch {
            NSLog("❌ AdminRealtimeService error: %@", error.localizedDescription)
            isSubscribed = false
        }
    }
    
    func stop() async {
        if let client = reportClient, let id = reportHandlerId {
            await client.removePostgresChange(id: id)
            await client.disconnect()
        }
        
        if let client = feedbackClient, let id = feedbackHandlerId {
            await client.removePostgresChange(id: id)
            await client.disconnect()
        }
        
        if let client = alertClient, let id = alertHandlerId {
            await client.removeBroadcastHandler(id: id)
            await client.disconnect()
        }
        
        reportHandlerId = nil
        feedbackHandlerId = nil
        alertHandlerId = nil
        reportClient = nil
        feedbackClient = nil
        alertClient = nil
        isSubscribed = false
    }
    
    
    private func handleNewReport(_ payload: [String: Any]) {
        NSLog("🚨 AdminRealtimeService: New report detected!")
        // Notify internal listeners (to update UI badges)
        onNewReport?()
    }
    
    private func handleNewFeedback(_ payload: [String: Any]) {
        NSLog("🚨 AdminRealtimeService: New feedback detected!")
        // Notify internal listeners (to update UI badges)
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
