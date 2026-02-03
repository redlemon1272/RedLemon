import Foundation
import Combine

/// Service that listens for live updates to the user's own profile.
/// Used to detect when an admin grants hosting privileges (Premium status).
@MainActor
class ProfileRealtimeService: ObservableObject {
    static let shared = ProfileRealtimeService()

    private var realtimeClient: SupabaseRealtimeClient { SupabaseClient.shared.realtimeClient }
    private var profileHandlerId: UUID?
    private var isSubscribed = false

    // Callback for when the profile is updated
    var onProfileUpdate: (([String: Any]) -> Void)?

    private init() {}

    func start() async {
        guard !isSubscribed else { return }

        guard let userId = SupabaseClient.shared.auth.currentUser?.id else {
            print("⚠️ ProfileRealtimeService: No logged in user to subscribe to.")
            return
        }

        // 1. Start Polling Fallback (Every 30s)
        // This ensures hosting grants are detected even if Realtime replication is disabled.
        startPolling()

        let topic = "profile_updates:\(userId)"

        // Setup Postgres change listener for THIS specific user
        let postgresChanges: [[String: Any]] = [[
            "event": "UPDATE",
            "schema": "public",
            "table": "profiles",
            "filter": "id=eq.\(userId)"
        ]]

        do {
            // 2. Register handler
            self.profileHandlerId = await realtimeClient.onPostgresChange(topic: topic) { [weak self] payload in
                Task { @MainActor in
                    print("📡 ProfileRealtimeService: Profile update detected for user: \(userId)")
                    self?.onProfileUpdate?(payload)
                }
            }

            // 3. Connect and Join
            try await realtimeClient.connect()
            try await realtimeClient.joinChannel(topic, postgresChanges: postgresChanges)

            isSubscribed = true
            print("✅ ProfileRealtimeService: Subscribed to profile updates for user: \(userId)")

        } catch {
            print("⚠️ ProfileRealtimeService: Realtime subscription failed (relying on polling): \(error.localizedDescription)")
            isSubscribed = true // We mark as "subscribed" so we don't spam start calls, polling is running
        }
    }

    func stop() async {
        stopPolling()

        if let id = profileHandlerId {
            await realtimeClient.removePostgresChange(id: id)
        }

        profileHandlerId = nil
        isSubscribed = false
        print("🛡️ ProfileRealtimeService: Stopped listeners and polling.")
    }

    // MARK: - Polling Fallback

    private var pollingTimer: Timer?

    private func startPolling() {
        stopPolling()
        print("⏲️ ProfileRealtimeService: Starting polling fallback (every 30s)")

        Task { @MainActor in
            self.pollingTimer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
                Task {
                    print("🔍 ProfileRealtimeService: Polling for profile updates...")
                    await LicenseManager.shared.refreshSubscription()
                }
            }
        }
    }

    private func stopPolling() {
        pollingTimer?.invalidate()
        pollingTimer = nil
    }
}
