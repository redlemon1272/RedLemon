import Foundation

/// Supabase REST API client for RedLemon backend operations
/// Uses direct HTTP requests to Supabase PostgREST API

enum SupabaseError: Error, LocalizedError {
    case httpError(Int, String)
    case decodingError(Error)
    case encodingError
    case roomCreationFailed
    case userNotFound
    case invalidURL
    case invalidResponse
    case userCreationFailed

    case serverError(String)
    case userMessage(String)

    var errorDescription: String? {
        switch self {
        case .httpError(let code, let message):
            return "Server Error (\(code)): \(message)"
        case .decodingError(let error):
            return "Failed to process server response: \(error.localizedDescription)"
        case .encodingError:
            return "Failed to encode data."
        case .roomCreationFailed:
            return "Failed to create room."
        case .userNotFound:
            return "User not found."
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid response from server."
        case .userCreationFailed:
            return "Failed to create user."
        case .serverError(let message):
            return "Server Error: \(message)"
        case .userMessage(let message):
            return message
        }
    }
}

/// Protocol for managing watch party rooms
protocol RoomManager {
    func createRoom(
        id: String,
        name: String,
        hostUserId: UUID?,
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
        playlist: [PlaylistItem]?,
        subtitleUrl: String?,
        sourceQuality: String?,
        createdAt: Date?
    ) async throws -> SupabaseRoom

    func joinRoom(roomId: String, userId: UUID, isHost: Bool) async throws
    func updateRoomStream(roomId: String, streamHash: String?, fileIdx: Int?, quality: String?, unlockedUrl: String?, sourceQuality: String?, resetPlayback: Bool) async throws
    func getRoomState(roomId: String) async throws -> SupabaseRoom?
    func getRoomParticipants(roomId: String) async throws -> [RoomParticipant]
}

protocol UserManager {
    func getUserById(userId: UUID) async throws -> SupabaseUser?
}

class SupabaseClient: RoomManager, UserManager {
    static let shared = SupabaseClient()

    // Performance: Cache formatters to avoid expensive initialization
    static let isoFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()

    // Cache decoders for the custom decoding strategy
    private static let decodingFormatters: [DateFormatter] = [
        {
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSX" // 6 digits + Z or +00:00
            f.locale = Locale(identifier: "en_US_POSIX")
            return f
        }(),
        {
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX" // 3 digits + Z or +00:00
            f.locale = Locale(identifier: "en_US_POSIX")
            return f
        }(),
        {
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd'T'HH:mm:ssX" // 0 digits + Z or +00:00
            f.locale = Locale(identifier: "en_US_POSIX")
            return f
        }(),
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
        }()
    ]

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

            // 1. Try robust ISO8601 formatter first (handles fractional microseconds + Z/Offset)
            if let date = SupabaseClient.isoFormatter.date(from: dateString) {
                return date
            }

            // 2. Try legacy formatters
            // Use cached formatters
            for formatter in SupabaseClient.decodingFormatters {
                if let date = formatter.date(from: dateString) {
                    return date
                }
            }



            // If all formatters fail, log the actual format we received
            NSLog("❌ Failed to decode date string: '%@'", dateString)
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
        config.timeoutIntervalForRequest = 15.0 // FAIL FAST: Prevent infinite hanging on bad connections/backend
        config.timeoutIntervalForResource = 30.0
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
        headers: [String: String]? = nil,
        useEphemeralSession: Bool = false,
        sign: Bool = false,
        isFunction: Bool = false
    ) async throws -> Data {
        var urlString: String
        if isFunction {
             urlString = "\(baseURL)/functions/v1\(path)"
        } else {
             urlString = "\(baseURL)/rest/v1\(path)"
        }

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

        var bodyData: Data? = nil
        if let body = body {
            // CRITICAL FIX: Use deterministic JSON ordering to ensure signature matches across platforms.
            // .sortedKeys is essential for cryptographic verification.
            // .withoutEscapingSlashes prevents URL escaping differences.
            var options: JSONSerialization.WritingOptions = [.sortedKeys]
            if #available(iOS 13.0, macOS 10.15, *) {
                options.insert(.withoutEscapingSlashes)
            }
            bodyData = try JSONSerialization.data(withJSONObject: body, options: options)
            request.httpBody = bodyData
        }

        // --- 🔐 SIGNATURE GENERATION ---
        if sign {
            if let (privateKey, publicKey) = await KeychainManager.shared.getKeyPair() {
                let timestamp = String(Int(Date().timeIntervalSince1970))

                // Payload: Timestamp + Method + Path + Body
                var payload = "\(timestamp)\(method)\(path)"
                if let bodyData = bodyData, let bodyString = String(data: bodyData, encoding: .utf8) {
                    payload += bodyString
                }

                do {
                    let signature = try CryptoManager.shared.sign(message: payload, privateKeyBase64: privateKey)

                    request.setValue(signature, forHTTPHeaderField: "x-signature")
                    request.setValue(timestamp, forHTTPHeaderField: "x-timestamp")
                    request.setValue(publicKey, forHTTPHeaderField: "x-public-key")

                    // 🛡️ SECURITY: Identity Proof (Timestamp + UserID + Path)
                    // This prevents replay attacks across users
                    //
                    // Security Check #88: New users created during onboarding may have auth.currentUser
                    // still nil when heartbeat fires. This fallback reconstructs it from Keychain.
                    var effectiveUserId = auth.currentUser?.id

                    // Fallback: Reconstruct from Keychain if auth context is stale
                    if effectiveUserId == nil {
                        if let storedId = await KeychainManager.shared.get(service: "user_id"),
                           let uuid = UUID(uuidString: storedId) {
                            effectiveUserId = uuid
                            NSLog("%@", "⚠️ SupabaseClient: auth.currentUser was nil, reconstructed from Keychain: \(uuid.uuidString)")

                            // Repair the auth context to prevent future misses
                            if let username = await KeychainManager.shared.getUsername() {
                                auth.currentUser = AuthUser(
                                    id: uuid,
                                    username: username,
                                    isAdmin: false,  // Will be refreshed on next full auth
                                    isPremium: false
                                )
                            }
                        }
                    }

                    if let userId = effectiveUserId {
                        // NOTE: This MUST match the server's verify_user_signature function exactly.
                        let identityPayload = "\(timestamp)\(userId.uuidString.lowercased())\(path)"

                        // DIAGNOSTIC LOGGING: Verify exactly what we are signing
                        if path == "/rpc/room_heartbeat" {
                            NSLog("%@", "🔐 SupabaseClient: Signing Identity Payload: '\(identityPayload)'")
                        }

                        let identitySignature = try CryptoManager.shared.sign(message: identityPayload, privateKeyBase64: privateKey)
                        request.setValue(identitySignature, forHTTPHeaderField: "x-identity-signature")
                        request.setValue(userId.uuidString, forHTTPHeaderField: "x-identity-id")
                    } else {
                        // CRITICAL: Identity signature will be missing - server will reject!
                        NSLog("%@", "⚠️ SupabaseClient: NO USER ID available for identity signature on \(path). Heartbeat WILL FAIL!")
                    }

                    NSLog("%@", "🔐 Signed request to \(path)")
                } catch {
                    NSLog("%@", "❌ Failed to sign request: \(error)")
                    // We continue without signing? Or fail?
                    // Fail safe:
                    throw SupabaseError.serverError("Signing failed: \(error.localizedDescription)")
                }
            } else {
                 NSLog("%@", "⚠️ Request requested signing but no keys found in Keychain")
            }
        }
        // -----------------------------

        // Use ephemeral session if requested to bypass shared session queue (critical for room creation)
        let sessionToUse: URLSession
        if useEphemeralSession {
            let config = URLSessionConfiguration.ephemeral
            config.timeoutIntervalForRequest = 30.0
            config.timeoutIntervalForResource = 30.0
            sessionToUse = URLSession(configuration: config)
        } else {
            sessionToUse = self.session
        }

        let (data, response) = try await sessionToUse.data(for: request)

        return try handleResponse(data: data, response: response, path: path)
    }

    private func handleResponse(data: Data, response: URLResponse, path: String) throws -> Data {
        // DEBUG: Print raw JSON for room requests to verify season/episode
        if path.contains("/rooms") {
            // if let jsonString = String(data: data, encoding: .utf8) {
            //    print("🔍 Supabase Response for \(path): \(jsonString)")
            // }
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw SupabaseError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let errorString = String(data: data, encoding: .utf8) ?? "Unknown error"

            // Attempt to parse clean Postgres error message
            // Format: {"code": "...", "message": "...", "details": "...", "hint": "..."}
            struct PostgresError: Decodable {
                let message: String
                let details: String?
                let hint: String?
            }

            if let jsonError = try? JSONDecoder().decode(PostgresError.self, from: data) {
                LoggingManager.shared.error(.network, message: "Supabase API Error: \(jsonError.message)")
                // For PostgreSQL exceptions (which we use for limits), use the raw message
                throw SupabaseError.userMessage(jsonError.message)
            }

            LoggingManager.shared.error(.network, message: "Supabase error (\(httpResponse.statusCode)): \(errorString)")
            throw SupabaseError.httpError(httpResponse.statusCode, errorString)
        }

        return data
    }

    /// Remote Procedure Call (RPC)
    func rpc<T: Decodable>(fn: String, params: [String: Any]? = nil) async throws -> T {

        let data = try await makeRequest(
            path: "/rpc/\(fn)",
            method: "POST",
            body: params,
            sign: true // 🔐 SECURE: Always sign RPC calls for identity proof
        )
        return try jsonDecoder.decode(T.self, from: data)
    }

    /// Invoke Edge Function
    func invokeFunction<T: Decodable>(name: String, body: [String: Any]? = nil) async throws -> T {
        // CRITICAL SECURITY: Always sign Edge Function calls to preventing IDOR
        // Enforced by switching from functions.invoke to makeRequest(isFunction: true, sign: true)
        let data = try await makeRequest(
            path: "/\(name)", // makeRequest appends /functions/v1
            method: "POST",
            body: body,
            sign: true,
            isFunction: true
        )
        return try jsonDecoder.decode(T.self, from: data)
    }

    /// Get trusted server time from Supabase (via HTTP Date header)
    /// Get trusted server time from Supabase (via RPC)
    func getServerTime() async throws -> Date {
        let data = try await makeRequest(
            path: "/rpc/get_server_time",
            method: "POST",
            sign: true // 🔐 SECURE: Proven request context
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
        NSLog("%@", "🔍 SupabaseClient: Looking up user by username '\(username)'")

        let data = try await makeRequest(
            path: "/users",
            query: ["username": "ilike.\(username)", "select": "*"]
        )

        NSLog("%@", "📡 SupabaseClient: User lookup response received (\(data.count) bytes)")

        do {
            let users = try jsonDecoder.decode([SupabaseUser].self, from: data)
            NSLog("%@", "✅ SupabaseClient: Decoded \(users.count) users from response")

            if let user = users.first {
                NSLog("%@", "👤 SupabaseClient: Found user - \(user.username) (ID: \(user.id))")
                return user
            } else {
                NSLog("%@", "⚠️ SupabaseClient: No users found for username '\(username)'")
                return nil
            }
        } catch {
            // Log the raw response for debugging
            if let responseString = String(data: data, encoding: .utf8) {
                NSLog("%@", "❌ SupabaseClient: Failed to decode user response. Raw data: \(responseString)")
            } else {
                NSLog("%@", "❌ SupabaseClient: Failed to decode user response (could not convert to string)")
            }
            NSLog("%@", "❌ SupabaseClient: Decoding error: \(error)")
            NSLog("%@", "   Error type: \(type(of: error))")
            NSLog("%@", "   Error details: \(error.localizedDescription)")
            throw error
        }
    }

    /// Secure Registration
    func registerUserSecure(username: String, publicKey: String) async throws -> SupabaseUser {
        let params: [String: Any] = [
            "p_username": username,
            "p_public_key": publicKey
        ]

        let data = try await makeRequest(
            path: "/rpc/register_user_secure",
            method: "POST",
            body: params,
            sign: true // 🔐 SECURE: Proof of key ownership
        )

        struct MinimalResponse: Decodable {
            let id: UUID
            let username: String
            let status: String
        }

        // The RPC returns a minimal object {id, username, status} that doesn't match full SupabaseUser
        let response = try jsonDecoder.decode(MinimalResponse.self, from: data)

        // Now fetch the full user profile to get created_at, isAdmin, etc.
        // We use a small retry in case of replication lag, though likely instantaneous on same node
        if let fullUser = try await getUserById(userId: response.id) {
            // Update auth context
            auth.currentUser = AuthUser(
                id: fullUser.id,
                username: fullUser.username,
                isAdmin: fullUser.isAdmin ?? false,
                isPremium: fullUser.isPremium ?? false
            )
            return fullUser
        } else {
            // Fallback if fetch fails (rare) -> Construct ephemeral user
            // We fake dates to avoid crash. This is a critical fallback.
            NSLog("%@", "⚠️ registerUserSecure: Could not fetch full profile immediately. Using fallback.")

            // Construct AuthUser manually
            auth.currentUser = AuthUser(
                id: response.id,
                username: response.username,
                isAdmin: false,
                isPremium: false
            )

            // We return a constructed SupabaseUser.
            // Warning: Missing fields might be nil or default.
            return SupabaseUser(
                id: response.id,
                username: response.username,
                displayName: nil,
                avatarUrl: nil,
                createdAt: Date(),
                lastSeen: Date(),
                isAdmin: false,
                isPremium: false,
                subscriptionExpiresAt: nil
            )
        }
    }

    /// Create or login user (username is unique and persistent)
    /// LEGACY: Kept for compatibility but should be replaced by registerUserSecure in UI
    func createOrGetUser(username: String) async throws -> SupabaseUser {
        // Use RPC for atomic login/registration (bypasses RLS issues)
        let data = try await makeRequest(
            path: "/rpc/login_by_username",
            method: "POST",
            body: ["p_username": username],
            sign: true // 🔐 SECURE: Identity proof
        )

        let users = try jsonDecoder.decode([SupabaseUser].self, from: data)
        guard let user = users.first else {
            throw SupabaseError.userCreationFailed
        }

        // Set auth context
        auth.currentUser = AuthUser(
            id: user.id,
            username: user.username,
            isAdmin: user.isAdmin ?? false,
            isPremium: user.isPremium ?? false
        )

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

    /// Get latest backup log
    func getLatestBackupLog() async throws -> BackupLog? {
        let data = try await makeRequest(
            path: "/backup_logs",
            query: [
                "select": "*",
                "order": "created_at.desc",
                "limit": "1"
            ]
        )
        let logs = try jsonDecoder.decode([BackupLog].self, from: data)
        return logs.first
    }

    /// Fetch latest system job log (e.g. payment_sweep, zilean_maintenance)
    func getLatestSystemJobLog(jobName: String) async throws -> SystemJobLog? {
        let data = try await makeRequest(
            path: "/system_job_logs",
            query: [
                "select": "*",
                "job_name": "eq.\(jobName)",
                "order": "created_at.desc",
                "limit": "1"
            ]
        )
        let logs = try jsonDecoder.decode([SystemJobLog].self, from: data)
        return logs.first
    }

    /// Extract Zilean torrent count and last update time
    func getZileanStatus() async throws -> (count: Int, lastUpdate: Date?) {
        guard let log = try await getLatestSystemJobLog(jobName: "zilean_maintenance") else {
            return (0, nil)
        }

        guard let details = log.details else {
            return (0, log.createdAt)
        }

        var count = 0
        // Expected format: "Total Torrents: 64973. ..."
        if let range = details.range(of: "Total Torrents: "),
           let firstPeriod = details[range.upperBound...].firstIndex(of: ".") {
            let countStr = details[range.upperBound..<firstPeriod].trimmingCharacters(in: .whitespaces)
            count = Int(countStr) ?? 0
        } else {
            // Fallback to extraction if format changed but numbers exist
            let digits = details.prefix(while: { $0 != "." }).filter { $0.isNumber }
            count = Int(digits) ?? 0
        }

        return (count, log.createdAt)
    }

    // Keep the old one for compatibility if needed, but let's just update all callers
    func getZileanTorrentCount() async throws -> Int {
        return try await getZileanStatus().count
    }


    /// Grant Premium Status (Admin Only)
    func grantPremium(callerUserId: UUID, username: String, days: Int) async throws -> String {
        let params: [String: Any] = [
            "caller_user_id": callerUserId.uuidString.lowercased(),
            "target_username": username,
            "days_to_add": days
        ]

        let data = try await makeRequest(
            path: "/rpc/admin_grant_premium",
            method: "POST",
            body: params,
            sign: true
        )

        struct GrantResponse: Decodable {
            let success: Bool
            let message: String
        }

        let result = try jsonDecoder.decode(GrantResponse.self, from: data)

        if result.success {
            return result.message
        } else {
            throw NSError(domain: "SupabaseClient", code: 403, userInfo: [NSLocalizedDescriptionKey: result.message])
        }
    }

    /// Revoke Premium Status (Admin Only)
    func revokePremium(callerUserId: UUID, username: String) async throws -> String {
        let params: [String: Any] = [
            "caller_user_id": callerUserId.uuidString.lowercased(),
            "target_username": username
        ]

        let data = try await makeRequest(
            path: "/rpc/admin_revoke_premium",
            method: "POST",
            body: params,
            sign: true
        )

        struct RevokeResponse: Decodable {
            let success: Bool
            let message: String
        }

        let result = try jsonDecoder.decode(RevokeResponse.self, from: data)

        if result.success {
            return result.message
        } else {
            throw NSError(domain: "SupabaseClient", code: 403, userInfo: [NSLocalizedDescriptionKey: result.message])
        }
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
    /// Get all public rooms with pagination and optional search
    func getAllRooms(limit: Int = 20, offset: Int = 0, searchQuery: String? = nil) async throws -> [SupabaseRoom] {
        var queryParams: [String: String] = [
            "is_public": "eq.true",
            "select": "*",
            "order": "last_activity.desc",
            "limit": String(limit),
            "offset": String(offset)
        ]

        if let search = searchQuery, !search.isEmpty {
            queryParams["name"] = "ilike.%\(search)%"
        }

        let data = try await makeRequest(
            path: "/rooms",
            query: queryParams
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

    // MARK: - Free Tier Limits

    /// Checks the remaining cooldown time for free users.
    /// Returns the number of seconds remaining    /// Check if the user has reached their free tier limit
    /// Returns: TimeInterval remaining until they can host again (0 if allowed)
    func checkFreeTierLimit() async throws -> TimeInterval {
        guard let userId = auth.currentUser?.id else {
            LoggingManager.shared.warn(.network, message: "checkFreeTierLimit: No current user ID")
            return 0
        }

        struct FreeTierStatus: Decodable {
            let remaining_seconds: Double
            let is_locked: Bool
        }

        do {
            // Use RPC to bypass RLS and get robust server-side calculation
            let status: FreeTierStatus = try await rpc(
                fn: "get_free_tier_status",
                params: ["target_user_id": userId.uuidString.lowercased()]
            )

            LoggingManager.shared.debug(.network, message: "checkFreeTierLimit (RPC): Locked=\(status.is_locked), Remaining=\(status.remaining_seconds)")
            return status.remaining_seconds

        } catch {
            LoggingManager.shared.error(.network, message: "checkFreeTierLimit RPC failed: \(error)")
            // Fallback to 0 (allow hosting) if check fails, to avoid blocking legitimate users on network error
            return 0
        }
    }
    /// Create a new room
    func createRoom(
        id: String,
        name: String,
        hostUserId: UUID?,
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
        playlist: [PlaylistItem]? = nil,
        subtitleUrl: String? = nil,
        sourceQuality: String? = nil, // Internal Note #91: Filename fallback for events
        createdAt: Date? = nil
    ) async throws -> SupabaseRoom {
        NSLog("%@", "🎬 SupabaseClient: createRoom called for id: \(id) - ENTRY")
        var roomData: [String: Any] = [
            "id": id,
            "name": name,
            "host_username": hostUsername,
            "is_public": isPublic,
            "last_activity": SupabaseClient.isoFormatter.string(from: createdAt ?? Date())
        ]

        if let hostId = hostUserId {
            roomData["host_user_id"] = hostId.uuidString.lowercased()
        } else {
             roomData["host_user_id"] = NSNull()
        }

        if let createdAt = createdAt {
            roomData["created_at"] = SupabaseClient.isoFormatter.string(from: createdAt)
        }

        if let description = description { roomData["description"] = description }
        if let streamHash = streamHash { roomData["stream_hash"] = streamHash }
        if let imdbId = imdbId { roomData["imdb_id"] = imdbId }
        if let posterUrl = posterUrl { roomData["poster_url"] = posterUrl }
        if let backdropUrl = backdropUrl { roomData["backdrop_url"] = backdropUrl }
        if let season = season { roomData["season"] = season }
        if let episode = episode { roomData["episode"] = episode }
        if let unlockedStreamUrl = unlockedStreamUrl { roomData["unlocked_stream_url"] = unlockedStreamUrl }
        if let subtitleUrl = subtitleUrl { roomData["subtitle_url"] = subtitleUrl }
        if let sourceQuality = sourceQuality { roomData["source_quality"] = sourceQuality }

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
                NSLog("%@", "⚠️ Failed to encode playlist for room creation: \(error)")
                // Continue without playlist rather than failing entirely
            }
        }

        NSLog("%@", "🎬 SupabaseClient: Creating room '\(id)' for host '\(hostUsername)'...")
        let data = try await makeRequest(
            path: "/rooms",
            method: "POST",
            body: roomData,
            headers: ["Prefer": "return=representation"],
            useEphemeralSession: true,
            sign: true // 🔐 Sign this request to prove identity and spend hosting days
        )
        NSLog("%@", "✅ SupabaseClient: Room creation request completed (received response)")

        let rooms = try jsonDecoder.decode([SupabaseRoom].self, from: data)
        guard let room = rooms.first else {
            throw SupabaseError.roomCreationFailed
        }

        return room
    }

    /// Join a room
    func joinRoom(roomId: String, userId: UUID, isHost: Bool = false) async throws {
        do {
            _ = try await makeRequest(
                path: "/room_participants",
                method: "POST",
                body: [
                    "room_id": roomId,
                    "user_id": userId.uuidString,
                    "is_host": isHost
                ],
                headers: ["Prefer": "resolution=merge-duplicates"],
                sign: true // 🔐 SECURE: Prove identity to join
            )
        } catch let error as SupabaseError {
            // Check for specific Postgres error code 23505 (Unique Violation) or duplicate key message
            // Duplicate key errors are now handled by UPSERT (merge-duplicates)
            // But we keep the catch block for other userMessage types just in case
            switch error {
            case .serverError(let msg), .userMessage(let msg):
                 // Log but rethrow distinct errors
                 LoggingManager.shared.warn(.network, message: "Supabase Join Error: \(msg)")
                 throw error
            case .httpError(let code, _):
                 if code == 409 {
                     // Should not happen with upsert, but just in case
                     NSLog("%@", "⚠️ SupabaseClient: Conflict (409) despite upsert - proceeding...")
                     return
                 }
                 throw error
            default:
                throw error
            }
            throw error
        } catch {
            // Catch generic Swift errors that might wrap the Supabase error
            let nsError = error as NSError
            if nsError.description.contains("23505") || nsError.localizedDescription.contains("duplicate key") {
                NSLog("%@", "⚠️ SupabaseClient: User already in room (Generic Duplicate Key), proceeding...")
            } else {
                // Re-throw other errors
                throw error
            }
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
            ],
            sign: true // 🔐 SECURE: Prove identity to leave
        )
    }

    /// Delete a room (Admin or Distributed Cleanup)
    func deleteRoom(roomId: String) async throws {
        _ = try await makeRequest(
            path: "/rooms",
            method: "DELETE",
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Only host or admin can delete
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

    /// Send heartbeat to keep presence alive
    func sendHeartbeat(roomId: String, userId: UUID) async throws {
        _ = try await makeRequest(
            path: "/rpc/room_heartbeat",
            method: "POST",
            body: [
                "p_room_id": roomId,
                "p_user_id": userId.uuidString.lowercased()
            ],
            // 🔐 SECURE: Sign request to prevent IDOR/Spoofing
            sign: true
        )
    }

    /// Send global user heartbeat (Last Seen update)
    func sendUserHeartbeat(userId: UUID) async throws {
        _ = try await makeRequest(
            path: "/rpc/user_heartbeat",
            method: "POST",
            body: [
                "p_user_id": userId.uuidString.lowercased()
            ],
            // 🔐 SECURE: Sign request to prevent IDOR/Spoofing
            sign: true
        )
    }


    /// Update room playback state
    func updateRoomPlayback(roomId: String, position: Int, isPlaying: Bool, shouldClearStream: Bool = false) async throws {
        var body: [String: Any] = [
            "playback_position": position,
            "is_playing": isPlaying,
            "last_activity": ISO8601DateFormatter().string(from: Date())
        ]

        // Security Check #35: Explicitly nil query-able stream properties to prevent Ghost Streams
        if shouldClearStream {
            body["stream_hash"] = NSNull()
            body["unlocked_stream_url"] = NSNull()
        }

        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Only host can control playback
        )
        if position % 10 == 0 { // Don't log every second
             NSLog("%@", "✅ SupabaseClient: Updated room playback (Playing: \(isPlaying), Pos: \(position)s, ClearedStream: \(shouldClearStream))")
        }
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
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Identity check
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

    /// Get the creation time of the last room hosted by the user
    /// Uses room_creation_history table for accurate tracking (rooms are ephemeral)
    func getLastRoomCreatedAt(userId: UUID) async throws -> Date? {
        let data = try await makeRequest(
            path: "/room_creation_history",
            query: [
                "user_id": "eq.\(userId.uuidString)",
                "select": "created_at",
                "order": "created_at.desc",
                "limit": "1"
            ]
        )

        struct HistoryDate: Decodable {
            let created_at: Date
        }

        let result = try jsonDecoder.decode([HistoryDate].self, from: data)
        return result.first?.created_at
    }

    /// Update room stream selection (Host only)
    /// Internal Note #91: sourceQuality is critical for Guest matching when infoHash is nil (DebridSearch)
    func updateRoomStream(
        roomId: String,
        streamHash: String?,
        fileIdx: Int?,
        quality: String?,
        unlockedUrl: String?,
        sourceQuality: String? = nil, // Internal Note #91: Filename fallback when hash is nil
        resetPlayback: Bool = false
    ) async throws {
        var body: [String: Any] = [
            "last_activity": ISO8601DateFormatter().string(from: Date())
        ]

        if resetPlayback {
            body["is_playing"] = false
            body["playback_position"] = 0
            NSLog("🔄 SupabaseClient: Resetting playback state for room %@", roomId)
        }

        if let streamHash = streamHash { body["stream_hash"] = streamHash }
        if let fileIdx = fileIdx { body["selected_file_idx"] = fileIdx }
        if let quality = quality { body["selected_quality"] = quality }
        if let unlockedUrl = unlockedUrl { body["unlocked_stream_url"] = unlockedUrl }
        // Internal Note #91: Always persist source_quality for Guest fallback matching
        if let sourceQuality = sourceQuality { body["source_quality"] = sourceQuality }

        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Only host can set stream
        )

        NSLog("%@", "✅ Persisted stream selection to room \(roomId)")
    }

    /// Reset room stream selection (Admin/Debug)
    func resetRoomStream(roomId: String) async throws {
        let body: [String: Any] = [
            "stream_hash": NSNull(),
            "selected_file_idx": NSNull(),
            "selected_quality": NSNull(),
            "unlocked_stream_url": NSNull(),
            "is_playing": false,
            "playback_position": 0,
            "last_activity": ISO8601DateFormatter().string(from: Date())
        ]

        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Host check
        )

        NSLog("✅ Reset/Cleared stream selection for room %@", roomId)
    }

    func updateRoomPrivacy(roomId: String, isPublic: Bool) async throws {
        let body: [String: Any] = [
            "is_public": isPublic
        ]

        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Host check
        )
    }

    /// Update room playlist (Host only)
    func updateRoomPlaylist(
        roomId: String,
        playlist: [PlaylistItem],
        currentIndex: Int
    ) async throws {
        NSLog("📡 SupabaseClient: updateRoomPlaylist called for room %@ with %d items, index: %d", roomId, playlist.count, currentIndex)

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
                query: ["id": "eq.\(roomId)"],
                sign: true // 🔐 SECURE: Host check
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
                query: ["id": "eq.\(roomId)"],
                sign: true // 🔐 SECURE: Host check
            )
            NSLog("✅ SupabaseClient: Playlist updated (Fallback mode: No Index persisted)")

        } catch {
             NSLog("❌ SupabaseClient: Failed to update playlist: %@", String(describing: error))
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

        // CRITICAL FIX: Explicitly clear fields when nil to remove stale values
        // When changing from series to movie, we must NULL out season/episode
        if let imdbId = imdbId {
            body["imdb_id"] = imdbId
        }

        // Always set season/episode (use NSNull() to clear if nil)
        body["season"] = season != nil ? season! : NSNull()
        body["episode"] = episode != nil ? episode! : NSNull()

        if let posterUrl = posterUrl { body["poster_url"] = posterUrl }
        if let backdropUrl = backdropUrl { body["backdrop_url"] = backdropUrl }

        // Update last_activity to keep room visible/fresh
        body["last_activity"] = ISO8601DateFormatter().string(from: Date())

        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Host check
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
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Identity proof required
        )
    }

    /// Update room description (Host only)
    func updateRoomDescription(roomId: String, description: String?) async throws {
        var body: [String: Any] = [
            "last_activity": ISO8601DateFormatter().string(from: Date())
        ]

        if let description = description, !description.isEmpty {
            // Limit to 200 characters to prevent abuse
            body["description"] = String(description.prefix(200))
        } else {
            body["description"] = NSNull()
        }

        _ = try await makeRequest(
            path: "/rooms",
            method: "PATCH",
            body: body,
            query: ["id": "eq.\(roomId)"],
            sign: true // 🔐 SECURE: Host check
        )
        NSLog("%@", "✅ Updated room description for \(roomId)")
    }
    /// Invoke cleanup for stale participants (RPC call)
    func cleanupStaleParticipants() async throws {
        _ = try await makeRequest(
            path: "/rpc/cleanup_stale_participants",
            method: "POST",
            sign: true
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
            ],
            sign: true // 🔐 SECURE: No impersonation
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
        var finalMessage = message

        // Serialize metadata into the message body (DB has no metadata column)
        if let metadata = metadata {
            if let jsonData = try? JSONSerialization.data(withJSONObject: metadata, options: .prettyPrinted),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                finalMessage += "\n\n[Metadata]\n\(jsonString)"
            }
        }

        var body: [String: Any] = [
            "level": level.uppercased(),
            "message": finalMessage,
            "created_at": SupabaseClient.isoFormatter.string(from: Date())
        ]

        if let userId = auth.currentUser?.id {
            body["user_id"] = userId.uuidString
        }

        // Fire and forget - don't wait for response to avoid blocking
        // RLS allows public insertion for logs
        do {
            _ = try await makeRequest(
                path: "/app_logs",
                method: "POST",
                body: body,
                sign: true // 🔐 SECURE: Authenticate log source
            )
        } catch {
            NSLog("❌ Failed to upload log: %@", String(describing: error))
        }
    }

    /// Fetch recent logs for Admin Dashboard (Secure RPC)
    func getAppLogs(limit: Int = 50, offset: Int = 0) async throws -> [AppLog] {
        let params: [String: Any] = [
            "p_limit": limit,
            "p_offset": offset
        ]

        // Use SIGNED request to prove Admin Identity via Public Key
        let data = try await makeRequest(
            path: "/rpc/get_admin_logs",
            method: "POST",
            body: params,
            sign: true
        )
        return try jsonDecoder.decode([AppLog].self, from: data)
    }

    /// Delete an app log (Admin RPC)
    func deleteAppLog(id: UUID) async {
        do {
            _ = try await makeRequest(
                path: "/rpc/delete_admin_log",
                method: "POST",
                body: ["p_log_id": id.uuidString.lowercased()],
                sign: true
            )
            LoggingManager.shared.info(.general, message: "Deleted app log: \(id)")
        } catch {
            LoggingManager.shared.error(.general, message: "Failed to delete app log: \(error)")
        }
    }

    /// Delete all app logs (Admin RPC)
    func deleteAllAppLogs() async throws {
        _ = try await makeRequest(
            path: "/rpc/delete_all_admin_logs",
            method: "POST",
            sign: true
        )
        LoggingManager.shared.info(.general, message: "Deleted all app logs.")
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
            method: "POST",
            sign: true // 🔐 Admin access
        )
        return try jsonDecoder.decode([AppVersionStat].self, from: data)
    }

    func getContentPopularity() async throws -> [ContentPopularityStat] {
        let data = try await makeRequest(
            path: "/rpc/get_content_popularity",
            method: "POST",
            sign: true // 🔐 Admin access
        )
        return try jsonDecoder.decode([ContentPopularityStat].self, from: data)
    }

    // MARK: - Crypto Rates

    /// Fetch current crypto rates (matches Edge Function logic)
    func fetchCryptoRates() async throws -> (btc: Double, eth: Double) {
        struct CoinbaseResponse: Decodable {
            struct Data: Decodable {
                let amount: String
            }
            let data: Data
        }

        struct MempoolResponse: Decodable {
            let USD: Double
        }

        async let ethRequest = URLSession.shared.data(from: URL(string: "https://api.coinbase.com/v2/prices/ETH-USD/spot")!)
        async let btcRequest = URLSession.shared.data(from: URL(string: "https://mempool.space/api/v1/prices")!)

        let (ethData, _) = try await ethRequest
        let (btcData, _) = try await btcRequest

        let ethResponse = try JSONDecoder().decode(CoinbaseResponse.self, from: ethData)
        let btcResponse = try JSONDecoder().decode(MempoolResponse.self, from: btcData)

        let ethPrice = Double(ethResponse.data.amount) ?? 0.0
        let btcPrice = btcResponse.USD

        return (btc: btcPrice, eth: ethPrice)
    }

    // MARK: - Payments (Edge Functions)

    /// Assign a payment address for the user
    func assignPaymentAddress(chain: String) async throws -> String {
        guard let userId = auth.currentUser?.id else {
            throw SupabaseError.userNotFound
        }

        let body = [
            "chain": chain,
            "user_id": userId.uuidString
        ]

        // Use makeRequest to enforce signature (IDOR protection)
        let response = try await makeRequest(
            path: "/assign-address",
            method: "POST",
            body: body,
            sign: true,
            isFunction: true
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

        var id: String { "\(hash)_\(season)_\(episode)" }
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
                ],
                sign: true // 🔐 SECURE: Admin mutation
            )
            LoggingManager.shared.info(.general, message: "Title updated for report \(id.uuidString)")
        } catch {
            LoggingManager.shared.error(.general, message: "Failed to update report title: \(error)")
        }
    }

    /// Report a bad stream (Community)
    func reportStream(imdbId: String, season: Int = -1, episode: Int = -1, quality: String, streamHash: String, reason: String, movieTitle: String? = nil, filename: String? = nil, provider: String? = nil) async {
        do {
            // Pack metadata into reason field to avoid schema changes
            var finalReason = reason
            if let provider = provider { finalReason += "\n[Provider: \(provider)]" }
            if let filename = filename { finalReason += "\n[File: \(filename)]" }

            var body: [String: Any] = [
                "imdb_id": imdbId,
                "season": season,       // For episode-specific decay
                "episode": episode,     // For episode-specific decay
                "quality": quality,
                "stream_hash": streamHash,
                "reason": finalReason
            ]

            if let title = movieTitle {
                body["movie_title"] = title
            }

            if let userId = auth.currentUser?.id.uuidString {
                body["user_id"] = userId
            }


            _ = try await makeRequest(
                path: "/reported_streams",
                method: "POST",
                body: body,
                sign: true // 🔐 SECURE: Authenticate user report
            )

            // Broadcast alert for real-time admin notification
            Task {
                try? await realtimeClient.connect()
                try? await realtimeClient.joinChannel("admin:alerts")
                try? await realtimeClient.broadcast(topic: "admin:alerts", event: "new_report", payload: [:])
            }
            LoggingManager.shared.info(.social, message: "Reported stream: \(streamHash) Reason: \(reason)")
        } catch {
            LoggingManager.shared.error(.social, message: "Failed to report stream: \(error)")
        }
    }

    /// Delete a report (Admin Action - Dismiss)
    func deleteReport(id: UUID) async {
        do {
            _ = try await makeRequest(
                path: "/reported_streams",
                method: "DELETE",
                query: ["id": "eq.\(id.uuidString)"],
                sign: true // 🔐 Admin check
            )
            LoggingManager.shared.info(.social, message: "Report dismissed: \(id)")
        } catch {
            LoggingManager.shared.error(.social, message: "Failed to dismiss report: \(error)")
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
            ],
            sign: true // 🔐 Admin check
        )
        LoggingManager.shared.info(.social, message: "Deleted reported stream entry: \(id)")
    }

    /// Delete a verified stream (Admin) - Unlocks the stream for normal resolver
    func deleteVerifiedStream(streamHash: String) async throws {
        _ = try await makeRequest(
            path: "/verified_streams",
            method: "DELETE",
            query: [
                "stream_hash": "eq.\(streamHash)"
            ],
            sign: true // 🔐 Admin check
        )
        LoggingManager.shared.info(.general, message: "Deleted verified stream with hash: \(streamHash)")
    }

    // MARK: - Blocked Streams (Blacklist)

    /// Get all blocked streams (Admin)
    func getBlockedStreams() async throws -> [BlockedStream] {
        let data = try await makeRequest(
            path: "/blocked_streams",
            query: [
                "select": "*",
                "order": "created_at.desc"
            ]
        )
        return try jsonDecoder.decode([BlockedStream].self, from: data)
    }

    /// Block a stream (Admin)
    func blockStream(hash: String, filename: String?, provider: String?, reason: String?) async throws {
        var body: [String: Any] = [
            "stream_hash": hash
        ]
        if let f = filename { body["filename"] = f }
        if let p = provider { body["provider"] = p }
        if let r = reason { body["reason"] = r }
        if let uid = auth.currentUser?.id { body["blocked_by"] = uid.uuidString }

        _ = try await makeRequest(
            path: "/blocked_streams",
            method: "POST",
            body: body,
            sign: true // 🔐 Admin check
        )
        LoggingManager.shared.warn(.general, message: "Blocked stream: \(hash)")
    }

    /// Unblock a stream (Admin)
    func unblockStream(hash: String) async throws {
        _ = try await makeRequest(
            path: "/blocked_streams",
            method: "DELETE",
            query: ["stream_hash": "eq.\(hash)"],
            sign: true // 🔐 Admin check
        )
        LoggingManager.shared.info(.general, message: "Unblocked stream: \(hash)")
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
                ],
                sign: true // 🔐 SECURE: Admin mutation
            )
            LoggingManager.shared.info(.general, message: "Title updated for \(imdbId)")
        } catch {
            LoggingManager.shared.error(.general, message: "Failed to update title: \(error)")
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
                "last_verified_at": SupabaseClient.isoFormatter.string(from: Date())
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
                        LoggingManager.shared.warn(.network, message: "Verified Stream: Keeping incumbent hash (Votes: \(existing.voteCount)) vs new candidate.")
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
                headers: ["Prefer": "resolution=merge-duplicates"],
                sign: true // 🔐 SECURE: Identity proof for voting
            )
            LoggingManager.shared.info(.network, message: "Verified Stream: Voted for \(imdbId) S\(season)E\(episode) (\(quality)) [Hash: \(streamHash.prefix(8))...]")

        } catch {
            LoggingManager.shared.error(.network, message: "Failed to vote for stream: \(error)")
        }
    }

    /// Check payment status via Edge Function
    /// Check payment status via Edge Function
    func checkPaymentStatus() async throws -> (Bool, Date?, Bool) {
        // Fix: Client uses custom auth, so we must pass user_id explicitly since we have no JWT
        let userId = auth.currentUser?.id.uuidString ?? ""
        let body = ["user_id": userId]

        let response = try await makeRequest(
            path: "/check-payment",
            method: "POST",
            body: body,
            useEphemeralSession: true, // Use longer 30s timeout for multi-chain scan
            sign: true,
            isFunction: true
        )

        struct PaymentResponse: Decodable {
            let success: Bool
            let premium: Bool?
            let new_payment: Bool?
            let new_expiry: String? // ISO8601 string
        }

        // Log raw response for debugging
        if let string = String(data: response, encoding: .utf8) {
            LoggingManager.shared.debug(.network, message: "Check Payment Response: \(string)")
        }

        let result = try JSONDecoder().decode(PaymentResponse.self, from: response)
        let isNew = result.new_payment ?? false

        if let expiryString = result.new_expiry,
           let date = SupabaseClient.isoFormatter.date(from: expiryString) {
            return (result.premium ?? false, date, isNew)
        }

        return (result.premium ?? false, nil, isNew)
    }

    /// Trigger manual sweep of funds to master wallet
    func sweepPayments() async throws -> String {
        let response = try await makeRequest(
            path: "/sweep-payments",
            method: "POST",
            body: [:],
            useEphemeralSession: true, // Use longer 30s timeout for multi-chain txs
            sign: true,
            isFunction: true
        )

        if let string = String(data: response, encoding: .utf8) {
            return string
        }
        return "Sweep command sent"
    }

    // MARK: - Payment Transaction History

    /// Get current user's own payment transactions (uses RLS policy)
    func getMyPaymentTransactions() async throws -> [PaymentTransaction] {
        guard let userId = auth.currentUser?.id else {
            return []
        }

        let params = ["p_user_id": userId.uuidString]

        // Use RPC to bypass RLS since client auth token is missing/invalid
        let data = try await makeRequest(
            path: "/rpc/get_user_payment_history",
            method: "POST",
            body: params,
            sign: true // 🔐 SECURE: Identity proof for history
        )
        return try jsonDecoder.decode([PaymentTransaction].self, from: data)
    }

    /// Admin: Get all payment transactions with joined username
    /// Uses RPC `get_all_payment_transactions` to bypass RLS and join users
    func getAllPaymentTransactions(limit: Int = 50, offset: Int = 0, search: String? = nil) async throws -> [PaymentTransaction] {
        struct RPCTransaction: Decodable {
            let id: UUID
            let userId: UUID
            let username: String?
            let chain: String
            let currency: String
            let amount: Double
            let amountUsd: Double?
            let txHash: String
            let createdAt: Date
            let durationDays: Int?

            enum CodingKeys: String, CodingKey {
                case id, username, chain, currency, amount
                case amountUsd = "amount_usd"
                case userId = "user_id"
                case txHash = "tx_hash"
                case createdAt = "created_at"
                case durationDays = "duration_days"
            }
        }

        var params: [String: Any] = ["p_limit": limit, "p_offset": offset]
        if let search = search, !search.isEmpty {
            params["p_search"] = search
        }

        // Use manual RPC call via PostgREST
        let data = try await makeRequest(
            path: "/rpc/get_all_payment_transactions",
            method: "POST",
            body: params,
            sign: true // 🔐 Admin access
        )
        let rpcTransactions = try jsonDecoder.decode([RPCTransaction].self, from: data)

        // Map RPC result to PaymentTransaction model
        return rpcTransactions.map { tx in
            var paymentTx = PaymentTransaction(
                id: tx.id,
                userId: tx.userId,
                chain: tx.chain,
                currency: tx.currency,
                amount: tx.amount,
                amountUsd: tx.amountUsd,
                txHash: tx.txHash,
                createdAt: tx.createdAt,
                durationDays: tx.durationDays
            )
            paymentTx.username = tx.username
            return paymentTx
        }
    }

    /// Admin: Get payment statistics (total revenue, 30-day, 90-day)
    /// Uses RPC `get_payment_stats` to bypass RLS
    func getPaymentStats() async throws -> PaymentStats {
        // Use manual RPC call via PostgREST
        let data = try await makeRequest(
            path: "/rpc/get_payment_stats",
            method: "POST",
            sign: true // 🔐 Admin access
        )

        let statsArray = try jsonDecoder.decode([PaymentStats].self, from: data)
        if let stats = statsArray.first {
            return stats
        }
        throw NSError(domain: "SupabaseClient", code: -1, userInfo: [NSLocalizedDescriptionKey: "No stats returned"])
    }

    // MARK: - Feedback & Logging System



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
                body: body,
                sign: true // 🔐 SECURE: Identity required for feedback
            )

            // Broadcast alert for real-time admin notification
            Task {
                try? await realtimeClient.connect()
                try? await realtimeClient.joinChannel("admin:alerts")
                try? await realtimeClient.broadcast(topic: "admin:alerts", event: "new_feedback", payload: [:])
            }

            LoggingManager.shared.info(.social, message: "Feedback sent successfully")
        } catch {
            LoggingManager.shared.error(.social, message: "Failed to send feedback: \(error)")
        }
    }

    /// Upload a session log
    func uploadSessionLog(log: SessionLog) async throws {
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
            body: body,
            sign: true // 🔐 SECURE: Identity required for logs
        )
        LoggingManager.shared.info(.network, message: "Session Log uploaded successfully: \(log.sessionId)")
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
                query: ["id": "eq.\(id.uuidString)"],
                sign: true // 🔐 SECURE: Admin mutation
            )
            LoggingManager.shared.info(.social, message: "Deleted feedback: \(id)")
        } catch {
            LoggingManager.shared.error(.social, message: "Failed to delete feedback: \(error)")
        }
    }



    func getSystemJobLogs(limit: Int = 50, offset: Int = 0) async throws -> [SystemJobLog] {
        let data = try await makeRequest(
            path: "/system_job_logs",
            query: [
                "select": "*",
                "order": "created_at.desc",
                "limit": String(limit),
                "offset": String(offset)
            ]
        )
        return try jsonDecoder.decode([SystemJobLog].self, from: data)
    }

    /// Delete all system job logs (Admin)
    func deleteAllSystemLogs() async throws {
         _ = try await makeRequest(
            path: "/system_job_logs",
            method: "DELETE",
            query: ["id": "neq.00000000-0000-0000-0000-000000000000"],
            sign: true // 🔐 SECURE: Admin mutation
        )
        LoggingManager.shared.info(.network, message: "Deleted all system logs.")
    }

    /// Delete a session log (Admin)
    func deleteSessionLog(id: UUID) async {
        do {
            _ = try await makeRequest(
                path: "/session_logs",
                method: "DELETE",
                query: ["id": "eq.\(id.uuidString)"],
                sign: true // 🔐 SECURE: Admin mutation
            )
            LoggingManager.shared.info(.network, message: "Deleted session log: \(id)")
        } catch {
            LoggingManager.shared.error(.network, message: "Failed to delete session log: \(error)")
        }
    }

    /// Delete all session logs (Admin)
    func deleteAllSessionLogs() async throws {
        // Delete where ID is not the zero-UUID (effectively all)
        _ = try await makeRequest(
            path: "/session_logs",
            method: "DELETE",
            query: ["id": "neq.00000000-0000-0000-0000-000000000000"],
            sign: true // 🔐 SECURE: Admin mutation
        )
        LoggingManager.shared.info(.network, message: "Deleted all session logs.")
    }

    /// Get session logs (Admin)
    func getSessionLogs(limit: Int = 20, offset: Int = 0) async throws -> [SessionLog] {
        let data = try await makeRequest(
            path: "/session_logs",
            query: [
                "select": "*",
                "order": "created_at.desc",
                "limit": String(limit),
                "offset": String(offset)
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
            // Use cached formatter, but here we need specific options
            // Note: isoFormatter is standard. If we need specialized options for decoding this specific field,
            // likely it matches standard ISO8601.
            // If SupabaseClient.isoFormatter uses default options, it handles internet date time.
            if let date = SupabaseClient.isoFormatter.date(from: dateStr) { return date }

            // Fallback to manual if cached fails (unlikely if standard ISO)
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

        var payload: [String: Any] = [
            "user_id": userId.uuidString,
            "media_id": item.mediaItem.id,
            "media_type": item.mediaItem.type,
            "title": item.mediaItem.name,
            "season": season,
            "episode": episode,
            "progress": item.progress,
            "last_watched": SupabaseClient.isoFormatter.string(from: item.lastWatched)
        ]

        if let poster = item.mediaItem.poster {
            payload["poster_url"] = poster
        }

        _ = try await makeRequest(
            path: "/user_watch_history",
            method: "POST",
            body: payload,
            query: ["on_conflict": "user_id,media_id,season,episode"],
            headers: ["Prefer": "resolution=merge-duplicates, return=representation"],
            sign: true // 🔐 SECURE: Proven history ownership
        )
    }

    /// Get watch history for a user (e.g. self or friend) using secure RPC
    func getWatchHistory(userId: UUID) async throws -> [RemoteHistoryItem] {
        let data = try await makeRequest(
            path: "/rpc/fetch_user_watch_history",
            method: "POST",
            body: ["p_user_id": userId.uuidString.lowercased()],
            sign: true
        )
        return try jsonDecoder.decode([RemoteHistoryItem].self, from: data)
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
    let subscriptionExpiresAt: Date?


    enum CodingKeys: String, CodingKey {
        case id, username
        case displayName = "display_name"
        case avatarUrl = "avatar_url"
        case createdAt = "created_at"
        case lastSeen = "last_seen"
        case isAdmin = "is_admin"
        case isPremium = "is_premium"
        case subscriptionExpiresAt = "subscription_expires_at"

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

/// Represents a payment transaction from the `payment_transactions` table.
/// Referenced in CRYPTO_PAYMENTS.md - logs every detected incoming payment.
struct PaymentTransaction: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let chain: String      // "btc", "evm" (matches key_derivation_indices)
    let currency: String   // "BTC", "ETH", "USDC", "USDT"
    let amount: Double
    var amountUsd: Double? // Value in USD at time of query
    let txHash: String
    let createdAt: Date
    let durationDays: Int?

    // Joined username (optional, populated for admin views)
    var username: String?

    enum CodingKeys: String, CodingKey {
        case id, chain, currency, amount, username
        case amountUsd = "amount_usd"
        case userId = "user_id"
        case txHash = "tx_hash"
        case createdAt = "created_at"
        case durationDays = "duration_days"
    }
}

/// Payment statistics for admin dashboard
struct PaymentStats: Codable {
    let totalTransactions: Int
    let totalRevenueUsd: Double
    let revenue30d: Double
    let revenue90d: Double

    enum CodingKeys: String, CodingKey {
        case totalTransactions = "total_transactions"
        case totalRevenueUsd = "total_revenue_usd"
        case revenue30d = "revenue_30d"
        case revenue90d = "revenue_90d"
    }
}

extension SupabaseClient {
    struct BlockedStream: Codable, Identifiable {
        var id: String { streamHash } // Conformance to Identifiable
        let streamHash: String
        let filename: String?
        let provider: String?
        let reason: String?
        let blockedBy: UUID?
        let createdAt: Date

        enum CodingKeys: String, CodingKey {
            case streamHash = "stream_hash"
            case filename
            case provider
            case reason
            case blockedBy = "blocked_by"
            case createdAt = "created_at"
        }
    }
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
    let hostUserId: UUID?
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
    let sourceQuality: String? // Internal Note #91: Stream title for fallback matching when hash is nil
    let unlockedStreamUrl: String? // Unlocked stream URL
    let playlist: [PlaylistItem]? // List of items to play
    let currentPlaylistIndex: Int? // Current index in playlist
    let description: String? // Room description
    let subtitleUrl: String? // Selected subtitle URL

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
        case sourceQuality = "source_quality" // Internal Note #91
        case unlockedStreamUrl = "unlocked_stream_url"
        case playlist
        case currentPlaylistIndex = "current_playlist_index"
        case description
        case subtitleUrl = "subtitle_url"
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
            if friendship.userId1 == userId { return friendship.userId2 } // OK
            if friendship.userId2 == userId { return friendship.userId1 } // OK
            return nil
        }

        if friendIds.isEmpty { return [] }

        // 3. Fetch profiles for these IDs from 'users' table
        let idsString = friendIds.map { $0.uuidString }.joined(separator: ",")

        let usersPath = "/users?id=in.(\(idsString))&select=id,username,display_name,avatar_url,created_at,last_seen,is_admin,is_premium,subscription_expires_at"
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
        _ = try await makeRequest(path: path, method: "DELETE", sign: true)
    }

    func deleteFriend(userId: UUID, friendId: UUID) async throws {
        _ = try await makeRequest(
            path: "/friendships",
            method: "DELETE",
            query: [
                "or": "(and(user_id_1.eq.\(userId.uuidString),user_id_2.eq.\(friendId.uuidString)),and(user_id_1.eq.\(friendId.uuidString),user_id_2.eq.\(userId.uuidString)))"
            ],
            sign: true // 🔐 SECURE: Only participants can delete
        )
    }

    // Removed duplicate searchUsers (already exists in SupabaseClient)

    // Internal helpers

    // MARK: - Blocking

    func blockUser(blockerId: UUID, blockedId: UUID) async throws {
        // SECURE: Use RPC with signature verification
        let body: [String: Any] = [
            "target_id": blockedId.uuidString,
            "action": "block"
        ]

        _ = try await makeRequest(
            path: "/rpc/manage_block",
            method: "POST",
            body: body,
            sign: true
        )
    }

    func unblockUser(blockerId: UUID, blockedId: UUID) async throws {
        // SECURE: Use RPC with signature verification
        let body: [String: Any] = [
            "target_id": blockedId.uuidString,
            "action": "unblock"
        ]

        _ = try await makeRequest(
            path: "/rpc/manage_block",
            method: "POST",
            body: body,
            sign: true
        )
    }

    /// Get list of blocked users
    func getBlockedUsers(userId: UUID) async throws -> [SupabaseUser] {
        // 1. Get block records where user is blocker
        let path = "/user_blocks?blocker_id=eq.\(userId.uuidString)&select=*"
        struct BlockRecord: Decodable {
            let blocked_id: UUID
        }

        let data = try await makeRequest(path: path, method: "GET")
        let blocks = try jsonDecoder.decode([BlockRecord].self, from: data)

        if blocks.isEmpty { return [] }

        // 2. Fetch profiles for blocked IDs
        let idsString = blocks.map { $0.blocked_id.uuidString }.joined(separator: ",")
        let usersPath = "/users?id=in.(\(idsString))"
        let usersData = try await makeRequest(path: usersPath, method: "GET") // Reusing makeRequest

        return try jsonDecoder.decode([SupabaseUser].self, from: usersData)
    }

    func sendFriendRequest(from senderId: UUID, to receiverId: UUID) async throws {
        // Check if there's any existing friendship between these two users
        // Use URLComponents to properly encode the complex OR query (Security Check #84)
        let senderIdStr = senderId.uuidString.lowercased()
        let receiverIdStr = receiverId.uuidString.lowercased()

        var components = URLComponents(string: "\(baseURL)/rest/v1/friendships")!
        components.queryItems = [
            URLQueryItem(name: "or", value: "(and(user_id_1.eq.\(senderIdStr),user_id_2.eq.\(receiverIdStr)),and(user_id_1.eq.\(receiverIdStr),user_id_2.eq.\(senderIdStr)))"),
            URLQueryItem(name: "select", value: "id,status,user_id_1")
        ]

        guard let checkURL = components.url else {
            throw SupabaseError.invalidURL
        }

        var request = URLRequest(url: checkURL)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        let (existingData, _) = try await URLSession.shared.data(for: request)

        struct ExistingFriendship: Decodable {
            let id: UUID
            let status: String
            let user_id_1: UUID
        }

        if let existingFriendships = try? jsonDecoder.decode([ExistingFriendship].self, from: existingData),
           let existing = existingFriendships.first {
            if existing.status == "accepted" {
                // Already friends - no action needed
                return
            } else if existing.status == "pending" {
                if existing.user_id_1 == receiverId {
                    // They already sent us a request - accept it! (mutual add = instant friends)
                    try await updateFriendshipStatus(id: existing.id, status: .accepted)
                }
                // Either way (they sent to us, or we sent to them), we're done
                return
            }
        }

        // No existing friendship, create a new pending request
        let path = "/friendships"
        let body: [String: Any] = [
            "user_id_1": senderId.uuidString,
            "user_id_2": receiverId.uuidString,
            "status": "pending"
        ]

        _ = try await makeRequest(path: path, method: "POST", body: body, sign: true)
    }

    func updateFriendshipStatus(id: UUID, status: FriendshipStatus) async throws {
        let path = "/friendships?id=eq.\(id)"
        let body = ["status": status.rawValue]
        _ = try await makeRequest(path: path, method: "PATCH", body: body, sign: true)


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
            ],
            sign: true
        )

        _ = try await makeRequest(
            path: "/friendships",
            method: "POST",
            body: [
                "user_id_1": userId2.uuidString,
                "user_id_2": userId1.uuidString,
                "status": "accepted"
            ],
            sign: true
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

        _ = try await makeRequest(path: path, method: "POST", body: body, sign: true)
    }

    /// Delete all direct messages between two users
    func deleteAllDirectMessages(userId: UUID, friendId: UUID) async throws {
        // Delete messages where either:
        // 1. user is sender AND friend is receiver
        // 2. friend is sender AND user is receiver
        _ = try await makeRequest(
            path: "/direct_messages",
            method: "DELETE",
            query: [
                "or": "(and(sender_id.eq.\(userId.uuidString),receiver_id.eq.\(friendId.uuidString)),and(sender_id.eq.\(friendId.uuidString),receiver_id.eq.\(userId.uuidString)))"
            ],
            sign: true // 🔐 SECURE: Only sender/receiver can delete
        )
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
    let isPremium: Bool
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
    func invoke(_ functionName: String, token: String? = nil, options: FunctionInvokeOptions? = nil) async throws -> Data {
        let urlString = "\(baseURL)/functions/v1/\(functionName)"

        guard let url = URL(string: urlString) else {
            throw SupabaseError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(apiKey, forHTTPHeaderField: "apikey")

        // Fix: Use the provided User Token if available, otherwise fall back to Anon Key
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        } else {
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let body = options?.body {
            // CRITICAL: Use deterministic JSON for potential future signature/hash verification
            var options: JSONSerialization.WritingOptions = [.sortedKeys]
            if #available(iOS 13.0, macOS 10.15, *) {
                options.insert(.withoutEscapingSlashes)
            }
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: options)
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
                query: query,
                sign: true // 🔐 SECURE: Mutations via QueryBuilder must be signed
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

struct SystemJobLog: Codable, Identifiable {
    let id: UUID
    let jobName: String
    let status: String
    let details: String?
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case jobName = "job_name"
        case status
        case details
        case createdAt = "created_at"
    }
}

// MARK: - Feedback Models

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

// MARK: - Cloud Sync Logic

struct RemoteLibraryItem: Codable {
    let item_id: String
    let name: String
    let type: String
    let poster_url: String?
    let year: String?
    let added_at: Date
    let media_meta: MediaItem? // JSONB
}

struct RemoteHistoryItem: Codable, Identifiable {
    var id: String { media_id }
    let media_id: String
    let title: String
    let media_type: String
    let poster_url: String?
    let timestamp: Double?
    let duration: Double?
    let progress: Double
    let season: Int?
    let episode: Int?
    let last_watched: Date
    let media_meta: MediaItem? // JSONB
}

extension SupabaseClient {
    
    // MARK: - Library Sync
    
    /// Sync a single library item to the server (Upsert)
    func syncLibraryItem(_ item: LibraryItem, mediaItem: MediaItem? = nil) async {
        guard let userId = auth.currentUser?.id else { return }
        
        var innerPayload: [String: Any] = [
            "user_id": userId.uuidString.lowercased(),
            "item_id": item.id,
            "name": item.name,
            "type": item.type,
            "poster_url": item.posterURL ?? NSNull(),
            "year": item.year ?? NSNull(),
            "added_at": SupabaseClient.isoFormatter.string(from: item.dateAdded)
        ]
        
        if let mediaItem = mediaItem,
           let data = try? JSONEncoder().encode(mediaItem),
           let json = try? JSONSerialization.jsonObject(with: data) {
            innerPayload["media_meta"] = json
        }
        
        do {
            _ = try await makeRequest(
                path: "/rpc/upsert_library_item",
                method: "POST",
                body: ["payload": innerPayload],
                sign: true
            )
        } catch {
            print("❌ Sync: Failed to sync library item \(item.name): \(error)")
        }
    }
    
    /// Delete library item from server
    func deleteLibraryItem(id: String) async {
        guard let userId = auth.currentUser?.id else { return }
        
        do {
            _ = try await makeRequest(
                path: "/rpc/delete_user_library_item",
                method: "POST",
                body: [
                    "p_user_id": userId.uuidString.lowercased(),
                    "p_item_id": id
                ],
                sign: true
            )
        } catch {
            print("❌ Sync: Failed to delete library item \(id): \(error)")
        }
    }
    
    /// Fetch all library items from server
    func fetchRemoteLibrary(userId: UUID? = nil) async throws -> [LibraryItem] {
        guard let targetId = userId ?? auth.currentUser?.id else { return [] }
        
        let data = try await makeRequest(
            path: "/rpc/fetch_user_library",
            method: "POST",
            body: ["p_user_id": targetId.uuidString.lowercased()],
            sign: true
        )
        
        let remoteItems = try jsonDecoder.decode([RemoteLibraryItem].self, from: data)
        
        return remoteItems.map { remote in
            LibraryItem(
                id: remote.item_id,
                type: remote.type,
                name: remote.name,
                posterURL: remote.poster_url,
                dateAdded: remote.added_at,
                year: remote.year
            )
        }
    }
    
    // MARK: - Watch History Sync
    
    /// Sync a single watch history item to server (Upsert)
    func syncWatchHistoryItem(_ item: WatchHistoryItem) async {
        guard let userId = auth.currentUser?.id else { return }
        
        // Use legacy column names (media_id, title) to match existing table schema
        var innerPayload: [String: Any] = [
            "user_id": userId.uuidString.lowercased(),
            "media_id": item.id,       // Table uses media_id
            "title": item.mediaItem.name, // Table uses title
            "media_type": item.mediaItem.type,
            "poster_url": item.mediaItem.poster ?? NSNull(),
            "timestamp": item.timestamp,
            "duration": item.duration,
            "progress": item.progress,
            "last_watched": SupabaseClient.isoFormatter.string(from: item.lastWatched)
        ]
        
        // Optional fields
        if let s = item.season { innerPayload["season"] = s }
        if let e = item.episode { innerPayload["episode"] = e }
        
        // Always sync the full media item metadata for restoration
        if let data = try? JSONEncoder().encode(item.mediaItem),
           let json = try? JSONSerialization.jsonObject(with: data) {
            innerPayload["media_meta"] = json
        }
        
        do {
            _ = try await makeRequest(
                path: "/rpc/upsert_watch_history_item",
                method: "POST",
                body: ["payload": innerPayload],
                sign: true
            )
        } catch {
            print("❌ Sync: Failed to sync history for \(item.mediaItem.name): \(error)")
        }
    }
    
    /// Fetch full watch history from server
    func fetchRemoteWatchHistory(userId: UUID? = nil) async throws -> [WatchHistoryItem] {
        guard let targetId = userId ?? auth.currentUser?.id else { return [] }
        
        let data = try await makeRequest(
            path: "/rpc/fetch_user_watch_history",
            method: "POST",
            body: ["p_user_id": targetId.uuidString.lowercased()],
            sign: true
        )
        
        let remoteItems = try jsonDecoder.decode([RemoteHistoryItem].self, from: data)
        
        return remoteItems.compactMap { remote -> WatchHistoryItem? in
            // Must have valid media_meta to reconstruct useful history locally
            guard let mediaItem = remote.media_meta else {
                return nil
            }
            
            return WatchHistoryItem(
                id: remote.media_id, // Map from media_id
                mediaItem: mediaItem,
                timestamp: remote.timestamp ?? 0,
                duration: remote.duration ?? 0,
                lastWatched: remote.last_watched,
                quality: nil, 
                season: remote.season,
                episode: remote.episode
            )
        }
    }
}
