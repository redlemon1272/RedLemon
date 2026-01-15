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

    // Schedule Update State
    @Published var showScheduleUpdatePrompt: Bool = false
    @Published var hasPendingScheduleUpdate: Bool = false  // Deferred notification for users in playback

    // Sub-ViewModels
    let player: PlayerViewModel
    private var cancellables = Set<AnyCancellable>()

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

        // Start listening for schedule updates
        EventsConfigService.shared.startRealtimeSubscription()

        // Subscribe to schedule update notifications (Context-Aware)
        NotificationCenter.default.publisher(for: Notification.Name("ScheduleDidUpdate"))
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.handleScheduleUpdate()
            }
            .store(in: &cancellables)

        // Forward PlayerViewModel changes to AppState
        self.player.objectWillChange
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }

    func restartApplication() {
        NSLog("%@", "🔄 [AppState] User requested restart due to schedule update")
        // Relaunching is complex, but standardized behavior for "Restart to apply updates" on macOS
        // often involves just terminating, or using a helper.
        // For simplicity and safety, we will just terminate, and the user can re-open.
        // We could also try to relaunch via Process, but sandbox might block it.
        NSApplication.shared.terminate(nil)
    }

    // MARK: - Context-Aware Schedule Notifications

    /// Handle schedule update notification based on user's current context
    /// - Users in playback: defer notification until they exit
    /// - All other users: show immediately
    private func handleScheduleUpdate() {
        if isUserInPlayback() {
            // Defer notification - will be shown when playback ends
            hasPendingScheduleUpdate = true
            NSLog("%@", "🔔 [AppState] Schedule update received but user is in playback. Deferring notification.")
        } else {
            // Show immediately
            showScheduleUpdatePrompt = true
            NSLog("%@", "🔔 [AppState] Schedule update received. Showing notification immediately.")
        }
    }

    /// Check if user is currently watching video (player view)
    private func isUserInPlayback() -> Bool {
        return currentView == .player
    }

    /// Called when user exits playback - check for pending updates
    func checkPendingScheduleUpdate() {
        if hasPendingScheduleUpdate {
            hasPendingScheduleUpdate = false
            showScheduleUpdatePrompt = true
            NSLog("%@", "🔔 [AppState] Playback ended. Showing deferred schedule update notification.")
        }
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
    @Published var previousView: AppView? = nil  // Track where user came from for back navigation

    /// Navigate to a view while preserving navigation history
    /// Use this instead of directly setting currentView when you want back navigation to work
    func navigateTo(_ view: AppView) {
        // Only track history for views that support "back" navigation
        // Don't overwrite previousView when navigating to player/lobby (they have their own exit logic)
        let trackableViews: Set<AppView> = [.browse, .discover, .events, .search, .friends, .rooms, .settings]

        if trackableViews.contains(currentView) {
            previousView = currentView
        }
        currentView = view
    }

    /// Go back to the previous view, or fallback to browse
    func goBack() {
        currentView = previousView ?? .browse
        previousView = nil
    }

    // MOVED TO PlayerViewModel:
    // selectedStream, selectedMediaItem, selectedMetadata, showPlayer
    // showQualitySelection, showMediaDetail, selectedQuality,
    // isResolvingStream, streamError, currentWatchMode, currentRoomId
    // isWatchPartyHost, currentWatchPartyRoom, isPreloading
    // Event specific state
    @Published var eventsSchedule: [EventItem] = []

    // Persistent Lobby Session
    // Keeps the LobbyViewModel alive during playback to prevent "Leave/Delete" logic
    @Published var activeLobbyViewModel: LobbyViewModel?

    // Dynamic Schedule
    @Published var scheduleEpoch: Date = ScheduleConstants.Epoch

    // Config Management
    @Published var eventsConfigVersion: Int = 0
    @Published var isEventPlayback: Bool = false // Track if this is a public event playback
    @Published var currentEventId: String? = nil // Track ID of current event

    @Published var browseScrollPosition: String? = nil  // Track scroll position in browse view
    @Published var discoverScrollPosition: String? = nil  // Track scroll position in discover view
    @Published var browseSelectedTab: Int = 0  // 0 = Movies, 1 = TV Shows - persisted across navigation
    @Published var discoverSelectedTab: Int = 0  // 0 = Movies, 1 = TV Shows - persisted across navigation
    @Published var discoverSelectedCatalog: String = "Netflix" // Persist selected provider
    @Published var discoverSelectedGenre: String = "All" // Persist selected genre
    @Published var browseRowScrollPositions: [String: CGFloat] = [:] // Persist horizontal scroll positions for Browse rows
    
    // Browse Page Persistence (Session-scoped)
    @Published var popularMovies: [MediaItem] = []
    @Published var popularShows: [MediaItem] = []
    @Published var browseCatalogs: [String: [MediaItem]] = [:] 
    @Published var browseIsLoadingCatalogs: Set<String> = []
    
    @Published var activeRooms: [WatchPartyRoom] = []  // Track all active rooms locally
    @Published var isLoadingRoom: Bool = false  // Track room loading state
    @Published var shouldAutoJoinLobby: Bool = false  // Flag to auto-join lobby for live events
    @Published var searchResults: [MediaItem] = []  // Persist search results across navigation
    @Published var lastSearchQuery: String = ""  // Remember last search query
    @Published var isServerReady: Bool = false  // Track if HTTP server is ready to accept requests
    @Published var showOnboarding: Bool = false     // Show welcome onboarding tour

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

    // Provider Health Status
    @Published var providerHealth: [String: String] = [:]
    @Published var isCheckingProviders: Bool = false

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

    /// Refresh the events list to filter out past events
    /// Called when an event ends or when transitioning to a new event
    func refreshEvents() {
        // Now delegates to the deterministic calculator for full refresh
        calculateDeterministicSchedule()
    }

    // Source of truth for all available event movies (shuffled daily order)
    @Published var allMovies: [MediaItem] = []
    private var scheduleTimer: Timer?
    private var participantCountTimer: Timer? // Dedicated timer for participant count polling
    private var participantCounts: [String: Int] = [:] // Local cache of counts
    private var lastCountFetch: Date = .distantPast

    /// Update the source list of movies and start scheduling
    func updateEventMovies(_ movies: [MediaItem]) {
        guard !movies.isEmpty else { return }
        self.allMovies = movies
        print("🎬 AppState: Updated event movie list (\(movies.count) items)")

        // Initial calculation
        calculateDeterministicSchedule()

        // Start recurring updates if not already running
        startScheduleTimer()

        // Initial fetch of participant counts
        Task {
            await fetchParticipantCounts()
        }

        // Start dedicated participant count polling (every 10 seconds)
        startParticipantCountPolling()
    }

    /// Start a timer that polls participant counts every 10 seconds
    private func startParticipantCountPolling() {
        participantCountTimer?.invalidate()
        participantCountTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { [weak self] _ in
            Task { @MainActor [weak self] in
                await self?.fetchParticipantCounts()
            }
        }
    }

    /// Update a single movie in the source list (e.g. lazy hydration)
    func updateEventConfig(_ config: EventsConfig) {
        self.allMovies = config.movies
        self.eventsConfigVersion = config.version

        // Update epoch if present (backward compatibility)
        if config.epochTimestamp > 0 {
             self.scheduleEpoch = Date(timeIntervalSince1970: TimeInterval(config.epochTimestamp))
             print("🗓 AppState: Updated schedule epoch to \(self.scheduleEpoch)")
        }

        // Recalculate immediately with new data
        calculateDeterministicSchedule()

        // Start participant count polling (every 10 seconds)
        startParticipantCountPolling()

        // Initial fetch
        Task {
            await fetchParticipantCounts()
        }
    }

    func updateSingleMovie(_ enrichedMovie: MediaItem) {
        guard let index = allMovies.firstIndex(where: { $0.id == enrichedMovie.id }) else { return }

        print("💧 AppState: Hydrating metadata for: \(enrichedMovie.name)")
        allMovies[index] = enrichedMovie

        // Recalculate schedule to reflect changes (e.g. runtime might have changed, though unlikely)
        // This ensures the EventItem in the schedule gets the new metadata (images, etc.)
        calculateDeterministicSchedule()
    }

    private func startScheduleTimer() {
        stopScheduleTimer()

        // Calculate when the NEXT schedule change will happen
        // This is usually when the live event finishes, or when the next upcoming event starts
        guard let liveEvent = eventsSchedule.first else {
            // Fallback if no events: check in 60s
             print("⏰ AppState: No events found, scheduling check in 60s")
            scheduleTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: false) { [weak self] _ in
                Task { @MainActor [weak self] in self?.calculateDeterministicSchedule() }
            }
            return
        }

        let now = TimeService.shared.now

        // Determine the next critical moment
        let nextUpdateDate: Date

        if liveEvent.isLive && !liveEvent.isFinished {
            // Case 1: Live event is playing. Next update is when it finishes.
            nextUpdateDate = liveEvent.endTime
             print("⏰ AppState: Next schedule update set for Event End: \(nextUpdateDate)")
        } else {
            // Case 2: In Lobby (or between events). Next update is when the NEXT event starts.
            // (Or if current is finished, we want to update immediately, effectively handled by 0 delay)
             if let nextEvent = eventsSchedule.dropFirst().first {
                 nextUpdateDate = nextEvent.startTime
                 print("⏰ AppState: Next schedule update set for Next Event Start: \(nextUpdateDate)")
             } else {
                 // Fallback: 60s
                 nextUpdateDate = now.addingTimeInterval(60)
             }
        }

        let interval = nextUpdateDate.timeIntervalSince(now)
        // Ensure we don't schedule negative or zero intervals (which cause loops)
        // Add 1.0s buffer to ensure we land safely *after* the change
        let delay = max(1.0, interval + 1.0)

        print("⏰ AppState: Scheduling update in \(Int(delay)) seconds")

        scheduleTimer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { [weak self] _ in
            Task { @MainActor [weak self] in
                self?.calculateDeterministicSchedule()
            }
        }
    }

    private func stopScheduleTimer() {
        scheduleTimer?.invalidate()
        scheduleTimer = nil
    }

    /// Deterministically calculates the current and upcoming events based on the epoch
    /// This ensures all clients see the same schedule at the same time.
    func calculateDeterministicSchedule() {
        guard !allMovies.isEmpty else { return }

        let now = TimeService.shared.now
        let bufferBetweenMovies = ScheduleConstants.DefaultBuffer

        // 1. Calculate total duration of the entire playlist cycle
        var totalCycleDuration: TimeInterval = 0
        var movieDurations: [TimeInterval] = []

        for movie in allMovies {
            let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
            let duration = TimeInterval(runtimeMinutes * 60) + bufferBetweenMovies
            movieDurations.append(duration)
            totalCycleDuration += duration
        }

        // 2. Determine where we are in the cycle relative to fixed epoch
        // CRITICAL: Use the stored dynamic epoch (which defaults to the constant if not updated)
        let epoch = self.scheduleEpoch

        let timeSinceEpoch = now.timeIntervalSince(epoch)
        let currentCycleTime = timeSinceEpoch.truncatingRemainder(dividingBy: totalCycleDuration)

        // 3. Find the currently playing movie
        var accumulatedTime: TimeInterval = 0
        var currentMovieIndex = 0
        var timeIntoCurrentMovie: TimeInterval = 0

        for (index, duration) in movieDurations.enumerated() {
            if accumulatedTime + duration > currentCycleTime {
                currentMovieIndex = index
                timeIntoCurrentMovie = currentCycleTime - accumulatedTime
                break
            }
            accumulatedTime += duration
        }

        // 4. Build the schedule starting from the current movie
        var scheduledEvents: [EventItem] = []
        let count = min(5, allMovies.count)

        for i in 0..<count {
            let index = (currentMovieIndex + i) % allMovies.count
            let movie = allMovies[index]

            let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
            let duration = TimeInterval(runtimeMinutes * 60) + bufferBetweenMovies

            let startTime: Date
            if i == 0 {
                // Live movie: Start time is in the past
                startTime = now.addingTimeInterval(-timeIntoCurrentMovie)
            } else {
                // Upcoming movies: Start time is based on previous movie's end of slot
                let prevEvent = scheduledEvents.last!
                startTime = prevEvent.startTime.addingTimeInterval(prevEvent.duration)
            }

            var event = EventItem(
                id: movie.id,
                mediaItem: movie,
                startTime: startTime,
                duration: duration,
                actualMovieDuration: TimeInterval(runtimeMinutes * 60),
                index: i
            )
            // Inject cached participant count
            event.participantCount = self.participantCounts[movie.id] ?? 0

            scheduledEvents.append(event)
        }

        // Update published state
        if self.eventsSchedule != scheduledEvents {
            self.eventsSchedule = scheduledEvents
            // print("🔄 AppState: Schedule updated. Live: \(scheduledEvents.first?.mediaItem.name ?? "None")")
        }

        // Check if we need to refresh participant counts (every 10 seconds for responsiveness)
        if Date().timeIntervalSince(lastCountFetch) > 10 {
            Task { await fetchParticipantCounts() }
        }

        // Check for finished live event to trigger player/lobby logic if needed
        // (Logic delegated to views/viewmodels based on specific needs)

        // RECURSION: Schedule the next update based on the new state
        startScheduleTimer()
    }

    @MainActor
    private func fetchParticipantCounts() async {
        guard !eventsSchedule.isEmpty else { return }
        lastCountFetch = Date()

        let currentIds = eventsSchedule.map { $0.id }

        let newCounts = await Task.detached {
            var counts: [String: Int] = [:]
            for id in currentIds {
                let roomId = "event_\(id)"
                if let roomState = try? await SupabaseClient.shared.getRoomState(roomId: roomId) {
                    counts[id] = roomState.participantsCount
                }
            }
            return counts
        }.value

        // Only log if there are non-zero counts (avoid spam)
        let activeRooms = newCounts.filter { $0.value > 0 }
        if !activeRooms.isEmpty {
            print("📊 AppState: Polled participant counts - Active: \(activeRooms)")
        }

        self.participantCounts = newCounts

        // CRITICAL: Immediately recalculate schedule to inject new counts into eventsSchedule
        // Without this, the UI won't update until the next timer tick
        calculateDeterministicSchedule()
    }

    /// Check health of all registered providers and update global state
    func checkProviderHealth() {
        guard !isCheckingProviders else { return }

        NSLog("%@", "🏥 [AppState] Starting global provider health check...")
        isCheckingProviders = true

        Task {
            // Give system time to settle if called on startup
            try? await Task.sleep(nanoseconds: 500_000_000)

            // Get provider health
            var health = await ProviderManager.shared.checkAllHealth()

            // Also check RealDebrid and subdl (external services)
            let rdToken = await KeychainManager.shared.get(service: "realdebrid")
            let subdlKey = await KeychainManager.shared.get(service: "subdl")

            // Run checks in parallel
            async let rdHealthTask: Bool = {
                if let token = rdToken, !token.isEmpty {
                    return await RealDebridClient.shared.checkHealth(token: token)
                }
                return false
            }()

            async let subdlHealthTask: Bool = {
                if let key = subdlKey, !key.isEmpty {
                    return await SubDLClient.shared.checkHealth(apiKey: key)
                }
                return false
            }()

            let rdHealthy = await rdHealthTask
            let subdlHealthy = await subdlHealthTask

            // Add to health dictionary
            health["realdebrid"] = rdHealthy ? "Online" : "Offline"
            health["subdl"] = subdlHealthy ? "Online" : "Offline"

            await MainActor.run {
                self.providerHealth = health
                self.isCheckingProviders = false
                NSLog("%@", "✅ [AppState] Provider health check complete (found \(health.count) services)")
            }
        }
    }


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
