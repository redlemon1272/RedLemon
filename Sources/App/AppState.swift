import SwiftUI
import Combine
import AppKit

@MainActor
class AppState: ObservableObject {
    
    // Dependencies
    private let metadataProvider: MetadataProvider
    private let streamResolver: StreamResolving
    private let roomManager: RoomManager
    private let userManager: UserManager
    
    // Global Alert State
    struct AppAlert: Identifiable {
        let id = UUID()
        let title: String
        let message: String
    }
    @Published var activeAlert: AppAlert?

    // Sub-ViewModels
    let player: PlayerViewModel
    
    init(
        metadataProvider: MetadataProvider = LocalAPIClient.shared,
        streamResolver: StreamResolving = StreamService.shared,
        roomManager: RoomManager = SupabaseClient.shared,
        userManager: UserManager = SupabaseClient.shared
    ) {
        self.metadataProvider = metadataProvider
        self.streamResolver = streamResolver
        self.roomManager = roomManager
        self.userManager = userManager

        // Initialize PlayerViewModel with same dependencies
        self.player = PlayerViewModel(
            metadataProvider: metadataProvider,
            streamResolver: streamResolver,
            roomManager: roomManager
        )
    }

    // Wiring up PlayerViewModel callbacks
    func setupPlayerBindings() {
        self.player.appState = self
    }

    // MARK: - Performance Settings
    /// Fixed performance profile (no hardware detection)
    nonisolated static var effectivePerformanceProfile: PerformanceProfile {
        return .medium // Use conservative medium profile for all devices
    }

    /// Fixed catalog size for all devices
    nonisolated static var adaptiveCatalogSize: Int {
        return 15 // Conservative limit for all devices
    }

    /// Fixed image cache limit for all devices
    nonisolated static var adaptiveImageCacheLimit: Int {
        return 50 // Conservative cache limit for all devices
    }

    enum PerformanceProfile: String {
        case low = "Low"      // < 8GB RAM or < 4 cores
        case medium = "Medium" // 8-16GB RAM and 4-8 cores
        case high = "High"    // > 16GB RAM and > 8 cores
    }

    @Published var currentView: AppView = .events
    
    // MOVED TO PlayerViewModel:
    // selectedStream, selectedMediaItem, selectedMetadata, showPlayer
    // showQualitySelection, showMediaDetail, selectedQuality,
    // isResolvingStream, streamError, currentWatchMode, currentRoomId
    // isWatchPartyHost, currentWatchPartyRoom, isPreloading
    // isEventPlayback, currentEventId, finishedEventIds
    // resumeFromTimestamp, eventStartTime

    @Published var browseScrollPosition: String? = nil  // Track scroll position in browse view
    @Published var activeRooms: [WatchPartyRoom] = []  // Track all active rooms locally
    @Published var isLoadingRoom: Bool = false  // Track room loading state
    @Published var shouldAutoJoinLobby: Bool = false  // Flag to auto-join lobby for live events
    @Published var searchResults: [MediaItem] = []  // Persist search results across navigation
    @Published var lastSearchQuery: String = ""  // Remember last search query
    @Published var isServerReady: Bool = false  // Track if HTTP server is ready to accept requests
    @Published var showUsernameSetup: Bool = false  // Show username setup dialog

    // User authentication (simple username)
    @Published var currentUsername: String = ""
    @Published var currentUserId: UUID?
    
    // Message passing (Player -> Lobby)
    @Published var pendingLobbyMessage: String? = nil

    // TV Show support (kept here for selection UI)
    @Published var selectedSeason: Int? {
        didSet { player.selectedSeason = selectedSeason }
    }
    @Published var selectedEpisode: Int? {
        didSet { player.selectedEpisode = selectedEpisode }
    }
    
    // Window management
    private var wasFullscreen = false

    enum AppView {
        case browse
        case events
        case discover
        case search
        case friends
        case rooms
        case settings
        case mediaDetail
        case seasonEpisodeSelector
        case qualitySelection
        case watchPartyLobby // New: Lobby view
        case player
    }

    // MARK: - Window Management (Delegated to WindowManager)
    // Public method for views to restore window size (kept for compatibility if needed)
    func restoreWindowFromLobby() {
        // Window stays at expanded size, no need to do anything
        NSLog("🪟 restoreWindowFromLobby() called - no action needed (window stays expanded)")
    }

    // MARK: - Helper Functions


}

enum WatchMode {
    case solo
    case watchParty
}

enum RoomVisibility {
    case `private`           // Hidden - no one can see
    case friendsCanSee       // Visible to friends, but can't join
    case friendsCanJoin      // Friends can see AND join
    case publicOpen          // Public - anyone can discover and join
}
