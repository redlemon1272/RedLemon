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
    func setup(roomId: String, isHost: Bool, userId: String, username: String, isPremium: Bool, subscriptionExpiresAt: TimeInterval?, postgresChanges: [[String: Any]]?) async throws
    func sendSyncMessage(_ message: SyncMessage) async throws
    func disconnect(leaveChannel: Bool, disconnectClient: Bool) async
    func cleanup(leaveChannel: Bool, disconnectClient: Bool) async
    func isRealtimeConnected() async -> Bool
    var roomId: String? { get }

    // Multi-Observer Support
    func registerObserver(id: String, onPresence: ((PresenceAction, String, [String: Any]?) -> Void)?, onSync: ((SyncMessage) -> Void)?, onConnectionState: ((RealtimeConnectionState) -> Void)?) async
    func unregisterObserver(id: String) async

    // Compatibility (should internally call registerObserver with id "default")
    func setConnectionStateCallback(_ callback: @escaping (RealtimeConnectionState) -> Void)
    func setPresenceCallback(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void)
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
    internal var roomId: String?
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
    private var syncCallbacks: [String: (SyncMessage) -> Void] = [:]

    // Connection status callbacks
    private var connectionStateCallbacks: [String: (RealtimeConnectionState) -> Void] = [:]

    // Presence tracking
    private var presenceCallbacks: [String: (PresenceAction, String, [String: Any]?) -> Void] = [:]

    // Postgres tracking
    private var postgresCallbacks: [String: ([String: Any]) -> Void] = [:]

    // Handler IDs for cleanup
    private var presenceHandlerId: UUID?
    private var connectionHandlerId: UUID?
    private var postgresHandlerId: UUID?
    private var broadcastHandlerId: UUID?

    // MARK: - Initialization

    init(realtimeClient: SupabaseRealtimeClient) {
        self.realtimeClient = realtimeClient
    }

    // MARK: - Setup

    func setup(roomId: String, isHost: Bool, userId: String, username: String, isPremium: Bool, subscriptionExpiresAt: TimeInterval?, postgresChanges: [[String: Any]]? = nil) async throws {
        // PREVENT DUPLICATE SETUP:
        // If we represent the SAME room and user, and are already connected, just return.
        if self.roomId?.caseInsensitiveCompare(roomId) == .orderedSame &&
           self.userId?.caseInsensitiveCompare(userId) == .orderedSame &&
           isConnected {
            print("ℹ️ RealtimeChannelManager: Already setup for room \(roomId), filtering duplicate setup call.")
            // CRITICAL FIX: Notify caller that we are connected, otherwise UI stays in "Connecting..." state
            await notifyConnectionStateChange(.connected)
            return
        }

        // AUTO-CLEANUP: If setting up a new room or re-setting up, ensure we clean up old handlers first
        if self.presenceHandlerId != nil || self.connectionHandlerId != nil {
            print("🧹 RealtimeChannelManager: Cleaning up previous handlers before new setup...")
            await removeHandlers()
        }

        self.roomId = roomId
        self.isHost = isHost
        self.userId = userId

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

        // Join the channel (joinChannel handles reference counting and deduplication)
        try await realtimeClient.joinChannel(channelName, postgresChanges: postgresChanges)

        // Track presence
        try await realtimeClient.track(topic: channelName, userId: userId, metadata: [
            "is_host": isHost,
            "joined_at": Date().timeIntervalSince1970,
            "username": username,
            "user_id": userId,
            "is_premium": isPremium,
            "subscription_expires_at": subscriptionExpiresAt as Any
        ])

        isConnected = true
        isDisconnecting = false
        await notifyConnectionStateChange(.connected)

        print("✅ Realtime channel setup complete")
    }

    // MARK: - Message Subscription

    private func setupHandlers() async {
        guard let roomId = self.roomId else { return }
        let channelName = "watch-party:\(roomId)"

        // Handle broadcast messages
        self.broadcastHandlerId = await realtimeClient.onBroadcast(topic: channelName, event: eventName) { _, payload in
            Task.detached { [weak self] in
                await self?.handleBroadcastMessage(payload)
            }
        }

        // Handle presence changes
        self.presenceHandlerId = await realtimeClient.onPresence(topic: channelName) { action, userId, metadata in
            Task.detached { [weak self] in
                await self?.handlePresenceUpdate(action: action, userId: userId, metadata: metadata)
            }
        }

        // Handle connection changes
        self.connectionHandlerId = await realtimeClient.onConnectionChange { connected in
            Task.detached { [weak self] in
                await self?.handleConnectionChange(connected)
            }
        }

        // CRITICAL FIX: Initial state check to ensure UI sync
        // If the shared client is already connected, callbacks won't fire automatically until a change.
        if await realtimeClient.isSocketConnected {
            await handleConnectionChange(true)
        }

        // Handle postgres changes (topic-scoped)
        self.postgresHandlerId = await realtimeClient.onPostgresChange(topic: channelName) { payload in
            Task.detached { [weak self] in
               await self?.handlePostgresChange(payload)
            }
        }

        // Start monitoring connection for auto-reconnect
        await monitorConnection()
    }

    /// Monitors connection state and attempts to reconnect if dropped unexpectedly
    private func monitorConnection() async {
        // Handled by connectionHandler in setupHandlers -> handleConnectionChange
    }

    // MARK: - Telemetry

    private func logError(_ message: String) {
        Task.detached { [weak self] in
            let rId = await self?.roomId ?? "unknown"
            let uId = await self?.userId ?? "unknown"
            // Bridge to SupabaseClient for server-side logging
            try? await SupabaseClient.shared.insertLog(
                level: "error",
                message: "[Realtime] \(message)",
                metadata: ["room_id": rId, "user_id": uId]
            )
        }
    }

    // New method to handle postgres changes
    private func handlePostgresChange(_ payload: [String: Any]) async {
        for callback in postgresCallbacks.values {
            callback(payload)
        }
    }

    private func handlePresenceUpdate(action: PresenceAction, userId: String, metadata: [String: Any]?) {
        for callback in presenceCallbacks.values {
            callback(action, userId, metadata)
        }
    }

    private func handleBroadcastMessage(_ payload: [String: Any]) async {
        NSLog("📨 Realtime: Received broadcast message")
        NSLog("   Payload keys: %@", payload.keys.joined(separator: ", "))

        // Decode the sync message
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: payload)
            let message = try JSONDecoder().decode(SyncMessage.self, from: jsonData)
            NSLog("✅ Realtime: Decoded message type: %@, sender: %@", String(describing: message.type), message.senderId ?? "unknown")
            handleSyncMessage(message)
        } catch {
            let errorMsg = "Failed to decode broadcast message: \(error)"
            NSLog("❌ Realtime: %@", errorMsg)
            NSLog("   Payload: %@", String(describing: payload))
            logError(errorMsg + " Payload keys: \(payload.keys)")
        }
    }

    private func handlePresenceChange(_ action: PresenceAction, userId: String, metadata: [String: Any]?) async {
        print("👥 Presence \(action == .join ? "joined" : "left"): \(userId)")
        for callback in presenceCallbacks.values {
            callback(action, userId, metadata)
        }
    }

    private func handleConnectionChange(_ connected: Bool) async {
        isConnected = connected
        await notifyConnectionStateChange(connected ? .connected : .disconnected)

        // Auto-Reconnect Logic
        if !connected && !isDisconnecting {
            print("⚠️ Realtime: Connection lost. Attempting auto-reconnect in 2s...")
            Task.detached { [weak self] in
                guard let self = self else { return }

                try? await Task.sleep(nanoseconds: 2_000_000_000) // 2s

                // Check state again
                let disconnecting = await self.isDisconnecting
                let alreadyConnected = await self.isConnected

                if !disconnecting && !alreadyConnected {
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

    // MARK: - Sending Messages

    func setPostgresCallback(_ callback: @escaping ([String: Any]) -> Void) {
        self.postgresCallbacks["default"] = callback
    }

    func sendSyncMessage(_ message: SyncMessage) async throws {
        guard isConnected else {
            NSLog("⚠️ Realtime: Cannot send sync message - not connected")
            return
        }

        NSLog("📤 Realtime: Sending message type: %@, sender: %@", String(describing: message.type), message.senderId ?? "unknown")

        // Convert message to dictionary
        let jsonData = try JSONEncoder().encode(message)
        let payload = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]

        NSLog("   Payload keys: %@", payload.keys.joined(separator: ", "))

        // Broadcast to channel
        let channelName = "watch-party:\(roomId!)"
        try await realtimeClient.broadcast(topic: channelName, event: eventName, payload: payload)
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

        // Pass to all registered observers
        for observerId in syncCallbacks.keys {
            if let callback = syncCallbacks[observerId] {
                // NSLog("📞 Realtime: Delivering sync message to observer: \(observerId)")
                callback(compensatedMessage)
            }
        }
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
        guard let userId = userId, let roomId = roomId else { return }
        let channelName = "watch-party:\(roomId)"
        try await realtimeClient.track(topic: channelName, userId: userId, metadata: state)
    }

    // Compatibility (handled via registerObserver)

    // MARK: - Connection State

    private func notifyConnectionStateChange(_ state: RealtimeConnectionState) async {
        print("📡 Connection state: \(state)")
        for callback in connectionStateCallbacks.values {
            callback(state)
        }
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
        // SMART DISCONNECT (v4): Ref-count check via observers
        // If we still have registered observers (e.g., Lobby just closed but Player has joined),
        // we MUST NOT leave the channel or disconnect the client.
        // We only clear our internal handlers.
        let observerCount = presenceCallbacks.count + syncCallbacks.count + connectionStateCallbacks.count

        if observerCount > 0 && leaveChannel {
            NSLog("🤝 Realtime: cleanup() for room %@ delayed - active observers remaining: %d (handoff in progress?)",
                  self.roomId ?? "unknown", observerCount)
            return
        }

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
            // Only untrack/leave if we have a topic
            if let t = topic {
                // Only untrack if we are connected
                if isConnected {
                    print("🔄 Untracking presence on \(t)...")
                    try await realtimeClient.untrack(topic: t)
                    print("✅ Presence untracked")
                }

                if leaveChannel {
                    print("🔄 Leaving channel \(t)...")
                    try await realtimeClient.leaveChannel(topic: t)
                    print("✅ Channel left")
                } else {
                    print("ℹ️ Keeping channel joined (leaveChannel=false)")
                }

                // CRITICAL FIX: Flush delay to ensure 'untrack'/'leave' frames are sent
                try? await Task.sleep(nanoseconds: 200_000_000) // 200ms
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

        // CRITICAL FIX: Notify state change BEFORE clearing callbacks
        // When returning from playback to lobby, LobbyViewModel needs to know
        // the channel is disconnected so it can reconnect. Without this notification,
        // realtimeConnectionStatus stays stale at .connected and connect() skips.
        await notifyConnectionStateChange(.disconnected)

        isDisconnecting = false
        roomId = nil
        userId = nil
        // Stop callbacks
        postgresCallbacks.removeAll()
        connectionStateCallbacks.removeAll()
        syncCallbacks.removeAll()
        presenceCallbacks.removeAll()

        // Clean up handlers
        await removeHandlers()

        print("✅ Realtime channel cleanup complete")
    }

    /// Disconnect from the realtime channel
    func disconnect(leaveChannel: Bool = true, disconnectClient: Bool = true) async {
        await cleanup(leaveChannel: leaveChannel, disconnectClient: disconnectClient)
    }

    /// Check if realtime is connected
    /// CRITICAL FIX (v4): Check actual channel join state, not just cached isConnected.
    /// Multiple RealtimeChannelManager instances share the same SupabaseRealtimeClient.
    /// If one manager leaves the channel (e.g., player cleanup), the underlying channel
    /// is gone but other managers still have isConnected=true (stale).
    func isRealtimeConnected() async -> Bool {
        guard isConnected, let roomId = self.roomId else { return false }
        // Verify the underlying channel is actually joined
        let channelName = "watch-party:\(roomId)"
        return await realtimeClient.isJoined(to: channelName)
    }

    /// Multi-Observer Implementation
    func registerObserver(id: String, onPresence: ((PresenceAction, String, [String: Any]?) -> Void)?, onSync: ((SyncMessage) -> Void)?, onConnectionState: ((RealtimeConnectionState) -> Void)?) async {
        if let onPresence = onPresence {
            presenceCallbacks[id] = onPresence
        }
        if let onSync = onSync {
            syncCallbacks[id] = onSync
        }
        if let onConnectionState = onConnectionState {
            connectionStateCallbacks[id] = onConnectionState
        }
        NSLog("📝 Realtime: Registered observer '%@' (Presence: %@, Sync: %@, Status: %@)",
              id, onPresence != nil ? "YES" : "NO", onSync != nil ? "YES" : "NO", onConnectionState != nil ? "YES" : "NO")
    }

    func unregisterObserver(id: String) async {
        presenceCallbacks.removeValue(forKey: id)
        syncCallbacks.removeValue(forKey: id)
        connectionStateCallbacks.removeValue(forKey: id)
        NSLog("📝 Realtime: Unregistered observer '%@'", id)
    }

    /// Set connection state callback (for compatibility)
    func setConnectionStateCallback(_ callback: @escaping (RealtimeConnectionState) -> Void) {
        connectionStateCallbacks["default"] = callback
    }

    /// Set presence callback (for compatibility)
    func setPresenceCallback(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void) {
        presenceCallbacks["default"] = callback
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

    // Extracted removeHandlers method to be used by both setup() and cleanup()
    private func removeHandlers() async {
        if let id = presenceHandlerId {
            await realtimeClient.removePresenceHandler(id: id)
            presenceHandlerId = nil
        }
        if let id = connectionHandlerId {
            await realtimeClient.removeConnectionHandler(id: id)
            connectionHandlerId = nil
        }
        if let id = postgresHandlerId {
            await realtimeClient.removePostgresChange(id: id)
            postgresHandlerId = nil
        }
        if let id = broadcastHandlerId {
            await realtimeClient.removeBroadcastHandler(id: id)
            broadcastHandlerId = nil
        }
    }
}
