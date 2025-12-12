import Foundation
import Combine

@MainActor
class SocialService: ObservableObject {
    static let shared = SocialService()
    
    // MARK: - Published State
    @Published var friends: [Friend] = []
    @Published var friendRequests: [FriendRequest] = []
    @Published var friendActivity: [String: FriendActivity] = [:] // Key: UserID (Principal)
    @Published var onlineUserIds: Set<String> = []
    @Published var messages: [String: [DirectMessage]] = [:] // Key: FriendID (Principal)
    
    @Published var isConnected: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Internal
    private let client = SupabaseClient.shared
    private var presenceClient: SupabaseRealtimeClient?
    private var dmClient: SupabaseRealtimeClient?
    private var currentUserId: String?
    private var currentUsername: String?
    
    private init() {}
    
    // MARK: - Setup
    
    func connect(userId: String, username: String) async {
        self.currentUserId = userId
        self.currentUsername = username
        
        // 1. Load initial friend list
        await loadFriends()
        
        // 2. Connect to Global Presence Channel
        await setupPresenceChannel(userId: userId, username: username)
        
        // 3. Connect to DM Channel
        await setupDMChannel(userId: userId)
        
        // 4. Sync Watch History
        await syncLocalHistory()
    }
    
    func disconnect() async {
        if let client = presenceClient {
            await client.disconnect()
            presenceClient = nil
        }
        if let client = dmClient {
            await client.disconnect()
            dmClient = nil
        }
        isConnected = false
        onlineUserIds.removeAll()
        friendActivity.removeAll()
    }
    
    // MARK: - Presence
    
    private func setupPresenceChannel(userId: String, username: String) async {
        print("🔌 SocialService: Connecting to global presence...")
        
        // Create a dedicated client for presence
        let client = SupabaseRealtimeClient(
            realtimeURL: Config.supabaseURL,
            apiKey: Config.supabaseAnonKey
        )
        self.presenceClient = client
        
        // Subscribe to presence events
        await client.onPresence { [weak self] action, userId, metadata in
            Task { @MainActor [weak self] in
                if action == .join {
                    self?.handlePresenceJoin(userId: userId, metadata: metadata)
                } else {
                    self?.handlePresenceLeave(userId: userId)
                }
            }
        }
        
        do {
            try await client.connect()
            try await client.joinChannel("global-presence")
            
            // Track my initial status
            try await client.track(userId: userId, metadata: [
                "username": username,
                "status": "online",
                "last_seen": ISO8601DateFormatter().string(from: Date())
            ])
            
            isConnected = true
            print("✅ SocialService: Connected to global presence")
        } catch {
            print("❌ SocialService: Failed to subscribe: \(error)")
            errorMessage = "Failed to connect to social features"
        }
    }
    
    func updateWatchingStatus(mediaTitle: String?, mediaType: String?, imdbId: String?, roomId: String?) async {
        guard let client = presenceClient, let userId = currentUserId, let username = currentUsername else { return }
        
        var metadata: [String: Any] = [
            "username": username,
            "status": "online",
            "last_seen": ISO8601DateFormatter().string(from: Date())
        ]
        
        if let title = mediaTitle {
            metadata["watching_title"] = title
            metadata["watching_type"] = mediaType
            metadata["watching_id"] = imdbId
            metadata["room_id"] = roomId
            metadata["started_at"] = ISO8601DateFormatter().string(from: Date())
        }
        
        do {
            try await client.track(userId: userId, metadata: metadata)
            print("📡 SocialService: Updated status - Watching: \(mediaTitle ?? "Nothing")")
        } catch {
            print("❌ SocialService: Failed to update status: \(error)")
        }
    }
    
    // MARK: - Presence Handlers
    
    private func handlePresenceJoin(userId: String, metadata: [String: Any]?) {
        // Ignore myself
        if userId == currentUserId { return }
        
        onlineUserIds.insert(userId)
        
        // Parse activity from metadata
        if let meta = metadata {
            var watchingInfo: FriendActivity.WatchingInfo?
            
            if let title = meta["watching_title"] as? String {
                watchingInfo = FriendActivity.WatchingInfo(
                    mediaTitle: title,
                    mediaType: meta["watching_type"] as? String ?? "movie",
                    imdbId: meta["watching_id"] as? String ?? "",
                    startedAt: Date(), // Simplified
                    roomId: meta["room_id"] as? String
                )
            }
            
            let activity = FriendActivity(
                id: userId,
                username: meta["username"] as? String ?? "Unknown",
                currentlyWatching: watchingInfo,
                lastSeen: Date()
            )
            
            friendActivity[userId] = activity
        }
    }
    
    private func handlePresenceLeave(userId: String) {
        onlineUserIds.remove(userId)
        friendActivity.removeValue(forKey: userId)
    }
    
    // MARK: - Data Loading (Friends)
    
    func loadFriends() async {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr) else { return }
        
        isLoading = true
        do {
            // 1. Get Friends
            let supabaseFriends = try await client.getFriends(userId: userId)
            self.friends = supabaseFriends.map { user in
                Friend(
                    id: user.id.uuidString,
                    username: user.username,
                    addedDate: Date(),
                    isFavorite: self.isFavorite(user.id.uuidString),
                    status: .accepted
                )
            }
            
            // 2. Get Requests
            let supabaseRequests = try await client.getFriendRequests(userId: userId)
            self.friendRequests = supabaseRequests.compactMap { req -> FriendRequest? in
                guard let fromUser = req.fromUser else { return nil }
                return FriendRequest(
                    id: req.id.uuidString,
                    fromPrincipal: req.userId1.uuidString,
                    fromUsername: fromUser.username,
                    toPrincipal: userIdStr,
                    requestDate: req.createdAt,
                    status: .pending
                )
            }
            
        } catch {
            print("❌ SocialService: Failed to load friends: \(error)")
        }
        isLoading = false
    }
    
    // MARK: - Actions
    
    func sendRequest(username: String) async -> String? {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr) else { return "Not logged in" }
        
        do {
            try await client.sendFriendRequest(fromUserId: userId, toUsername: username)
            await loadFriends()
            return nil
        } catch {
            return error.localizedDescription
        }
    }
    
    func acceptRequest(_ request: FriendRequest) async {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr),
              let requestId = UUID(uuidString: request.id),
              let friendId = UUID(uuidString: request.fromPrincipal) else { return }
        
        do {
            try await client.acceptFriendRequest(requestId: requestId, userId: userId, friendId: friendId)
            await loadFriends()
        } catch {
            print("❌ Failed to accept: \(error)")
        }
    }
    
    func declineRequest(_ request: FriendRequest) async {
        guard let requestId = UUID(uuidString: request.id) else { return }
        
        do {
            try await client.declineFriendRequest(requestId: requestId)
            await loadFriends()
        } catch {
            print("❌ Failed to decline: \(error)")
        }
    }
    
    // MARK: - Favorites
    
    private func isFavorite(_ friendId: String) -> Bool {
        let favorites = UserDefaults.standard.stringArray(forKey: "FavoriteFriends") ?? []
        return favorites.contains(friendId)
    }
    
    func toggleFavorite(friendId: String) {
        var favorites = UserDefaults.standard.stringArray(forKey: "FavoriteFriends") ?? []
        if favorites.contains(friendId) {
            favorites.removeAll { $0 == friendId }
        } else {
            favorites.append(friendId)
        }
        UserDefaults.standard.set(favorites, forKey: "FavoriteFriends")
        
        // Update local state
        if let index = friends.firstIndex(where: { $0.id == friendId }) {
            friends[index].isFavorite.toggle()
        }
    }
    
    // MARK: - Direct Messages
    
    private func setupDMChannel(userId: String) async {
        print("🔌 SocialService: Connecting to DM channel...")
        
        let client = SupabaseRealtimeClient(
            realtimeURL: Config.supabaseURL,
            apiKey: Config.supabaseAnonKey
        )
        self.dmClient = client
        
        // Subscribe to Postgres Changes on direct_messages table
        await client.onPostgresChange { [weak self] payload in
            Task { @MainActor [weak self] in
                self?.handleIncomingMessage(payload)
            }
        }
        
        do {
            try await client.connect()
            
            // Listen for INSERTs on direct_messages where I am the receiver OR sender
            // Note: Supabase Realtime filters are limited. We'll listen to all inserts and filter locally if needed,
            // or try to use a filter string if the custom client supports it (it passes it to config).
            // The custom client passes 'postgres_changes' config array.
            
            let changesConfig: [[String: Any]] = [
                [
                    "event": "INSERT",
                    "schema": "public",
                    "table": "direct_messages",
                    "filter": "receiver_id=eq.\(userId)"
                ],
                [
                    "event": "INSERT",
                    "schema": "public",
                    "table": "direct_messages",
                    "filter": "sender_id=eq.\(userId)"
                ]
            ]
            
            try await client.joinChannel("direct_messages", postgresChanges: changesConfig)
            print("✅ SocialService: Connected to DM channel")
        } catch {
            print("❌ SocialService: Failed to subscribe to DMs: \(error)")
        }
    }
    
    private func handleIncomingMessage(_ payload: [String: Any]) {
        // Payload structure: { "new": { ... }, "eventType": "INSERT", ... }
        guard let newRecord = payload["new"] as? [String: Any],
              let idStr = newRecord["id"] as? String,
              let id = UUID(uuidString: idStr),
              let senderIdStr = newRecord["sender_id"] as? String,
              let senderId = UUID(uuidString: senderIdStr),
              let receiverIdStr = newRecord["receiver_id"] as? String,
              let receiverId = UUID(uuidString: receiverIdStr),
              let content = newRecord["content"] as? String,
              let createdAtStr = newRecord["created_at"] as? String else {
            return
        }
        
        // Parse date
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let createdAt = formatter.date(from: createdAtStr) ?? Date()
        
        let message = DirectMessage(
            id: id,
            senderId: senderId,
            receiverId: receiverId,
            content: content,
            isRead: newRecord["is_read"] as? Bool ?? false,
            createdAt: createdAt
        )
        
        // Determine which friend conversation this belongs to
        let friendId = (senderIdStr == currentUserId) ? receiverIdStr : senderIdStr
        
        var currentMsgs = self.messages[friendId] ?? []
        
        // Check for duplicates (optimistic updates might cause this)
        if !currentMsgs.contains(where: { $0.id == id }) {
            currentMsgs.append(message)
            self.messages[friendId] = currentMsgs
            print("📨 SocialService: New message from/to \(friendId)")
        }
    }
    
    func loadMessages(friendId: String) async {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr),
              let friendUUID = UUID(uuidString: friendId) else { return }
        
        do {
            let msgs = try await client.getDirectMessages(userId: userId, with: friendUUID)
            self.messages[friendId] = msgs
        } catch {
            print("❌ Failed to load messages: \(error)")
        }
    }
    
    func sendMessage(to friendId: String, content: String) async {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr),
              let friendUUID = UUID(uuidString: friendId) else { return }
        
        // Optimistic update
        let tempId = UUID()
        let optimisticMsg = DirectMessage(
            id: tempId,
            senderId: userId,
            receiverId: friendUUID,
            content: content,
            isRead: false,
            createdAt: Date()
        )
        
        var currentMsgs = self.messages[friendId] ?? []
        currentMsgs.append(optimisticMsg)
        self.messages[friendId] = currentMsgs
        
        do {
            try await client.sendDirectMessage(from: userId, to: friendUUID, content: content)
            // Reload to get the real ID and timestamp
            // We can wait for the realtime event to confirm it, or reload.
            // Reloading ensures we have the correct ID.
            // But realtime event might arrive first.
            // Let's just let realtime handle the confirmation.
            // Actually, we should replace the optimistic message with the real one when it arrives.
            // For now, reloading is safer to sync state.
            // await loadMessages(friendId: friendId) 
        } catch {
            print("❌ Failed to send message: \(error)")
            // Revert optimistic update
            self.messages[friendId]?.removeAll(where: { $0.id == tempId })
            errorMessage = "Failed to send message"
        }
    }
    // MARK: - Watch History Sync
    
    private func syncLocalHistory() async {
        guard let data = UserDefaults.standard.data(forKey: "watchHistory"),
              let history = try? JSONDecoder().decode([WatchHistoryItem].self, from: data),
              let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr) else { return }
        
        print("🔄 SocialService: Syncing \(history.count) items to cloud...")
        
        for item in history {
            // Fire and forget individually to avoid blocking
            Task {
                try? await client.upsertWatchHistory(item: item, userId: userId)
            }
        }
    }
    
    func fetchFriendHistory(friendId: String) async -> [SupabaseWatchHistoryEntry] {
        guard let friendUUID = UUID(uuidString: friendId) else { return [] }
        do {
            return try await client.getWatchHistory(userId: friendUUID)
        } catch {
            print("❌ Failed to fetch friend history: \(error)")
            return []
        }
    }
}
