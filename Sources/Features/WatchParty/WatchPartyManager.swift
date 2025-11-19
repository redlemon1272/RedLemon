import Foundation
import Combine

/// Manages watch party coordination with configurable transport
/// Bridges the gap between existing SyncMessage format and new uWS protocol
@MainActor
class WatchPartyManager: ObservableObject {

    // MARK: - Configuration
    enum TransportType {
        case localLoopback
        case webSocket(url: String)
    }

    // MARK: - Published Properties
    @Published var isConnected: Bool = false
    @Published var connectionState: RealtimeConnectionState = .disconnected
    @Published var participants: [String: String] = [:] // userId: userName
    @Published var currentTransport: TransportType = .localLoopback

    // MARK: - Properties
    private var transport: WatchPartyTransport?
    private var syncCallback: ((SyncMessage) -> Void)?
    private var presenceCallback: ((PresenceAction, String) -> Void)?
    private var connectionStateCallback: ((RealtimeConnectionState) -> Void)?

    // Sync state
    private var lastKnownPosition: TimeInterval = 0
    private var lastKnownPlayingState: Bool = false
    private var currentUser: UUID = UUID()

    // MARK: - Initialization

    init(transportType: TransportType = .localLoopback) {
        self.currentTransport = transportType
        setupTransport()
    }

    // MARK: - Public Interface

    func setTransport(_ type: TransportType) {
        guard isConnected == false else {
            print("⚠️ Cannot change transport while connected")
            return
        }

        currentTransport = type
        setupTransport()
    }

    func connect(roomId: String, userId: String, isHost: Bool) async throws {
        // Use a simple token for now - in production this would be a Supabase JWT
        let token = isHost ? "host-token" : "guest-token"
        let role: Role = isHost ? .host : .guest

        updateConnectionState(.connecting)

        try await transport?.connect(token: token, roomId: roomId, role: role)

        isConnected = true
        updateConnectionState(.connected)

        print("✅ WatchParty connected to room: \(roomId)")
    }

    func disconnect() async {
        transport?.disconnect()
        isConnected = false
        updateConnectionState(.disconnected)
        participants.removeAll()

        print("🔌 WatchParty disconnected")
    }

    func sendSyncMessage(_ message: SyncMessage) async {
        guard isConnected else {
            print("⚠️ Cannot send sync message - not connected")
            return
        }

        // Convert SyncMessage to OutgoingMessage based on type
        let outgoingMessage = convertToOutgoingMessage(message)
        await transport?.send(outgoingMessage)

        // Update local state
        updateLocalState(from: message)
    }

    func sendChatMessage(text: String, username: String) async {
        guard isConnected else {
            print("⚠️ Cannot send chat message - not connected")
            return
        }

        await transport?.send(.chat(text: text))
    }

    func sendPlayCommand() async {
        await transport?.send(.play)
        lastKnownPlayingState = true
    }

    func sendPauseCommand() async {
        await transport?.send(.pause)
        lastKnownPlayingState = false
    }

    func sendSeekCommand(positionMs: Int) async {
        await transport?.send(.seek(positionMs: positionMs))
        lastKnownPosition = TimeInterval(positionMs) / 1000.0
    }

    func sendHeartbeat(positionMs: Int, playing: Bool) async {
        await transport?.send(.heartbeat(positionMs: positionMs, playing: playing))
        lastKnownPosition = TimeInterval(positionMs) / 1000.0
        lastKnownPlayingState = playing
    }

    // MARK: - Callbacks

    func onSync(_ callback: @escaping (SyncMessage) -> Void) {
        self.syncCallback = callback
    }

    func onPresenceChange(_ callback: @escaping (PresenceAction, String) -> Void) {
        self.presenceCallback = callback
    }

    func onConnectionStateChange(_ callback: @escaping (RealtimeConnectionState) -> Void) {
        self.connectionStateCallback = callback
    }

    // MARK: - Private Methods

    private func setupTransport() {
        switch currentTransport {
        case .localLoopback:
            transport = LocalLoopbackTransport()
        case .webSocket(let url):
            transport = WebSocketTransport(endpoint: url)
        }

        transport?.delegate = self
        print("🔧 Set up transport: \(type(of: transport!))")
    }

    private func updateConnectionState(_ state: RealtimeConnectionState) {
        connectionState = state
        connectionStateCallback?(state)
    }

    private func updateLocalState(from message: SyncMessage) {
        lastKnownPosition = message.position
        if let playing = message.isPlaying {
            lastKnownPlayingState = playing
        }
    }

    private func convertToOutgoingMessage(_ message: SyncMessage) -> OutgoingMessage {
        switch message.type {
        case .play:
            return .play
        case .pause:
            return .pause
        case .seek:
            return .seek(positionMs: Int(message.position * 1000))
        case .playbackState:
            // Convert to heartbeat
            return .heartbeat(
                positionMs: Int(message.position * 1000),
                playing: message.isPlaying ?? false
            )
        case .chat:
            // This should be handled separately
            return .heartbeat(positionMs: 0, playing: false)
        case .ping, .pong:
            // Not used in new protocol
            return .heartbeat(positionMs: 0, playing: false)
        }
    }

    private func convertFromTransportState(_ state: StateUpdate) -> SyncMessage {
        return SyncMessage(
            type: .playbackState,
            timestamp: Date().timeIntervalSince1970,
            position: TimeInterval(state.positionMs) / 1000.0,
            isPlaying: state.playing,
            senderId: state.updatedBy.uuidString
        )
    }

    private func convertFromTransportChat(_ chat: ChatMessageWire) -> SyncMessage {
        let fallbackUsername = "User \(chat.from.uuidString.prefix(8))"
        return SyncMessage(
            type: .chat,
            timestamp: chat.timestamp.timeIntervalSince1970,
            position: 0,
            isPlaying: nil,
            senderId: chat.from.uuidString,
            chatText: chat.text,
            chatUsername: fallbackUsername // TODO: Map userId to username
        )
    }
}

// MARK: - WatchPartyTransportDelegate

extension WatchPartyManager: WatchPartyTransportDelegate {

    func transportDidReceiveState(_ state: StateUpdate) {
        let syncMessage = convertFromTransportState(state)
        updateLocalState(from: syncMessage)

        DispatchQueue.main.async {
            self.syncCallback?(syncMessage)
        }
    }

    func transportDidReceiveChat(_ message: ChatMessageWire) {
        let syncMessage = convertFromTransportChat(message)

        DispatchQueue.main.async {
            self.syncCallback?(syncMessage)
        }
    }

    func transportDidUpdatePresence(userId: UUID, event: PresenceEvent) {
        let userIdString = userId.uuidString
        let presenceAction: PresenceAction = event == .join ? .join : .leave

        DispatchQueue.main.async {
            // Update participants list
            switch event {
            case .join:
                self.participants[userIdString] = "User \(self.participants.count + 1)"
            case .leave:
                self.participants.removeValue(forKey: userIdString)
            }

            self.presenceCallback?(presenceAction, userIdString)
        }
    }

    func transportDidRequestReconnect() {
        DispatchQueue.main.async {
            self.updateConnectionState(.failed)
        }
    }
}

// MARK: - Convenience Extensions

extension WatchPartyManager {

    /// Get interpolated position based on last known state and time
    func getInterpolatedPosition() -> TimeInterval {
        guard lastKnownPlayingState else {
            return lastKnownPosition
        }

        let timeSinceLastUpdate = Date().timeIntervalSince1970 - (lastKnownPosition)
        return lastKnownPosition + timeSinceLastUpdate
    }

    /// Check if connected to the transport
    func isTransportConnected() -> Bool {
        return isConnected
    }
}

// MARK: - Settings Integration

extension WatchPartyManager {

    /// Load transport type from UserDefaults
    func loadTransportSettings() {
        let useWebSocket = UserDefaults.standard.bool(forKey: "watchPartyUseWebSocket")
        let webSocketURL = UserDefaults.standard.string(forKey: "watchPartyWebSocketURL") ?? "ws://151.243.109.217:8080"

        setTransport(useWebSocket ? .webSocket(url: webSocketURL) : .localLoopback)
    }

    /// Save transport type to UserDefaults
    func saveTransportSettings() {
        switch currentTransport {
        case .localLoopback:
            UserDefaults.standard.set(false, forKey: "watchPartyUseWebSocket")
        case .webSocket(let url):
            UserDefaults.standard.set(true, forKey: "watchPartyUseWebSocket")
            UserDefaults.standard.set(url, forKey: "watchPartyWebSocketURL")
        }
    }
}
