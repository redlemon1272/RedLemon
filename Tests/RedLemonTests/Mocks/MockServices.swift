import Foundation
@testable import RedLemon

/// Mock implementation of RealtimeService for unit testing
actor MockRealtimeManager: RealtimeService {
    var roomId: String? = nil
    var isConnected: Bool = false
    var syncCallback: ((SyncMessage) -> Void)?
    var connectionStateCallback: ((RealtimeConnectionState) -> Void)?
    var presenceCallback: ((PresenceAction, String, [String: Any]?) -> Void)?

    // Test verification properties
    var sentMessages: [SyncMessage] = []

    func setup(roomId: String, isHost: Bool, userId: String, username: String, isPremium: Bool, subscriptionExpiresAt: TimeInterval?, postgresChanges: [[String: Any]]? = nil) async throws {
        self.roomId = roomId
        self.isConnected = true
        connectionStateCallback?(.connected)
    }

    func registerObserver(id: String, onPresence: ((PresenceAction, String, [String: Any]?) -> Void)?, onSync: ((SyncMessage) -> Void)?, onConnectionState: ((RealtimeConnectionState) -> Void)?) async {
        if let onPresence = onPresence {
            self.presenceCallback = onPresence
        }
        if let onSync = onSync {
            self.syncCallback = onSync
        }
        if let onConnectionState = onConnectionState {
            self.connectionStateCallback = onConnectionState
        }
    }

    func unregisterObserver(id: String) async {
        // No-op for mock simple implementation
    }

    func sendSyncMessage(_ message: SyncMessage) async throws {
        sentMessages.append(message)
    }

    func disconnect(leaveChannel: Bool, disconnectClient: Bool) async {
        isConnected = false
        connectionStateCallback?(.disconnected)
    }

    func cleanup(leaveChannel: Bool, disconnectClient: Bool) async {
        isConnected = false
    }

    func isRealtimeConnected() -> Bool {
        return isConnected
    }

    func setConnectionStateCallback(_ callback: @escaping (RealtimeConnectionState) -> Void) {
        self.connectionStateCallback = callback
    }

    func setPresenceCallback(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void) {
        self.presenceCallback = callback
    }

    func onPresenceChange(_ callback: @escaping (PresenceAction, String, [String: Any]?) -> Void) {
        self.presenceCallback = callback
    }

    func onConnectionStateChange(_ callback: @escaping (RealtimeConnectionState) -> Void) {
        self.connectionStateCallback = callback
    }

    // Helper to simulate incoming messages
    func simulateIncomingMessage(_ message: SyncMessage) {
        syncCallback?(message)
    }

    func setPostgresCallback(_ callback: @escaping ([String: Any]) -> Void) {
        // Mock implementation
    }
}

// MARK: - Mock MetadataProvider

class MockMetadataProvider: MetadataProvider {
    var fetchedMetadata: MediaMetadata?
    var fetchedDetails: MediaItem?
    var fetchedPopularMovies: [MediaItem] = []

    // Configurable responses
    var metadataResult: Result<MediaMetadata, Error>?

    func fetchMetadata(type: String, id: String) async throws -> MediaMetadata {
        if let result = metadataResult {
            return try result.get()
        }
        return fetchedMetadata ?? MediaMetadata(
            id: id,
            type: type,
            title: "Mock Title",
            year: "2023",
            posterURL: nil,
            backgroundURL: nil,
            logoURL: nil,
            description: nil,
            director: nil,
            cast: [],
            genres: [],
            runtime: nil,
            imdbRating: nil,
            releaseInfo: nil,
            trailerURL: nil,
            videos: nil
        )
    }

    func fetchMediaDetails(imdbId: String, type: String) async throws -> MediaItem {
        return fetchedDetails ?? MediaItem(
            id: imdbId,
            type: type,
            name: "Mock Item",
            poster: nil,
            background: nil,
            logo: nil,
            description: nil,
            releaseInfo: nil,
            year: nil,
            imdbRating: nil,
            genres: nil,
            runtime: nil
        )
    }


    func fetchPopularMovies() async throws -> [MediaItem] {
        return fetchedPopularMovies
    }

    func fetchPopularShows() async throws -> [MediaItem] {
        return fetchedPopularMovies // Reuse common mock for now
    }

    func searchMedia(query: String, type: String) async throws -> [MediaItem] {
        return []
    }
}

// MARK: - Mock StreamResolver

class MockStreamResolver: StreamResolving {
    var resolvedStream: RedLemon.Stream?
    var unlockedStream: RedLemon.Stream?

    func resolveStream(item: MediaItem, quality: VideoQuality, season: Int?, episode: Int?, metadata: MediaMetadata?, preferredInfoHash: String?, preferredTitle: String?, preferredProvider: String?, filterExtended: Bool, triggerSource: String = "test") async throws -> StreamResolutionResult {
        let stream = resolvedStream ?? RedLemon.Stream(
            url: "https://example.com/stream",
            title: "Mock Stream",
            quality: quality.rawValue,
            seeders: 100,
            size: "1GB",
            provider: "RD",
            infoHash: "hash123",
            fileIdx: 0,
            ext: "mp4",
            behaviorHints: nil,
            subtitles: []
        )
        return StreamResolutionResult(stream: stream, metadata: metadata!)
    }

    func unlockStream(stream: RedLemon.Stream, item: MediaItem, season: Int?, episode: Int?, bypassTorrentCache: Bool? = nil) async throws -> RedLemon.Stream {
        return unlockedStream ?? stream
    }
}

// MARK: - Mock RoomManager & UserManager

class MockRoomManager: RoomManager, UserManager {
    var createdRoom: SupabaseRoom?
    var joinRoomCalled = false
    var leaveRoomCalled = false
    var updateStreamCalled = false
    var updatePlaylistCalled = false
    var roomState: SupabaseRoom?
    var participants: [RoomParticipant] = []

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
    ) async throws -> SupabaseRoom {
        let room = SupabaseRoom(
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
            createdAt: createdAt ?? Date(),
            lastActivity: Date(),
            season: season,
            episode: episode,
            fileIdx: 0,

            quality: "1080p",
            sourceQuality: sourceQuality,
            unlockedStreamUrl: nil,
            playlist: playlist,
            currentPlaylistIndex: 0,
            description: description,
            subtitleUrl: subtitleUrl
        )
        createdRoom = room
        return room
    }

    func joinRoom(roomId: String, userId: UUID, isHost: Bool) async throws {
        joinRoomCalled = true
    }

    func updateRoomStream(roomId: String, streamHash: String?, fileIdx: Int?, quality: String?, unlockedUrl: String?, sourceQuality: String?, resetPlayback: Bool) async throws {
        updateStreamCalled = true
    }

    func updateRoomPlaylist(roomId: String, playlist: [PlaylistItem], currentIndex: Int) async throws {
        updatePlaylistCalled = true
    }

    func getRoomState(roomId: String) async throws -> SupabaseRoom? {
        return roomState
    }

    func getRoomParticipants(roomId: String) async throws -> [RoomParticipant] {
        return participants
    }

    // UserManager
    func getUserById(userId: UUID) async throws -> SupabaseUser? {
        return nil
    }
}
