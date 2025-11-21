import Foundation

/// WebSocket client for Supabase Realtime using native URLSession
/// Compatible with macOS 12+ and Swift 5.7+ - no external dependencies needed
actor SupabaseRealtimeClient {

    // MARK: - Configuration
    private let realtimeURL: String
    private let apiKey: String

    // MARK: - WebSocket State
    private var webSocketTask: URLSessionWebSocketTask?
    private var isConnected = false

    // MARK: - Message Handling
    private var messageHandlers: [String: (String, [String: Any]) -> Void] = [:]
    private var presenceHandlers: [(PresenceAction, String, [String: Any]?) -> Void] = []
    private var connectionHandlers: [(Bool) -> Void] = []

    // MARK: - Channel State
    private var channelName: String?
    private var realtimeTopic: String?  // Full "realtime:*" topic name
    private var joinRef: String?
    private var heartbeatTask: Task<Void, Error>?
    private var receiveTask: Task<Void, Error>?
    private var messageRef = 0

    // MARK: - Initialization

    init(realtimeURL: String, apiKey: String) {
        // Convert https:// to wss://
        if realtimeURL.hasPrefix("https://") {
            self.realtimeURL = realtimeURL.replacingOccurrences(of: "https://", with: "wss://") + "/realtime/v1/websocket"
        } else if realtimeURL.hasPrefix("http://") {
            self.realtimeURL = realtimeURL.replacingOccurrences(of: "http://", with: "ws://") + "/realtime/v1/websocket"
        } else {
            self.realtimeURL = realtimeURL
        }
        self.apiKey = apiKey
    }

    // MARK: - Connection Management

    func connect() async throws {
        guard !isConnected else { return }

        print("🔌 Connecting to Supabase Realtime: \(realtimeURL)")

        // Build URL with query parameters
        guard var urlComponents = URLComponents(string: realtimeURL) else {
            throw RealtimeError.invalidURL
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "vsn", value: "1.0.0")
        ]

        guard let url = urlComponents.url else {
            throw RealtimeError.invalidURL
        }

        // Create URLSession configuration
        let session = URLSession(configuration: .default)

        // Create WebSocket task
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apikey")

        let task = session.webSocketTask(with: request)
        self.webSocketTask = task

        // Resume the task to connect
        task.resume()

        self.isConnected = true

        print("✅ Connected to Supabase Realtime")

        // Notify connection handlers
        for handler in connectionHandlers {
            handler(true)
        }

        // Start receiving messages
        startReceivingMessages()

        // Start heartbeat
        startHeartbeat()
    }

    func disconnect() async {
        // Prevent recursive calls
        guard isConnected || webSocketTask != nil else {
            return
        }

        print("🔌 Disconnecting from Supabase Realtime")

        // Cancel tasks and WebSocket FIRST to break the receive loop
        heartbeatTask?.cancel()
        heartbeatTask = nil

        receiveTask?.cancel()
        receiveTask = nil

        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil

        // Set to false AFTER canceling so the loop can exit cleanly
        self.isConnected = false

        // Notify connection handlers
        for handler in connectionHandlers {
            handler(false)
        }

        print("✅ Disconnected from Supabase Realtime")
    }

    // MARK: - Channel Management

    func joinChannel(_ channelName: String, postgresChanges: [[String: Any]]? = nil) async throws {
        guard isConnected else {
            throw RealtimeError.notConnected
        }

        self.channelName = channelName
        self.joinRef = UUID().uuidString

        // Supabase Realtime expects channels in format "realtime:*"
        let topic = channelName.hasPrefix("realtime:") ? channelName : "realtime:\(channelName)"
        self.realtimeTopic = topic

        var config: [String: Any] = [
            "broadcast": ["self": true],
            "presence": ["key": ""]
        ]
        
        if let changes = postgresChanges {
            config["postgres_changes"] = changes
        }

        let message: [String: Any] = [
            "topic": topic,
            "event": "phx_join",
            "payload": [
                "config": config
            ],
            "ref": joinRef!
        ]

        try await sendMessage(message)
        print("📡 Joined channel: \(topic)")
    }

    func leaveChannel() async throws {
        guard let topic = realtimeTopic else { return }

        let message: [String: Any] = [
            "topic": topic,
            "event": "phx_leave",
            "payload": [:],
            "ref": nextRef()
        ]

        try await sendMessage(message)
        self.channelName = nil
        self.realtimeTopic = nil
        self.joinRef = nil
    }

    func isJoined(to channel: String) -> Bool {
        let topic = channel.hasPrefix("realtime:") ? channel : "realtime:\(channel)"
        return isConnected && realtimeTopic == topic
    }

    // MARK: - Broadcasting

    func broadcast(event: String, payload: [String: Any]) async throws {
        guard let topic = realtimeTopic else {
            throw RealtimeError.notJoined
        }

        let message: [String: Any] = [
            "topic": topic,
            "event": "broadcast",
            "payload": [
                "type": "broadcast",
                "event": event,
                "payload": payload
            ],
            "ref": nextRef()
        ]

        try await sendMessage(message)
    }

    // MARK: - Presence

    func track(userId: String, metadata: [String: Any]) async throws {
        guard let topic = realtimeTopic else {
            throw RealtimeError.notJoined
        }

        let message: [String: Any] = [
            "topic": topic,
            "event": "presence",
            "payload": [
                "type": "presence",
                "event": "track",
                "payload": [
                    "user_id": userId
                ].merging(metadata) { $1 }
            ],
            "ref": nextRef()
        ]

        try await sendMessage(message)
    }

    func untrack() async throws {
        guard let topic = realtimeTopic else {
            throw RealtimeError.notJoined
        }

        let message: [String: Any] = [
            "topic": topic,
            "event": "presence",
            "payload": [
                "type": "presence",
                "event": "untrack"
            ],
            "ref": nextRef()
        ]

        try await sendMessage(message)
    }

    // MARK: - Event Handlers

    func onBroadcast(event: String, handler: @escaping (String, [String: Any]) -> Void) {
        messageHandlers[event] = handler
    }

    func onPresence(handler: @escaping (PresenceAction, String, [String: Any]?) -> Void) {
        presenceHandlers.append(handler)
    }

    func onConnectionChange(handler: @escaping (Bool) -> Void) {
        connectionHandlers.append(handler)
    }

    // MARK: - Private Methods

    private func sendMessage(_ message: [String: Any]) async throws {
        guard let task = webSocketTask else {
            throw RealtimeError.notConnected
        }

        let jsonData = try JSONSerialization.data(withJSONObject: message)
        let text = String(data: jsonData, encoding: .utf8) ?? ""

        let wsMessage = URLSessionWebSocketTask.Message.string(text)
        try await task.send(wsMessage)
    }

    private func startReceivingMessages() {
        receiveTask = Task {
            while isConnected {
                do {
                    guard let task = webSocketTask else { break }

                    let message = try await task.receive()

                    // Check again after await - we might have disconnected
                    guard isConnected else { break }

                    switch message {
                    case .string(let text):
                        print("📨 Received: \(text)")
                        handleIncomingMessage(text)
                    case .data(let data):
                        if let text = String(data: data, encoding: .utf8) {
                            print("📨 Received (binary): \(text)")
                            handleIncomingMessage(text)
                        }
                    @unknown default:
                        break
                    }
                } catch {
                    // Only log error if we're still supposed to be connected
                    if isConnected {
                        print("❌ Error receiving message: \(error)")
                        // Connection lost, notify handlers
                        await disconnect()
                    }
                    break
                }
            }
            print("🛑 Receive loop stopped")
        }
    }

    private func handleIncomingMessage(_ text: String) {
        guard let data = text.data(using: .utf8),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let event = json["event"] as? String else {
            return
        }

        // Handle different event types
        switch event {
        case "phx_reply":
            // Handle join/leave replies
            break

        case "broadcast":
            if let payload = json["payload"] as? [String: Any],
               let eventName = payload["event"] as? String,
               let eventPayload = payload["payload"] as? [String: Any],
               let handler = messageHandlers[eventName] {
                handler(eventName, eventPayload)
            }

        case "presence_state", "presence_diff":
            handlePresenceEvent(json)

        case "phx_error":
            print("❌ Realtime error: \(json)")

        case "heartbeat":
            // Heartbeat response
            break

        case "postgres_changes":
            if let payload = json["payload"] as? [String: Any],
               let _ = payload["data"] as? [String: Any] {
                // Notify postgres handlers
                for handler in postgresHandlers {
                    handler(payload)
                }
            }

        default:
            print("📨 Unknown event: \(event)")
        }
    }

    private var postgresHandlers: [([String: Any]) -> Void] = []

    func onPostgresChange(handler: @escaping ([String: Any]) -> Void) {
        postgresHandlers.append(handler)
    }

    private func handlePresenceEvent(_ json: [String: Any]) {
        guard let payload = json["payload"] as? [String: Any],
              let event = json["event"] as? String else { return }

        if event == "presence_diff" {
            // Handle joins
            if let joins = payload["joins"] as? [String: Any] {
                for (userId, data) in joins {
                    let metas = (data as? [String: Any])?["metas"] as? [[String: Any]]
                    let metadata = metas?.first
                    for handler in presenceHandlers {
                        handler(.join, userId, metadata)
                    }
                }
            }

            // Handle leaves
            if let leaves = payload["leaves"] as? [String: Any] {
                for (userId, data) in leaves {
                    let metas = (data as? [String: Any])?["metas"] as? [[String: Any]]
                    let metadata = metas?.first
                    for handler in presenceHandlers {
                        handler(.leave, userId, metadata)
                    }
                }
            }
        } else if event == "presence_state" {
            // Initial state - treat all as joins
            for (userId, data) in payload {
                let metas = (data as? [String: Any])?["metas"] as? [[String: Any]]
                let metadata = metas?.first
                for handler in presenceHandlers {
                    handler(.join, userId, metadata)
                }
            }
        }
    }

    private func startHeartbeat() {
        heartbeatTask = Task {
            while !Task.isCancelled {
                do {
                    try await Task.sleep(nanoseconds: 30_000_000_000) // 30 seconds

                    let message: [String: Any] = [
                        "topic": "phoenix",
                        "event": "heartbeat",
                        "payload": [:],
                        "ref": nextRef()
                    ]

                    try await sendMessage(message)
                    print("💓 Heartbeat sent")
                } catch {
                    print("❌ Heartbeat failed: \(error)")
                    if isConnected {
                        await disconnect()
                    }
                    break
                }
            }
        }
    }

    private func nextRef() -> String {
        messageRef += 1
        return String(messageRef)
    }
}

// MARK: - Errors

enum RealtimeError: Error {
    case invalidURL
    case notConnected
    case notJoined
    case connectionFailed(Error)
    case notInitialized
    case invalidMessage
    case channelNotReady
    case connectionTimeout
}
