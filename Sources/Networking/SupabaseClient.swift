import Foundation

/// Supabase REST API client for RedLemon backend operations
/// Uses direct HTTP requests to Supabase PostgREST API
class SupabaseClient {
    static let shared = SupabaseClient()

    private let baseURL: String
    private let apiKey: String
    private let session: URLSession

    /// Custom Realtime client for watch party sync
    lazy var realtimeClient: SupabaseRealtimeClient = {
        SupabaseRealtimeClient(
            realtimeURL: Config.supabaseURL,
            apiKey: Config.supabaseAnonKey
        )
    }()

    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()

        // Custom date decoding strategy to handle multiple Supabase formats
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            // Try different formats that Supabase might return
            let formatters: [DateFormatter] = [
                {
                    let f = DateFormatter()
                    f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
                    f.locale = Locale(identifier: "en_US_POSIX")
                    f.timeZone = TimeZone(secondsFromGMT: 0)
                    return f
                }(),
                {
                    let f = DateFormatter()
                    f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    f.locale = Locale(identifier: "en_US_POSIX")
                    f.timeZone = TimeZone(secondsFromGMT: 0)
                    return f
                }(),
                {
                    let f = DateFormatter()
                    f.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    f.locale = Locale(identifier: "en_US_POSIX")
                    return f
                }(),
                {
                    let f = DateFormatter()
                    f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    f.locale = Locale(identifier: "en_US_POSIX")
                    return f
                }()
            ]

            for formatter in formatters {
                if let date = formatter.date(from: dateString) {
                    return date
                }
            }

            // If all formatters fail, log the actual format we received
            NSLog("❌ Failed to decode date string: '\(dateString)'")
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Date string '\(dateString)' does not match any expected format"
            )
        }

        return decoder
    }()

    private init() {
        self.baseURL = Config.supabaseURL
        self.apiKey = Config.supabaseAnonKey
        self.session = URLSession.shared
    }

    // MARK: - Helper Methods

    private func makeRequest(
        path: String,
        method: String = "GET",
        body: [String: Any]? = nil,
        query: [String: String]? = nil
    ) async throws -> Data {
        var urlString = "\(baseURL)/rest/v1\(path)"

        if let query = query, !query.isEmpty {
            let queryItems = query.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
            urlString += "?\(queryItems)"
        }

        guard let url = URL(string: urlString) else {
            throw SupabaseError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("return=representation", forHTTPHeaderField: "Prefer")

        if let body = body {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        }

        let (data, response) = try await session.data(for: request)
        
        // DEBUG: Print raw JSON for room requests to verify season/episode
        if path.contains("/rooms") {
            if let jsonString = String(data: data, encoding: .utf8) {
                print("🔍 Supabase Response for \(path): \(jsonString)")
            }
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw SupabaseError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let errorString = String(data: data, encoding: .utf8) ?? "Unknown error"
            print("❌ Supabase error (\(httpResponse.statusCode)): \(errorString)")
            throw SupabaseError.httpError(httpResponse.statusCode, errorString)
        }

        return data
    }

    // MARK: - User Management

    /// Create or get existing user
    /// Get user by username (for friends lookup)
    func getUserByUsername(username: String) async throws -> SupabaseUser? {
        NSLog("🔍 SupabaseClient: Looking up user by username '\(username)'")

        let data = try await makeRequest(
            path: "/users",
            query: ["username": "eq.\(username)", "select": "*"]
        )

        NSLog("📡 SupabaseClient: User lookup response received (\(data.count) bytes)")

        do {
            let users = try jsonDecoder.decode([SupabaseUser].self, from: data)
            NSLog("✅ SupabaseClient: Decoded \(users.count) users from response")

            if let user = users.first {
                NSLog("👤 SupabaseClient: Found user - \(user.username) (ID: \(user.id))")
                return user
            } else {
                NSLog("⚠️ SupabaseClient: No users found for username '\(username)'")
                return nil
            }
        } catch {
            // Log the raw response for debugging
            if let responseString = String(data: data, encoding: .utf8) {
                NSLog("❌ SupabaseClient: Failed to decode user response. Raw data: \(responseString)")
            } else {
                NSLog("❌ SupabaseClient: Failed to decode user response (could not convert to string)")
            }
            NSLog("❌ SupabaseClient: Decoding error: \(error)")
            NSLog("   Error type: \(type(of: error))")
            NSLog("   Error details: \(error.localizedDescription)")
            throw error
        }
    }

    /// Create or login user (username is unique and persistent)
    func createOrGetUser(username: String) async throws -> SupabaseUser {
        // Try to get existing user first
        let existingData = try await makeRequest(
            path: "/users",
            query: ["username": "eq.\(username)", "select": "*"]
        )

        let existing = try jsonDecoder.decode([SupabaseUser].self, from: existingData)
        if let user = existing.first {
            // Update last_seen
            _ = try? await makeRequest(
                path: "/users",
                method: "PATCH",
                body: ["last_seen": ISO8601DateFormatter().string(from: Date())],
                query: ["id": "eq.\(user.id.uuidString)"]
            )
            return user
        }

        // Create new user
        let newData = try await makeRequest(
            path: "/users",
            method: "POST",
            body: ["username": username]
        )

        let newUsers = try jsonDecoder.decode([SupabaseUser].self, from: newData)
        guard let user = newUsers.first else {
            throw SupabaseError.userCreationFailed
        }

        return user
    }

    func getUser(id: UUID) async throws -> SupabaseUser? {
        let data = try await makeRequest(
            path: "/users",
            query: ["id": "eq.\(id.uuidString)", "select": "*"]
        )
        let users = try jsonDecoder.decode([SupabaseUser].self, from: data)
        return users.first
    }

    /// Alias for getUser (more descriptive)
    func getUserById(userId: UUID) async throws -> SupabaseUser? {
        return try await getUser(id: userId)
    }

    /// Search for users by username (case-insensitive partial match)
    func searchUsers(username: String) async throws -> [SupabaseUser] {
        let data = try await makeRequest(
            path: "/users",
            query: ["username": "ilike.*\(username)*", "select": "*"]
        )

        let users = try jsonDecoder.decode([SupabaseUser].self, from: data)
        return users
    }

    // MARK: - Room Management

    /// Get all public rooms
    func getAllRooms() async throws -> [SupabaseRoom] {
        let data = try await makeRequest(
            path: "/rooms",
            query: [
                "is_public": "eq.true",
                "select": "*",
                "order": "last_activity.desc"
            ]
        )
        return try jsonDecoder.decode([SupabaseRoom].self, from: data)
    }

    /// Create a new room
    func createRoom(
        id: String,
        name: String,
        hostUserId: UUID,
        hostUsername: String,
        streamHash: String? = nil,
        imdbId: String? = nil,
        posterUrl: String? = nil,
        backdropUrl: String? = nil,
        season: Int? = nil,
        episode: Int? = nil,
        isPublic: Bool = true
    ) async throws -> SupabaseRoom {
        var roomData: [String: Any] = [
            "id": id,
            "name": name,
            "host_user_id": hostUserId.uuidString,
            "host_username": hostUsername,
            "is_public": isPublic
        ]

        if let streamHash = streamHash { roomData["stream_hash"] = streamHash }
        if let imdbId = imdbId { roomData["imdb_id"] = imdbId }
        if let posterUrl = posterUrl { roomData["poster_url"] = posterUrl }
        if let backdropUrl = backdropUrl { roomData["backdrop_url"] = backdropUrl }
        if let season = season { roomData["season"] = season }
        if let episode = episode { roomData["episode"] = episode }

        let data = try await makeRequest(
            path: "/rooms",
            method: "POST",
            body: roomData
        )

        let rooms = try jsonDecoder.decode([SupabaseRoom].self, from: data)
        guard let room = rooms.first else {
            throw SupabaseError.roomCreationFailed
        }

        return room
    }    /// Join a room
    func joinRoom(roomId: String, userId: UUID, isHost: Bool = false) async throws {
        _ = try await makeRequest(
            path: "/room_participants",
            method: "POST",
            body: [
                "room_id": roomId,
                "user_id": userId.uuidString,
                "is_host": isHost
            ]
        )
    }

    /// Leave a room
    func leaveRoom(roomId: String, userId: UUID) async throws {
        _ = try await makeRequest(
            path: "/room_participants",
            method: "DELETE",
            query: [
                "room_id": "eq.\(roomId)",
                "user_id": "eq.\(userId.uuidString)"
            ]
        )
    }

    /// Get all participants in a room
    func getRoomParticipants(roomId: String) async throws -> [RoomParticipant] {
        let data = try await makeRequest(
            path: "/room_participants",
            method: "GET",
            query: [
                "room_id": "eq.\(roomId)",
                "select": "*"
            ]
        )
        let response = try jsonDecoder.decode([RoomParticipant].self, from: data)
        return response
    }

    /// Update room playback state
    func updateRoomPlayback(roomId: String, position: Int, isPlaying: Bool) async throws {
        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: [
                "playback_position": position,
                "is_playing": isPlaying,
                "last_activity": ISO8601DateFormatter().string(from: Date())
            ],
            query: ["id": "eq.\(roomId)"]
        )
    }

    /// Start room playback for database fallback (when Realtime fails)
    func startRoomPlayback(roomId: String) async throws {
        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: [
                "is_playing": true,
                "playback_position": 0,
                "last_activity": ISO8601DateFormatter().string(from: Date())
            ],
            query: ["id": "eq.\(roomId)"]
        )
    }

    /// Get room state for database fallback polling
    func getRoomState(roomId: String) async throws -> SupabaseRoom? {
        let data = try await makeRequest(
            path: "/rooms",
            query: ["id": "eq.\(roomId)", "select": "*"]
        )

        let rooms = try jsonDecoder.decode([SupabaseRoom].self, from: data)
        return rooms.first
    }

    // MARK: - Friends System

    /// Send friend request
    func sendFriendRequest(fromUserId: UUID, toUsername: String) async throws {
        // Get target user ID
        let userData = try await makeRequest(
            path: "/users",
            query: ["username": "eq.\(toUsername)", "select": "*"]
        )

        let users = try jsonDecoder.decode([SupabaseUser].self, from: userData)
        guard let toUser = users.first else {
            throw SupabaseError.userNotFound
        }

        _ = try await makeRequest(
            path: "/friend_requests",
            method: "POST",
            body: [
                "from_user_id": fromUserId.uuidString,
                "to_user_id": toUser.id.uuidString,
                "status": "pending"
            ]
        )
    }

    /// Get friends list
    func getFriends(userId: UUID) async throws -> [SupabaseUser] {
        NSLog("📡 SupabaseClient: Fetching friendships for user \(userId)")

        let data = try await makeRequest(
            path: "/friendships",
            query: [
                "user_id": "eq.\(userId.uuidString)",
                "select": "user_id,friend_id,created_at"
            ]
        )

        NSLog("✅ SupabaseClient: Friendships response received (\(data.count) bytes)")

        let friendships = try jsonDecoder.decode([SupabaseFriendship].self, from: data)
        NSLog("✅ SupabaseClient: Decoded \(friendships.count) friendships")

        let friendIds = friendships.map { $0.friendId.uuidString }
        NSLog("   Friend IDs: \(friendIds)")

        guard !friendIds.isEmpty else {
            NSLog("   No friends found for user")
            return []
        }

        NSLog("📡 SupabaseClient: Fetching user details for friends...")
        let friendsData = try await makeRequest(
            path: "/users",
            query: [
                "id": "in.(\(friendIds.joined(separator: ",")))",
                "select": "*"
            ]
        )

        NSLog("✅ SupabaseClient: Friends data received (\(friendsData.count) bytes)")

        return try jsonDecoder.decode([SupabaseUser].self, from: friendsData)
    }

    /// Create friendship directly (bypasses friend request system)
    /// Used for auto-friending lemontom (MySpace Tom style)
    func createFriendship(userId1: UUID, userId2: UUID) async throws {
        // Create friendship both ways (bidirectional)
        _ = try await makeRequest(
            path: "/friendships",
            method: "POST",
            body: [
                "user_id": userId1.uuidString,
                "friend_id": userId2.uuidString
            ]
        )

        _ = try await makeRequest(
            path: "/friendships",
            method: "POST",
            body: [
                "user_id": userId2.uuidString,
                "friend_id": userId1.uuidString
            ]
        )
    }

    /// Get incoming friend requests for a user
    func getFriendRequests(userId: UUID) async throws -> [SupabaseFriendRequest] {
        NSLog("📡 SupabaseClient: Fetching friend requests for user ID: \(userId)")

        let query = [
            "to_user_id": "eq.\(userId.uuidString)",
            "status": "eq.pending",
            "select": "*,from_user:from_user_id(id,username)"
        ]

        NSLog("   Query parameters: \(query)")

        let data = try await makeRequest(
            path: "/friend_requests",
            query: query
        )

        NSLog("✅ SupabaseClient: Friend requests response received (\(data.count) bytes)")

        do {
            let requests = try jsonDecoder.decode([SupabaseFriendRequest].self, from: data)
            NSLog("✅ SupabaseClient: Decoded \(requests.count) friend requests")

            for request in requests {
                NSLog("   📨 Request from: \(request.fromUserId) → \(request.toUserId)")
                NSLog("      Status: \(request.status)")
                NSLog("      Created: \(request.createdAt)")
                if let fromUser = request.fromUser {
                    NSLog("      From user: \(fromUser.username)")
                } else {
                    NSLog("      ⚠️ No from user data included")
                }
            }

            return requests
        } catch {
            NSLog("❌ SupabaseClient: Failed to decode friend requests: \(error)")
            if let responseString = String(data: data, encoding: .utf8) {
                NSLog("   Raw response: \(responseString)")
            }
            throw error
        }
    }

    /// Accept friend request
    func acceptFriendRequest(requestId: UUID, userId: UUID, friendId: UUID) async throws {
        // Update request status
        _ = try await makeRequest(
            path: "/friend_requests",
            method: "PATCH",
            body: ["status": "accepted"],
            query: ["id": "eq.\(requestId.uuidString)"]
        )

        // Create bidirectional friendship
        try await createFriendship(userId1: userId, userId2: friendId)
    }

    /// Decline friend request
    func declineFriendRequest(requestId: UUID) async throws {
        _ = try await makeRequest(
            path: "/friend_requests",
            method: "PATCH",
            body: ["status": "rejected"],
            query: ["id": "eq.\(requestId.uuidString)"]
        )
    }


    // MARK: - Chat

    /// Send chat message
    func sendChatMessage(roomId: String, userId: UUID, username: String, message: String) async throws {
        _ = try await makeRequest(
            path: "/chat_messages",
            method: "POST",
            body: [
                "room_id": roomId,
                "user_id": userId.uuidString,
                "username": username,
                "message": message
            ]
        )
    }

    /// Get chat messages for room
    func getChatMessages(roomId: String, limit: Int = 50) async throws -> [SupabaseChatMessage] {
        let data = try await makeRequest(
            path: "/chat_messages",
            query: [
                "room_id": "eq.\(roomId)",
                "select": "*",
                "order": "created_at.asc",
                "limit": String(limit)
            ]
        )
        return try jsonDecoder.decode([SupabaseChatMessage].self, from: data)
    }
}
// MARK: - Supabase Models

struct SupabaseUser: Codable {
    let id: UUID
    let username: String
    let displayName: String?
    let avatarUrl: String?
    let createdAt: Date
    let lastSeen: Date

    enum CodingKeys: String, CodingKey {
        case id, username
        case displayName = "display_name"
        case avatarUrl = "avatar_url"
        case createdAt = "created_at"
        case lastSeen = "last_seen"
    }
}

struct SupabaseRoom: Codable {
    let id: String
    let name: String
    let hostUserId: UUID
    let hostUsername: String
    let streamHash: String?
    let imdbId: String?
    let posterUrl: String?
    let backdropUrl: String?
    let playbackPosition: Int
    let isPlaying: Bool
    let participantsCount: Int
    let maxParticipants: Int
    let isPublic: Bool
    let createdAt: Date
    let lastActivity: Date
    let season: Int?  // Season number for TV shows
    let episode: Int?  // Episode number for TV shows

    enum CodingKeys: String, CodingKey {
        case id, name
        case hostUserId = "host_user_id"
        case hostUsername = "host_username"
        case streamHash = "stream_hash"
        case imdbId = "imdb_id"
        case posterUrl = "poster_url"
        case backdropUrl = "backdrop_url"
        case playbackPosition = "playback_position"
        case isPlaying = "is_playing"
        case participantsCount = "participants_count"
        case maxParticipants = "max_participants"
        case isPublic = "is_public"
        case createdAt = "created_at"
        case lastActivity = "last_activity"
        case season
        case episode
    }
}

struct SupabaseFriendship: Codable {
    let userId: UUID
    let friendId: UUID
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case friendId = "friend_id"
        case createdAt = "created_at"
    }
}

struct SupabaseFriendRequest: Codable {
    let id: UUID
    let fromUserId: UUID
    let toUserId: UUID
    let status: String
    let createdAt: Date
    let fromUser: SupabaseUser?

    enum CodingKeys: String, CodingKey {
        case id
        case fromUserId = "from_user_id"
        case toUserId = "to_user_id"
        case status
        case createdAt = "created_at"
        case fromUser = "from_user"
    }
}

struct RoomParticipant: Codable {
    let roomId: String
    let userId: UUID
    let joinedAt: Date
    let isHost: Bool

    enum CodingKeys: String, CodingKey {
        case roomId = "room_id"
        case userId = "user_id"
        case joinedAt = "joined_at"
        case isHost = "is_host"
    }
}


struct SupabaseChatMessage: Codable {
    let id: UUID
    let roomId: String
    let userId: UUID
    let username: String
    let message: String
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case roomId = "room_id"
        case userId = "user_id"
        case username, message
        case createdAt = "created_at"
    }
}

// Helper for dynamic JSON
struct AnyCodable: Codable {
    let value: Any

    init(_ value: Any) {
        self.value = value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            value = string
        } else if let int = try? container.decode(Int.self) {
            value = int
        } else if let double = try? container.decode(Double.self) {
            value = double
        } else if let bool = try? container.decode(Bool.self) {
            value = bool
        } else if let array = try? container.decode([AnyCodable].self) {
            value = array.map { $0.value }
        } else if let dict = try? container.decode([String: AnyCodable].self) {
            value = dict.mapValues { $0.value }
        } else {
            value = NSNull()
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let string = value as? String {
            try container.encode(string)
        } else if let int = value as? Int {
            try container.encode(int)
        } else if let double = value as? Double {
            try container.encode(double)
        } else if let bool = value as? Bool {
            try container.encode(bool)
        } else {
            try container.encodeNil()
        }
    }
}

// MARK: - Errors

enum SupabaseError: Error {
    case userCreationFailed
    case userNotFound
    case roomCreationFailed
    case invalidURL
    case invalidResponse
    case httpError(Int, String)
}
