import Foundation

// MARK: - Realtime Connection States
enum RealtimeConnectionState {
    case disconnected
    case connecting
    case connected
    case failed
}

// MARK: - Realtime Channel Manager for Watch Party Sync
/// Manages Supabase Realtime channels for watch party synchronization
/// Uses custom WebSocket client instead of Supabase SDK
actor RealtimeChannelManager {

    // MARK: - Configuration
    private let realtimeClient: SupabaseRealtimeClient

    // Sync thresholds (optimized for Realtime implementation)
    private let smallDriftThreshold: TimeInterval = 0.05  // 50ms - perfect sync
    private let mediumDriftThreshold: TimeInterval = 0.5   // 500ms - subtle adjust
    private let largeDriftThreshold: TimeInterval = 2.0    // 2s - aggressive adjust
    private let minPlaybackRate: Double = 0.95             // Slowest playback rate
    private let maxPlaybackRate: Double = 1.25             // Fastest playback rate

    // MARK: - State
    private let eventName = "sync"
    private var isHost: Bool = false
    private var roomId: String?
    private var userId: String?

    // Connection state tracking
    private var isConnected: Bool = false
    private var isDisconnecting: Bool = false

    // Latency tracking (for sync compensation)
    private var latencySamples: [TimeInterval] = []
    private let maxLatencySamples = 10
    private var averageLatency: TimeInterval = 0.1  // Start with 100ms estimate

    // Sync state
    private var lastRemoteTimestamp: TimeInterval = 0
    private var lastRemoteUpdateTime: Date = Date()
    private var syncCallback: ((SyncMessage) -> Void)?

    // Connection status callback
    private var connectionStateCallback: ((RealtimeConnectionState) -> Void)?

    // Presence tracking
    private var presenceCallback: ((PresenceAction, String) -> Void)?

    // MARK: - Initialization

    init(realtimeClient: SupabaseRealtimeClient) {
        self.realtimeClient = realtimeClient
    }

    // MARK: - Setup

    func setup(roomId: String, isHost: Bool, userId: String, onSync: @escaping (SyncMessage) -> Void) async throws {
        self.roomId = roomId
        self.isHost = isHost
        self.userId = userId
        self.syncCallback = onSync

        // Create channel with room-specific name
        let channelName = "watch-party:\(roomId)"

        print("🔌 Setting up Realtime channel: \(channelName)")
        print("   Role: \(isHost ? "Host" : "Guest")")
        print("   User ID: \(userId)")

        // Setup connection handlers
        await setupHandlers()

        // Connect to Realtime
        await notifyConnectionStateChange(.connecting)
        try await realtimeClient.connect()

        // Check if already joined
        if await realtimeClient.isJoined(to: channelName) {
            print("ℹ️ Already joined channel \(channelName), skipping join")
        } else {
            // Join the channel
            try await realtimeClient.joinChannel(channelName)
        }

        // Track presence
        try await realtimeClient.track(userId: userId, metadata: [
            "is_host": isHost,
            "joined_at": Date().timeIntervalSince1970
        ])

        isConnected = true
        isDisconnecting = false
        await notifyConnectionStateChange(.connected)

        print("✅ Realtime channel setup complete")
    }

    // MARK: - Message Subscription

    private func setupHandlers() async {
        // Handle broadcast messages
        await realtimeClient.onBroadcast(event: eventName) { _, payload in
            Task { [weak self] in
                await self?.handleBroadcastMessage(payload)
            }
        }

        // Handle presence changes
        await realtimeClient.onPresence { action, userId in
            Task { [weak self] in
                await self?.handlePresenceChange(action, userId: userId)
            }
        }

        // Handle connection changes
        await realtimeClient.onConnectionChange { connected in
            Task { [weak self] in
                await self?.handleConnectionChange(connected)
            }
        }
    }

    private func handleBroadcastMessage(_ payload: [String: Any]) async {
        // Decode the sync message
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: payload)
            let message = try JSONDecoder().decode(SyncMessage.self, from: jsonData)
            handleSyncMessage(message)
        } catch {
            print("⚠️ Failed to decode broadcast message: \(error)")
        }
    }

    private func handlePresenceChange(_ action: PresenceAction, userId: String) async {
        print("👥 Presence \(action == .join ? "joined" : "left"): \(userId)")
        presenceCallback?(action, userId)
    }

    private func handleConnectionChange(_ connected: Bool) async {
        isConnected = connected
        await notifyConnectionStateChange(connected ? .connected : .disconnected)
    }

    // MARK: - Sending Messages

    func sendSyncMessage(_ message: SyncMessage) async throws {
        guard isConnected else {
            print("⚠️ Cannot send sync message - not connected")
            return
        }

        // Convert message to dictionary
        let jsonData = try JSONEncoder().encode(message)
        let payload = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]

        // Broadcast to channel
        try await realtimeClient.broadcast(event: eventName, payload: payload)
    }

    // MARK: - Sync Message Handling

    private func handleSyncMessage(_ message: SyncMessage) {
        // Record timestamp for latency calculation
        let receivedAt = Date().timeIntervalSince1970

        // Update latency estimate
        let latency = receivedAt - message.timestamp
        updateLatencyEstimate(latency)

        // Compensate for network latency (create new message with adjusted position)
        let compensatedPosition = message.position + averageLatency
        let compensatedMessage = SyncMessage(
            type: message.type,
            timestamp: message.timestamp,
            position: compensatedPosition,
            isPlaying: message.isPlaying,
            senderId: message.senderId,
            chatText: message.chatText,
            chatUsername: message.chatUsername
        )

        // Store last remote update time
        lastRemoteTimestamp = compensatedMessage.position
        lastRemoteUpdateTime = Date()

        // Pass to callback
        syncCallback?(compensatedMessage)
    }

    // MARK: - Latency Tracking

    private func updateLatencyEstimate(_ latency: TimeInterval) {
        // Only track positive, reasonable latencies (< 5 seconds)
        guard latency > 0 && latency < 5.0 else { return }

        latencySamples.append(latency)
        if latencySamples.count > maxLatencySamples {
            latencySamples.removeFirst()
        }

        // Calculate average latency
        averageLatency = latencySamples.reduce(0, +) / Double(latencySamples.count)
    }

    // MARK: - Presence Tracking

    private func trackPresence(state: [String: Any]) async throws {
        guard let userId = userId else { return }
        try await realtimeClient.track(userId: userId, metadata: state)
    }

    func onPresenceChange(_ callback: @escaping (PresenceAction, String) -> Void) {
        self.presenceCallback = callback
    }

    // MARK: - Connection State

    private func notifyConnectionStateChange(_ state: RealtimeConnectionState) async {
        print("📡 Connection state: \(state)")
        connectionStateCallback?(state)
    }

    func onConnectionStateChange(_ callback: @escaping (RealtimeConnectionState) -> Void) {
        self.connectionStateCallback = callback
    }

    private func waitForConnection(timeout: TimeInterval = 10.0) async throws {
        let start = Date()
        while !isConnected {
            if Date().timeIntervalSince(start) > timeout {
                throw RealtimeError.notConnected
            }
            try await Task.sleep(nanoseconds: 100_000_000) // 100ms
        }
    }

    // MARK: - Cleanup

    func cleanup(leaveChannel: Bool = true, disconnectClient: Bool = true) async {
        // Prevent double cleanup or cleanup while already disconnecting
        guard !isDisconnecting else {
            print("⚠️ Cleanup already in progress, skipping")
            return
        }
        
        // If we are not connected and not just trying to disconnect the client, we might be able to skip
        // But we should be careful. The safest is to check if we have anything to clean up.
        if !isConnected && !disconnectClient {
             print("ℹ️ Already disconnected, skipping cleanup")
             return
        }

        isDisconnecting = true
        print("🧹 Cleaning up Realtime channel for room: \(roomId ?? "unknown")")

        do {
            // Only untrack if we are connected
            if isConnected {
                print("🔄 Untracking presence...")
                try await realtimeClient.untrack()
                print("✅ Presence untracked")
            }

            if leaveChannel {
                print("🔄 Leaving channel...")
                try await realtimeClient.leaveChannel()
                print("✅ Channel left")
            } else {
                print("ℹ️ Keeping channel joined (leaveChannel=false)")
            }

            if disconnectClient {
                print("🔄 Disconnecting WebSocket...")
                await realtimeClient.disconnect()
                print("✅ WebSocket disconnected")
            } else {
                print("ℹ️ Keeping WebSocket connected (disconnectClient=false)")
            }
        } catch {
            print("⚠️ Error during cleanup: \(error)")
        }

        isConnected = false
        isDisconnecting = false
        roomId = nil
        userId = nil
        syncCallback = nil
        presenceCallback = nil
        connectionStateCallback = nil

        print("✅ Realtime channel cleanup complete")
    }

    /// Disconnect from the realtime channel
    func disconnect(leaveChannel: Bool = true, disconnectClient: Bool = true) async {
        await cleanup(leaveChannel: leaveChannel, disconnectClient: disconnectClient)
    }

    /// Check if realtime is connected
    func isRealtimeConnected() -> Bool {
        return isConnected
    }

    /// Set connection state callback (for compatibility)
    func setConnectionStateCallback(_ callback: @escaping (RealtimeConnectionState) -> Void) {
        self.connectionStateCallback = callback
    }

    /// Set presence callback (for compatibility)
    func setPresenceCallback(_ callback: @escaping (PresenceAction, String) -> Void) {
        self.presenceCallback = callback
    }

    deinit {
        print("♻️ RealtimeChannelManager deinitialized")
    }
}

// MARK: - Helper Extensions

extension RealtimeChannelManager {
    /// Get interpolated position based on last known remote position
    func getInterpolatedPosition() -> TimeInterval {
        let timeSinceLastUpdate = Date().timeIntervalSince(lastRemoteUpdateTime)
        // Assume playback continues at normal speed
        return lastRemoteTimestamp + timeSinceLastUpdate
    }
}
