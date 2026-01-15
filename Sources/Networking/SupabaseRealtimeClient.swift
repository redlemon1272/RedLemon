import Foundation

/// WebSocket client for Supabase Realtime using native URLSession
/// Compatible with macOS 12+ and Swift 5.7+ - no external dependencies needed
actor SupabaseRealtimeClient {

    // MARK: - Configuration
    private let realtimeURL: String
    private let apiKey: String
    private let session: URLSession

    // MARK: - WebSocket State
    private var webSocketTask: URLSessionWebSocketTask?
    private var isConnected = false

    // MARK: - Message Handling
    private var messageHandlers: [String: (String, [String: Any]) -> Void] = [:]
    private var presenceHandlers: [UUID: (PresenceAction, String, [String: Any]?) -> Void] = [:]
    private var connectionHandlers: [UUID: (Bool) -> Void] = [:]

    // MARK: - Event Handlers

    func onBroadcast(event: String, handler: @escaping (String, [String: Any]) -> Void) {
        messageHandlers[event] = handler
    }

    @discardableResult
    func onPresence(handler: @escaping (PresenceAction, String, [String: Any]?) -> Void) -> UUID {
        let id = UUID()
        presenceHandlers[id] = handler
        return id
    }

    func removePresenceHandler(id: UUID) {
        presenceHandlers.removeValue(forKey: id)
    }

    @discardableResult
    func onConnectionChange(handler: @escaping (Bool) -> Void) -> UUID {
        let id = UUID()
        connectionHandlers[id] = handler
        return id
    }

    func removeConnectionHandler(id: UUID) {
        connectionHandlers.removeValue(forKey: id)
    }

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
        } else if realtimeURL.hasPrefix("http://") { // OK - handled below
            self.realtimeURL = realtimeURL.replacingOccurrences(of: "http://", with: "ws://") + "/realtime/v1/websocket" // OK - upgrading to WS
        } else {
            self.realtimeURL = realtimeURL
        }
        self.apiKey = apiKey

        // Initialize shared session
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config)
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

        // Create WebSocket task using shared session
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "apikey")

        let task = session.webSocketTask(with: request)
        self.webSocketTask = task

        // Resume the task to connect
        task.resume()

        self.isConnected = true

        print("✅ Connected to Supabase Realtime")

        // Notify connection handlers
        for handler in connectionHandlers.values {
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
        for handler in connectionHandlers.values {
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

    func leaveChannel(topic: String? = nil) async throws {
        // Use provided topic or fall back to current
        guard let targetTopic = topic ?? realtimeTopic else { return }

        let message: [String: Any] = [
            "topic": targetTopic,
            "event": "phx_leave",
            "payload": [:],
            "ref": nextRef()
        ]

        try await sendMessage(message)

        // Only clear local state if we left the currently tracked channel
        if targetTopic == self.realtimeTopic {
            self.channelName = nil
            self.realtimeTopic = nil
            self.joinRef = nil
        }
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

    func untrack(topic: String? = nil) async throws {
        // Use provided topic or fall back to current
        guard let targetTopic = topic ?? realtimeTopic else {
            throw RealtimeError.notJoined
        }

        let message: [String: Any] = [
            "topic": targetTopic,
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
               let data = payload["data"] as? [String: Any] {

                // CRITICAL STANDARDIZATION: Map raw WebSocket keys to "Standard" Supabase SDK format
                // This allows consumers to use payload["new"] and payload["eventType"] reliably.
                var mappedPayload = payload

                // 1. Map event type (UPDATE, INSERT, DELETE)
                if let type = data["type"] as? String {
                    mappedPayload["eventType"] = type
                }

                // 2. Map new record (for INSERT/UPDATE)
                if let record = data["record"] as? [String: Any] {
                    mappedPayload["new"] = record
                }

                // 3. Map old record (for UPDATE/DELETE)
                if let oldRecord = data["old_record"] as? [String: Any] {
                    mappedPayload["old"] = oldRecord
                }

                // 4. Inject schema and table at top level for convenience
                if let schema = data["schema"] as? String {
                    mappedPayload["schema"] = schema
                }
                if let table = data["table"] as? String {
                    mappedPayload["table"] = table
                }

                // Notify postgres handlers with standardized payload
                for handler in postgresHandlers.values {
                    handler(mappedPayload)
                }
            }

        case "system":
            if let payload = json["payload"] as? [String: Any],
               let status = payload["status"] as? String,
               status == "error" {
                let msg = payload["message"] as? String ?? "Unknown error"
                print("❌ Realtime System Error: \(msg)")
                // We could broadcast this error if needed, but for now just logging it clearly is enough
            }

        default:
            print("📨 Unknown event: \(event)")
        }
    }

    private var postgresHandlers: [UUID: ([String: Any]) -> Void] = [:]

    @discardableResult
    func onPostgresChange(handler: @escaping ([String: Any]) -> Void) -> UUID {
        let id = UUID()
        postgresHandlers[id] = handler
        return id
    }

    func removePostgresChange(id: UUID) {
        postgresHandlers.removeValue(forKey: id)
    }

    private func handlePresenceEvent(_ json: [String: Any]) {
        guard let payload = json["payload"] as? [String: Any],
              let event = json["event"] as? String else { return }

        if event == "presence_diff" {
            // Handle joins
            if let joins = payload["joins"] as? [String: Any] {
                for (key, data) in joins {
                    let metas = (data as? [String: Any])?["metas"] as? [[String: Any]]
                    let metadata = metas?.first

                    // Pass the Phoenix map key as 'userId' to ensure unique connection tracking.
                    // The actual user's UUID is still inside the metadata dictionary.
                    for handler in presenceHandlers.values {
                        handler(.join, key, metadata)
                    }
                }
            }

            // Handle leaves
            if let leaves = payload["leaves"] as? [String: Any] {
                for (key, data) in leaves {
                    let metas = (data as? [String: Any])?["metas"] as? [[String: Any]]
                    let metadata = metas?.first

                    for handler in presenceHandlers.values {
                        handler(.leave, key, metadata)
                    }
                }
            }
        } else if event == "presence_state" {
            // Initial state - treat all as joins
            for (key, data) in payload {
                let metas = (data as? [String: Any])?["metas"] as? [[String: Any]]
                let metadata = metas?.first

                for handler in presenceHandlers.values {
                    handler(.join, key, metadata)
                }
            }
        }
    }

    private func startHeartbeat() {
        // Cancel any existing heartbeat task to prevent duplicates
        heartbeatTask?.cancel()

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
