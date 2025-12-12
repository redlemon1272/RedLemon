import Foundation
@testable import RedLemon

class MockLobbyDataService: LobbyDataService {
    
    // MARK: - Properties
    
    // Call Counts for Verification
    var joinRoomCallCount = 0
    var leaveRoomCallCount = 0
    var createRoomCallCount = 0
    var deleteRoomCallCount = 0
    var startRoomPlaybackCallCount = 0
    var updateRoomPlaybackCallCount = 0
    var updateRoomMetadataCallCount = 0
    var updateRoomPlaylistCallCount = 0
    var updateRoomStreamCallCount = 0
    var getRoomParticipantsCallCount = 0
    var sendHeartbeatCallCount = 0
    var getRoomStateCallCount = 0
    
    // Stubbed Data
    var roomStateToReturn: SupabaseRoom?
    var participantsToReturn: [RoomParticipant] = []
    var userToReturn: SupabaseUser?
    
    // Realtime Client (Not used if MockRealtimeManager is injected)
    var realtimeClient: SupabaseRealtimeClient {
        fatalError("MockLobbyDataService: realtimeClient should not be accessed when RealtimeService is injected")
    }
    
    // MARK: - Room Management
    
    func getRoomState(roomId: String) async throws -> SupabaseRoom? {
        getRoomStateCallCount += 1
        return roomStateToReturn
    }
    
    func joinRoom(roomId: String, userId: UUID, isHost: Bool) async throws {
        joinRoomCallCount += 1
    }
    
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
    ) async throws -> SupabaseRoom {
        createRoomCallCount += 1
        return SupabaseRoom(
            id: id,
            name: name,
            hostUserId: hostUserId,
            hostUsername: hostUsername,
            streamHash: streamHash,
            imdbId: imdbId,
            posterUrl: posterUrl,
            backdropUrl: backdropUrl,
            playbackPosition: 0,
            isPlaying: false,
            participantsCount: 1,
            maxParticipants: 10,
            isPublic: isPublic,
            createdAt: Date(),
            lastActivity: Date(),
            season: season,
            episode: episode,
            fileIdx: 0,
            quality: "1080p",
            unlockedStreamUrl: unlockedStreamUrl,
            playlist: playlist,
            currentPlaylistIndex: 0,
            description: description
        )
    }
    
    func deleteRoom(roomId: String) async throws {
        deleteRoomCallCount += 1
    }
    
    func leaveRoom(roomId: String, userId: UUID) async throws {
        leaveRoomCallCount += 1
    }
    
    // MARK: - Playback & State
    
    func startRoomPlayback(roomId: String) async throws {
        startRoomPlaybackCallCount += 1
    }
    
    func updateRoomPlayback(roomId: String, position: Int, isPlaying: Bool) async throws {
        updateRoomPlaybackCallCount += 1
    }
    
    func updateRoomMetadata(
        roomId: String,
        name: String,
        imdbId: String?,
        season: Int?,
        episode: Int?,
        posterUrl: String?,
        backdropUrl: String?
    ) async throws {
        updateRoomMetadataCallCount += 1
    }
    
    func updateRoomPlaylist(roomId: String, playlist: [PlaylistItem], currentIndex: Int) async throws {
        updateRoomPlaylistCallCount += 1
    }
    
    func updateRoomStream(
        roomId: String,
        streamHash: String?,
        fileIdx: Int?,
        quality: String?,
        unlockedUrl: String?
    ) async throws {
        updateRoomStreamCallCount += 1
    }
    
    // MARK: - Participants & Presence
    
    func getRoomParticipants(roomId: String) async throws -> [RoomParticipant] {
        getRoomParticipantsCallCount += 1
        return participantsToReturn
    }
    
    func sendHeartbeat(roomId: String, userId: UUID) async throws {
        sendHeartbeatCallCount += 1
    }
    
    // MARK: - User
    
    func getUserById(userId: UUID) async throws -> SupabaseUser? {
        return userToReturn
    }
}
