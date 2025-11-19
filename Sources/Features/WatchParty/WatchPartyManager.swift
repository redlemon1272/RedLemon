import Foundation
import Combine

/// Manages watch party coordination with configurable transport
/// Bridges gap between existing SyncMessage format and new uWS protocol
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
    weak var delegate: WatchPartyManagerDelegate?

    // Sync state
    private var lastKnownPosition: TimeInterval = 0
    private var lastKnownPlayingState: Bool = false
    private var currentUser: UUID = UUID()

    // Room and role state
    private var currentRoom: WatchPartyRoom?
    private var isHost: Bool = false

    // MARK: - Initialization

    init(transportType: TransportType = .webSocket(url: "wss://151.243.109.217.nip.io/ws")) {
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

    func setRoom(_ room: WatchPartyRoom, isHost: Bool) {
        self.currentRoom = room
        self.isHost = isHost
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

    // MARK: - Stream Synchronization

    func sendStreamSelection(infoHash: String, fileIdx: Int?, quality: String, unlockedURL: String?) async {
        guard isConnected else {
            print("⚠️ Cannot send stream selection - not connected")
            return
        }

        // Update local room state
        if var room = currentRoom {
            room.selectedStreamHash = infoHash
            room.selectedFileIdx = fileIdx
            room.selectedQuality = quality
            room.unlockedStreamURL = unlockedURL
            currentRoom = room
        }

        await transport?.send(.streamSelected(
            infoHash: infoHash,
            fileIdx: fileIdx,
            quality: quality,
            unlockedURL: unlockedURL
        ))

        print("🎬 Sent stream selection: \(infoHash) (file: \(fileIdx ?? -1), quality: \(quality))")
    }

    func requestStream() async {
        guard isConnected else {
            print("⚠️ Cannot request stream - not connected")
            return
        }

        await transport?.send(.requestStream)
        print("🎬 Sent stream request")
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
        case .ping, .pong, .streamSelected, .requestStream:
            // Not used in new protocol for outgoing messages
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
        print("🔄 Transport requested reconnect")
        // TODO: Implement reconnection logic
    }

    func transportDidReceiveStreamSelected(infoHash: String, fileIdx: Int?, quality: String, unlockedURL: String?) {
        print("🎬 Received stream selection: \(infoHash) (file: \(fileIdx ?? -1), quality: \(quality))")

        // Update room state with stream information
        if var room = currentRoom {
            room.selectedStreamHash = infoHash
            room.selectedFileIdx = fileIdx
            room.selectedQuality = quality
            room.unlockedStreamURL = unlockedURL
            currentRoom = room
        }

        // Notify delegates of stream update
        delegate?.watchPartyManager(self, didUpdateStream: StreamInfo(
            infoHash: infoHash,
            fileIdx: fileIdx,
            quality: quality,
            unlockedURL: unlockedURL
        ))
    }

    func transportDidReceiveStreamRequest() {
        print("🎬 Received stream request")

        // If host, send current stream info
        if isHost, let room = currentRoom,
           let streamHash = room.selectedStreamHash,
           let quality = room.selectedQuality {

            Task {
                await transport?.send(.streamSelected(
                    infoHash: streamHash,
                    fileIdx: room.selectedFileIdx,
                    quality: quality,
                    unlockedURL: room.unlockedStreamURL
                ))
                print("🎬 Sent stream info to requesting guest")
            }
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

    /// Check if connected to transport
    func isTransportConnected() -> Bool {
        return isConnected
    }
}

// MARK: - Settings Integration

extension WatchPartyManager {

    /// Load transport type from UserDefaults
    func loadTransportSettings() {
        let useWebSocket = UserDefaults.standard.bool(forKey: "watchPartyUseWebSocket")
        let webSocketURL = UserDefaults.standard.string(forKey: "watchPartyWebSocketURL") ?? "wss://151.243.109.217.nip.io/ws"

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
