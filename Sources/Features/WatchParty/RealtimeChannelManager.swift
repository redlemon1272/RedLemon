import Foundation

// MARK: - Realtime Connection States
enum RealtimeConnectionState {
    case disconnected
    case connecting
    case connected
    case failed
}

/// Protocol for RealtimeChannelManager to enable mocking
protocol RealtimeService: Actor {
    func setup(roomId: String, isHost: Bool, userId: String, username: String, postgresChanges: [[String: Any]]?, onSync: @escaping (SyncMessage) -> Void) async throws
    func sendSyncMessage(_ message: SyncMessage) async throws
    func disconnect(leaveChannel: Bool, disconnectClient: Bool) async
    func cleanup(leaveChannel: Bool, disconnectClient: Bool) async
    func isRealtimeConnected() -> Bool
    func setConnectionStateCallback(_ callback: @escaping (RealtimeConnectionState) -> Void)
    func setPresenceCallback(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void)
    func onPresenceChange(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void)
    func onConnectionStateChange(_ callback: @escaping (RealtimeConnectionState) -> Void)
    func setPostgresCallback(_ callback: @escaping ([String: Any]) -> Void)
}

// MARK: - Realtime Channel Manager for Watch Party Sync
/// Manages Supabase Realtime channels for watch party synchronization
/// Uses custom WebSocket client instead of Supabase SDK
actor RealtimeChannelManager: RealtimeService {

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
    private var presenceCallback: ((PresenceAction, String, [String: Any]?) -> Void)?
    
    // Postgres tracking
    private var postgresCallback: (([String: Any]) -> Void)?

    // MARK: - Initialization

    init(realtimeClient: SupabaseRealtimeClient) {
        self.realtimeClient = realtimeClient
    }

    // MARK: - Setup

    func setup(roomId: String, isHost: Bool, userId: String, username: String, postgresChanges: [[String: Any]]? = nil, onSync: @escaping (SyncMessage) -> Void) async throws {
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
            try await realtimeClient.joinChannel(channelName, postgresChanges: postgresChanges)
        }

        // Track presence
        try await realtimeClient.track(userId: userId, metadata: [
            "is_host": isHost,
            "joined_at": Date().timeIntervalSince1970,
            "username": username,
            "user_id": userId
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
        await realtimeClient.onPresence { action, userId, metadata in
            Task { @MainActor in
                await self.handlePresenceUpdate(action: action, userId: userId, metadata: metadata)
            }
        }

        // Handle connection changes
        await realtimeClient.onConnectionChange { connected in
            Task { [weak self] in
                await self?.handleConnectionChange(connected)
            }
        }
        
        // Handle postgres changes
        await realtimeClient.onPostgresChange { payload in
            Task { [weak self] in
               await self?.handlePostgresChange(payload)
            }
        }
        
        // Start monitoring connection for auto-reconnect
        await monitorConnection()
    }
    
    /// Monitors connection state and attempts to reconnect if dropped unexpectedly
    private func monitorConnection() async {
        await realtimeClient.onConnectionChange { [weak self] connected in
            guard let self = self else { return }
            
            Task {
                // Update local state
                await self.handleConnectionChange(connected)
                
                // Auto-Reconnect Logic
                let isDisconnectingLocal = await self.isDisconnecting
                
                if !connected && !isDisconnectingLocal {
                    print("⚠️ Realtime: Connection lost. Attempting auto-reconnect in 2s...")
                    await self.logError("Realtime connection lost unexpectedly. Reconnecting...")
                    
                    try? await Task.sleep(nanoseconds: 2_000_000_000) // 2s
                    
                    // Double check we haven't started disconnecting in the meantime
                    // We must re-fetch the actor state
                    let isDisconnectingNow = await self.isDisconnecting
                    let isConnectedNow = await self.isConnected
                    
                    if !isDisconnectingNow && !isConnectedNow {
                        print("🔄 Realtime: Reconnecting now...")
                        do {
                            try await self.realtimeClient.connect()
                            print("✅ Realtime: Rejoin requested")
                        } catch {
                            print("❌ Realtime: Reconnect failed: \(error)")
                            await self.logError("Auto-reconnect failed: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Telemetry
    
    private func logError(_ message: String) {
        Task {
            // Bridge to SupabaseClient for server-side logging
            // We use 'error' level for these runtime failures
            try? await SupabaseClient.shared.insertLog(
                level: "error", 
                message: "[Realtime] \(message)",
                metadata: ["room_id": roomId ?? "unknown", "user_id": userId ?? "unknown"]
            )
        }
    }
    
    // New method to handle postgres changes
    private func handlePostgresChange(_ payload: [String: Any]) async {
        postgresCallback?(payload)
    }

    private func handlePresenceUpdate(action: PresenceAction, userId: String, metadata: [String: Any]?) {
        presenceCallback?(action, userId, metadata)
    }

    private func handleBroadcastMessage(_ payload: [String: Any]) async {
        NSLog("📨 Realtime: Received broadcast message")
        NSLog("   Payload keys: \(payload.keys.joined(separator: ", "))")
        
        // Decode the sync message
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: payload)
            let message = try JSONDecoder().decode(SyncMessage.self, from: jsonData)
            NSLog("✅ Realtime: Decoded message type: \(message.type), sender: \(message.senderId ?? "unknown")")
            handleSyncMessage(message)
        } catch {
            let errorMsg = "Failed to decode broadcast message: \(error)"
            NSLog("❌ Realtime: \(errorMsg)")
            NSLog("   Payload: \(payload)")
            logError(errorMsg + " Payload keys: \(payload.keys)")
        }
    }

    private func handlePresenceChange(_ action: PresenceAction, userId: String, metadata: [String: Any]?) async {
        print("👥 Presence \(action == .join ? "joined" : "left"): \(userId)")
        presenceCallback?(action, userId, metadata)
    }

    private func handleConnectionChange(_ connected: Bool) async {
        isConnected = connected
        await notifyConnectionStateChange(connected ? .connected : .disconnected)
    }

    // MARK: - Sending Messages

    func setPostgresCallback(_ callback: @escaping ([String: Any]) -> Void) {
        self.postgresCallback = callback
    }
    
    func sendSyncMessage(_ message: SyncMessage) async throws {
        guard isConnected else {
            NSLog("⚠️ Realtime: Cannot send sync message - not connected")
            return
        }

        NSLog("📤 Realtime: Sending message type: \(message.type), sender: \(message.senderId ?? "unknown")")
        
        // Convert message to dictionary
        let jsonData = try JSONEncoder().encode(message)
        let payload = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]
        
        NSLog("   Payload keys: \(payload.keys.joined(separator: ", "))")
        
        // Broadcast to channel
        try await realtimeClient.broadcast(event: eventName, payload: payload)
        NSLog("✅ Realtime: Message broadcast complete")
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
            chatUsername: message.chatUsername,
            infoHash: message.infoHash,
            fileIdx: message.fileIdx,
            quality: message.quality,
            unlockedURL: message.unlockedURL,
            isPremium: message.isPremium
        )

        // Store last remote update time
        lastRemoteTimestamp = compensatedMessage.position
        lastRemoteUpdateTime = Date()

        // CRITICAL: Log callback status before invoking
        if syncCallback == nil {
            NSLog("❌ Realtime: syncCallback is NIL, cannot deliver message type: \(message.type)")
            return
        }
        
        NSLog("📞 Realtime: Invoking syncCallback for message type: \(message.type)")
        
        // Pass to callback
        syncCallback?(compensatedMessage)
        
        NSLog("✅ Realtime: syncCallback invoked successfully")
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

    func onPresenceChange(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void) {
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
        
        let capturedRoomId = self.roomId
        
        // If we are not connected and not just trying to disconnect the client, we might be able to skip
        // But we should be careful. The safest is to check if we have anything to clean up.
        if !isConnected && !disconnectClient {
             print("ℹ️ Already disconnected, skipping cleanup")
             return
        }

        isDisconnecting = true
        print("🧹 Cleaning up Realtime channel for room: \(capturedRoomId ?? "unknown")")

        // Construct topic for scoped cleanup
        let topic: String? = capturedRoomId.map { "realtime:watch-party:\($0)" }

        do {
            // Only untrack if we are connected
            if isConnected {
                print("🔄 Untracking presence...")
                // CRITICAL FIX: explicit topic to avoid untracking global presence if topic changed
                if let t = topic {
                    try await realtimeClient.untrack(topic: t)
                } else {
                    try await realtimeClient.untrack()
                }
                print("✅ Presence untracked")
            }

            if leaveChannel {
                print("🔄 Leaving channel...")
                // CRITICAL FIX: explicit topic to avoid leaving wrong channel
                if let t = topic {
                    try await realtimeClient.leaveChannel(topic: t)
                } else {
                    try await realtimeClient.leaveChannel()
                }
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
        postgresCallback = nil // CRITICAL: Stop receiving DB changes
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
    func setPresenceCallback(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void) {
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
