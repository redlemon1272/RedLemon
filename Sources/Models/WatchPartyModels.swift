import Foundation

// MARK: - Playlist Item

struct PlaylistItem: Identifiable, Codable, Equatable {
    let id: String
    let mediaItem: MediaItem
    let season: Int?
    let episode: Int?

    init(mediaItem: MediaItem, season: Int? = nil, episode: Int? = nil) {
        self.id = UUID().uuidString
        self.mediaItem = mediaItem
        self.season = season
        self.episode = episode
    }

    var displayTitle: String {
        if let s = season, let e = episode {
            return "\(mediaItem.name) - S\(s)E\(e)"
        }
        return mediaItem.name
    }
}

// MARK: - Watch Party Room

// MARK: - Room Type

enum RoomType {
    case event
    case userRoom
}

struct WatchPartyRoom: Identifiable {
    let id: String // Room ID for joining

    var type: RoomType {
        id.hasPrefix("event_") ? .event : .userRoom
    }

    var hostId: String
    var hostName: String? // Username of host
    var mediaItem: MediaItem? // Optional - can be set later in lobby
    var season: Int? // Season number for series
    var episode: Int? // Episode number for series
    var episodeTitle: String? // Title of the episode
    var quality: VideoQuality
    var sourceQuality: String? // BluRay, WEB-DL, CAM, etc.
    var description: String? // Room description set by host
    var posterURL: String? // Poster art for the media
    var participants: [Participant]
    var participantCount: Int  // DB-managed count (source of truth for display)
    var state: RoomState
    var createdAt: Date
    var lastActivity: Date

    // MARK: - Playlist Support
    var playlist: [PlaylistItem]?
    var currentPlaylistIndex: Int
    var lobbyDuration: TimeInterval  // Buffer between movies (default 10 min)
    var shouldLoop: Bool
    var isPersistent: Bool  // If true, room stays alive after movies

    // MARK: - Playback Progress
    var playbackPosition: TimeInterval? // Current playback position in seconds
    var runtime: TimeInterval? // Total runtime in seconds

    // MARK: - Stream Synchronization
    var selectedStreamHash: String? // Host's selected stream infoHash
    var selectedFileIdx: Int? // Host's selected file index
    var selectedQuality: String? // Host's selected quality
    var unlockedStreamURL: String? // Host's unlocked stream URL
    var subtitleUrl: String? = nil // Host's selected subtitle URL

    enum RoomState: String {
        case lobby // Waiting for host to start
        case playing // Video is playing
        case paused // Video is paused
        case ended // Video finished
    }

    var guestCount: Int {
        participants.filter { !$0.isHost }.count
    }

    var readyCount: Int {
        participants.filter { $0.isReady }.count
    }

    // MARK: - Playlist Helpers

    var hasPlaylist: Bool {
        playlist != nil && !(playlist?.isEmpty ?? true)
    }

    var currentPlaylistItem: PlaylistItem? {
        guard let playlist = playlist,
              currentPlaylistIndex < playlist.count else {
            return nil
        }
        return playlist[currentPlaylistIndex]
    }

    var isLastItemInPlaylist: Bool {
        guard let playlist = playlist else { return false }
        return currentPlaylistIndex >= playlist.count - 1
    }
}

// MARK: - Participant

struct Participant: Identifiable {
    let id: String // Unique participant ID
    var name: String // Display name (e.g., "Guest 1", "Host")
    var isHost: Bool
    var isReady: Bool // Ready to start
    var joinedAt: Date
    var phxRefs: Set<String> // Multiple Phoenix Presence References (Connection IDs)

    static func guest(number: Int) -> Participant {
        Participant(
            id: UUID().uuidString.lowercased(),
            name: "Guest \(number)",
            isHost: false,
            isReady: false,
            joinedAt: Date(),
            phxRefs: []
        )
    }

    static func host() -> Participant {
        Participant(
            id: UUID().uuidString.lowercased(),
            name: "Host",
            isHost: true,
            isReady: true, // Host is always ready
            joinedAt: Date(),
            phxRefs: []
        )
    }
}


// MARK: - Realtime Connection Status

enum RealtimeConnectionStatus: String, CaseIterable {
    case disconnected = "Disconnected"
    case connecting = "Connecting..."
    case connected = "Connected"
    case failed = "Connection failed"

    var displayText: String {
        switch self {
        case .disconnected:
            return "Not connected"
        case .connecting:
            return "Connecting to channel..."
        case .connected:
            return "Connected"
        case .failed:
            return "Connection failed - using database"
        }
    }

    var isActive: Bool {
        switch self {
        case .connecting:
            return true
        default:
            return false
        }
    }
}

// MARK: - Lobby Messages

enum LobbyMessageType: String {
    case userJoined
    case userLeft
    case userReady
    case userNotReady
    case userVoted
    case userUnvoted
    case hostStarting
    case movieChanged
    case userKicked
    case systemInfo
    case systemError
}

struct LobbyMessage: Identifiable {
    let id: String
    let type: LobbyMessageType
    let userId: String
    let userName: String
    let timestamp: Date
    let data: [String: String]? // Additional data (e.g., new movie title)

    var displayText: String {
        switch type {
        case .userJoined:
            return "\(userName) joined the party 🎉"
        case .userLeft:
            return "\(userName) left the party 👋"
        case .userReady:
            return "\(userName) is ready ✓"
        case .userNotReady:
            return "\(userName) is not ready"
        case .userVoted:
            if let title = data?["title"] {
                return "\(userName) voted for \(title) ❤️"
            }
            return "\(userName) voted for a video ❤️"
        case .userUnvoted:
            if let title = data?["title"] {
                return "\(userName) removed vote for \(title)"
            }
            return "\(userName) removed their vote"
        case .hostStarting:
            return "🎬 Host is starting the movie..."
        case .movieChanged:
            if let newTitle = data?["title"] {
                return "🎬 Host changed movie to: \(newTitle)"
            }
            return "🎬 Host changed the movie"
        case .userKicked:
            return "\(userName) was removed from the party"
        case .systemInfo:
            if let message = data?["message"] {
                return "ℹ️ \(message)"
            }
            return "ℹ️ System information"
        case .systemError:
            if let message = data?["message"] {
                return "⚠️ \(message)"
            }
            return "⚠️ System error occurred"
        }
    }
}

// MARK: - Sync Message Types

/// Message types for watch party synchronization
enum SyncMessageType: String, Codable {
    case ping
    case pong
    case playbackState
    case seek
    case pause
    case play
    case chat  // Chat messages
    case streamSelected  // Host selected a stream
    case requestStream  // Guest requests current stream
    case preload        // Host instructs guests to load stream but stay paused
    case ready          // Guest reports they are buffered and ready to play
    case returnToLobby  // Host returning everyone to lobby
    case roomClosed     // Host has left and closed the room
    case reaction       // Floating emoji reaction
    case hostAnnouncement // Floating host announcement
}

/// Sync message for watch party coordination
struct SyncMessage: Codable {
    let type: SyncMessageType
    let timestamp: TimeInterval
    let position: TimeInterval  // Current playback position
    let isPlaying: Bool?
    let senderId: String?
    let chatText: String?  // For chat messages
    let chatUsername: String?  // For chat messages

    // MARK: - Stream Synchronization
    let infoHash: String?  // Selected stream infoHash
    let fileIdx: Int?  // Selected stream file index
    let quality: String?  // Selected stream quality
    let unlockedURL: String?  // Unlocked stream URL
    let isPremium: Bool? // Premium User Status (Crown)


    init(
        type: SyncMessageType,
        timestamp: TimeInterval = Date().timeIntervalSince1970,
        position: TimeInterval = 0,
        isPlaying: Bool? = nil,
        senderId: String? = nil,
        chatText: String? = nil,
        chatUsername: String? = nil,
        infoHash: String? = nil,
        fileIdx: Int? = nil,
        quality: String? = nil,
        unlockedURL: String? = nil,
        isPremium: Bool? = nil
    ) {
        self.type = type
        self.timestamp = timestamp
        self.position = position
        self.isPlaying = isPlaying
        self.senderId = senderId
        self.chatText = chatText
        self.chatUsername = chatUsername
        self.infoHash = infoHash
        self.fileIdx = fileIdx
        self.quality = quality
        self.unlockedURL = unlockedURL
        self.isPremium = isPremium

    }
}

// MARK: - Sync Action (Syncplay + WatchParty inspired)

enum SyncAction {
    case none  // Within threshold, no action needed
    case speedAdjust(rate: Double)  // Adjust playback rate to catch up
    case hardSeek(to: TimeInterval)  // Jump to position (for large drift)
}

// MARK: - Stream Information

struct StreamInfo {
    let infoHash: String
    let fileIdx: Int?
    let quality: String
    let unlockedURL: String?
}

// MARK: - Presence Actions

enum PresenceAction {
    case join
    case leave
}

