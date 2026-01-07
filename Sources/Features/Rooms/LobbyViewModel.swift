import Foundation
import SwiftUI
import Combine

@MainActor
class LobbyViewModel: ObservableObject {
    @Published var participants: [Participant]

    // Phase 1: Chat properties delegated to ChatManager
    // We keep them as published properties linked to the manager for minimal view breakage
    // View should eventually bind to chatManager paths directly, but this is a transitional step.
    var messages: [LobbyMessage] { chatManager.messages }
    var chatMessages: [ChatMessage] { chatManager.chatMessages }
    var unifiedMessages: [UnifiedLobbyMessage] { chatManager.unifiedMessages }
    var chatInput: String {
        get { chatManager.chatInput }
        set { chatManager.chatInput = newValue }
    }

    @Published var isReady: Bool = false
    @Published var isStarting: Bool = false
    @Published var forceSoloStart: Bool = false // Toggle for host to skip waiting for guests
    @Published var countdown: Int = 3
    @Published var didCopyRoomID: Bool = false
    @Published var posterURL: String?
    @Published var backdropURL: String?
    @Published var logoURL: String?
    @Published var timeUntilStart: TimeInterval = 0 // Time until event officially starts
    @Published var showRoomClosedAlert: Bool = false
    @Published var roomClosedMessage: String = "The host has left the room."
    @Published var lobbyState: LobbyState = .initializing

    // NEW: Playlist Support
    @Published var playlist: [PlaylistItem] = []
    @Published var currentPlaylistIndex: Int = 0
    @Published var isPlaylistMode: Bool = false
    @Published var mutedUserIds: Set<String> = []

    // Track unique realtime connection IDs to show "Joined" notifications correctly
    // even if user is already known from DB polling
    var connectedUserIds: Set<String> = []

    // Realtime connection status for UI feedback

    // Realtime connection status for UI feedback
    @Published var realtimeConnectionStatus: RealtimeConnectionStatus = .disconnected
    @Published var isResolvingStream: Bool = false // UI indicator for stream resolution

    @Published var room: WatchPartyRoom
    var isHost: Bool
    private var realtimeClient: SupabaseRealtimeClient?
    // private var countdownTimer: Timer? // Removed for concurrency
    // countdownTask already declared on line 38, ensuring we use that instead.
    private var countdownTask: Task<Void, Never>?
    // NOTE: participantsPollingTask moved to LobbyPresenceManager
    // NOTE: roomStatePollingTask moved to LobbyDatabaseManager
    var lastRoomPlayingState: Bool = false // Made var for LobbyDatabaseManager access
    var participantId: String
    private var isDisconnecting: Bool = false
    var realtimeManager: (any RealtimeService)?
    var playbackEndedTimestamp: Date? // Made var for LobbyDatabaseManager access (Track when playback ended)
    var isLeavingExplicitly: Bool = false // Flag to track if host is explicitly leaving (vs deinit/background)
    var canAutoJoin: Bool = false // Safety flag: Made var for LobbyDatabaseManager access


    // Combine storage for Refactor Phase 1
    private var cancellables = Set<AnyCancellable>()

    // Helper to track state safely across actor boundaries (specifically for deinit)
    var transitionState = TransitionState() // made var internal
    class TransitionState { // made class internal
        var isStarting: Bool = false
    }

    weak var appState: AppState?  // Weak reference to avoid retain cycle

    // MARK: - Composition / Managers
    // Phase 1: Chat Logic
    lazy var chatManager: LobbyChatManager = {
        LobbyChatManager(sendMessageHandler: { [weak self] syncMessage in
             guard let self = self,
                   let manager = self.realtimeManager,
                   await manager.isRealtimeConnected() else {
                 throw NSError(domain: "LobbyViewModel", code: 1, userInfo: [NSLocalizedDescriptionKey: "Realtime not connected"])
             }
             try await manager.sendSyncMessage(syncMessage)
        })
    }()

    // Phase 2: Event Logic
    lazy var eventRouter: LobbyEventRouter = {
        LobbyEventRouter(viewModel: self)
    }()

    // Phase 3: Presence Logic
    lazy var presenceManager: LobbyPresenceManager = {
        LobbyPresenceManager(viewModel: self)
    }()

    // Phase 4: Database Logic
    lazy var databaseManager: LobbyDatabaseManager = {
        LobbyDatabaseManager(viewModel: self)
    }()

    // Phase 5: State Machine
    lazy var stateMachine: LobbyStateMachine = {
        LobbyStateMachine()
    }()

    // MARK: - Initialization

    // Data Service for Testing
    var dataService: LobbyDataService

    // MARK: - Initialization

    init(room: WatchPartyRoom, isHost: Bool, realtimeManager: (any RealtimeService)? = nil, dataService: LobbyDataService = SupabaseClient.shared) {
        self.room = room
        self.isHost = isHost
        self.realtimeManager = realtimeManager
        self.dataService = dataService
        // NORMALIZE: Ensure all initial participants have lowercase IDs for consistency
        self.participants = room.participants.map { p in
            return Participant(
                id: p.id.lowercased(),
                name: p.name,
                isHost: p.isHost,
                isReady: p.isReady,
                joinedAt: p.joinedAt,
                phxRef: nil
            )
        }

        // For hosts, use room host ID. For guests, we'll set to participantId after getting user ID
        if isHost {
            self.participantId = room.hostId.lowercased()
        } else {
            // Temporary - will be updated when we get actual user ID
            // NORMALIZE TO LOWERCASE to match Postgres conventions and avoid Realtime/DB mismatches
            self.participantId = UUID().uuidString.lowercased()
        }

        // Load metadata for poster/backdrop
        loadMetadata()

        // Setup Realtime subscription for room updates
        Task {
            await setupRealtimeSubscription()
        }

        // Add initial join message
        // Add initial join message and track connection
        if isHost {
            self.connectedUserIds.insert(self.participantId)
            addMessage(.userJoined, userName: room.hostName ?? "Host")
        }

        // NEW: Initialize playlist state
        if let roomPlaylist = room.playlist {
            self.playlist = roomPlaylist
            self.currentPlaylistIndex = room.currentPlaylistIndex
            self.isPlaylistMode = !roomPlaylist.isEmpty
        }

        // Initialize playbackEndedTimestamp to enable the grace period check in pollRoomState
        self.playbackEndedTimestamp = Date()

        // Phase 1: Wire up ChatManager changes to View Model changes
        self.chatManager.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)

        // Phase 5: Subscribe to State Machine updates
        stateMachine.$currentState
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.lobbyState = state
            }
            .store(in: &cancellables)

        // Fetch fresh room state from Supabase to ensure playlist is synced
        // This fixes the issue where Host sees "Playlist 0" because AppState had stale data
        Task {
            await self.fetchFreshRoomState()
        }

        // CRITICAL FIX: Prevent "Autoplay Death Loop"
        // When host returns to lobby after movie finishes, DB still says is_playing=true
        // This causes the "Database Fallback" in init/join to immediately restart playback
        // We must strictly reset this for USER hosted rooms, but preserve it for EVENTS (which do autoplay)
        if isHost && room.type == .userRoom {
             Task {
                 print("🛑 Lobby: Host explicitly clearing playback state in DB to prevent autoplay loop")
                 try? await self.dataService.updateRoomPlayback(roomId: room.id, position: 0, isPlaying: false)
             }
        }


        // Safety Delay for Auto-Join (User Rooms)
        // If we join and DB says "Playing", it might be STALE (Host in Lobby).
        // Wait 8 seconds. If it's STILL playing, then it's real.
        Task { [weak self] in
            try? await Task.sleep(nanoseconds: 8 * 1_000_000_000)
            await MainActor.run {
                self?.canAutoJoin = true
                print("🛡️ Lobby: Auto-Join safety delay passed (8s). Enabled for late joiners.")
            }
        }
    }

    // Called by View when "Auto Join" intent is detected (e.g. User clicked "Join" on a playing room)
    // This bypasses the safety delay because the user explicitly asked to join NOW.
    func enableInstantJoin() {
        print("🚀 Lobby: Enabling INSTANT JOIN (Late Joiner detected)")
        self.canAutoJoin = true
    }

    deinit {
        print("☠️ LobbyViewModel deinit")
        countdownTask?.cancel()

        // Capture client for async cleanup
        if let client = realtimeClient {
            Task {
                await client.disconnect()
            }
        }
    }

    private func setupRealtimeSubscription() async {
        // Initialize Realtime manager if not already injected (for testing)
        if self.realtimeManager == nil {
            self.realtimeManager = RealtimeChannelManager(realtimeClient: self.dataService.realtimeClient)
        }

        // Set up presence callback (Delegated to Manager)
        if let manager = realtimeManager {
            await presenceManager.setupPresence(realtimeManager: manager)
        }

        // Set up connection state callback
        await realtimeManager?.setConnectionStateCallback { [weak self] state in
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                // Convert RealtimeConnectionState to RealtimeConnectionStatus
                switch state {
                case .connected:
                    self.realtimeConnectionStatus = .connected
                case .connecting:
                    self.realtimeConnectionStatus = .connecting
                case .disconnected:
                    self.realtimeConnectionStatus = .disconnected
                case .failed:
                    self.realtimeConnectionStatus = .failed
                }
            }
        }

        // Connect - the onSync callback will handle all sync messages including chat
        do {
            // Configure Realtime to listen for Room updates (Playlist changes)
            let roomUpdatesConfig: [[String: Any]] = [
                [
                    "event": "*",
                    "schema": "public",
                    "table": "rooms",
                    "filter": "id=eq.\(room.id)"
                ]
            ]

            // Note: We register the handler globally on the client since RealtimeChannelManager handles the channel join
            // This works because SupabaseRealtimeClient's postgres handlers are global for the connection
            // Delegate Postgres changes handling to LobbyPresenceManager via RealtimeChannelManager
            // This prevents split-brain logic and ensures we handle DELETE events correctly.


            try await realtimeManager?.setup(
                roomId: room.id,
                isHost: isHost,
                userId: participantId,
                username: appState?.currentUsername ?? "User",
                postgresChanges: roomUpdatesConfig,
                onSync: { [weak self] message in
                    Task { @MainActor [weak self] in
                        guard let self = self else { return }
                        await self.handleLobbyMessage(message)
                    }
                }
            )
            print("✅ Lobby: Connected to Realtime")
        } catch {
            print("❌ Lobby: Failed to connect to Realtime: \(error)")
        }
    }

    func startCountdown() {
        guard !isStarting else { return }

        // Transition state machine
        stateMachine.transition(to: .startingCountdown(secondsRemaining: 3))

        isStarting = true
        transitionState.isStarting = true
        countdown = 3

        countdownTask?.cancel()
        countdownTask = nil

        countdownTask = Task { @MainActor [weak self] in
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                guard let self = self, !Task.isCancelled else { return }

                if self.countdown > 0 {
                    self.countdown -= 1
                } else {
                    return // Loop finished
                }
            }
        }
    }

    func connect() {
        // Check for pending messages from Player (e.g. "Host returned to lobby")
        if let msg = appState?.pendingLobbyMessage {
            print("🔔 Lobby: Displaying pending message: \(msg)")
            addMessage(.systemInfo, userName: "System", data: ["message": msg])
            appState?.pendingLobbyMessage = nil
        }

        // Prevent multiple connection attempts
        if realtimeConnectionStatus == .connected || realtimeConnectionStatus == .connecting {
            print("⚠️ Lobby: Already connected or connecting - skipping duplicate connect call")
            return
        }

        print("🎭 Lobby: Connecting to room \(room.id)...")
        stateMachine.transition(to: .connecting)

        Task { [weak self] in
            guard let self = self else { return }
            do {
                // Force Host re-join to ensure presence in DB (idempotent)
                // This fixes the "zombie host" issue where host times out during playback
                // and returns to lobby without being in the room_participants table.
                if isHost {
                     if let userId = UUID(uuidString: participantId) {
                         // We use try? because we don't want to block connection if this fails (e.g. network blip)
                         // The heartbeat loop will also try to keep us alive, but this is the "instant" fix.
                         try? await self.dataService.joinRoom(roomId: room.id, userId: userId, isHost: true)
                         NSLog("✅ Host re-joined room \(room.id) in database (refreshing presence)")
                     }
                }

                // Guest needs to join room in database first
                if !isHost {
                    guard let userId = self.appState?.currentUserId else {
                        print("❌ Lobby: Cannot join room - no user ID")
                        return
                    }

                    // Update participantId to match actual user ID (Normalized to lowercase)
                    self.participantId = userId.uuidString.lowercased()

                    do {
                        try await self.dataService.joinRoom(roomId: room.id, userId: userId, isHost: false)
                        NSLog("✅ Guest joined room \(room.id) in database")
                    } catch {
                        // If join failed, check if it's because we're already in the room
                        let errorStr = String(describing: error)
                        if errorStr.contains("409") || errorStr.contains("23505") || errorStr.contains("duplicate key") {
                             NSLog("ℹ️ Lobby: Join failed with conflict (409/Duplicate) - assuming user already joined. Proceeding...")
                             // Proceed as success
                        } else if room.type == .event {
                            // Event Fallback Logic (Keep existing logic for events)
                            // Check if room exists
                            let roomExists = (try? await self.dataService.getRoomState(roomId: self.room.id)) != nil

                            if roomExists {
                                NSLog("ℹ️ Lobby: Join failed but room exists - assuming user already joined")
                                // Proceed as success
                            } else {
                                NSLog("⚠️ Lobby: System room missing, attempting to create: \(room.id)")
                                do {
                                    // Create the room using current user as host (technical requirement)
                                    // but keeping system name/metadata
                                    let _ = try await self.dataService.createRoom(
                                        id: room.id,
                                        name: room.description ?? "Live Event",
                                        hostUserId: userId,
                                        hostUsername: "RedLemon System",
                                        streamHash: room.selectedStreamHash,
                                        imdbId: room.mediaItem?.id,
                                        posterUrl: room.posterURL,
                                        backdropUrl: room.mediaItem?.background,
                                        season: room.season,
                                        episode: room.episode,
                                        isPublic: true
                                    )

                                    // Retry join
                                    try await self.dataService.joinRoom(roomId: room.id, userId: userId, isHost: false)
                                    NSLog("✅ Guest created and joined system room \(room.id)")
                                } catch let createError {
                                    NSLog("❌ Lobby: Failed to create system room: \(createError)")
                                    // CRITICAL FIX: Don't throw here for events!
                                    // We want to proceed to autoStartSystemEvent even if DB join fails
                                    NSLog("⚠️ Proceeding with local playback despite join failure")
                                }
                            }
                        } else {
                            // Real error for non-event rooms
                            throw error
                        }
                    }

                    // Refresh room state to check for active playback
                    // This prevents stale auto-start loops when returning to lobby
                    if let freshRoom = try? await self.dataService.getRoomState(roomId: room.id) {
                        print("✅ Lobby: Refreshed room state. isPlaying: \(freshRoom.isPlaying)")

                        // CRITICAL FIX: Update local media item from fresh room state BEFORE starting playback
                        // This prevents utilizing stale 'room.mediaItem' from a previous session
                        print("🛡️ Lobby: Ensuring local media state is fresh before auto-start check...")
                        await self.updateMediaItemFromRoomState(freshRoom)

                        // Also sync season/episode explicitly just in case updateMediaItemFromRoomState didn't cover it (it does metadata mostly)
                        if let s = freshRoom.season, let e = freshRoom.episode {
                             self.room.season = s
                             self.room.episode = e
                             print("📺 Lobby: Synced season/episode: S\(s)E\(e)")
                        }

                        // Auto-start for event rooms (always) or regular rooms that are already playing
                        if room.type == .event {
                            print("🎬 Event room detected - auto-starting playback")
                            autoStartSystemEvent()
                        } else if freshRoom.isPlaying {
                            print("▶️ Room already playing - auto-starting playback")
                            autoStartSystemEvent()
                        }
                    } else {
                        // Fallback to existing state if fetch fails (rare)
                        if room.type == .event {
                            print("🎬 Event room detected - auto-starting playback")
                            autoStartSystemEvent()
                        } else if room.state == .playing {
                            print("▶️ Room already playing - auto-starting playback (cached state)")
                            autoStartSystemEvent()
                        }
                    }
                }

                // Initialize Realtime channel (reusing setup method to ensure callbacks are attached)
                await self.setupRealtimeSubscription()

                await MainActor.run {
                    self.stateMachine.transition(to: .connected)
                }

                if !isHost {
                    // Guest joining - send join message via Realtime only
                    let guestName = self.appState?.currentUsername ?? "Guest"

                    // Send join message via Realtime
                    let joinMsg = SyncMessage(
                        type: .chat,
                        timestamp: 0,
                        isPlaying: nil,
                        senderId: self.participantId,
                        chatText: "LOBBY_JOIN",
                        chatUsername: guestName
                    )
                    try? await realtimeManager?.sendSyncMessage(joinMsg)
                }

            } catch {
                NSLog("❌ Lobby: Failed to connect - \(error)")
                if !isHost {
                    NSLog("   Guest could not join room in database")
                    addMessage(.systemError, userName: "System", data: [
                        "message": "Failed to join room. Please check your connection and try again.",
                        "error": "\(error.localizedDescription)"
                    ])
                } else {
                    NSLog("   Will rely on database polling instead")
                    addMessage(.systemInfo, userName: "System", data: [
                        "message": "Connection setup failed. Using database polling for synchronization.",
                        "error": "\(error.localizedDescription)"
                    ])
                }

                realtimeConnectionStatus = .disconnected

                await MainActor.run {
                    self.stateMachine.transition(to: .error(error.localizedDescription))
                }
            }

            // Start database polling (works even if Realtime fails)
            startPolling()
        }
    }

    func disconnect() {
        // Prevent double disconnect
        guard !isDisconnecting else { return }
        isDisconnecting = true

        // Stop polling immediately
        stopPolling()

        stateMachine.transition(to: .closed)

        // Capture values locally (optional but safe)
        let roomId = self.room.id
        let isHost = self.isHost
        // let hostId = self.room.hostId // Unused
        let isLeavingExplicitly = self.isLeavingExplicitly
        let currentUserId = self.appState?.currentUserId

        // Cleanup Realtime subscription to prevent "Zombie" listeners (e.g. Persistent DELETE events)
        Task { [weak self] in
            await self?.realtimeManager?.disconnect(leaveChannel: true, disconnectClient: false)
        }

        Task {
            // Implicit strong capture of 'self' ensures ViewModel stays alive
            // until the DB leave operation completes.

            if self.isStarting {
                print("🎬 Lobby: Starting movie - skipping disconnect to preserve connection and presence")
                self.isDisconnecting = false
                return
            }

            // Leave Supabase room (use captured values)
            // CRITICAL FIX: improved logic to not delete event rooms
            if isHost && self.room.type == .userRoom {
                do {
                    // Delete Room: Explicitly delete the room from the database
                    if isLeavingExplicitly {
                        print("🙈 Host leaving explicitly: Deleting room \(roomId)")

                        // CRITICAL: Explicitly delete the room to trigger DELETE event for guests
                        try await self.dataService.deleteRoom(roomId: roomId)
                        NSLog("✅ Host DELETED room \(roomId)")
                    } else {
                        print("⚠️ Lobby: Host disconnected but preserving room presence (implicit disconnect)")
                    }
                } catch {
                    NSLog("❌ Failed to delete room: \(error)")
                }
            } else if let userId = currentUserId {
                // Guest / Event Host logic
                
                // CRITICAL FIX: Only leave room if EXPLICITLY leaving. 
                // Implicit disconnects (backgrounding, view reload) should NOT remove user from DB.
                // This prevents race conditions where the old view deletes the user 
                // just as the new view is trying to join/sync.
                if isLeavingExplicitly {
                    do {
                        try await self.dataService.leaveRoom(roomId: roomId, userId: userId)
                        NSLog("✅ Left room \(roomId) (User: \(userId))")
                    } catch {
                        NSLog("❌ Failed to leave room: \(error)")
                    }
                } else {
                     NSLog("⚠️ Implicit disconnect for \(userId) - Preserving DB presence")
                }
            }

            // Reset flag after completion
            self.isDisconnecting = false
        }
        countdownTask?.cancel()

        print("🎭 Lobby: Disconnected from room \(room.id)")
    }

    func initiateLeave() {
        print("🚪 Lobby: Explicit leave initiated. isHost=\(isHost), roomId=\(room.id), hostId=\(room.hostId)")
        isLeavingExplicitly = true

        if isHost && room.type == .userRoom && room.hostId != "system" {
            // Notify guests that room is closing
            Task { [weak self] in
                guard let self = self else { return }
                print("🔒 Host closing room, notifying guests...")
                let syncMsg = SyncMessage(
                    type: .roomClosed,
                    timestamp: Date().timeIntervalSince1970,
                    isPlaying: nil,
                    senderId: self.participantId,
                    chatText: "Room Closed",
                    chatUsername: "Host"
                )
                try? await self.realtimeManager?.sendSyncMessage(syncMsg)
                // Short wait to ensure message delivery
                try? await Task.sleep(nanoseconds: 1_000_000_000) // 1.0s
                await MainActor.run {
                    self.disconnect()
                }
            }
        } else {
             disconnect()
        }
    }

    func sendChatMessage() {
        Task {
            // Always use actual user's username from AppState, with host as fallback
            let username = appState?.currentUsername ?? (isHost ? (room.hostName ?? "Host") : "Guest")

            // Validate user ID exists
            guard (isHost ? UUID(uuidString: room.hostId) != nil : appState?.currentUserId != nil) else {
                NSLog("⚠️ Cannot send message: No user ID")
                return
            }

            await chatManager.send(senderId: participantId, username: username)
        }


    }

    // Extracted logic for network transmission (called by ChatManager callback)





    func addMessage(_ type: LobbyMessageType, userName: String, data: [String: String] = [:]) {
        chatManager.addSystemMessage(type, userName: userName, data: data)
    }

    // Old trimLobbyMessages function - Removed as ChatManager handles it
    // func trimLobbyMessages() { ... }

    func toggleReady() {
        presenceManager.toggleReady()
    }

    func toggleMute(participantId: String) {
        presenceManager.toggleMute(participantId: participantId)
    }

    func kickParticipant(_ participant: Participant) {
        presenceManager.kickParticipant(participant)
    }
    
    /// Kick user by ID (Used by Context Menu)
    func kickUser(userId: String) {
        if let participant = participants.first(where: { $0.id == userId }) {
            kickParticipant(participant)
        } else {
            // Create dummy for signaling (ID is what matters)
            let dummy = Participant(id: userId, name: "User", isHost: false, isReady: false, joinedAt: Date(), phxRef: nil)
            kickParticipant(dummy)
        }
    }

    func blockParticipant(_ participant: Participant) {
        // First kick, then block
        kickParticipant(participant)
        Task {
            await SocialService.shared.blockUser(userId: participant.id, username: participant.name)
        }
    }
    
    /// Block user by ID (Used by Context Menu when participant might not be in the list)
    /// Block user by ID (Used by Context Menu when participant might not be in the list)
    func blockUser(_ userId: String, username: String? = nil) {
        // Check if participant is in the list
        if let participant = participants.first(where: { $0.id == userId }) {
            blockParticipant(participant)
        } else {
            // Not in list (or event room), but still block via service
            // If we are host, we can still try to send a kick command by ID
            if isHost {
                 let dummy = Participant(id: userId, name: username ?? "User", isHost: false, isReady: false, joinedAt: Date(), phxRef: nil)
                 kickParticipant(dummy)
            }
            Task {
                await SocialService.shared.blockUser(userId: userId, username: username)
            }
        }
    }

    func addFriend(participantId: String) {
        Task {
            _ = await SocialService.shared.sendRequest(toUserId: participantId)
        }
    }

    func startMovie(appState: AppState) async {
        guard isHost else { return }

        // CRITICAL FIX: Prevent re-entrancy / race conditions
        // If user clicks start multiple times, or if resolution hangs, ignore subsequent clicks
        guard !isResolvingStream else {
            NSLog("⚠️ Host: startMovie ignored - already resolving stream")
            return
        }

        // CRITICAL FIX: Explicitly reset event playback flag
        // This prevents the "Exit Event" button from appearing in User Rooms
        appState.player.isEventPlayback = (room.type == .event)

        guard let mediaItem = room.mediaItem else {
            NSLog("❌ Host: Cannot start playback - no media selected")
            return
        }

        NSLog("🎬 Host: Starting movie for \(participants.count) participants")
        isStarting = true
        transitionState.isStarting = true

        // Smart Start Message
        var startMsg = "Host is starting the media"
        if let type = Optional(mediaItem.type.lowercased()) {
             if type == "series" {
                 startMsg = "Host is starting the episode"
             } else if type == "movie" {
                 startMsg = "Host is starting the movie"
             }
        }
        addMessage(.systemInfo, userName: "System", data: ["message": startMsg])

        // 1. Resolve and persist stream explicitly BEFORE broadcasting signal
        // This ensures guests don't fetch nil stream details
        isResolvingStream = true

        // Ensure we reset this flag even if resolution throws
        defer {
             isResolvingStream = false
        }

        var preResolvedStream: Stream?
        do {
            preResolvedStream = try await appState.player.resolveAndPersistForWatchParty(
                mediaItem: mediaItem,
                quality: .fullHD,
                roomId: room.id,
                season: room.season,
                episode: room.episode
            )
            NSLog("✅ Host: Stream resolved and persisted OK")
        } catch {
            NSLog("❌ Host: Stream resolution failed: \(error)")
            addMessage(.systemError, userName: "System", data: [
                "message": "Failed to resolve stream for Watch Party",
                "error": "\(error.localizedDescription)"
            ])
            isStarting = false
            transitionState.isStarting = false
            isResolvingStream = false
            return
        }
        isResolvingStream = false

        guard let finalStream = preResolvedStream else {
             isStarting = false
             transitionState.isStarting = false
             return
        }

        var realtimeSuccess = false

        // Broadcast via Realtime with error handling
        Task { [weak self] in
            guard let self = self else { return }
            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: Double(self.countdown),
                isPlaying: nil,
                senderId: self.participantId,
                chatText: "LOBBY_START_COUNTDOWN",
                chatUsername: "Host"
            )
            do {
                try await self.realtimeManager?.sendSyncMessage(syncMsg)
                realtimeSuccess = true
                NSLog("✅ Host: Successfully broadcast LOBBY_START_COUNTDOWN via Realtime")
                NSLog("📡 Realtime delivery confirmed for \(self.participants.count) guests")
            } catch RealtimeError.channelNotReady {
                NSLog("⚠️ Host: Realtime channel not ready - will use database fallback")
                self.addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal (Realtime not ready)",
                    "reason": "Channel not ready"
                ])
            } catch {
                NSLog("⚠️ Host: Unknown Realtime error: \(error) - will use database fallback")
                self.addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal",
                    "error": "\(error.localizedDescription)"
                ])
            }
        }

        // Database fallback: Update room state to indicate playback starting
        Task {
            do {
                try await self.dataService.startRoomPlayback(roomId: room.id)
                NSLog("✅ Host: Set room playback state in database as fallback")

                if !realtimeSuccess {
                    addMessage(.systemInfo, userName: "System", data: [
                        "message": "✅ Start signal sent via database (Realtime unavailable)",
                        "guestCount": "\(participants.count)"
                    ])
                }
            } catch {
                NSLog("❌ Host: Failed to update room state in database: \(error)")
            }
        }

        // Countdown with drift correction
        let startTime = Date()
        for i in (1...3).reversed() {
            countdown = i

            // Calculate how much time has passed since we started
            let elapsed = Date().timeIntervalSince(startTime)
            // Calculate how much time we should have waited by now (3 - i + 1 seconds)
            let targetDelay = Double(3 - i + 1)

            // Sleep for the remaining time to hit the target
            let sleepDuration = max(0, targetDelay - elapsed)
            if sleepDuration > 0 {
                try? await Task.sleep(nanoseconds: UInt64(sleepDuration * 1_000_000_000))
            }
        }

        // Start playback for everyone
        NSLog("🎬 Host: Launching player for \(mediaItem.name)")

        // Stop polling before transition to prevent double-polling
        stopPolling()

        await MainActor.run {
            // Manually set state since we resolve first
            appState.player.isWatchPartyHost = true
            appState.player.currentWatchMode = .watchParty
            appState.player.currentRoomId = room.id
            // NEW: Pass solo launch intent
            appState.player.forceSoloStart = self.forceSoloStart

            // CRITICAL FIX: Update AppState season/episode so Player UI shows correct title
            if let mediaItem = room.mediaItem, mediaItem.type == "series" {
                appState.selectedSeason = room.season
                appState.selectedEpisode = room.episode
                print("✅ Host: Updated AppState selection to S\(room.season ?? 0)E\(room.episode ?? 0)")
            }

            // Sync Playlist State to AppState
            if var currentRoom = appState.player.currentWatchPartyRoom {
                currentRoom.playlist = self.playlist
                currentRoom.currentPlaylistIndex = self.currentPlaylistIndex
                appState.player.currentWatchPartyRoom = currentRoom
                print("✅ Host: Synced playlist state to AppState (Index: \(self.currentPlaylistIndex))")
            }

            appState.player.navigateToPlayer(stream: finalStream)
        }

    }

    func addToPlaylist(item: MediaItem, season: Int? = nil, episode: Int? = nil) async {
        print("🎬 LobbyViewModel: addToPlaylist called for \(item.name)")
        await addItemsToPlaylist([(item, season, episode)])
    }

    func addItemsToPlaylist(_ items: [(item: MediaItem, season: Int?, episode: Int?)]) async {
        guard isHost, !items.isEmpty else { return }

        let newItems = items.compactMap { entry -> PlaylistItem? in
            let finalSeason = entry.season ?? (entry.item.type == "series" ? 1 : nil)
            let finalEpisode = entry.episode ?? (entry.item.type == "series" ? 1 : nil)

            // Check for duplicates in existing playlist
            let isDuplicateInPlaylist = playlist.contains { existing in
                existing.mediaItem.id == entry.item.id &&
                existing.season == finalSeason &&
                existing.episode == finalEpisode
            }

            // Check if it matches the CURRENTLY playing item (to avoid immediate replay)
            let isCurrentItem = (room.mediaItem?.id == entry.item.id &&
                                 room.season == finalSeason &&
                                 room.episode == finalEpisode)

            if isDuplicateInPlaylist || isCurrentItem {
                 return nil
            }

            return PlaylistItem(mediaItem: entry.item, season: finalSeason, episode: finalEpisode)
        }

        guard !newItems.isEmpty else { return }

        // Optimistic update
        await MainActor.run {
            self.playlist.append(contentsOf: newItems)
            if playlist.count == newItems.count { // First items added
                self.currentPlaylistIndex = 0
            }
            self.isPlaylistMode = true

            // Sync to AppState so MPVPlayerView sees it
            if var room = self.appState?.player.currentWatchPartyRoom {
                room.playlist = self.playlist
                room.currentPlaylistIndex = self.currentPlaylistIndex
                self.appState?.player.currentWatchPartyRoom = room
            }

            // Persist to Supabase
            self.updatePlaylistInDatabase()
        }
    }



    // MARK: - Realtime Message Handling

    private func handleLobbyMessage(_ syncMessage: SyncMessage) async {
        await eventRouter.handle(syncMessage)
    }

    func loadMetadata() {
        // Only load metadata if media item exists
        guard let mediaItem = room.mediaItem else {
            print("⚠️ Lobby: No media selected yet")
            return
        }

        Task { [weak self] in
            guard let self = self else { return }
            do {
                // Fetch metadata from local API
                let mediaItem = try await LocalAPIClient.shared.fetchMediaDetails(
                    imdbId: mediaItem.id,
                    type: mediaItem.type
                )

                // Extract poster and backdrop URLs
                await MainActor.run {
                    self.posterURL = mediaItem.posterURL?.absoluteString
                    self.backdropURL = mediaItem.backgroundURL?.absoluteString
                    self.logoURL = mediaItem.logo
                }

                print("✅ Lobby: Loaded metadata for \(mediaItem.name)")
            } catch {
                print("❌ Lobby: Failed to load metadata: \(error)")
            }
        }
    }

    // MARK: - Database Polling

    private func startPolling() {
        print("🔄 Lobby: Starting database polling for participants and room state...")

        presenceManager.startPolling()
        databaseManager.startPolling() // Delegates room state polling for guests
    }

    private func stopPolling() {
        presenceManager.stopPolling()
        databaseManager.stopPolling()

        print("🛑 Lobby: Polling stopped (chat via Realtime only)")
    }

    /// Fetch fresh room state from Supabase (Host & Guest)
    /// This ensures we have the latest playlist and room details, as AppState might be stale
    func fetchFreshRoomState() async {
        print("🔄 Lobby: Fetching fresh room state from Supabase...")
        do {
            guard let freshRoom = try await self.dataService.getRoomState(roomId: room.id) else {
                print("❌ Lobby: Failed to fetch fresh room state (not found)")
                return
            }

            await MainActor.run {
                // Update Playlist
                if let playlist = freshRoom.playlist {
                    print("✅ Lobby: Synced playlist with \(playlist.count) items")
                    self.playlist = playlist
                    self.isPlaylistMode = !playlist.isEmpty
                }

                // Update Index
                if let index = freshRoom.currentPlaylistIndex {
                    print("✅ Lobby: Synced playlist index to \(index)")
                    self.currentPlaylistIndex = index
                }

                // Update other room properties locally if needed
                // Note: We don't replace self.room completely to avoid wiping out other local state,
                // but we SHOULD update the playlist on the room struct too.
                self.room.playlist = freshRoom.playlist
                self.room.currentPlaylistIndex = freshRoom.currentPlaylistIndex ?? 0

                // Update local room state first (Raw sync)
                self.room.playlist = freshRoom.playlist
                self.room.currentPlaylistIndex = freshRoom.currentPlaylistIndex ?? 0
                self.room.selectedStreamHash = freshRoom.streamHash
                self.room.selectedFileIdx = freshRoom.fileIdx
                self.room.selectedQuality = freshRoom.quality
                self.room.unlockedStreamURL = freshRoom.unlockedStreamUrl
                self.room.subtitleUrl = freshRoom.subtitleUrl

                // NOTE: AppState update moved to AFTER type inference to prevent stale data sync

                // CRITICAL FIX: Syn Sync UI Metadata on Init (Fixes Art Reversion)
                // Construct MediaItem from SupabaseRoom flat properties
                var freshMedia: MediaItem? = nil
                if let imdbId = freshRoom.imdbId {
                    // 1. Better Type Inference: Check Playlist first
                    // This prevents stale season/episode data (from previous series) from forcing "series" type on a movie
                    var expectedType = (freshRoom.season != nil || freshRoom.episode != nil) ? "series" : "movie"

                    if let playlist = freshRoom.playlist,
                       let index = freshRoom.currentPlaylistIndex,
                       index >= 0, index < playlist.count {
                        let playlistItem = playlist[index]
                        // Only trust playlist type if IDs match
                        if playlistItem.mediaItem.id == imdbId {
                            expectedType = playlistItem.mediaItem.type
                        }
                    }

                    freshMedia = MediaItem(
                        id: imdbId,
                        type: expectedType,
                        name: freshRoom.name,
                        poster: freshRoom.posterUrl,
                        background: freshRoom.backdropUrl,
                        logo: nil,
                        description: freshRoom.description,
                        releaseInfo: nil,
                        year: nil,
                        imdbRating: nil,
                        genres: nil,
                        runtime: nil
                    )
                }

                if let mediaItem = freshMedia {
                    if self.room.mediaItem?.id != mediaItem.id ||
                       self.room.season != freshRoom.season ||
                       self.room.episode != freshRoom.episode ||
                       self.room.mediaItem?.type != mediaItem.type { // added type check

                        // Update local room state
                        self.room.mediaItem = mediaItem

                        // CRITICAL: Force clear season/episode if type is movie (overriding stale DB values)
                        if mediaItem.type == "series" {
                            self.room.season = freshRoom.season
                            self.room.episode = freshRoom.episode
                        } else {
                            self.room.season = nil
                            self.room.episode = nil
                        }

                        // Update UI Bindings
                        self.posterURL = mediaItem.poster
                        self.backdropURL = mediaItem.background
                        self.logoURL = mediaItem.logo // Reset logo (will be nil for DB state, triggering fetch)

                        print("✅ Lobby: Synced Initial Metadata -> \(mediaItem.name) (\(mediaItem.type))")

                        // Trigger metadata load if assets are missing
                        if self.logoURL == nil {
                            self.loadMetadata()
                        }
                    }
                }

                // CRITICAL FIX: Update AppState with CORRECTED room data (Clean Sync)
                // This must run AFTER the season/episode correction logic above
                // CRITICAL: Only sync if this lobby's room matches AppState's room to prevent stale lobby contamination
                if var currentRoomParam = self.appState?.player.currentWatchPartyRoom,
                   currentRoomParam.id == self.room.id {
                    currentRoomParam.playlist = self.room.playlist
                    currentRoomParam.currentPlaylistIndex = self.room.currentPlaylistIndex
                    
                    // Sync corrected season/episode
                    currentRoomParam.season = self.room.season
                    currentRoomParam.episode = self.room.episode
                    
                    // Sync verified stream properties (ensuring correct hash/fileIdx)
                    currentRoomParam.selectedStreamHash = self.room.selectedStreamHash
                    currentRoomParam.selectedFileIdx = self.room.selectedFileIdx
                    currentRoomParam.selectedQuality = self.room.selectedQuality
                    currentRoomParam.unlockedStreamURL = self.room.unlockedStreamURL
                    currentRoomParam.subtitleUrl = self.room.subtitleUrl
                    
                    // Sync verified media item
                    currentRoomParam.mediaItem = self.room.mediaItem

                    self.appState?.player.currentWatchPartyRoom = currentRoomParam
                    print("✅ Lobby: Synced CLEAN stream info, metadata & playlist to AppState")
                }

                // CRITICAL FIX: Ensure initial item is in playlist (for Host)
                if self.isHost, self.playlist.isEmpty, let mediaItem = self.room.mediaItem {
                    print("🆕 Lobby: Auto-adding initial item to playlist: \(mediaItem.name)")
                    let initialItem = PlaylistItem(
                        mediaItem: mediaItem,
                        season: self.room.season,
                        episode: self.room.episode
                    )
                    self.playlist = [initialItem]
                    self.isPlaylistMode = true

                    // Persist to Supabase immediately
                    Task { [weak self] in
                        guard let self = self else { return }
                        do {
                            try await self.dataService.updateRoomPlaylist(
                                roomId: self.room.id,
                                playlist: [initialItem],
                                currentIndex: 0
                            )
                            print("✅ Lobby: Persisted initial playlist item")
                        } catch {
                            print("❌ Lobby: Failed to persist initial playlist item: \(error)")
                        }
                    }
                }
            }

        } catch {
            print("❌ Lobby: Error fetching fresh state: \(error)")
        }
    }



    // MARK: - Helper Functions


    private func autoStartSystemEvent() {
        if isHost {
            if isStarting || stateMachine.isCountingDown {
                print("⚠️ Host is already starting, ignoring auto-start")
                return
            }
        }

        guard let appState = appState else {
            print("❌ Lobby: autoStartSystemEvent - no appState")
            return
        }

        print("🤖 Lobby: Checking auto-start for system event")
        print("   Room ID: \(room.id)")
        print("   Room createdAt: \(room.createdAt)")
        print("   Current time: \(Date())")

        // Calculate time until start
        let now = Date()
        let timeUntilStart = room.createdAt.timeIntervalSince(now)

        print("   Time until start: \(timeUntilStart)s")

        if timeUntilStart > 0 {
            // We are early! Wait for the official start time.
            print("⏳ Lobby: Event starts in \(Int(timeUntilStart))s. Waiting...")

            self.timeUntilStart = timeUntilStart

            // Start a task to update the countdown UI
            countdownTask?.cancel()
            countdownTask = Task { [weak self] in
                while !Task.isCancelled {
                    guard let self = self else { return }

                    let remaining = self.room.createdAt.timeIntervalSince(Date())
                    if remaining <= 0 {
                        self.timeUntilStart = 0
                        self.autoStartSystemEvent() // Retry start
                        return
                    } else {
                        self.timeUntilStart = remaining
                    }

                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                }
            }
            return
        }

        print("🤖 Lobby: Auto-starting system event now")

        // Calculate playback position (should be >= 0 now)
        let elapsed = now.timeIntervalSince(room.createdAt)

        print("   Elapsed time: \(elapsed)s")
        print("   Media item: \(room.mediaItem?.name ?? "nil")")

        // NEW: Set event start time for dynamic seeking (instead of static timestamp)
        // The player will recalculate the correct seek position when video is ready
        appState.player.eventStartTime = room.createdAt
        appState.player.resumeFromTimestamp = nil  // Don't use static timestamp for events

        print("   Set eventStartTime to: \(room.createdAt)")
        print("   Current elapsed would be: \(elapsed)s (will recalculate on video ready)")

        // Set starting state to update UI
        self.isStarting = true
        self.transitionState.isStarting = true

        // Start playback
        Task { [weak self] in
            guard let self = self else { return }
            // Wait a moment for the UI to settle and show "Starting..."
            try? await Task.sleep(nanoseconds: 1_500_000_000) // 1.5 seconds

            if let mediaItem = self.room.mediaItem {
                print("🎬 Lobby: Calling playMedia for \(mediaItem.name)")

                // Stop polling before transition
                self.stopPolling()

                await self.appState?.player.playMedia(
                    mediaItem,
                    quality: .fullHD,
                    watchMode: .watchParty,
                    roomId: self.room.id,
                    isHost: false, // System is host, user is guest
                    isEvent: self.room.type == .event
                )
            } else {
                print("❌ Lobby: No media item to play!")
            }
        }
    }


    // MARK: - Timeout and Error Handling

    /// Handle case when no guests join room
    private func handleNoGuestsJoined() async {
        print("🔔 Host: No guests joined - showing waiting state")

        // Add user-facing message
        addMessage(.systemInfo, userName: "System", data: [
            "message": "Waiting for guests to join room...",
            "roomCode": room.id
        ])

        // Set up listener for when guests do join
        await setupGuestJoinedListener()

        // Offer to restart signaling when guests join
        print("💡 Host: Realtime signaling is persistent, no restart needed")
    }

    /// Check if media item needs update based on room state
    func updateMediaItemFromRoomState(_ roomState: SupabaseRoom) async {
        // Check if IMDB ID matches
        guard let newImdbId = roomState.imdbId else { return }

        // Infer expected type from season/episode presence
        // If season/episode are present, it MUST be a series
        var expectedType = (roomState.season != nil || roomState.episode != nil) ? "series" : "movie"

        // CRITICAL FIX: Check Playlist first to override stale inference
        if let playlist = roomState.playlist,
           let index = roomState.currentPlaylistIndex,
           index >= 0, index < playlist.count {
            let playlistItem = playlist[index]
            if playlistItem.mediaItem.id == newImdbId {
                expectedType = playlistItem.mediaItem.type
            }
        }

        // Check for mismatch in either ID OR Type
        // This fixes the issue where ID is correct (e.g. Breaking Bad) but Type is wrong (Movie -> "Mirror")
        let idMismatch = room.mediaItem?.id != newImdbId
        let typeMismatch = room.mediaItem?.type != expectedType

        if idMismatch || typeMismatch {
            NSLog("🔄 Guest: Detected media change via DB")
            if idMismatch {
                NSLog("   ID Mismatch: Local \(room.mediaItem?.id ?? "nil") -> Remote \(newImdbId)")
            }
            if typeMismatch {
                NSLog("   Type Mismatch: Local \(room.mediaItem?.type ?? "nil") -> Expected \(expectedType)")
            }

            do {
                // Fetch fresh metadata with the CORRECT type
                let mediaItem = try await LocalAPIClient.shared.fetchMediaDetails(imdbId: newImdbId, type: expectedType)

                await MainActor.run {
                    self.room.mediaItem = mediaItem

                    // CRITICAL: Force clear season/episode if type is movie
                    if expectedType == "series" {
                        self.room.season = roomState.season
                        self.room.episode = roomState.episode
                    } else {
                        self.room.season = nil
                        self.room.episode = nil
                    }

                    self.posterURL = mediaItem.posterURL?.absoluteString
                    self.backdropURL = mediaItem.backgroundURL?.absoluteString
                    self.logoURL = mediaItem.logo
                    
                    // CRITICAL FIX: Update AppState with changes
                    if var currentRoomParam = self.appState?.player.currentWatchPartyRoom {
                         currentRoomParam.mediaItem = self.room.mediaItem
                         currentRoomParam.season = self.room.season
                         currentRoomParam.episode = self.room.episode
                         self.appState?.player.currentWatchPartyRoom = currentRoomParam
                         NSLog("✅ Guest: Synced media change to AppState")
                    }
                }

                NSLog("✅ Guest: Updated media item to \(mediaItem.name) (\(expectedType))")

                // Trigger metadata load to ensure everything is fresh
                loadMetadata()

            } catch {
                NSLog("❌ Guest: Failed to fetch metadata for new media item: \(error)")
            }
        }
    }

    /// Handle timeout when guests are present but no answer received
    private func handleAnswerTimeoutWithGuests(guestCount: Int) async {
        print("⚠️ Host: Timeout with \(guestCount) guests present - guests may have connection issues")

        // Add user-facing message
        addMessage(.systemInfo, userName: "System", data: [
            "message": "Guests are having trouble connecting. You can wait longer or restart the connection.",
            "guestCount": "\(guestCount)"
        ])

        // Offer restart option
        // TODO: Add UI button to restart Realtime signaling
        print("💡 Host: Consider offering restart option to user")
    }

    /// Handle general signaling errors
    private func handleSignalingError(_ error: Error) async {
        print("❌ Host: Signaling error occurred: \(error)")

        // Add user-facing message
        addMessage(.systemError, userName: "System", data: [
            "message": "Connection issue occurred. Realtime will fall back to database polling.",
            "error": "\(error)"
        ])
    }

    /// Set up listener for when guests join room
    private func setupGuestJoinedListener() async {
        // This could be enhanced to monitor participant changes
        // and restart signaling when guests join
        print("👂 Host: Setting up guest join listener")
    }

    /// Restart Realtime signaling (for when guests join after initial timeout)
    /// DEPRECATED: This function was used with WebRTC, no longer needed with Realtime
    func restartRealtimeSignaling() async {
        // Realtime connections are persistent and don't need manual restart
        print("⚠️ restartRealtimeSignaling called but is deprecated with Realtime implementation")
    }

// MARK: - WatchPartyManagerDelegate

    // MARK: - Playlist Management

    // MARK: - Playlist Management

    // RENAMED: was checkForAutoAdvance
    func prepareNextItem() {
        guard isHost, isPlaylistMode else { return }

        // Sync local index with Updated AppState if referenced
        if let appStateIndex = appState?.player.currentWatchPartyRoom?.currentPlaylistIndex {
            self.currentPlaylistIndex = appStateIndex
        }

        // Validate index
        guard currentPlaylistIndex < playlist.count else {
            print("✅ Playlist completed (Manual Advance)")
            // Reset to 0 if we want to show the first item again, or leave as is?
            // If looped, AppState already reset it to 0.
            // If valid index, prepare it.
            return
        }

        let item = playlist[currentPlaylistIndex]
        print("🎬 Preparing next item: \(item.displayTitle) (Index: \(currentPlaylistIndex))")

        // Update room's current media immediately for the lobby UI
        room.mediaItem = item.mediaItem
        room.season = item.season
        room.episode = item.episode

        // Update Supabase with new index & media
        // This ensures guests see the new poster/title
        updatePlaylistIndex(currentPlaylistIndex)

        // Also trigger metadata load specifically for this new item to refresh background/poster
        posterURL = item.mediaItem.poster
        backdropURL = item.mediaItem.background
        logoURL = item.mediaItem.logo // If available on item, or nil to trigger fetch

        if logoURL == nil {
             loadMetadata() // Full fetch if needed
        }

        // CRITICAL: Reset ready state so we don't start automatically or stuck in ready state
        self.isReady = false
        // Also update backend to unready? The standard "toggleReady" might be needed or manual DB update.
        // For now, local reset ensures UI is correct.
        // Ideally we should broadcast "UNREADY" but existing logic handles toggles.
        // Let's force a toggle if we are ready?
        // if self.isReady { toggleReady() } - better to just set false locally and let user click again.
    }

    // REMOVED: startPlaylistCountdown
    // REMOVED: startNextPlaylistItem (Host calls startMovie manually now)

    /// Explicitly play a specific item from the playlist (Host only)
    func playItem(at index: Int) {
        guard isHost, index >= 0, index < playlist.count else { return }

        let item = playlist[index]
        print("🎬 Host switching to playlist item \(index + 1): \(item.displayTitle)")

        // Update local state
        self.currentPlaylistIndex = index

        // Update Supabase with new index & media
        // If assets are missing (e.g. from search), start a Task to fetch fresh
        // metadata BEFORE updating Supabase to ensure consistency.

        // 2. Update local state immediately with what we have
        self.room.mediaItem = item.mediaItem
        // CRITICAL FIX: Clear season/episode for movies to prevent type mismatch in API calls
        // If we're switching from a series to a movie, stale season/episode values
        // will cause the resolver to incorrectly try /api/metadata/meta/series/...
        if item.mediaItem.type.lowercased() == "series" {
            self.room.season = item.season
            self.room.episode = item.episode
        } else {
            self.room.season = nil
            self.room.episode = nil
        }
        self.room.currentPlaylistIndex = index

        // Sync to AppState so MPVPlayerView sees it immediately if active
        if var room = self.appState?.player.currentWatchPartyRoom {
            room.currentPlaylistIndex = index
            self.appState?.player.currentWatchPartyRoom = room
        }

        self.posterURL = item.mediaItem.poster
        self.backdropURL = item.mediaItem.background
        self.logoURL = item.mediaItem.logo

        // CRITICAL: Reset ready state
        self.isReady = false

        Task { [weak self] in
            guard let self = self else { return }
            // Prepare metadata to send
            var finalPoster = item.mediaItem.poster
            var finalBackdrop = item.mediaItem.background

            // If assets are missing, try to fetch fresh metadata
            if item.mediaItem.logo == nil || item.mediaItem.background == nil {
                do {
                    print("🔍 Lobby: Fetching fresh metadata before Supabase update...")
                    let freshMeta = try await LocalAPIClient.shared.fetchMediaDetails(
                        imdbId: item.mediaItem.id,
                        type: item.mediaItem.type
                    )

                    // Update Local UI with fresh details
                    await MainActor.run {
                        self.posterURL = freshMeta.posterURL?.absoluteString
                        self.backdropURL = freshMeta.backgroundURL?.absoluteString
                        self.logoURL = freshMeta.logo

                        // Update local room item too so it persists
                        if let freshPoster = freshMeta.posterURL?.absoluteString {
                            finalPoster = freshPoster
                        }
                        if let freshBackdrop = freshMeta.backgroundURL?.absoluteString {
                            finalBackdrop = freshBackdrop
                        }
                    }
                    print("✅ Lobby: Fresh metadata fetched for Supabase sync")
                } catch {
                    print("⚠️ Lobby: Failed to fetch fresh metadata, proceeding with basic info: \(error)")
                }
            }

            do {
                // 3. Update Supabase with definitive metadata (fresh or basic)
                // Use empty strings to clear stale art if still missing
                try await self.dataService.updateRoomMetadata(
                    roomId: self.room.id,
                    name: item.mediaItem.name,
                    imdbId: item.mediaItem.id,
                    season: item.season,
                    episode: item.episode,
                    posterUrl: finalPoster ?? "",
                    backdropUrl: finalBackdrop ?? ""
                )

                // Also update playlist index
                try await self.dataService.updateRoomPlaylist(
                    roomId: self.room.id,
                    playlist: self.playlist,
                    currentIndex: index
                )
                print("✅ Supabase: Room metadata & playlist updated")
            } catch {
                print("❌ Supabase: Failed to update room: \(error)")
            }
        }
    }





    func removeFromPlaylist(at index: Int) {
        guard isHost, index < playlist.count else { return }

        playlist.remove(at: index)

        // Adjust currentPlaylistIndex if necessary
        if index < currentPlaylistIndex {
            currentPlaylistIndex -= 1
        } else if index == currentPlaylistIndex {
            // If removed current item, ensure index is still valid
            if currentPlaylistIndex >= playlist.count {
                currentPlaylistIndex = max(0, playlist.count - 1)
            }
        }

        if playlist.isEmpty {
            isPlaylistMode = false
            currentPlaylistIndex = 0
        }

        // Sync to AppState so MPVPlayerView sees it
        if var room = self.appState?.player.currentWatchPartyRoom {
            room.playlist = self.playlist
            room.currentPlaylistIndex = self.currentPlaylistIndex
            self.appState?.player.currentWatchPartyRoom = room
        }

        updatePlaylistInDatabase()
    }

    func movePlaylistItem(from: Int, to: Int) {
        guard isHost else { return }

        // Track if we are moving the currently playing item
        let isMovingCurrent = (from == currentPlaylistIndex)

        // Temporarily adjust index for removal
        if from < currentPlaylistIndex {
            currentPlaylistIndex -= 1
        }

        let item = playlist.remove(at: from)
        playlist.insert(item, at: to)

        // Adjust index for insertion
        if to <= currentPlaylistIndex {
            currentPlaylistIndex += 1
        }

        // If we moved the current item, update index to its new position
        if isMovingCurrent {
            currentPlaylistIndex = to
        }

        // Sync to AppState so MPVPlayerView sees it
        if var room = self.appState?.player.currentWatchPartyRoom {
            room.playlist = self.playlist
            room.currentPlaylistIndex = self.currentPlaylistIndex
            self.appState?.player.currentWatchPartyRoom = room
        }

        updatePlaylistInDatabase()
    }

    private func updatePlaylistInDatabase() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                try await self.dataService.updateRoomPlaylist(
                    roomId: self.room.id,
                    playlist: self.playlist,
                    currentIndex: self.currentPlaylistIndex
                )
                print("✅ LobbyViewModel: updateRoomPlaylist returned successfully")
            } catch {
                print("❌ Failed to update playlist in database: \(error)")
            }
        }
    }

    private func updatePlaylistIndex(_ index: Int) {
        // We update the whole playlist structure for simplicity as our backend expects both
        Task { [weak self] in
            guard let self = self else { return }
            do {
                try await self.dataService.updateRoomPlaylist(
                    roomId: self.room.id,
                    playlist: self.playlist,
                    currentIndex: index
                )
            } catch {
                print("❌ Failed to update playlist index: \(error)")
            }
        }
    }
}

