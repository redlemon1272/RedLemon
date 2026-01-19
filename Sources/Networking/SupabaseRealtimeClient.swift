import Foundation

/// WebSocket client for Supabase Realtime using native URLSession
/// Compatible with macOS 12+ and Swift 5.7+ - no external dependencies needed
actor SupabaseRealtimeClient {

    // MARK: - Configuration
    private let realtimeURL: String
    private let apiKey: String
    private let accessToken: String?
    private let session: URLSession

    // MARK: - WebSocket State
    private var webSocketTask: URLSessionWebSocketTask?
    private var isConnected = false
    public var isSocketConnected: Bool { return isConnected }

    // MARK: - Message Handling
    private var broadcastHandlers: [String: [String: [UUID: (String, [String: Any]) -> Void]]] = [:] // topic -> event -> id -> handler
    private var presenceHandlers: [String: [UUID: (PresenceAction, String, [String: Any]?) -> Void]] = [:] // topic -> id -> handler
    private var connectionHandlers: [UUID: (Bool) -> Void] = [:]

    // MARK: - Event Handlers

    @discardableResult
    func onBroadcast(topic: String, event: String, handler: @escaping (String, [String: Any]) -> Void) -> UUID {
        let id = UUID()
        let t = topic.hasPrefix("realtime:") ? topic : "realtime:\(topic)"
        if broadcastHandlers[t] == nil {
            broadcastHandlers[t] = [:]
        }
        if broadcastHandlers[t]?[event] == nil {
            broadcastHandlers[t]?[event] = [:]
        }
        broadcastHandlers[t]?[event]?[id] = handler
        return id
    }

    func removeBroadcastHandler(id: UUID) {
        for topic in broadcastHandlers.keys {
            guard let topicHandlers = broadcastHandlers[topic] else { continue }
            for event in topicHandlers.keys {
                broadcastHandlers[topic]?[event]?.removeValue(forKey: id)
            }
        }
    }

    @discardableResult
    func onPresence(topic: String, handler: @escaping (PresenceAction, String, [String: Any]?) -> Void) -> UUID {
        let id = UUID()
        let t = topic.hasPrefix("realtime:") ? topic : "realtime:\(topic)"
        if presenceHandlers[t] == nil {
            presenceHandlers[t] = [:]
        }
        presenceHandlers[t]?[id] = handler
        return id
    }

    func removePresenceHandler(id: UUID) {
        for topic in presenceHandlers.keys {
            if presenceHandlers[topic]?.removeValue(forKey: id) != nil {
                return
            }
        }
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
    private var joinedTopics: [String: String] = [:] // topic -> joinRef
    private var topicInterestCount: [String: Int] = [:] // topic -> count
    private var topicPresenceCount: [String: Int] = [:] // topic -> count
    private var heartbeatTask: Task<Void, Error>?
    private var receiveTask: Task<Void, Error>?
    private var messageRef = 0

    // MARK: - Initialization

    init(realtimeURL: String, apiKey: String, accessToken: String? = nil) {
        // Convert https:// to wss://
        if realtimeURL.hasPrefix("https://") {
            self.realtimeURL = realtimeURL.replacingOccurrences(of: "https://", with: "wss://") + "/realtime/v1/websocket"
        } else if realtimeURL.hasPrefix("http://") { // OK - handled below
            self.realtimeURL = realtimeURL.replacingOccurrences(of: "http://", with: "ws://") + "/realtime/v1/websocket" // OK - upgrading to WS
        } else {
            self.realtimeURL = realtimeURL
        }
        self.apiKey = apiKey
        self.accessToken = accessToken

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

        if let token = accessToken {
            urlComponents.queryItems?.append(URLQueryItem(name: "access_token", value: token))
        }

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

        // Clear local topic state on full disconnect
        joinedTopics.removeAll()
        topicInterestCount.removeAll()

        print("✅ Disconnected from Supabase Realtime")
    }

    // MARK: - Channel Management

    func joinChannel(_ channelName: String, postgresChanges: [[String: Any]]? = nil) async throws {
        guard isConnected else {
            throw RealtimeError.notConnected
        }

        // Supabase Realtime expects channels in format "realtime:*"
        let topic = channelName.hasPrefix("realtime:") ? channelName : "realtime:\(channelName)"
        
        // Reference counting
        let currentCount = topicInterestCount[topic] ?? 0
        topicInterestCount[topic] = currentCount + 1
        
        // If already joined, don't send phx_join again
        if currentCount > 0 && joinedTopics[topic] != nil {
            print("📡 Topic \(topic) already joined (interest count: \(currentCount + 1)), skipping phx_join")
            return
        }

        let joinRef = UUID().uuidString
        self.joinedTopics[topic] = joinRef

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
            "ref": joinRef
        ]

        try await sendMessage(message)
        print("📡 Joined channel: \(topic) (interest count: 1)")
    }

    func leaveChannel(topic: String) async throws {
        let targetTopic = topic.hasPrefix("realtime:") ? topic : "realtime:\(topic)"
        
        // Reference counting
        let currentCount = topicInterestCount[targetTopic] ?? 0
        if currentCount > 1 {
            topicInterestCount[targetTopic] = currentCount - 1
            print("📡 Topic \(targetTopic) still in use by other managers (interest count: \(currentCount - 1)), skipping phx_leave")
            return
        }
        
        // Last one out, turn off the lights
        topicInterestCount.removeValue(forKey: targetTopic)
        topicPresenceCount.removeValue(forKey: targetTopic)
        guard joinedTopics[targetTopic] != nil else { return }

        let message: [String: Any] = [
            "topic": targetTopic,
            "event": "phx_leave",
            "payload": [:],
            "ref": nextRef()
        ]

        try await sendMessage(message)

        // Clear local state for this topic
        self.joinedTopics.removeValue(forKey: targetTopic)
        // Also clear handlers for this topic to prevent memory leaks
        self.broadcastHandlers.removeValue(forKey: targetTopic)
        self.presenceHandlers.removeValue(forKey: targetTopic)
        self.postgresHandlersByTopic.removeValue(forKey: targetTopic)
        
        print("📡 Left channel: \(targetTopic)")
    }

    func isJoined(to channel: String) -> Bool {
        let topic = channel.hasPrefix("realtime:") ? channel : "realtime:\(channel)"
        return isConnected && joinedTopics[topic] != nil
    }

    // MARK: - Broadcasting

    func broadcast(topic: String, event: String, payload: [String: Any]) async throws {
        let t = topic.hasPrefix("realtime:") ? topic : "realtime:\(topic)"
        guard joinedTopics[t] != nil else {
            throw RealtimeError.notJoined
        }

        let message: [String: Any] = [
            "topic": t,
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

    func track(topic: String, userId: String, metadata: [String: Any]) async throws {
        let t = topic.hasPrefix("realtime:") ? topic : "realtime:\(topic)"
        guard joinedTopics[t] != nil else {
            throw RealtimeError.notJoined
        }

        // Reference counting
        let currentCount = topicPresenceCount[t] ?? 0
        topicPresenceCount[t] = currentCount + 1

        let message: [String: Any] = [
            "topic": t,
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

    func untrack(topic: String) async throws {
        let t = topic.hasPrefix("realtime:") ? topic : "realtime:\(topic)"
        guard joinedTopics[t] != nil else {
            return
        }

        // Reference counting
        let currentCount = topicPresenceCount[t] ?? 0
        if currentCount > 1 {
            topicPresenceCount[t] = currentCount - 1
            print("📡 Topic \(t) presence still tracked by other managers (count: \(currentCount - 1)), skipping phx_leave for presence")
            return
        }

        // Last one out
        topicPresenceCount.removeValue(forKey: t)

        let message: [String: Any] = [
            "topic": t,
            "event": "presence",
            "payload": [
                "type": "presence",
                "event": "untrack"
            ],
            "ref": nextRef()
        ]

        try await sendMessage(message)
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
                        // print("📨 Received: \(text)")
                        handleIncomingMessage(text)
                    case .data(let data):
                        if let text = String(data: data, encoding: .utf8) {
                            // print("📨 Received (binary): \(text)")
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
              let event = json["event"] as? String,
              let topic = json["topic"] as? String else {
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
               let eventPayload = payload["payload"] as? [String: Any] {
                
                // Notify topic-specific handlers for this event
                if let eventHandlers = broadcastHandlers[topic]?[eventName] {
                    for handler in eventHandlers.values {
                        handler(eventName, eventPayload)
                    }
                }
            }

        case "presence_state", "presence_diff":
            handlePresenceEvent(json, topic: topic)

        case "phx_error":
            print("❌ Realtime error on \(topic): \(json)")

        case "heartbeat":
            // Heartbeat response
            break

        case "postgres_changes":
            if let payload = json["payload"] as? [String: Any],
               let data = payload["data"] as? [String: Any] {

                // CRITICAL STANDARDIZATION: Map raw WebSocket keys to "Standard" Supabase SDK format
                var mappedPayload = payload
                if let type = data["type"] as? String { mappedPayload["eventType"] = type }
                if let record = data["record"] as? [String: Any] { mappedPayload["new"] = record }
                if let oldRecord = data["old_record"] as? [String: Any] { mappedPayload["old"] = oldRecord }
                if let schema = data["schema"] as? String { mappedPayload["schema"] = schema }
                if let table = data["table"] as? String { mappedPayload["table"] = table }

                // Notify global handlers
                for handler in postgresHandlers.values {
                    handler(mappedPayload)
                }
                
                // Notify topic-specific handlers
                if let handlers = postgresHandlersByTopic[topic] {
                    for handler in handlers.values {
                        handler(mappedPayload)
                    }
                }
            }

        case "system":
            if let payload = json["payload"] as? [String: Any],
               let status = payload["status"] as? String,
               status == "error" {
                let msg = payload["message"] as? String ?? "Unknown error"
                print("❌ Realtime System Error (\(topic)): \(msg)")
            }

        default:
            print("📨 Unknown event: \(event) on \(topic)")
        }
    }

    private var postgresHandlers: [UUID: ([String: Any]) -> Void] = [:]
    private var postgresHandlersByTopic: [String: [UUID: ([String: Any]) -> Void]] = [:]

    @discardableResult
    func onPostgresChange(topic: String? = nil, handler: @escaping ([String: Any]) -> Void) -> UUID {
        let id = UUID()
        if let t = topic {
            let topicName = t.hasPrefix("realtime:") ? t : "realtime:\(t)"
            if postgresHandlersByTopic[topicName] == nil {
                postgresHandlersByTopic[topicName] = [:]
            }
            postgresHandlersByTopic[topicName]?[id] = handler
        } else {
            postgresHandlers[id] = handler
        }
        return id
    }

    func removePostgresChange(id: UUID) {
        postgresHandlers.removeValue(forKey: id)
        for topic in postgresHandlersByTopic.keys {
            postgresHandlersByTopic[topic]?.removeValue(forKey: id)
        }
    }

    private func handlePresenceEvent(_ json: [String: Any], topic: String) {
        guard let payload = json["payload"] as? [String: Any],
              let event = json["event"] as? String else { return }

        // Get handlers for this specific topic
        guard let handlers = presenceHandlers[topic]?.values, !handlers.isEmpty else { return }

        if event == "presence_diff" {
            // Handle joins
            if let joins = payload["joins"] as? [String: Any] {
                for (_, data) in joins {
                    if let metas = (data as? [String: Any])?["metas"] as? [[String: Any]] {
                        for metadata in metas {
                            if let phxRef = metadata["phx_ref"] as? String {
                                for handler in handlers {
                                    handler(.join, phxRef, metadata)
                                }
                            }
                        }
                    }
                }
            }

            // Handle leaves
            if let leaves = payload["leaves"] as? [String: Any] {
                for (_, data) in leaves {
                    if let metas = (data as? [String: Any])?["metas"] as? [[String: Any]] {
                        for metadata in metas {
                            if let phxRef = metadata["phx_ref"] as? String {
                                for handler in handlers {
                                    handler(.leave, phxRef, metadata)
                                }
                            }
                        }
                    }
                }
            }
        } else if event == "presence_state" {
            // Initial state - treat all as joins
            for (_, data) in payload {
                if let metas = (data as? [String: Any])?["metas"] as? [[String: Any]] {
                    for metadata in metas {
                        if let phxRef = metadata["phx_ref"] as? String {
                            for handler in handlers {
                                handler(.join, phxRef, metadata)
                            }
                        }
                    }
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
                    // print("💓 Heartbeat sent")
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
