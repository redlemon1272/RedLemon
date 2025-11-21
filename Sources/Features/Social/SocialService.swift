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
    private var presenceChannel: RealtimeChannel?
    private var dmChannel: RealtimeChannel?
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
    }
    
    func disconnect() async {
        if let channel = presenceChannel {
            await channel.unsubscribe()
            presenceChannel = nil
        }
        if let channel = dmChannel {
            await channel.unsubscribe()
            dmChannel = nil
        }
        isConnected = false
        onlineUserIds.removeAll()
        friendActivity.removeAll()
    }
    
    // MARK: - Presence
    
    private func setupPresenceChannel(userId: String, username: String) async {
        print("🔌 SocialService: Connecting to global presence...")
        
        // Use a global channel name
        let channel = client.realtimeClient.channel("global-presence")
        self.presenceChannel = channel
        
        // Subscribe to presence sync
        channel.onPresenceSync { [weak self] in
            Task { @MainActor [weak self] in
                self?.handlePresenceSync()
            }
        }
        
        channel.onPresenceJoin { [weak self] key, presences in
            Task { @MainActor [weak self] in
                self?.handlePresenceJoin(key: key, presences: presences)
            }
        }
        
        channel.onPresenceLeave { [weak self] key, presences in
            Task { @MainActor [weak self] in
                self?.handlePresenceLeave(key: key, presences: presences)
            }
        }
        
        do {
            try await channel.subscribe()
            
            // Track my initial status
            try await channel.track(state: [
                "user_id": userId,
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
        guard let channel = presenceChannel, let userId = currentUserId, let username = currentUsername else { return }
        
        var state: [String: Any] = [
            "user_id": userId,
            "username": username,
            "status": "online",
            "last_seen": ISO8601DateFormatter().string(from: Date())
        ]
        
        if let title = mediaTitle {
            state["watching_title"] = title
            state["watching_type"] = mediaType
            state["watching_id"] = imdbId
            state["room_id"] = roomId
            state["started_at"] = ISO8601DateFormatter().string(from: Date())
        }
        
        do {
            try await channel.track(state: state)
            print("📡 SocialService: Updated status - Watching: \(mediaTitle ?? "Nothing")")
        } catch {
            print("❌ SocialService: Failed to update status: \(error)")
        }
    }
    
    // MARK: - Presence Handlers
    
    private func handlePresenceSync() {
        guard let channel = presenceChannel else { return }
        
        let state = channel.presenceState()
        // state is [String: [Presence]] where String is the presence key (usually UUID)
        
        var newOnlineIds = Set<String>()
        var newActivity = [String: FriendActivity]()
        
        for (_, presences) in state {
            // Get the most recent presence for this user
            if let presence = presences.last,
               let userId = presence.state["user_id"] as? String,
               let username = presence.state["username"] as? String {
                
                // Ignore myself
                if userId == currentUserId { continue }
                
                newOnlineIds.insert(userId)
                
                // Parse watching info
                var watchingInfo: FriendActivity.WatchingInfo?
                if let title = presence.state["watching_title"] as? String,
                   let type = presence.state["watching_type"] as? String,
                   let id = presence.state["watching_id"] as? String {
                    
                    let roomId = presence.state["room_id"] as? String
                    let startedAtStr = presence.state["started_at"] as? String
                    let startedAt = ISO8601DateFormatter().date(from: startedAtStr ?? "") ?? Date()
                    
                    watchingInfo = FriendActivity.WatchingInfo(
                        mediaTitle: title,
                        mediaType: type,
                        imdbId: id,
                        startedAt: startedAt,
                        roomId: roomId
                    )
                }
                
                let activity = FriendActivity(
                    id: userId,
                    username: username,
                    currentlyWatching: watchingInfo,
                    lastSeen: Date() // Approximate
                )
                
                newActivity[userId] = activity
            }
        }
        
        self.onlineUserIds = newOnlineIds
        self.friendActivity = newActivity
        
        print("👥 SocialService: Sync - \(newOnlineIds.count) users online")
    }
    
    private func handlePresenceJoin(key: String, presences: [Presence]) {
        // Incremental update could be done here, but sync usually covers it
        print("👤 SocialService: User joined - \(key)")
    }
    
    private func handlePresenceLeave(key: String, presences: [Presence]) {
        print("👤 SocialService: User left - \(key)")
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
            self.friendRequests = supabaseRequests.compactMap { request in
                guard let fromUser = request.fromUser else { return nil }
                return FriendRequest(
                    id: request.id.uuidString,
                    fromPrincipal: fromUser.id.uuidString,
                    fromUsername: fromUser.username,
                    toPrincipal: userIdStr,
                    requestDate: request.createdAt,
                    status: .pending
                )
            }
            
        } catch {
            print("❌ SocialService: Failed to load friends: \(error)")
        }
        isLoading = false
    }
    
    // MARK: - Actions
    
    func sendFriendRequest(to username: String) async -> String? {
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
        
        // Listen to changes in direct_messages table where receiver_id or sender_id is me
        // Note: Supabase Realtime RLS should handle the filtering, but we can also filter client-side if needed
        let channel = client.realtimeClient.channel("direct-messages")
        self.dmChannel = channel
        
        channel.onPostgresChange(AnyAction.self, schema: "public", table: "direct_messages", filter: "receiver_id=eq.\(userId)") { [weak self] change in
            Task { @MainActor [weak self] in
                self?.handleIncomingMessage(change)
            }
        }
        
        // Also listen for my own sent messages to update UI immediately (if not optimistic)
        channel.onPostgresChange(AnyAction.self, schema: "public", table: "direct_messages", filter: "sender_id=eq.\(userId)") { [weak self] change in
             Task { @MainActor [weak self] in
                 self?.handleIncomingMessage(change)
             }
         }
        
        do {
            try await channel.subscribe()
            print("✅ SocialService: Connected to DM channel")
        } catch {
            print("❌ SocialService: Failed to subscribe to DMs: \(error)")
        }
    }
    
    private func handleIncomingMessage(_ change: AnyAction) {
        // Decode the new record
        // Note: Supabase Realtime returns a dictionary, we need to decode it manually or use a helper
        // For simplicity, we'll trigger a reload for the specific conversation if we can identify it
        // Or just reload all messages for now (less efficient but safer)
        
        // Ideally we parse the record to find the other user ID
        // let record = change.record
        // let senderId = record["sender_id"]
        // let receiverId = record["receiver_id"]
        
        // For now, let's just log it. A full implementation would decode and append.
        print("📩 SocialService: New message received")
        
        // TODO: Optimize this to only append the new message
        // For now, we can't easily know WHICH friend to reload without parsing the payload
        // We will rely on the UI calling loadMessages or implement full parsing later
    }
    
    func loadMessages(friendId: String) async {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr),
              let friendUUID = UUID(uuidString: friendId) else { return }
        
        do {
            let msgs = try await client.getDirectMessages(userId: userId, friendId: friendUUID)
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
            try await client.sendDirectMessage(fromUserId: userId, toFriendId: friendUUID, content: content)
            // Reload to get the real ID and timestamp
            await loadMessages(friendId: friendId)
        } catch {
            print("❌ Failed to send message: \(error)")
            // Revert optimistic update
            self.messages[friendId]?.removeAll(where: { $0.id == tempId })
            errorMessage = "Failed to send message"
        }
    }
}
