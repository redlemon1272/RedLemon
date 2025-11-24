import Foundation
import Combine

/// WebSocket-based transport for watch party realtime communication
/// Implements the WebSocket protocol defined in the architecture docs
final class WebSocketTransport: WatchPartyTransport {

    // MARK: - Configuration
    private let url: URL
    private let maxReconnectAttempts: Int = 10
    private let baseReconnectDelay: TimeInterval = 1.0
    private let maxReconnectDelay: TimeInterval = 30.0
    private let authTimeout: TimeInterval = 5.0

    // MARK: - State
    private var webSocketTask: URLSessionWebSocketTask?
    private var isConnected: Bool = false
    private var reconnectAttempts: Int = 0
    private var lastSeq: Int = 0
    private var pendingReconnect: WorkItem?
    private var allowReconnect: Bool = true
    private var authContinuation: CheckedContinuation<Void, Error>?
    private let authLock = NSLock()
    private var connectionContinuation: CheckedContinuation<Void, Error>?

    // Connection state tracking
    private var connectionState: ConnectionState = .disconnected {
        didSet {
            if connectionState != oldValue {
                print("🔌 WebSocket transport state: \(connectionState)")
                if connectionState == .failed {
                    delegate?.transportDidRequestReconnect()
                }
            }
        }
    }

    enum ConnectionState {
        case disconnected
        case connecting
        case connected
        case failed
    }

    // MARK: - Properties
    weak var delegate: WatchPartyTransportDelegate?
    private var token: String?
    private var roomId: String?
    private var role: Role?
    private var userId: String?

    // MARK: - Initialization

    init(url: URL) {
        self.url = url
    }

    convenience init(endpoint: String) {
        guard let url = URL(string: endpoint) else {
            fatalError("Invalid WebSocket endpoint: \(endpoint)")
        }
        self.init(url: url)
    }

    // MARK: - WatchPartyTransport Protocol

    func connect(token: String, roomId: String, role: Role) async throws {
        guard !isConnected else {
            print("⚠️ WebSocket already connected")
            return
        }

        self.token = token
        self.roomId = roomId
        self.role = role
        self.lastSeq = 0
        self.reconnectAttempts = 0
        self.allowReconnect = true

        try await performConnect()
    }

    func disconnect() {
        allowReconnect = false
        isConnected = false
        connectionState = .disconnected
        pendingReconnect?.cancel()
        pendingReconnect = nil
        resolveAuthContinuation(.failure(TransportError.connectionFailed))

        webSocketTask?.cancel(with: .normalClosure, reason: nil)
        webSocketTask = nil

        print("🔌 WebSocket disconnected")
    }

    func send(_ message: OutgoingMessage) async {
        guard isConnected, let webSocketTask = webSocketTask else {
            print("⚠️ Cannot send message - not connected")
            return
        }

        do {
            let jsonString = try encodeMessage(message)
            let wsMessage = URLSessionWebSocketTask.Message.string(jsonString)

            try await webSocketTask.send(wsMessage)
            print("📤 Sent: \(wsMessage)")
        } catch {
            print("❌ Failed to send message: \(error)")
            await handleConnectionError()
        }
    }

    // MARK: - Private Methods

    private func performConnect() async throws {
        connectionState = .connecting

        let urlSession = URLSession(configuration: .default)
        webSocketTask = urlSession.webSocketTask(with: url)

        // Set up message handling
        Task { [weak self] in
            await self?.handleIncomingMessages()
        }

        // Start the connection
        webSocketTask?.resume()

        // Wait for connection and send auth
        try await waitForConnectionAndAuth()
    }

    private func waitForConnectionAndAuth() async throws {
        // Wait a moment for the connection to establish
        try await Task.sleep(nanoseconds: 100_000_000) // 100ms

        // Send authentication message
        try await sendAuthMessage()

        // Wait for auth response with timeout
        try await waitForAuthAck(timeout: authTimeout)

        connectionState = .connected
        isConnected = true
        reconnectAttempts = 0

        print("✅ WebSocket connected and authenticated")
    }

    private func sendAuthMessage() async throws {
        guard let token = token, let roomId = roomId, let role = role else {
            throw TransportError.missingCredentials
        }

        let authMessage: [String: Any] = [
            "type": "auth",
            "token": token,
            "roomId": roomId,
            "role": role == .host ? "host" : "guest",
            "lastSeq": lastSeq
        ]

        let jsonString = try JSONSerialization.data(withJSONObject: authMessage)
        let message = URLSessionWebSocketTask.Message.string(String(data: jsonString, encoding: .utf8) ?? "{}")

        webSocketTask?.send(message) { error in
            if let error = error {
                print("❌ Failed to send auth message: \(error)")
            }
        }
    }

    private func waitForAuthAck(timeout: TimeInterval) async throws {
        try await withCheckedThrowingContinuation { continuation in
            authLock.lock()
            authContinuation = continuation
            authLock.unlock()
            
            Task { [weak self] in
                try? await Task.sleep(nanoseconds: UInt64(timeout * 1_000_000_000))
                guard let self = self else { return }
                
                self.authLock.lock()
                defer { self.authLock.unlock() }
                
                if let pending = self.authContinuation {
                    self.authContinuation = nil // Clear continuation after timeout
                    pending.resume(throwing: TransportError.authTimeout)
                }
            }
        }
    }

    private func handleIncomingMessages() async {
        while let webSocketTask = webSocketTask {
            do {
                let message = try await webSocketTask.receive()

                switch message {
                case .string(let text):
                    await handleTextMessage(text)
                case .data(let data):
                    print("📥 Received binary data: \(data.count) bytes")
                @unknown default:
                    print("📥 Received unknown message type")
                }
            } catch {
                print("❌ WebSocket receive error: \(error)")
                await handleConnectionError()
                break
            }
        }
    }

    private func handleTextMessage(_ text: String) async {
        guard let data = text.data(using: .utf8),
              let message = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            print("⚠️ Failed to parse message: \(text)")
            return
        }

        guard let type = message["type"] as? String else {
            print("⚠️ Message missing type: \(message)")
            return
        }

        switch type {
        case "auth_ok":
            await handleAuthResponse(message)
        case "auth_error":
            await handleAuthError(message)
        case "state":
            await handleStateUpdate(message)
        case "chat":
            await handleChatMessage(message)
        case "presence":
            await handlePresenceUpdate(message)
        case "state_snapshot":
            await handleStateSnapshot(message)
        case "stream_selected":
            await handleStreamSelected(message)
        default:
            print("⚠️ Unknown message type: \(type)")
        }
    }

    private func handleAuthResponse(_ message: [String: Any]) async {
        if let seq = message["seq"] as? Int {
            lastSeq = seq
        }
        if let userId = message["userId"] as? String {
            self.userId = userId
        }
        print("✅ Authentication successful")
        resolveAuthContinuation(.success(()))
    }

    private func handleAuthError(_ message: [String: Any]) async {
        print("❌ Authentication failed: \(message)")
        connectionState = .failed
        resolveAuthContinuation(.failure(TransportError.authFailed))
        delegate?.transportDidRequestReconnect()
    }

    private func handleStateUpdate(_ message: [String: Any]) async {
        guard let seq = message["seq"] as? Int,
              let userIdString = message["userId"] as? String,
              let userId = UUID(uuidString: userIdString) else {
            print("⚠️ Invalid state message: \(message)")
            return
        }

        lastSeq = seq

        let playing: Bool
        let positionMs: Int

        if let event = message["event"] as? String {
            switch event {
            case "play":
                playing = true
                positionMs = message["positionMs"] as? Int ?? 0
            case "pause":
                playing = false
                positionMs = message["positionMs"] as? Int ?? 0
            case "seek":
                playing = true // Assume playing after seek
                positionMs = message["positionMs"] as? Int ?? 0
            case "heartbeat":
                playing = message["playing"] as? Bool ?? false
                positionMs = message["positionMs"] as? Int ?? 0
            default:
                playing = false
                positionMs = 0
            }
        } else {
            playing = message["playing"] as? Bool ?? false
            positionMs = message["positionMs"] as? Int ?? 0
        }

        let stateUpdate = StateUpdate(
            playing: playing,
            positionMs: positionMs,
            seq: seq,
            updatedBy: userId
        )

        delegate?.transportDidReceiveState(stateUpdate)
    }

    private func handleChatMessage(_ message: [String: Any]) async {
        guard let seq = message["seq"] as? Int,
              let userIdString = message["userId"] as? String,
              let userId = UUID(uuidString: userIdString),
              let text = message["text"] as? String else {
            print("⚠️ Invalid chat message: \(message)")
            return
        }

        lastSeq = seq

        let chatMessage = ChatMessageWire(
            from: userId,
            text: text,
            seq: seq,
            timestamp: Date(timeIntervalSince1970: (message["ts"] as? Double ?? 0) / 1000)
        )

        delegate?.transportDidReceiveChat(chatMessage)
    }

    private func handlePresenceUpdate(_ message: [String: Any]) async {
        guard let seq = message["seq"] as? Int,
              let userIdString = message["userId"] as? String,
              let userId = UUID(uuidString: userIdString),
              let eventString = message["event"] as? String else {
            print("⚠️ Invalid presence message: \(message)")
            return
        }

        lastSeq = seq

        let event: PresenceEvent = eventString == "join" ? .join : .leave
        delegate?.transportDidUpdatePresence(userId: userId, event: event)
    }

    private func handleStateSnapshot(_ message: [String: Any]) async {
        if let seq = message["seq"] as? Int {
            lastSeq = seq
        }
        print("📸 Received state snapshot, updated lastSeq to \(lastSeq)")
    }

    private func handleStreamSelected(_ message: [String: Any]) async {
        guard let seq = message["seq"] as? Int,
              let infoHash = message["infoHash"] as? String,
              let quality = message["quality"] as? String else {
            print("⚠️ Invalid stream selected message: \(message)")
            return
        }

        lastSeq = seq

        let fileIdx = message["fileIdx"] as? Int
        let unlockedURL = message["unlockedURL"] as? String

        delegate?.transportDidReceiveStreamSelected(
            infoHash: infoHash,
            fileIdx: fileIdx,
            quality: quality,
            unlockedURL: unlockedURL
        )

        print("🎬 Received stream selection: \(infoHash) (file: \(fileIdx ?? -1), quality: \(quality))")
    }

    private func encodeMessage(_ message: OutgoingMessage) throws -> String {
        var dict: [String: Any] = [:]

        switch message {
        case .play:
            dict["type"] = "play"
        case .pause:
            dict["type"] = "pause"
        case .seek(let positionMs):
            dict["type"] = "seek"
            dict["positionMs"] = positionMs
        case .chat(let text):
            dict["type"] = "chat"
            dict["text"] = text
        case .heartbeat(let positionMs, let playing):
            dict["type"] = "heartbeat"
            dict["positionMs"] = positionMs
            dict["playing"] = playing
        case .streamSelected(let infoHash, let fileIdx, let quality, let unlockedURL):
            dict["type"] = "stream_selected"
            dict["infoHash"] = infoHash
            dict["fileIdx"] = fileIdx
            dict["quality"] = quality
            dict["unlockedURL"] = unlockedURL
        case .requestStream:
            dict["type"] = "request_stream"
        }

        let data = try JSONSerialization.data(withJSONObject: dict)
        guard let string = String(data: data, encoding: .utf8) else {
            throw TransportError.messageEncodingFailed
        }
        return string
    }

    private func handleConnectionError() async {
        guard allowReconnect else { return }
        isConnected = false
        connectionState = .failed

        // Attempt reconnection with exponential backoff
        await scheduleReconnect()
    }

    private func scheduleReconnect() async {
        guard allowReconnect else { return }
        guard reconnectAttempts < maxReconnectAttempts else {
            print("❌ Max reconnection attempts reached")
            return
        }

        reconnectAttempts += 1
        let delay = min(baseReconnectDelay * pow(2.0, Double(reconnectAttempts - 1)), maxReconnectDelay)

        print("🔄 Scheduling reconnection attempt \(reconnectAttempts)/\(maxReconnectAttempts) in \(delay)s")

        // Cancel any pending reconnect
        pendingReconnect?.cancel()

        pendingReconnect = WorkItem {
            Task { [weak self] in
                await self?.attemptReconnect()
            }
        }

        Task {
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            pendingReconnect?.perform()
        }
    }

    private func attemptReconnect() async {
        guard let _ = token, let _ = roomId, let _ = role else {
            print("⚠️ Cannot reconnect - missing credentials")
            return
        }

        do {
            print("🔄 Attempting to reconnect...")
            try await performConnect()
        } catch {
            print("❌ Reconnection failed: \(error)")
            await handleConnectionError()
        }
    }

    private func resolveAuthContinuation(_ result: Result<Void, Error>) {
        guard let continuation = authContinuation else { return }
        authContinuation = nil
        switch result {
        case .success:
            continuation.resume()
        case .failure(let error):
            continuation.resume(throwing: error)
        }
    }
}

// MARK: - Supporting Types

private class WorkItem {
    private let block: () -> Void
    private var cancelled = false

    init(block: @escaping () -> Void) {
        self.block = block
    }

    func cancel() {
        cancelled = true
    }

    func perform() {
        guard cancelled == false else { return }
        block()
    }
}

// MARK: - Errors

enum TransportError: Error {
    case missingCredentials
    case connectionFailed
    case messageEncodingFailed
    case messageDecodingFailed
    case authFailed
    case authTimeout
}

extension TransportError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingCredentials:
            return "Missing authentication credentials"
        case .connectionFailed:
            return "WebSocket connection failed"
        case .messageEncodingFailed:
            return "Failed to encode message"
        case .messageDecodingFailed:
            return "Failed to decode message"
        case .authFailed:
            return "Authentication failed"
        case .authTimeout:
            return "Authentication timed out"
        }
    }
}
