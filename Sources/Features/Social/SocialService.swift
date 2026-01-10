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
    @Published var unreadCounts: [String: Int] = [:] // Key: FriendID
    @Published var blockedUsers: [SupabaseUser] = [] // New: Blocked users list for management
    @Published var localBlockedIds: Set<String> = [] // Fallback for session
    
    var blockedUserIds: Set<String> {
        let serverBlocked = Set(blockedUsers.map { $0.id.uuidString.lowercased() })
        return serverBlocked.union(localBlockedIds)
    }
    
    @Published var isConnected: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Internal
    private let client = SupabaseClient.shared
    private var presenceClient: SupabaseRealtimeClient?
    private var userPresenceRefs: [String: [String: [String: Any]]] = [:] // Key: UserID -> [Ref: Metadata]
    private var dmClient: SupabaseRealtimeClient?
    private var currentUserId: String?
    private var currentUsername: String?
    private var currentMetadata: [String: Any] = [:]
    
    // Performance: Cache formatter to avoid expensive initialization on main thread
    private static let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    private init() {}
    
    // MARK: - Setup
    
    func connect(userId: String, username: String) async {
        self.currentUserId = userId.lowercased()
        self.currentUsername = username
        
        // 1. Load initial friend list and blocked users
        await loadFriends()
        await loadBlockedUsers()
        
        // 2. Connect to Global Presence Channel
        await setupPresenceChannel(userId: userId, username: username)
        
        // 4. Connect to DM Channel
        await setupDMChannel(userId: userId)
        
        // 5. Fetch Unread Counts (Offline messages)
        await fetchUnreadCounts()
        
        // 6. Sync Watch History
        await syncLocalHistory()
    }
    
    func disconnect() async {
        stopHeartbeat()
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
        
        // Setup connection monitoring
        await setupConnectionMonitoring(for: client, isPresence: true)
        
        // Subscribe to presence events
        await client.onPresence { [weak self] action, userId, metadata in
            Task { @MainActor [weak self] in
                if action == .join {
                    self?.handlePresenceJoin(userId: userId, metadata: metadata)
                } else {
                    self?.handlePresenceLeave(userId: userId, metadata: metadata)
                }
            }
        }
        
        do {
            try await client.connect()
            try await client.joinChannel("global-presence")
            
            // Track my initial status
            let initialMeta: [String: Any] = [
                "username": username,
                "status": "online",
                "last_seen": SocialService.isoFormatter.string(from: Date()),
                "is_premium": LicenseManager.shared.isPremium
            ]
            self.currentMetadata = initialMeta
            try await client.track(userId: userId, metadata: initialMeta)
            
            isConnected = true
            startHeartbeat()
            print("✅ SocialService: Connected to global presence")
        } catch {
            print("❌ SocialService: Failed to subscribe: \(error)")
            errorMessage = "Failed to connect to social features"
        }
    }
    
    func updateWatchingStatus(mediaTitle: String?, mediaType: String?, imdbId: String?, roomId: String?, status: String? = nil) async {
        guard let client = presenceClient, let userId = currentUserId, let username = currentUsername else { return }
        
        var metadata: [String: Any] = [
            "username": username,
            "status": status ?? "online",
            "last_seen": SocialService.isoFormatter.string(from: Date()),
            "is_premium": LicenseManager.shared.isPremium
        ]
        
        if let title = mediaTitle {
            metadata["watching_title"] = title
            metadata["watching_type"] = mediaType
            metadata["watching_id"] = imdbId
            metadata["room_id"] = roomId
            metadata["started_at"] = SocialService.isoFormatter.string(from: Date())
        } else if status == nil {
             // If no specific status and no media, default to "Browsing"
             metadata["status"] = "Browsing"
        }
        
        do {
            self.currentMetadata = metadata
            try await client.track(userId: userId, metadata: metadata)
            print("📡 SocialService: Updated status - \(metadata["status"] as? String ?? "Unknown"): \(mediaTitle ?? "")")
        } catch {
            print("❌ SocialService: Failed to update status: \(error)")
        }
    }
    
    // MARK: - Presence Handlers
    
    private var heartbeatTimer: Timer?

    // ... (inside setupPresenceChannel or connect)
    // We will start heartbeat in connect() and stop in disconnect()
    
    // MARK: - Presence Handlers
    
    private func handlePresenceJoin(userId: String, metadata: [String: Any]?) {
        let normalizedUserId = userId.lowercased()
        
        // 1. Track specific connection ref with its metadata
        if let phxRef = metadata?["phx_ref"] as? String, let meta = metadata {
            if userPresenceRefs[normalizedUserId] == nil {
                userPresenceRefs[normalizedUserId] = [:]
            }
            userPresenceRefs[normalizedUserId]?[phxRef] = meta
        }
        
        // 2. Recalculate best state based on most recent timestamp
        recalculateUserActivity(userId: normalizedUserId)
    }
    
    private func handlePresenceLeave(userId: String, metadata: [String: Any]?) {
        let normalizedUserId = userId.lowercased()
        
        // 1. Remove specific connection ref
        if let phxRef = metadata?["phx_ref"] as? String {
            userPresenceRefs[normalizedUserId]?.removeValue(forKey: phxRef)
        }
        
        // 2. Recalculate or mark offline
        recalculateUserActivity(userId: normalizedUserId)
    }
    
    private func recalculateUserActivity(userId: String) {
        let normalizedUserId = userId.lowercased()
        guard let refs = userPresenceRefs[normalizedUserId], !refs.isEmpty else {
            // No active refs -> User is Offline
            if onlineUserIds.contains(normalizedUserId) {
                print("📉 SocialService: User \(normalizedUserId) went offline (No active refs)")
                onlineUserIds.remove(normalizedUserId)
                friendActivity.removeValue(forKey: normalizedUserId)
            }
            return
        }
        
        // User is Online -> Find the most recent session
        if !onlineUserIds.contains(normalizedUserId) {
            print("📈 SocialService: User \(normalizedUserId) came online")
            onlineUserIds.insert(normalizedUserId)
        }
        
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        
        // Sort refs by 'last_seen' or 'started_at' to find the newest
        let sortedRefs = refs.values.sorted { (m1, m2) -> Bool in
            let dateString1 = m1["last_seen"] as? String ?? ""
            let dateString2 = m2["last_seen"] as? String ?? ""
            
            // Use cached formatter, fallback only if needed (e.g. legacy format)
            let date1 = SocialService.isoFormatter.date(from: dateString1) ?? Date.distantPast
            let date2 = SocialService.isoFormatter.date(from: dateString2) ?? Date.distantPast
            return date1 < date2 // Ascending order, last is newest
        }
        
        guard let newestMetadata = sortedRefs.last else { return } // Should not happen if refs is not empty
        
        // Create activity from the newest metadata
        var activity = FriendActivity(
            id: normalizedUserId,
            username: newestMetadata["username"] as? String ?? "Unknown",
            currentlyWatching: nil,
            lastSeen: Date(),
            customStatus: nil,
            isPremium: newestMetadata["is_premium"] as? Bool
        )
        
        // SYNC: Update the persistent Friend object in self.friends
        if let premium = activity.isPremium,
           let index = friends.firstIndex(where: { $0.id == normalizedUserId }) {
            if friends[index].isPremium != premium {
                friends[index].isPremium = premium
            }
        }
        
        // Parse metadata
        // Check for specific watching status
        if let mediaTitle = newestMetadata["watching_title"] as? String {
            let roomId = newestMetadata["room_id"] as? String
            
            activity.currentlyWatching = FriendActivity.WatchingInfo(
                mediaTitle: mediaTitle,
                mediaType: newestMetadata["watching_type"] as? String ?? "movie",
                imdbId: newestMetadata["watching_id"] as? String ?? "",
                startedAt: Date(), // Simplistic
                roomId: roomId,
                isJoinable: true // Default to true, will validate async
            )
            
            // Async: Validate room exists if roomId is present
            if let roomId = roomId {
                Task { [weak self] in
                    await self?.validateRoomJoinability(userId: normalizedUserId, roomId: roomId)
                }
            }
        }
        // Check for custom status
        if let status = newestMetadata["status"] as? String {
            activity.customStatus = status
        }
        
        friendActivity[normalizedUserId] = activity

    }
    
    /// Validates if a room is joinable by checking if it exists in the database with a valid host.
    /// If the room doesn't exist or has no host, sets isJoinable = false for the friend's activity.
    /// Note: Live Events (room IDs starting with "event_") are always joinable.
    private func validateRoomJoinability(userId: String, roomId: String) async {
        // Live Events validation
        // Event room IDs follow the pattern "event_{imdbId}" (e.g., "event_tt1293847")
        if roomId.hasPrefix("event_") {
            // Check if this event is currently "live" OR "upcoming lobby"
            do {
                let config = try await EventsConfigService.shared.fetchMovieEventsConfig()
                
                if EventsConfigService.shared.isEventJoinable(eventId: roomId, config: config) {
                     print("✅ SocialService: Event \(roomId) is JOINABLE (Live or Next Up) - allowing join")
                     return // Allow join
                } else {
                    print("🚫 SocialService: Event \(roomId) is STALE - marking \(userId) as unjoinable")
                    markUserAsUnjoinable(userId: userId)
                    return
                }
            } catch {
                print("⚠️ SocialService: Failed to validate event liveness: \(error)")
                return 
            }
        }
        
        do {
            // Check if room exists and has participants (including host)
            let room = try await SupabaseClient.shared.getRoomState(roomId: roomId)
            
            if room == nil {
                // Room doesn't exist - mark as not joinable
                print("👻 SocialService: Room \(roomId) not found - marking \(userId) as unjoinable")
                markUserAsUnjoinable(userId: userId)
            } else {
                // Room exists - check if it has a host by checking participants
                let participants = try await SupabaseClient.shared.getRoomParticipants(roomId: roomId)
                let targetHostId = room?.hostUserId?.uuidString.lowercased()
                let hasHost = participants.contains { $0.userId.uuidString.lowercased() == targetHostId }
                
                if !hasHost {
                    print("👻 SocialService: Room \(roomId) has no active host - marking \(userId) as unjoinable")
                    markUserAsUnjoinable(userId: userId)
                }
            }
        } catch {
            print("⚠️ SocialService: Failed to validate room \(roomId): \(error)")
            // On error, keep as joinable (fail open)
        }
    }
    
    /// Marks a user's currentlyWatching as not joinable
    private func markUserAsUnjoinable(userId: String) {
        let normalizedUserId = userId.lowercased()
        guard var activity = friendActivity[normalizedUserId],
              var watching = activity.currentlyWatching else { return }
        
        watching.isJoinable = false
        activity.currentlyWatching = watching
        friendActivity[normalizedUserId] = activity
    }

    // MARK: - Heartbeat

    
    private func startHeartbeat() {
        stopHeartbeat()
        // Reduced to 20.0 to prevent timeouts (server often times out at 60s)
        let timer = Timer(timeInterval: 20.0, repeats: true) { [weak self] _ in
            Task { @MainActor [weak self] in
                await self?.sendHeartbeat()
            }
        }
        // Use .common mode so scrolling/resizing doesn't block the heartbeat
        RunLoop.main.add(timer, forMode: .common)
        heartbeatTimer = timer
    }
    
    private func stopHeartbeat() {
        heartbeatTimer?.invalidate()
        heartbeatTimer = nil
    }

    // MARK: - Reconnection Logic

    private func setupConnectionMonitoring(for client: SupabaseRealtimeClient, isPresence: Bool) async {
        await client.onConnectionChange { [weak self] isConnected in
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                
                if isConnected {
                    if isPresence {
                        print("✅ SocialService: Presence connected")
                        self.isConnected = true
                        self.startHeartbeat()
                    } else {
                        print("✅ SocialService: DM channel connected")
                    }
                } else {
                    print("⚠️ SocialService: \(isPresence ? "Presence" : "DM") disconnected")
                    if isPresence {
                        self.isConnected = false
                        self.stopHeartbeat()
                    }
                    
                    // Attempt Reconnect if we expect to be connected
                    if self.currentUserId != nil {
                         self.scheduleReconnect()
                    }
                }
            }
        }
    }

    private var reconnectTask: Task<Void, Never>?
    
    private func scheduleReconnect() {
        guard reconnectTask == nil else { return }
        
        print("🔄 SocialService: Scheduling reconnection in 5s...")
        reconnectTask = Task {
            try? await Task.sleep(nanoseconds: 5 * 1_000_000_000) // 5s delay
            
            if !Task.isCancelled {
                await self.reconnect()
            }
            self.reconnectTask = nil
        }
    }
    
    private func reconnect() async {
        guard let userId = currentUserId, let username = currentUsername else { return }
        print("🔄 SocialService: Attempting to reconnect...")
        
        // Re-establish Presence
        if let client = presenceClient {
            let isJoined = await client.isJoined(to: "global-presence")
            if !isJoined {
                 do {
                     try await client.connect()
                     try await client.joinChannel("global-presence")
                     try await client.track(userId: userId, metadata: currentMetadata)
                     print("✅ SocialService: Reconnected to presence")
                 } catch {
                     print("❌ SocialService: Presence reconnection failed: \(error)")
                 }
            }
        } else {
             await setupPresenceChannel(userId: userId, username: username)
        }
        
        // Re-establish DMs
        if let client = dmClient {
             // Basic check if connected, otherwise try to connect
             // Currently SupabaseRealtimeClient doesn't expose strict "isJoined" for generic channels easily without tracking topic
             // But we can try connect() which is idempotent-ish
             try? await client.connect()
             // We'd need to re-join if the socket completely died.
             // For now, simpler to just re-run setup if needed, but let's try connect first.
        } else {
             await setupDMChannel(userId: userId)
        }
    }
    
    private func sendHeartbeat() async {
        guard isConnected, let client = presenceClient, let userId = currentUserId else { return }
        
        // Refresh timestamp and premium status
        var metadata = currentMetadata
        metadata["last_seen"] = SocialService.isoFormatter.string(from: Date())
        metadata["is_premium"] = LicenseManager.shared.isPremium
        currentMetadata = metadata
        
        do {
            // print("💓 SocialService: Sending heartbeat...") (Silent unless debug)
            try await client.track(userId: userId, metadata: metadata)
        } catch {
            print("❌ SocialService: Heartbeat failed: \(error)")
        }
    }
    
    // MARK: - Data Loading (Friends)
    
    func loadFriends() async {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr) else { return }
        
        isLoading = true
        do {
            // 1. Get Friends
            let supabaseFriends = try await client.getFriends(userId: userId)
            self.friends = supabaseFriends.map { user in
                // Check if premium (either isPremium flag or valid subscription)
                let hasPremium: Bool
                if let isPremium = user.isPremium, isPremium {
                    hasPremium = true
                } else if let expiresAt = user.subscriptionExpiresAt, expiresAt > Date() {
                    hasPremium = true
                } else {
                    hasPremium = false
                }
                
                return Friend(
                    id: user.id.uuidString.lowercased(),
                    username: user.username,
                    addedDate: Date(),
                    isFavorite: self.isFavorite(user.id.uuidString.lowercased()),
                    status: .accepted,
                    isPremium: hasPremium
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
            // Refresh blocked list
            await loadBlockedUsers()
            
        } catch {
            print("❌ SocialService: Failed to load friends: \(error)")
            
            // Delegate to central handler
            await handleAuthError(error)
        }
        isLoading = false
    }
    
    /// Centralized handler for auth/key errors from any component (Player, Social, etc.)
    /// Triggers self-healing if a key mismatch is detected.
    func handleAuthError(_ error: Error) async {
        let errorMsg = error.localizedDescription
        // expanded check to cover "No public key registered"
        if errorMsg.contains("Invalid cryptographic signature") || 
           errorMsg.contains("signature verification failed") ||
           errorMsg.contains("No public key registered") {
            
            print("🔑 SocialService: Detected key mismatch/auth error: \(errorMsg). Attempting auto-repair...")
            await repairKeys()
        }
    }

    
    /// Auto-repair keys by re-uploading the current public key to the server
    private func repairKeys() async {
        guard let currentUsername = currentUsername else { return }
        
        do {
            // 1. Get current keys
            guard let (_, publicKey) = await KeychainManager.shared.getKeyPair() else {
                print("❌ SocialService: Cannot repair keys - no local keys found")
                return
            }
            
            print("🔄 SocialService: Re-registering user \(currentUsername) to update public key...")
            
            // 2. Call Secure Registration (updates key if username exists)
            _ = try await SupabaseClient.shared.registerUserSecure(username: currentUsername, publicKey: publicKey)
            
            print("✅ SocialService: Keys repaired successfully! Retrying loadFriends...")
            
            // 3. Retry action
            await loadFriends()
            
        } catch {
            print("❌ SocialService: Key repair failed: \(error)")
        }
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

    func sendRequest(toUserId targetId: String) async -> String? {
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr),
              let targetUUID = UUID(uuidString: targetId) else { return "Invalid IDs" }
        
        do {
            try await client.sendFriendRequest(from: userId, to: targetUUID)
            await loadFriends()
            return nil
        } catch {
            return error.localizedDescription
        }
    }

    func removeFriend(friendId: String) async {
        let friendId = friendId.lowercased()
        guard let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr),
              let friendUUID = UUID(uuidString: friendId) else { return }
        
        do {
            try await client.deleteFriend(userId: userId, friendId: friendUUID)
            
            await MainActor.run {
                friends.removeAll { $0.id == friendId }
                friendActivity.removeValue(forKey: friendId)
                messages.removeValue(forKey: friendId)
            }
            print("✅ SocialService: Removed friend \(friendId)")
        } catch {
            print("❌ SocialService: Failed to remove friend: \(error)")
        }
    }

    func blockUser(userId targetId: String, username: String? = nil) async {
         guard let myIdStr = currentUserId, let myId = UUID(uuidString: myIdStr),
               let targetUUID = UUID(uuidString: targetId) else { return }
         
         // 1. Backend Call (Attempt)
         do {
             try await client.blockUser(blockerId: myId, blockedId: targetUUID)
             print("✅ SocialService: Backend blocked user \(targetId)")
         } catch {
             print("❌ SocialService: Backend block failed: \(error). Using local fallback.")
         }
         
         // 2. Local Update (Always apply)
         await MainActor.run {
             // Remove from friends/activity/messages
             friends.removeAll { $0.id == targetId.lowercased() }
             friendActivity.removeValue(forKey: targetId.lowercased())
             messages.removeValue(forKey: targetId.lowercased())
             
             // Add to local block list
             self.localBlockedIds.insert(targetId.lowercased())
             
             // Add to UI list (blockedUsers)
             if !blockedUsers.contains(where: { $0.id.uuidString.lowercased() == targetId.lowercased() }) {
                 let name = username ?? "Blocked User"
                 // Construct a temporary SupabaseUser for UI display
                 let blockedUser = SupabaseUser(
                     id: targetUUID,
                     username: name,
                     displayName: nil,
                     avatarUrl: nil,
                     createdAt: Date(),
                     lastSeen: Date(),
                     isAdmin: false,
                     isPremium: false,
                     subscriptionExpiresAt: nil
                 )
                 self.blockedUsers.append(blockedUser)
             }
         }
    }
    
    func unblockUser(userId: String) async {
         guard let currentId = SupabaseClient.shared.auth.currentUser?.id,
               let targetUuid = UUID(uuidString: userId) else { return }

         do {
             try await SupabaseClient.shared.unblockUser(blockerId: currentId, blockedId: targetUuid)
             print("✅ Unblocked user: \(userId)")
         } catch {
             print("❌ Failed to unblock user: \(error)")
         }
         
         // Update local list regardless of backend success (optimistic / fallback)
         await MainActor.run {
             blockedUsers.removeAll { $0.id.uuidString.lowercased() == userId.lowercased() }
             localBlockedIds.remove(userId.lowercased())
         }
    }
    
    func loadBlockedUsers() async {
        guard let currentId = SupabaseClient.shared.auth.currentUser?.id else { return }
        do {
            let users = try await SupabaseClient.shared.getBlockedUsers(userId: currentId)
            await MainActor.run {
                self.blockedUsers = users
            }
        } catch {
            print("⚠️ Failed to load blocked users: \(error)")
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
        
        // Setup monitoring
        await setupConnectionMonitoring(for: client, isPresence: false)
        
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
                    "filter": "receiver_id=eq.\(userId.lowercased())" // Force lowercase for DB match
                ],
                [
                    "event": "INSERT",
                    "schema": "public",
                    "table": "direct_messages",
                    "filter": "sender_id=eq.\(userId.lowercased())" // Force lowercase for DB match
                ]
            ]
            
            try await client.joinChannel("direct_messages", postgresChanges: changesConfig)
            print("✅ SocialService: Connected to DM channel")
        } catch {
            print("❌ SocialService: Failed to subscribe to DMs: \(error)")
        }
    }
    
    private func handleIncomingMessage(_ payload: [String: Any]) {
        // Standardized Realtime payload (mapped in SupabaseRealtimeClient)
        guard let newRecord = payload["new"] as? [String: Any] else {
            return
        }
        
        guard let idStr = newRecord["id"] as? String,
              let id = UUID(uuidString: idStr),
              let senderIdStr = newRecord["sender_id"] as? String,
              let senderId = UUID(uuidString: senderIdStr),
              let receiverIdStr = newRecord["receiver_id"] as? String,
              let receiverId = UUID(uuidString: receiverIdStr),
              let content = newRecord["content"] as? String,
              let createdAtStr = newRecord["created_at"] as? String else {
            // print("⚠️ SocialService: Failed to parse incoming message payload: \(payload)")
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
        // Determine which friend conversation this belongs to
        // INFO: Normalize to lowercase to match Friend.id
        let friendId = (senderIdStr == currentUserId) ? receiverIdStr : senderIdStr
        let normalizedFriendId = friendId.lowercased()
        
        var currentMsgs = self.messages[normalizedFriendId] ?? []
        
        // Check for duplicates or updates
        if let index = currentMsgs.firstIndex(where: { $0.id == id }) {
            // Update existing message
            var existing = currentMsgs[index]
            
            // If content is empty, preserve existing content (assume metadata update like is_read)
            if content.isEmpty && !existing.content.isEmpty {
                // Only update metadata
                print("ℹ️ SocialService: Updating metadata for message \(id)")
                existing.isRead = newRecord["is_read"] as? Bool ?? existing.isRead
            } else {
                // Full update including content
                existing = message
            }
            
            currentMsgs[index] = existing
            self.messages[normalizedFriendId] = currentMsgs
        } else {
            // New message logic
            // Deduplicate optimistic message from self
            if senderIdStr == currentUserId {
                // Look for a message with same content and diff ID (assumed to be the temp one)
                if let idx = currentMsgs.lastIndex(where: { 
                    $0.senderId.uuidString.lowercased() == currentUserId &&
                    $0.content == content &&
                    $0.id != id
                }) {
                    print("🧹 SocialService: Replacing optimistic message")
                    currentMsgs.remove(at: idx)
                }
            }
            
            currentMsgs.append(message)
            self.messages[normalizedFriendId] = currentMsgs
            
            // Increment unread count if it's an incoming message (not from me)
            // Use case-insensitive comparison
            if senderIdStr.caseInsensitiveCompare(currentUserId ?? "") != .orderedSame {
                self.unreadCounts[normalizedFriendId, default: 0] += 1
            }
            
            print("📨 SocialService: New message from/to \(friendId)")
        }
    }
    
    func clearUnread(friendId: String) {
        let friendId = friendId.lowercased()
        unreadCounts[friendId] = 0
        
        // Mark as read on server
        guard let userIdStr = currentUserId else { return }
        Task {
            do {
                _ = try await client.makeRequest(
                    path: "/direct_messages",
                    method: "PATCH",
                    body: ["is_read": true],
                    query: [
                        "sender_id": "eq.\(friendId)",
                        "receiver_id": "eq.\(userIdStr)"
                    ]
                )
            } catch {
                print("❌ Failed to mark messages as read: \(error)")
            }
        }
    }
    
    func fetchUnreadCounts() async {
        guard let userIdStr = currentUserId else { return }
        
        struct UnreadMessage: Decodable {
            let senderId: String
            
            enum CodingKeys: String, CodingKey {
                case senderId = "sender_id"
            }
        }
        
        do {
            let data = try await client.makeRequest(
                path: "/direct_messages",
                query: [
                    "select": "sender_id",
                    "receiver_id": "eq.\(userIdStr)",
                    "is_read": "eq.false"
                ]
            )
            
            let response = try JSONDecoder().decode([UnreadMessage].self, from: data)
            
            // Group by senderId
            var counts: [String: Int] = [:]
            for msg in response {
                let sender = msg.senderId.lowercased()
                counts[sender, default: 0] += 1
            }
            
            self.unreadCounts = counts
            print("📬 SocialService: Fetched \(response.count) unread messages")
        } catch {
            print("❌ Failed to fetch unread counts: \(error)")
        }
    }
    
    func loadMessages(friendId: String) async {
        let friendId = friendId.lowercased()
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
        let friendId = friendId.lowercased()
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
    
    func sendInvite(to friendId: String, roomId: String, roomName: String) async {
        let inviteContent = "INVITE|\(roomId)|\(roomName)"
        await sendMessage(to: friendId, content: inviteContent)
    }
    
    /// Delete all messages with a friend
    func deleteAllMessages(friendId: String) async throws {
        let friendId = friendId.lowercased()
        guard let userIdStr = currentUserId,
              let userId = UUID(uuidString: userIdStr),
              let friendUUID = UUID(uuidString: friendId) else {
            throw NSError(domain: "SocialService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid user or friend ID"])
        }
        
        do {
            try await client.deleteAllDirectMessages(userId: userId, friendId: friendUUID)
            
            // Clear local cache
            self.messages[friendId] = []
            self.unreadCounts[friendId] = 0
            
            print("✅ SocialService: Deleted all messages with \(friendId)")
        } catch {
            print("❌ SocialService: Failed to delete messages: \(error)")
            throw error
        }
    }


    // MARK: - Watch History Sync
    
    private func syncLocalHistory() async {
        guard let data = UserDefaults.standard.data(forKey: "watchHistory"),
              let history = try? JSONDecoder().decode([WatchHistoryItem].self, from: data),
              let userIdStr = currentUserId, let userId = UUID(uuidString: userIdStr) else { return }
        
        print("🔄 SocialService: Syncing \(history.count) items to cloud...")
        
        // Sort by lastWatched (newest first) to prioritize recent history
        let sortedHistory = history.sorted { $0.lastWatched > $1.lastWatched }
        let batch = Array(sortedHistory.prefix(50)) // Limit to 50 items to prevent overload
        
        print("🔄 SocialService: Syncing \(batch.count) items to cloud (serial)...")
        
        Task {
            for item in batch {
                do {
                    try await client.upsertWatchHistory(item: item, userId: userId)
                    // Small yield to allow other tasks to process if needed
                    try await Task.sleep(nanoseconds: 10_000_000) // 10ms
                } catch {
                    print("⚠️ SocialService: Failed to sync item \(item.mediaItem.name): \(error)")
                }
            }
        }
    }
    
    func fetchFriendHistory(friendId: String) async -> [SupabaseWatchHistoryEntry] {
        guard let friendUUID = UUID(uuidString: friendId) else { return [] }
        do {
            let rawHistory = try await client.getWatchHistory(userId: friendUUID)
            
            // Deduplicate: Keep only the most recent entry for each media_id (Show/Movie)
            // Since the API returns sorted by last_watched (desc), the first one we find is the latest.
            var seenMedia = Set<String>()
            return rawHistory.filter { entry in
                // For shows, mediaId should be the Show ID. For movies, it's the Movie ID.
                // This ensures "Breaking Bad S02E03" and "Breaking Bad S01E05" don't appear twice.
                guard !seenMedia.contains(entry.mediaId) else { return false }
                seenMedia.insert(entry.mediaId)
                return true
            }
        } catch {
            print("❌ Failed to fetch friend history: \(error)")
            return []
        }
    }
}
