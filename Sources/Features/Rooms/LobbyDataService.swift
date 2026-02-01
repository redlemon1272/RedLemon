import Foundation

/// Protocol defining database operations required by the Lobby system.
/// This abstraction allows us to mock the data layer for integration testing.
protocol LobbyDataService {
    // Realtime Client Access
    var realtimeClient: SupabaseRealtimeClient { get }

    // Room Management
    func getRoomState(roomId: String) async throws -> SupabaseRoom?
    func joinRoom(roomId: String, userId: UUID, isHost: Bool) async throws
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
        sourceQuality: String?
    ) async throws -> SupabaseRoom

    func deleteRoom(roomId: String) async throws
    func leaveRoom(roomId: String, userId: UUID) async throws

    // Playback & State
    func startRoomPlayback(roomId: String) async throws
    func updateRoomPlayback(roomId: String, position: Int, isPlaying: Bool, shouldClearStream: Bool) async throws
    func updateRoomMetadata(
        roomId: String,
        name: String,
        imdbId: String?,
        season: Int?,
        episode: Int?,
        posterUrl: String?,
        backdropUrl: String?
    ) async throws

    func updateRoomPlaylist(roomId: String, playlist: [PlaylistItem], currentIndex: Int) async throws

    func updateRoomStream(
        roomId: String,
        streamHash: String?,
        fileIdx: Int?,
        quality: String?,
        unlockedUrl: String?,
        sourceQuality: String?,
        resetPlayback: Bool
    ) async throws

    func resetRoomStream(roomId: String) async throws

    func updateRoomPrivacy(roomId: String, isPublic: Bool) async throws

    // Participants & Presence
    func getRoomParticipants(roomId: String) async throws -> [RoomParticipant]
    func sendHeartbeat(roomId: String, userId: UUID) async throws

    // User
    func getUserById(userId: UUID) async throws -> SupabaseUser?
}

// Default Implementations (For Default Arguments)
extension LobbyDataService {
    // Forwarding for backward compatibility
    func updateRoomPlayback(roomId: String, position: Int, isPlaying: Bool) async throws {
        try await updateRoomPlayback(roomId: roomId, position: position, isPlaying: isPlaying, shouldClearStream: false)
    }

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
        sourceQuality: String? = nil
    ) async throws -> SupabaseRoom {
        return try await createRoom(
            id: id,
            name: name,
            hostUserId: hostUserId,
            hostUsername: hostUsername,
            streamHash: streamHash,
            imdbId: imdbId,
            posterUrl: posterUrl,
            backdropUrl: backdropUrl,
            season: season,
            episode: episode,
            isPublic: isPublic,
            unlockedStreamUrl: unlockedStreamUrl,
            description: description,
            playlist: playlist,
            subtitleUrl: subtitleUrl,
            sourceQuality: sourceQuality
        )
    }

    func updateRoomMetadata(
        roomId: String,
        name: String,
        imdbId: String?,
        season: Int?,
        episode: Int?,
        posterUrl: String? = nil,
        backdropUrl: String? = nil
    ) async throws {
        try await updateRoomMetadata(
            roomId: roomId,
            name: name,
            imdbId: imdbId,
            season: season,
            episode: episode,
            posterUrl: posterUrl,
            backdropUrl: backdropUrl
        )
    }
}


// Default Conformance for the Singleton Client
extension SupabaseClient: LobbyDataService {
    // Methods declared in LobbyDataService match exactly with existing SupabaseClient methods.
    // No implementation implementation needed here as SupabaseClient already implements them.
}
