import Foundation

/// Supabase REST API client for RedLemon backend operations
/// Uses direct HTTP requests to Supabase PostgREST API

enum SupabaseError: Error {
    case httpError(Int, String)
    case decodingError(Error)
    case encodingError
    case roomCreationFailed
    case userNotFound
    case invalidURL
    case invalidResponse
    case userCreationFailed
    case serverError(String)
}

/// Protocol for managing watch party rooms
protocol RoomManager {
    func createRoom(
        id: String,
        name: String,
        hostUserId: UUID,
        hostUsername: String,
        streamHash: String?,
        imdbId: String?,
        posterUrl: String?,
        backdropUrl: String?,
        season: Int?,
        episode: Int?,
        isPublic: Bool,
        unlockedStreamUrl: String?,
        description: String?,
        playlist: [PlaylistItem]?
    ) async throws -> SupabaseRoom
    
    func joinRoom(roomId: String, userId: UUID, isHost: Bool) async throws
    func updateRoomStream(roomId: String, streamHash: String?, fileIdx: Int?, quality: String?, unlockedUrl: String?) async throws
    func getRoomState(roomId: String) async throws -> SupabaseRoom?
    func getRoomParticipants(roomId: String) async throws -> [RoomParticipant]
}

protocol UserManager {
    func getUserById(userId: UUID) async throws -> SupabaseUser?
}

class SupabaseClient: RoomManager, UserManager {
    static let shared = SupabaseClient()

    private let baseURL: String
    private let apiKey: String
    private let session: URLSession

    /// Auth context for tracking current user
    var auth: AuthContext { AuthContext.shared }

    /// Edge Functions API
    var functions: EdgeFunctionsAPI { EdgeFunctionsAPI(baseURL: baseURL, apiKey: apiKey) }

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
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        self.session = URLSession(configuration: config)
    }

    // MARK: - Query Builder

    /// Create a query builder for a table
    func from(_ table: String) -> QueryBuilder {
        return QueryBuilder(client: self, table: table)
    }

    // MARK: - Helper Methods

    internal func makeRequest(
        path: String,
        method: String = "GET",
        body: [String: Any]? = nil,
        query: [String: String]? = nil,
        headers: [String: String]? = nil
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
        
        // Default Preference
        var requestHeaders = ["Prefer": "return=representation"]
        
        // Merge custom headers (overwriting defaults if key exists)
        if let customHeaders = headers {
            for (key, value) in customHeaders {
                requestHeaders[key] = value
            }
        }
        
        // Apply headers to request
        for (key, value) in requestHeaders {
            request.setValue(value, forHTTPHeaderField: key)
        }

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

    /// Get trusted server time from Supabase (via HTTP Date header)
    /// Get trusted server time from Supabase (via RPC)
    func getServerTime() async throws -> Date {
        let data = try await makeRequest(
            path: "/rpc/get_server_time",
            method: "POST"
        )
        
        // RPC returns a string like "2023-10-27T10:00:00.123456+00:00"
        // It might be wrapped in quotes if it's a JSON string
        guard let dateString = String(data: data, encoding: .utf8)?.trimmingCharacters(in: CharacterSet(charactersIn: "\"")) else {
            throw SupabaseError.invalidResponse
        }
        
        // Use our flexible date decoder logic (or just a formatter here)
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = formatter.date(from: dateString) {
            return date
        }
        
        // Fallback for standard ISO8601
        let fallbackFormatter = ISO8601DateFormatter()
        if let date = fallbackFormatter.date(from: dateString) {
            return date
        }
        
        throw SupabaseError.invalidResponse
    }

    // MARK: - User Management

    /// Create or get existing user
    /// Get user by username (for friends lookup)
    func getUserByUsername(username: String) async throws -> SupabaseUser? {
        NSLog("🔍 SupabaseClient: Looking up user by username '\(username)'")

        let data = try await makeRequest(
            path: "/users",
            query: ["username": "ilike.\(username)", "select": "*"]
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
        // Use RPC for atomic login/registration (bypasses RLS issues)
        let data = try await makeRequest(
            path: "/rpc/login_by_username",
            method: "POST",
            body: ["p_username": username]
        )

        let users = try jsonDecoder.decode([SupabaseUser].self, from: data)
        guard let user = users.first else {
            throw SupabaseError.userCreationFailed
        }

        // Set auth context
        auth.currentUser = AuthUser(id: user.id, username: user.username, isAdmin: user.isAdmin ?? false)

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

    /// Get all users for Admin Dashboard
    func getAllUsers(limit: Int = 50, offset: Int = 0) async throws -> [SupabaseUser] {
        let data = try await makeRequest(
            path: "/users",
            query: [
                "select": "*",
                "order": "last_seen.desc",
                "limit": String(limit),
                "offset": String(offset)
            ]
        )
        return try jsonDecoder.decode([SupabaseUser].self, from: data)
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
    /// Get all public rooms with pagination
    func getAllRooms(limit: Int = 20, offset: Int = 0) async throws -> [SupabaseRoom] {
        let data = try await makeRequest(
            path: "/rooms",
            query: [
                "is_public": "eq.true",
                "select": "*",
                "order": "last_activity.desc",
                "limit": String(limit),
                "offset": String(offset)
            ]
        )
        return try jsonDecoder.decode([SupabaseRoom].self, from: data)
    }

    /// Get active rooms for Admin Dashboard
    func getActiveRooms() async throws -> [SupabaseRoom] {
        let data = try await makeRequest(
            path: "/rooms",
            query: [
                "participants_count": "gt.0",
                "select": "*",
                "order": "participants_count.desc"
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
        isPublic: Bool = false,
        unlockedStreamUrl: String? = nil,
        description: String? = nil,
        playlist: [PlaylistItem]? = nil
    ) async throws -> SupabaseRoom {
        var roomData: [String: Any] = [
            "id": id,
            "name": name,
            "host_user_id": hostUserId.uuidString,
            "host_username": hostUsername,
            "is_public": isPublic,
            "last_activity": ISO8601DateFormatter().string(from: Date())
        ]

        if let description = description { roomData["description"] = description }
        if let streamHash = streamHash { roomData["stream_hash"] = streamHash }
        if let imdbId = imdbId { roomData["imdb_id"] = imdbId }
        if let posterUrl = posterUrl { roomData["poster_url"] = posterUrl }
        if let backdropUrl = backdropUrl { roomData["backdrop_url"] = backdropUrl }
        if let season = season { roomData["season"] = season }
        if let episode = episode { roomData["episode"] = episode }
        if let unlockedStreamUrl = unlockedStreamUrl { roomData["unlocked_stream_url"] = unlockedStreamUrl }

        if let playlist = playlist {
            // Serialize playlist items to dictionaries for JSONB column
            do {
                let playlistData = try playlist.map { item -> [String: Any] in
                    let data = try JSONEncoder().encode(item)
                    guard let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        throw SupabaseError.encodingError
                    }
                    return dict
                }
                roomData["playlist"] = playlistData
            } catch {
                NSLog("⚠️ Failed to encode playlist for room creation: \(error)")
                // Continue without playlist rather than failing entirely
            }
        }

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
        do {
            _ = try await makeRequest(
                path: "/room_participants",
                method: "POST",
                body: [
                    "room_id": roomId,
                    "user_id": userId.uuidString,
                    "is_host": isHost
                ]
            )
        } catch SupabaseError.httpError(let code, _) where code == 409 {
            // Error 409 means user is already in the room (duplicate key).
            // We can safely ignore this and proceed as if join was successful.
            NSLog("⚠️ SupabaseClient: User already in room (409), proceeding...")
        } catch {
            // Re-throw other errors
            throw error
        }
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

    /// Delete a room (Admin or Distributed Cleanup)
    func deleteRoom(roomId: String) async throws {
        _ = try await makeRequest(
            path: "/rooms",
            method: "DELETE",
            query: ["id": "eq.\(roomId)"]
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
    
    /// Update room stream selection (Host only)
    func updateRoomStream(
        roomId: String,
        streamHash: String?,
        fileIdx: Int?,
        quality: String?,
        unlockedUrl: String?
    ) async throws {
        var body: [String: Any] = [
            "last_activity": ISO8601DateFormatter().string(from: Date())
        ]
        
        if let streamHash = streamHash { body["stream_hash"] = streamHash }
        if let fileIdx = fileIdx { body["selected_file_idx"] = fileIdx }
        if let quality = quality { body["selected_quality"] = quality }
        if let unlockedUrl = unlockedUrl { body["unlocked_stream_url"] = unlockedUrl }
        
        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"]
        )
        
        NSLog("✅ Persisted stream selection to room \(roomId)")
    }

    /// Update room playlist (Host only)
    func updateRoomPlaylist(
        roomId: String,
        playlist: [PlaylistItem],
        currentIndex: Int
    ) async throws {
        NSLog("📡 SupabaseClient: updateRoomPlaylist called for room \(roomId) with \(playlist.count) items, index: \(currentIndex)")
        
        do {
            // Serialize playlist items to dictionaries for JSONB column
            let playlistData = try playlist.map { item -> [String: Any] in
                let data = try JSONEncoder().encode(item)
                guard let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    throw SupabaseError.encodingError
                }
                return dict
            }

            _ = try await makeRequest(
                path: "/rooms",
                method: "PATCH",
                body: [
                    "playlist": playlistData,
                    "current_playlist_index": currentIndex
                ],
                query: ["id": "eq.\(roomId)"]
            )
            NSLog("✅ SupabaseClient: Playlist updated successfully")
        } catch SupabaseError.httpError(let code, let message) where code == 400 && message.contains("current_playlist_index") {
            NSLog("⚠️ SupabaseClient: Backend schema missing 'current_playlist_index'. Retrying without index...")
            
            // RETRY: Update ONLY the playlist array
            // Serialize playlist items AGAIN (since they were consumed/scoped above)
            let playlistData = try playlist.map { item -> [String: Any] in
                let data = try JSONEncoder().encode(item)
                guard let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    throw SupabaseError.encodingError
                }
                return dict
            }
            
            _ = try await makeRequest(
                path: "/rooms",
                method: "PATCH",
                body: ["playlist": playlistData],
                query: ["id": "eq.\(roomId)"]
            )
            NSLog("✅ SupabaseClient: Playlist updated (Fallback mode: No Index persisted)")
            
        } catch {
             NSLog("❌ SupabaseClient: Failed to update playlist: \(error)")
             throw error
        }
    }

    /// Update room metadata (Active Media)
    func updateRoomMetadata(
        roomId: String,
        name: String,
        imdbId: String?,
        season: Int?,
        episode: Int?,
        posterUrl: String? = nil,
        backdropUrl: String? = nil
    ) async throws {
        var body: [String: Any] = [
            "name": name,
            "last_activity": ISO8601DateFormatter().string(from: Date())
        ]
        
        if let imdbId = imdbId { body["imdb_id"] = imdbId }
        if let season = season { body["season"] = season }
        if let episode = episode { body["episode"] = episode }
        if let posterUrl = posterUrl { body["poster_url"] = posterUrl }
        if let backdropUrl = backdropUrl { body["backdrop_url"] = backdropUrl }
        
        // Update last_activity to keep room visible/fresh
        body["last_activity"] = ISO8601DateFormatter().string(from: Date())
        
        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"]
        )
    }

    /// Update room visibility (e.g. Soft Close)
    func setRoomVisibility(roomId: String, isPublic: Bool) async throws {
        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: [
                "is_public": isPublic,
                "last_activity": ISO8601DateFormatter().string(from: Date())
            ],
            query: ["id": "eq.\(roomId)"]
        )
    }

    /// Send heartbeat to update last_seen for participant
    func sendHeartbeat(roomId: String, userId: UUID) async throws {
        _ = try await makeRequest(
            path: "/room_participants",
            method: "PATCH",
            body: [
                "last_seen": ISO8601DateFormatter().string(from: Date())
            ],
            query: [
                "room_id": "eq.\(roomId)",
                "user_id": "eq.\(userId.uuidString)"
            ]
        )
    }

    /// Invoke cleanup for stale participants (RPC call)
    func cleanupStaleParticipants() async throws {
        _ = try await makeRequest(
            path: "/rpc/cleanup_stale_participants",
            method: "POST"
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
    // MARK: - Logging

    /// Upload log entry to Supabase
    func insertLog(level: String, message: String, metadata: [String: Any]? = nil) async throws {
        var body: [String: Any] = [
            "level": level,
            "message": message,
            "created_at": ISO8601DateFormatter().string(from: Date())
        ]
        
        if let metadata = metadata {
            body["metadata"] = metadata
        }
        
        if let userId = auth.currentUser?.id {
            body["user_id"] = userId.uuidString
        }
        
        // Fire and forget - don't wait for response to avoid blocking
        _ = try await makeRequest(
            path: "/app_logs",
            method: "POST",
            body: body
        )
    }

    /// Fetch recent logs for Admin Dashboard
    func getAppLogs(limit: Int = 50) async throws -> [AppLog] {
        let data = try await makeRequest(
            path: "/app_logs",
            query: [
                "select": "*",
                "order": "created_at.desc",
                "limit": String(limit)
            ]
        )
        return try jsonDecoder.decode([AppLog].self, from: data)
    }

    /// Get total user count
    func getUserCount() async throws -> Int {
        // Workaround: Just fetch all IDs (small payload)
        let idsData = try await makeRequest(
            path: "/users",
            query: ["select": "id"]
        )
        let ids = try jsonDecoder.decode([SupabaseUserID].self, from: idsData)
        return ids.count
    }
    
    /// Check system health (latency)
    func checkHealth() async throws -> Double {
        let start = Date()
        _ = try await getServerTime()
        return Date().timeIntervalSince(start) * 1000 // ms
    }
    
    // MARK: - Analytics
    
    func getAppVersionStats() async throws -> [AppVersionStat] {
        let data = try await makeRequest(
            path: "/rpc/get_app_version_stats",
            method: "POST"
        )
        return try jsonDecoder.decode([AppVersionStat].self, from: data)
    }
    
    func getContentPopularity() async throws -> [ContentPopularityStat] {
        let data = try await makeRequest(
            path: "/rpc/get_content_popularity",
            method: "POST"
        )
        return try jsonDecoder.decode([ContentPopularityStat].self, from: data)
    }

    // MARK: - Payments (Edge Functions)

    /// Assign a payment address for the user
    func assignPaymentAddress(chain: String) async throws -> String {
        let response = try await functions.invoke(
            "assign-address",
            options: FunctionInvokeOptions(body: ["chain": chain])
        )
        
        let result = try JSONDecoder().decode(PaymentAssignment.self, from: response)
        
        if let error = result.error {
            throw SupabaseError.serverError(error)
        }
        
        guard let address = result.address else {
            throw SupabaseError.serverError("No address returned")
        }
        
        return address
    }
    
    // MARK: - Verified Streams (Community Caching)
    
    struct VerifiedStream: Identifiable, Codable {
        let hash: String
        let imdbId: String
        let quality: String
        let season: Int
        let episode: Int
        let magnetLink: String?
        let movieTitle: String? // Optional as it might not be joined yet
        let voteCount: Int
        let lastVerifiedAt: Date
        
        // Custom coding keys to match DB Snake Case
        enum CodingKeys: String, CodingKey {
            case hash = "stream_hash"
            case imdbId = "imdb_id"
            case quality
            case season
            case episode
            case magnetLink = "magnet_link"
            case movieTitle = "movie_title"
            case voteCount = "vote_count"
            case lastVerifiedAt = "last_verified_at"
        }
        
        var id: String { hash }
    }

struct ReportedStream: Identifiable, Codable {
    let id: UUID
    let imdbId: String
    let quality: String
    let streamHash: String
    let reason: String
    let createdAt: Date
    let movieTitle: String? // Added for better display
    
    enum CodingKeys: String, CodingKey {
        case id
        case imdbId = "imdb_id"
        case quality
        case streamHash = "stream_hash"
        case reason
        case createdAt = "created_at"
        case movieTitle = "movie_title"
    }
}
    
    /// Get a strict verified stream for instant playback
    func getVerifiedStream(imdbId: String, season: Int = -1, episode: Int = -1, quality: String) async throws -> VerifiedStream? {
        let data = try await makeRequest(
            path: "/verified_streams",
            query: [
                "imdb_id": "eq.\(imdbId)",
                "season": "eq.\(season)",
                "episode": "eq.\(episode)",
                "quality": "eq.\(quality)",
                "order": "vote_count.desc", // Get highest voted if duplicates exist (shouldn't due to PK)
                "limit": "1"
            ]
        )
        
        let streams = try jsonDecoder.decode([VerifiedStream].self, from: data)
        return streams.first
    }

    /// Get all verified streams (Admin)
    func getAllVerifiedStreams(limit: Int = 50) async throws -> [VerifiedStream] {
        let data = try await makeRequest(
            path: "/verified_streams",
            query: [
                "select": "*",
                "order": "last_verified_at.desc,vote_count.desc",
                "limit": String(limit)
            ]
        )
        return try jsonDecoder.decode([VerifiedStream].self, from: data)
    }

    /// Update title for an existing reported stream (Legacy migration)
    func updateReportedStreamTitle(id: UUID, title: String) async {
        do {
            _ = try await makeRequest(
                path: "/reported_streams",
                method: "PATCH",
                body: ["movie_title": title],
                query: [
                    "id": "eq.\(id.uuidString)"
                ]
            )
            print("Title updated for report \(id.uuidString)")
        } catch {
            print("Failed to update report title: \(error)")
        }
    }
    
    /// Report a bad stream (Community)
    func reportStream(imdbId: String, quality: String, streamHash: String, reason: String, movieTitle: String? = nil) async {
        do {
            var body: [String: Any] = [
                "imdb_id": imdbId,
                "quality": quality,
                "stream_hash": streamHash,
                "reason": reason
            ]
            
            if let title = movieTitle {
                body["movie_title"] = title
            }
            
            
            _ = try await makeRequest(
                path: "/reported_streams",
                method: "POST",
                body: body
            )
            print("🚨 Reported stream: \(streamHash) Reason: \(reason)")
        } catch {
            print("Failed to report stream: \(error)")
        }
    }
    
    /// Delete a report (Admin Action - Dismiss)
    func deleteReport(id: UUID) async {
        do {
            _ = try await makeRequest(
                path: "/reported_streams",
                method: "DELETE",
                query: ["id": "eq.\(id.uuidString)"]
            )
            print("✅ Report dismissed: \(id)")
        } catch {
            print("❌ Failed to dismiss report: \(error)")
        }
    }
    
    /// Get all reported streams (Admin)
    func getReportedStreams(limit: Int = 50) async throws -> [ReportedStream] {
        let data = try await makeRequest(
            path: "/reported_streams",
            query: [
                "select": "*",
                "order": "created_at.desc",
                "limit": String(limit)
            ]
        )
        return try jsonDecoder.decode([ReportedStream].self, from: data)
    }
    
    /// Delete a reported stream entry (Admin)
    func deleteReportedStream(id: String) async throws {
        _ = try await makeRequest(
            path: "/reported_streams",
            method: "DELETE",
            query: [
                "id": "eq.\(id)"
            ]
        )
        print("🗑️ Deleted reported stream entry: \(id)")
    }
    
    /// Delete a verified stream (Admin) - Unlocks the stream for normal resolver
    func deleteVerifiedStream(streamHash: String) async throws {
        _ = try await makeRequest(
            path: "/verified_streams",
            method: "DELETE",
            query: [
                "stream_hash": "eq.\(streamHash)"
            ]
        )
        print("🗑️ Deleted verified stream with hash: \(streamHash)")
    }
    
    /// Update title for an existing verified stream (Legacy migration)
    func updateVerifiedStreamTitle(imdbId: String, title: String) async {
        do {
            _ = try await makeRequest(
                path: "/verified_streams",
                method: "PATCH",
                body: ["movie_title": title],
                query: [
                    "imdb_id": "eq.\(imdbId)"
                ]
            )
            print("Title updated for \(imdbId)")
        } catch {
            print("Failed to update title: \(error)")
        }
    }
    
    /// Vote for a successful stream (Upsert logic via RPC or Client)
    func voteStreamSuccess(imdbId: String, season: Int = -1, episode: Int = -1, quality: String, streamHash: String, magnetLink: String? = nil, movieTitle: String? = nil) async {
        // We use an RPC 'vote_for_stream' if available to handle the atomic increment, 
        // OR standard upsert if we want to keep it simple client-side for V1.
        
        do {
            // 1. Check if exists (Using new season/episode aware lookup)
            let existing = try await getVerifiedStream(imdbId: imdbId, season: season, episode: episode, quality: quality)
            
            var body: [String: Any] = [
                "imdb_id": imdbId,
                "season": season,
                "episode": episode,
                "quality": quality,
                "stream_hash": streamHash,
                "last_verified_at": ISO8601DateFormatter().string(from: Date())
            ]
            
            if let title = movieTitle {
                body["movie_title"] = title
            }
            
            if let magnet = magnetLink {
                body["magnet_link"] = magnet
            }
            
            // 2. Logic: If exists AND hash matches, increment vote.
            // If exists AND hash differs, only overwrite if new vote count > old vote count? 
            if let existing = existing {
                if existing.hash == streamHash {
                    // Same hash -> Increment vote
                    body["vote_count"] = existing.voteCount + 1
                } else {
                    // Different hash -> Conflict.
                    // For now, let's NOT overwrite if the existing one is popular (e.g. votes > 5)
                    if existing.voteCount > 5 {
                        print("⚠️ Verified Stream: Keeping incumbent hash (Votes: \(existing.voteCount)) vs new candidate.")
                        return 
                    }
                    // Else overwrite (incubment was weak)
                    body["vote_count"] = 1
                }
            } else {
                // New -> Vote = 1
                body["vote_count"] = 1
            }
            
            _ = try await makeRequest(
                path: "/verified_streams",
                method: "POST", // POST with Prefer: resolution=merge-duplicates is UPSERT
                body: body,
                headers: ["Prefer": "resolution=merge-duplicates"]
            )
            print("✅ Verified Stream: Voted for \(imdbId) S\(season)E\(episode) (\(quality)) [Hash: \(streamHash.prefix(8))...]")
            
        } catch {
            print("❌ Failed to vote for stream: \(error)")
        }
    }
    
    /// Check payment status
    func checkPaymentStatus() async throws -> Bool {
        // ...
        return true
    }
    
    // MARK: - Feedback & Logging System
    
    struct FeedbackReport: Identifiable, Codable {
        let id: UUID
        let type: String
        let message: String
        let contactEmail: String?
        let sessionLogId: UUID?
        let createdAt: Date
        
        enum CodingKeys: String, CodingKey {
            case id
            case type
            case message
            case contactEmail = "contact_email"
            case sessionLogId = "session_log_id"
            case createdAt = "created_at"
        }
    }
    
    /// Send user feedback
    func sendFeedback(type: String, message: String, email: String? = nil, sessionLogId: UUID? = nil) async {
        do {
            var body: [String: Any] = [
                "type": type,
                "message": message,
                "platform": "macOS",
                "app_version": Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
            ]
            if let email = email, !email.isEmpty {
                body["contact_email"] = email
            }
            if let logId = sessionLogId {
                body["session_log_id"] = logId.uuidString
            }
            
            _ = try await makeRequest(
                path: "/feedback_reports",
                method: "POST",
                body: body
            )
            print("📝 Feedback sent successfully")
        } catch {
            print("❌ Failed to send feedback: \(error)")
        }
    }
    
    /// Upload a session log
    func uploadSessionLog(log: SessionLog) async {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let data = try encoder.encode(log)
            guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
            
            // Map to DB columns
            let body: [String: Any] = [
                "id": log.id.uuidString,
                "session_id": log.sessionId.uuidString,
                "platform": log.platform,
                "app_version": log.appVersion,
                "imdb_id": log.imdbId ?? "",
                "stream_hash": log.streamHash ?? "",
                "events": json["events"] ?? []
            ]
            
            _ = try await makeRequest(
                path: "/session_logs",
                method: "POST",
                body: body
            )
            print("📋 Session Log uploaded successfully: \(log.sessionId)")
        } catch {
            print("❌ Failed to upload session log: \(error)")
        }
    }
    
    /// Get feedback reports (Admin)
    func getFeedback(limit: Int = 50) async throws -> [FeedbackReport] {
        let data = try await makeRequest(
            path: "/feedback_reports",
            query: [
                "select": "*",
                "order": "created_at.desc",
                "limit": String(limit)
            ]
        )
        return try jsonDecoder.decode([FeedbackReport].self, from: data)
    }
    
    /// Delete a feedback report (Admin)
    func deleteFeedback(id: UUID) async {
        do {
            _ = try await makeRequest(
                path: "/feedback_reports",
                method: "DELETE",
                query: ["id": "eq.\(id.uuidString)"]
            )
            print("🗑️ Deleted feedback: \(id)")
        } catch {
            print("❌ Failed to delete feedback: \(error)")
        }
    }
    
    /// Delete a session log (Admin)
    func deleteSessionLog(id: UUID) async {
        do {
            _ = try await makeRequest(
                path: "/session_logs",
                method: "DELETE",
                query: ["id": "eq.\(id.uuidString)"]
            )
            print("🗑️ Deleted session log: \(id)")
        } catch {
            print("❌ Failed to delete session log: \(error)")
        }
    }
    
    /// Get session logs (Admin)
    func getSessionLogs(limit: Int = 20) async throws -> [SessionLog] {
        let data = try await makeRequest(
            path: "/session_logs",
            query: [
                "select": "*",
                "order": "created_at.desc",
                "limit": String(limit)
            ]
        )
        
        // Custom decoding needed because 'events' is JSONB
        // Ideally SessionLog matches DB schema if we used Codable properly.
        // Let's rely on JSONDecoder to match keys.
        // Note: DB 'events' is JSONB, Swift struct has 'events: [SessionEvent]'. 
        // Supabase returns JSONB as nested JSON, standard decoder handles this if structure matches.
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            // Handle ISO8601 with fractional seconds
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let date = formatter.date(from: dateStr) { return date }
            
            formatter.formatOptions = [.withInternetDateTime]
            if let date = formatter.date(from: dateStr) { return date }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format: \(dateStr)")
        }
        
        return try decoder.decode([SessionLog].self, from: data)
    }

    // MARK: - Watch History Management
    
    /// Sync a watch history item to the cloud
    func upsertWatchHistory(item: WatchHistoryItem, userId: UUID) async throws {
        // Use -1 for movies (where season/episode is nil) to satisfy UNIQUE constraint compatibility
        let season = item.season ?? -1
        let episode = item.episode ?? -1
        
        let payload: [String: Any] = [
            "user_id": userId.uuidString,
            "media_id": item.mediaItem.id,
            "media_type": item.mediaItem.type,
            "title": item.mediaItem.name,
            "season": season,
            "episode": episode,
            "progress": item.progress,
            "poster_url": item.mediaItem.poster as Any,
            "last_watched": ISO8601DateFormatter().string(from: item.lastWatched)
        ]
        
        // Remove nils (like poster_url if missing), but keep season/episode (-1)
        let cleanPayload = payload.compactMapValues { $0 }
        
        _ = try await makeRequest(
            path: "/user_watch_history",
            method: "POST",
            body: cleanPayload,
            query: ["on_conflict": "user_id,media_id,season,episode"],
            headers: ["Prefer": "resolution=merge-duplicates, return=representation"]
        )
    }
    
    /// Get watch history for a user (e.g. self or friend)
    func getWatchHistory(userId: UUID) async throws -> [SupabaseWatchHistoryEntry] {
        let data = try await makeRequest(
            path: "/user_watch_history",
            query: [
                "user_id": "eq.\(userId.uuidString)",
                "select": "*",
                "order": "last_watched.desc",
                "limit": "20"
            ]
        )
        return try jsonDecoder.decode([SupabaseWatchHistoryEntry].self, from: data)
    }
}

struct SupabaseWatchHistoryEntry: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let mediaId: String
    let mediaType: String
    let title: String
    let season: Int?
    let episode: Int?
    let progress: Double
    let posterUrl: String?
    let lastWatched: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case mediaId = "media_id"
        case mediaType = "media_type"
        case title
        case season
        case episode
        case progress
        case posterUrl = "poster_url"
        case lastWatched = "last_watched"
    }
}

struct SupabaseUserID: Codable {
    let id: UUID
}

struct AppVersionStat: Codable, Identifiable {
    var id: String { version ?? "unknown" }
    let version: String?
    let count: Int
}

struct ContentPopularityStat: Codable, Identifiable {
    var id: String { title }
    let title: String
    let type: String
    let count: Int
}
// MARK: - Supabase Models

struct SupabaseUser: Codable {
    let id: UUID
    let username: String
    let displayName: String?
    let avatarUrl: String?
    let createdAt: Date
    let lastSeen: Date
    let isAdmin: Bool?
    let isPremium: Bool?

    enum CodingKeys: String, CodingKey {
        case id, username
        case displayName = "display_name"
        case avatarUrl = "avatar_url"
        case createdAt = "created_at"
        case lastSeen = "last_seen"
        case isAdmin = "is_admin"
        case isPremium = "is_premium"
    }
}

// MARK: - Payment Models

struct PaymentAssignment: Codable {
    let success: Bool
    let address: String?
    let message: String?
    let error: String?
}

struct PaymentCheckResult: Codable {
    let success: Bool
    let premium: Bool?
    let message: String?
}

struct AppLog: Codable, Identifiable {
    let id: UUID
    let level: String
    let message: String
    let timestamp: Date
    let userId: UUID?
    let metadata: [String: AnyCodable]?
    
    enum CodingKeys: String, CodingKey {
        case id, level, message, metadata
        case timestamp = "created_at"
        case userId = "user_id"
    }
}

/// Represents a User-Hosted Watch Party (Room).
///
/// **Distinct from System Events**:
/// - A `SupabaseRoom` is created and managed by a user ("Host").
/// - Playback is synchronized via WebSockets (pause/resume/seek).
/// - Ephemeral lifecycle (exists while occupied).
///
/// For system-scheduled content, see `EventsConfig` in `EventsConfigService`.
struct SupabaseRoom: Codable {
    let id: String
    
    var type: RoomType {
        id.hasPrefix("event_") ? .event : .userRoom
    }
    
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
    let fileIdx: Int? // Selected file index
    let quality: String? // Selected quality
    let unlockedStreamUrl: String? // Unlocked stream URL
    let playlist: [PlaylistItem]? // List of items to play
    let currentPlaylistIndex: Int? // Current index in playlist
    let description: String? // Room description

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
        case fileIdx = "selected_file_idx"
        case quality = "selected_quality"
        case unlockedStreamUrl = "unlocked_stream_url"
        case playlist
        case currentPlaylistIndex = "current_playlist_index"
        case description
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


// MARK: - Social Features Models

// MARK: - Social Features Models

struct Friendship: Codable, Identifiable {
    let id: UUID
    let userId1: UUID
    let userId2: UUID
    let status: FriendshipStatus
    let createdAt: Date

    // Joined data (optional)
    let fromUser: SupabaseUser?
    let toUser: SupabaseUser?

    enum CodingKeys: String, CodingKey {
        case id
        case userId1 = "user_id_1"
        case userId2 = "user_id_2"
        case status
        case createdAt = "created_at"
        case fromUser = "user_id_1_profile" // Alias for joined data
        case toUser = "user_id_2_profile"   // Alias for joined data
    }
}

enum FriendshipStatus: String, Codable {
    case pending
    case accepted
    case blocked
}



// MARK: - Social Features Extensions

extension SupabaseClient {

    // MARK: - Friendships

    /// Get list of accepted friends (Profiles)
    func getFriends(userId: UUID) async throws -> [SupabaseUser] {
        // 1. Get all accepted friendships involving this user
        let path = "/friendships?or=(user_id_1.eq.\(userId),user_id_2.eq.\(userId))&status=eq.accepted&select=*"
        let data = try await makeRequest(path: path, method: "GET")
        let friendships = try jsonDecoder.decode([Friendship].self, from: data)

        // 2. Extract friend IDs
        let friendIds = friendships.compactMap { friendship -> UUID? in
            if friendship.userId1 == userId { return friendship.userId2 }
            if friendship.userId2 == userId { return friendship.userId1 }
            return nil
        }

        if friendIds.isEmpty { return [] }

        // 3. Fetch profiles for these IDs from 'users' table
        let idsString = friendIds.map { $0.uuidString }.joined(separator: ",")

        let usersPath = "/users?id=in.(\(idsString))"
        let usersData = try await makeRequest(path: usersPath, method: "GET")

        return try jsonDecoder.decode([SupabaseUser].self, from: usersData)
    }

    /// Get pending friend requests received by user
    func getFriendRequests(userId: UUID) async throws -> [Friendship] {
        // Fetch pending requests where user is receiver (user_id_2)
        let path = "/friendships?user_id_2=eq.\(userId)&status=eq.pending"
        let data = try await makeRequest(path: path, method: "GET")
        var friendships = try jsonDecoder.decode([Friendship].self, from: data)

        // Fetch profiles for senders from 'users' table
        let senderIds = friendships.map { $0.userId1 }
        if !senderIds.isEmpty {
            let idsString = senderIds.map { $0.uuidString }.joined(separator: ",")
            let usersPath = "/users?id=in.(\(idsString))"
            let usersData = try await makeRequest(path: usersPath, method: "GET")
            let profiles: [SupabaseUser]?
            do {
                profiles = try jsonDecoder.decode([SupabaseUser].self, from: usersData)
            } catch {
                LogManager.shared.error("Failed to decode friend request profiles", error: error)
                profiles = nil
            }

            // Reconstruct friendships with profiles
            friendships = friendships.map { friendship in
                let profile = profiles?.first(where: { $0.id == friendship.userId1 })
                return Friendship(
                    id: friendship.id,
                    userId1: friendship.userId1,
                    userId2: friendship.userId2,
                    status: friendship.status,
                    createdAt: friendship.createdAt,
                    fromUser: profile,
                    toUser: nil
                )
            }
        }

        return friendships
    }

    func sendFriendRequest(fromUserId: UUID, toUsername: String) async throws {
        // 1. Find user by username
        let users = try await searchUsers(username: toUsername)
        guard let targetUser = users.first else {
            throw SupabaseError.userNotFound
        }

        if targetUser.id == fromUserId {
            throw SupabaseError.httpError(400, "Cannot add yourself")
        }

        // 2. Send request
        try await sendFriendRequest(from: fromUserId, to: targetUser.id)
    }

    func acceptFriendRequest(requestId: UUID, userId: UUID, friendId: UUID) async throws {
        try await updateFriendshipStatus(id: requestId, status: .accepted)
    }

    func declineFriendRequest(requestId: UUID) async throws {
        // Delete the row
        let path = "/friendships?id=eq.\(requestId)"
        _ = try await makeRequest(path: path, method: "DELETE")


    }

    // Removed duplicate searchUsers (already exists in SupabaseClient)

    // Internal helpers

    func sendFriendRequest(from senderId: UUID, to receiverId: UUID) async throws {
        let path = "/friendships"
        let body: [String: Any] = [
            "user_id_1": senderId.uuidString,
            "user_id_2": receiverId.uuidString,
            "status": "pending"
        ]

        _ = try await makeRequest(path: path, method: "POST", body: body)


    }

    func updateFriendshipStatus(id: UUID, status: FriendshipStatus) async throws {
        let path = "/friendships?id=eq.\(id)"
        let body = ["status": status.rawValue]
        _ = try await makeRequest(path: path, method: "PATCH", body: body)


    }

    // MARK: - Direct Messages

    /// Create friendship directly (bypasses friend request system)
    /// Used for auto-friending lemontom (MySpace Tom style)
    func createFriendship(userId1: UUID, userId2: UUID) async throws {
        // Create friendship both ways (bidirectional)
        _ = try await makeRequest(
            path: "/friendships",
            method: "POST",
            body: [
                "user_id_1": userId1.uuidString,
                "user_id_2": userId2.uuidString,
                "status": "accepted"
            ]
        )

        _ = try await makeRequest(
            path: "/friendships",
            method: "POST",
            body: [
                "user_id_1": userId2.uuidString,
                "user_id_2": userId1.uuidString,
                "status": "accepted"
            ]
        )
    }

    func getDirectMessages(userId: UUID, with friendId: UUID) async throws -> [DirectMessage] {
        let query = "or=(and(sender_id.eq.\(userId),receiver_id.eq.\(friendId)),and(sender_id.eq.\(friendId),receiver_id.eq.\(userId)))&order=created_at.asc"
        let path = "/direct_messages?\(query)"
        let data = try await makeRequest(path: path, method: "GET")
        return try jsonDecoder.decode([DirectMessage].self, from: data)
    }

    func sendDirectMessage(from senderId: UUID, to receiverId: UUID, content: String) async throws {
        let path = "/direct_messages"
        let body: [String: Any] = [
            "sender_id": senderId.uuidString,
            "receiver_id": receiverId.uuidString,
            "content": content
        ]

        _ = try await makeRequest(path: path, method: "POST", body: body)


    }
}

// MARK: - Auth Context

/// Simple auth context to track current user
class AuthContext {
    static let shared = AuthContext()

    private init() {}

    /// Current user (set after login/signup)
    var currentUser: AuthUser?
}

struct AuthUser {
    let id: UUID
    let username: String
    let isAdmin: Bool
}

// MARK: - Edge Functions API

/// Supabase Edge Functions API client
class EdgeFunctionsAPI {
    private let baseURL: String
    private let apiKey: String

    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }

    /// Invoke an edge function
    func invoke(_ functionName: String, options: FunctionInvokeOptions? = nil) async throws -> Data {
        let urlString = "\(baseURL)/functions/v1/\(functionName)"

        guard let url = URL(string: urlString) else {
            throw SupabaseError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let body = options?.body {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw SupabaseError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let errorString = String(data: data, encoding: .utf8) ?? "Unknown error"
            throw SupabaseError.httpError(httpResponse.statusCode, errorString)
        }

        return data
    }
}

struct FunctionInvokeOptions {
    let body: [String: Any]
}

// MARK: - Query Builder

/// Query builder for Supabase tables
class QueryBuilder {
    private weak var client: SupabaseClient?
    private let table: String
    private var selectFields: String = "*"
    private var filters: [String] = []
    private var updateData: [String: Any]?

    init(client: SupabaseClient, table: String) {
        self.client = client
        self.table = table
    }

    /// Select specific fields
    func select(_ fields: String = "*") -> QueryBuilder {
        self.selectFields = fields
        return self
    }

    /// Add equality filter
    func eq(_ column: String, value: Any) -> QueryBuilder {
        let valueStr: String
        if let uuid = value as? UUID {
            valueStr = uuid.uuidString
        } else if let str = value as? String {
            valueStr = str
        } else {
            valueStr = "\(value)"
        }
        filters.append("\(column)=eq.\(valueStr)")
        return self
    }

    /// Set data for update
    func update(_ data: [String: Any]) -> QueryBuilder {
        self.updateData = data
        return self
    }

    /// Execute the query
    func execute() async throws -> QueryResult {
        guard let client = client else {
            throw SupabaseError.invalidResponse
        }

        var query: [String: String] = [:]

        if !filters.isEmpty {
            for filter in filters {
                let parts = filter.split(separator: "=", maxSplits: 1)
                if parts.count == 2 {
                    query[String(parts[0])] = String(parts[1])
                }
            }
        }

        if let updateData = updateData {
            // PATCH request
            query["select"] = selectFields
            let data = try await client.makeRequest(
                path: "/\(table)",
                method: "PATCH",
                body: updateData,
                query: query
            )
            return QueryResult(data: data)
        } else {
            // GET request
            query["select"] = selectFields
            let data = try await client.makeRequest(
                path: "/\(table)",
                method: "GET",
                query: query
            )
            return QueryResult(data: data)
        }
    }
}

struct QueryResult {
    let data: Data

    /// Decode the result as an array
    var value: [Any] {
        get throws {
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
                return []
            }
            return json
        }
    }
}
