import Foundation
import SwiftUI
import Combine

@MainActor
class LobbyViewModel: ObservableObject {
    @Published var participants: [Participant]
    @Published var messages: [LobbyMessage] = []
    @Published var chatMessages: [ChatMessage] = []  // User chat messages
    @Published var chatInput: String = ""
    @Published var isReady: Bool = false
    @Published var isStarting: Bool = false
    @Published var countdown: Int = 3
    @Published var didCopyRoomID: Bool = false
    @Published var posterURL: String?
    @Published var backdropURL: String?
    @Published var logoURL: String?
    @Published var timeUntilStart: TimeInterval = 0 // Time until event officially starts
    @Published var showRoomClosedAlert: Bool = false
    @Published var roomClosedMessage: String = "The host has left the room."

    // NEW: Playlist Support
    @Published var playlist: [PlaylistItem] = []
    @Published var currentPlaylistIndex: Int = 0
    @Published var isPlaylistMode: Bool = false
    @Published var mutedUserIds: Set<String> = []

    // Realtime connection status for UI feedback

    // Realtime connection status for UI feedback
    @Published var realtimeConnectionStatus: RealtimeConnectionStatus = .disconnected
    @Published var isResolvingStream: Bool = false // UI indicator for stream resolution

    @Published var room: WatchPartyRoom
    private var isHost: Bool
    private var realtimeClient: SupabaseRealtimeClient?
    // private var countdownTimer: Timer? // Removed for concurrency
    // countdownTask already declared on line 38, ensuring we use that instead.
    private var countdownTask: Task<Void, Never>?
    private var participantsPollingTask: Task<Void, Never>?
    private var roomStatePollingTask: Task<Void, Never>?
    private var lastRoomPlayingState: Bool = false
    private var participantId: String
    private var isDisconnecting: Bool = false
    private var realtimeManager: (any RealtimeService)?
    private var playbackEndedTimestamp: Date? // Track when playback ended to prevent immediate re-join race condition
    private var isLeavingExplicitly: Bool = false // Flag to track if host is explicitly leaving (vs deinit/background)
    private var canAutoJoin: Bool = false // Safety flag: Prevents auto-join immediately upon entry (race condition protection)

    // Helper to track state safely across actor boundaries (specifically for deinit)
    private class TransitionState {
        var isStarting: Bool = false
    }
    private let transitionState = TransitionState()

    weak var appState: AppState?  // Weak reference to avoid retain cycle

    // MARK: - Initialization

    init(room: WatchPartyRoom, isHost: Bool, realtimeManager: (any RealtimeService)? = nil) {
        self.room = room
        self.isHost = isHost
        self.realtimeManager = realtimeManager
        self.participants = room.participants

        // For hosts, use room host ID. For guests, we'll set to participantId after getting user ID
        if isHost {
            self.participantId = room.hostId
        } else {
            // Temporary - will be updated when we get actual user ID
            self.participantId = UUID().uuidString
        }

        // Load metadata for poster/backdrop
        loadMetadata()

        // Setup Realtime subscription for room updates
        Task {
            await setupRealtimeSubscription()
        }

        // Add initial join message
        if isHost {
            addMessage(.userJoined, userName: "Host")
        }

        // NEW: Initialize playlist state
        if let roomPlaylist = room.playlist {
            self.playlist = roomPlaylist
            self.currentPlaylistIndex = room.currentPlaylistIndex
            self.isPlaylistMode = !roomPlaylist.isEmpty
        }

        // Initialize playbackEndedTimestamp to enable the grace period check in pollRoomState
        self.playbackEndedTimestamp = Date()

        // Fetch fresh room state from Supabase to ensure playlist is synced
        // This fixes the issue where Host sees "Playlist 0" because AppState had stale data
        Task {
            await self.fetchFreshRoomState()
        }

        // CRITICAL FIX: Prevent "Autoplay Death Loop"
        // When host returns to lobby after movie finishes, DB still says is_playing=true
        // This causes the "Database Fallback" in init/join to immediately restart playback
        // We must strictly reset this for USER hosted rooms, but preserve it for EVENTS (which do autoplay)
        if isHost && !room.id.hasPrefix("event_") {
             Task {
                 print("🛑 Lobby: Host explicitly clearing playback state in DB to prevent autoplay loop")
                 try? await SupabaseClient.shared.updateRoomPlayback(roomId: room.id, position: 0, isPlaying: false)
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
            self.realtimeManager = RealtimeChannelManager(realtimeClient: SupabaseClient.shared.realtimeClient)
        }

        // Set up presence callback
        await realtimeManager?.setPresenceCallback { [weak self] action, userId, metadata in
            Task { @MainActor [weak self] in
                guard let self = self else { return }

                // Update participants list
                switch action {
                case .join:
                    // Check if already exists
                    if let index = self.participants.firstIndex(where: { $0.id == userId }) {
                        // User exists - update their timestamp so the subsequent 'leave' event
                        // (which happens on metadata updates) knows they just 'joined' and doesn't remove them.
                        self.participants[index].joinedAt = Date()
                        // Also update metadata if needed
                        let username = metadata?["username"] as? String ?? "User"
                        self.participants[index].name = username
                    } else {
                        // New user
                        let username = metadata?["username"] as? String ?? "User"
                        let _ = metadata?["avatar_url"] as? String

                        let newParticipant = Participant(
                            id: userId,
                            name: username,
                            isHost: false, // We can't easily determine host from presence alone yet
                            isReady: false,
                            joinedAt: Date()
                        )
                        self.participants.append(newParticipant)
                        self.addMessage(.userJoined, userName: username)
                    }
                case .leave:
                    // Defer leave processing to avoid false positives from metadata updates
                    // Phoenix sends leave+join for the same user when updating metadata
                    // Wait a moment to see if they rejoin (metadata update) before removing
                    Task { @MainActor in
                        try? await Task.sleep(nanoseconds: 100_000_000) // 100ms

                        // Only remove if they're still not in participants (actual leave)
                        // If they rejoined (metadata update), they'll already be in the list
                        if let index = self.participants.firstIndex(where: { $0.id == userId }) {
                            // Double-check they're actually gone by verifying no recent join
                            let participant = self.participants[index]
                            let timeSinceJoin = Date().timeIntervalSince(participant.joinedAt)

                            // If they joined recently (\u003c 1 second), it's a metadata update, not a real leave
                            if timeSinceJoin > 1.0 {
                                self.participants.remove(at: index)
                                self.addMessage(.userLeft, userName: participant.name)
                            }
                        }
                    }
                }
            }
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
                    "event": "UPDATE",
                    "schema": "public",
                    "table": "rooms",
                    "filter": "id=eq.\(room.id)"
                ]
            ]
            
            // Note: We register the handler globally on the client since RealtimeChannelManager handles the channel join
            // This works because SupabaseRealtimeClient's postgres handlers are global for the connection
            await SupabaseClient.shared.realtimeClient.onPostgresChange { [weak self] payload in
                 // Verify this update is for our room (though filter should catch it)
                 // Just trigger fetch
                 print("📨 Lobby: Received Room UPDATE from Realtime")
                 Task { [weak self] in
                     await self?.fetchFreshRoomState()
                 }
            }

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
                         try? await SupabaseClient.shared.joinRoom(roomId: room.id, userId: userId, isHost: true)
                         NSLog("✅ Host re-joined room \(room.id) in database (refreshing presence)")
                     }
                }

                // Guest needs to join room in database first
                if !isHost {
                    guard let userId = appState?.currentUserId else {
                        print("❌ Lobby: Cannot join room - no user ID")
                        return
                    }

                    // Update participantId to match actual user ID
                    self.participantId = userId.uuidString

                    do {
                        try await SupabaseClient.shared.joinRoom(roomId: room.id, userId: userId, isHost: false)
                        NSLog("✅ Guest joined room \(room.id) in database")
                    } catch {
                        // If join failed, check if it's because we're already in the room or if the room is missing
                        if room.id.hasPrefix("event_") {
                            // Check if room exists
                            let roomExists = (try? await SupabaseClient.shared.getRoomState(roomId: room.id)) != nil

                            if roomExists {
                                NSLog("ℹ️ Lobby: Join failed but room exists - assuming user already joined")
                                // Proceed as success
                            } else {
                                NSLog("⚠️ Lobby: System room missing, attempting to create: \(room.id)")
                                do {
                                    // Create the room using current user as host (technical requirement)
                                    // but keeping system name/metadata
                                    let _ = try await SupabaseClient.shared.createRoom(
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
                                    try await SupabaseClient.shared.joinRoom(roomId: room.id, userId: userId, isHost: false)
                                    NSLog("✅ Guest created and joined system room \(room.id)")
                                } catch let createError {
                                    NSLog("❌ Lobby: Failed to create system room: \(createError)")
                                    // CRITICAL FIX: Don't throw here for events!
                                    // We want to proceed to autoStartSystemEvent even if DB join fails
                                    NSLog("⚠️ Proceeding with local playback despite join failure")
                                }
                            }
                        } else {
                            throw error
                        }
                    }

                    // Refresh room state to check for active playback
                    // This prevents stale auto-start loops when returning to lobby
                    if let freshRoom = try? await SupabaseClient.shared.getRoomState(roomId: room.id) {
                        print("✅ Lobby: Refreshed room state. isPlaying: \(freshRoom.isPlaying)")
                        
                        // Auto-start for event rooms (always) or regular rooms that are already playing
                        if room.id.hasPrefix("event_") {
                            print("🎬 Event room detected - auto-starting playback")
                            autoStartSystemEvent()
                        } else if freshRoom.isPlaying {
                            print("▶️ Room already playing - auto-starting playback")
                            autoStartSystemEvent()
                        }
                    } else {
                        // Fallback to existing state if fetch fails (rare)
                        if room.id.hasPrefix("event_") {
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

                if !isHost {
                    // Guest joining - send join message via Realtime only
                    let guestName = appState?.currentUsername ?? "Guest"

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

        Task { [weak self] in
            // If we are starting the movie, DO NOT leave the room or disconnect
            // This ensures the player can take over the existing connection and DB presence
            guard let self = self else { return }
            
            if self.isStarting {
                print("🎬 Lobby: Starting movie - skipping disconnect to preserve connection and presence")
                self.isDisconnecting = false
                return
            }

            // Leave Supabase room (use current user ID, not just host ID)
            if self.isHost {
                do {
                    // Soft Close: Only hide room from public list if explicitly leaving
                    if self.isLeavingExplicitly {
                        print("🙈 Host leaving explicitly: Soft closing room \(self.room.id)")
                        // Attempt soft close (ignore failure)
                        try? await SupabaseClient.shared.setRoomVisibility(roomId: self.room.id, isPublic: false)
                        
                        // CRITICAL: Ensure we leave the room even if soft close failed
                        try await SupabaseClient.shared.leaveRoom(roomId: self.room.id, userId: UUID(uuidString: self.room.hostId)!)
                        NSLog("✅ Host Left room \(self.room.id) (Row deleted)")
                    } else {
                        print("⚠️ Lobby: Host disconnected but preserving room presence (implicit disconnect)")
                        // Logic: If app crashes/closes without explicit leave, room stays "Active" until heartbeat timeout
                        // This prevents guests from being kicked if host just rotates device/updates view
                    }
                } catch {
                    NSLog("❌ Failed to soft close/leave room: \(error)")
                }
            } else if let userId = self.appState?.currentUserId {
                do {
                    try await SupabaseClient.shared.leaveRoom(roomId: self.room.id, userId: userId)
                    NSLog("✅ Left room \(self.room.id)")
                } catch {
                    NSLog("❌ Failed to leave room: \(error)")
                }
            }

            // Reset flag after completion (though we likely won't use this instance again)
            self.isDisconnecting = false
        }
        countdownTask?.cancel()

        print("🎭 Lobby: Disconnected from room \(room.id)")
    }

    func initiateLeave() {
        print("🚪 Lobby: Explicit leave initiated")
        isLeavingExplicitly = true
        
        if isHost {
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
                try? await Task.sleep(nanoseconds: 200_000_000)
                await MainActor.run {
                    self.disconnect()
                }
            }
        } else {
             disconnect()
        }
    }

    func sendChatMessage() {
        guard !chatInput.trimmingCharacters(in: .whitespaces).isEmpty else { return }

        let messageText = chatInput
        // Always use actual user's username from AppState, with host as fallback
        let username = appState?.currentUsername ?? (isHost ? (room.hostName ?? "Host") : "Guest")

        // Debug logging to track username assignment
        NSLog("🔍 Chat message - isHost: \(isHost), appStateUsername: \(appState?.currentUsername ?? "nil"), room.hostName: \(room.hostName ?? "nil"), finalUsername: \(username)")

        // Validate user ID exists
        guard (isHost ? UUID(uuidString: room.hostId) != nil : appState?.currentUserId != nil) else {
            NSLog("⚠️ Cannot send message: No user ID")
            return
        }

        // Clear input immediately for better UX
        chatInput = ""

        // Add message locally for instant feedback (optimistic UI)
        let localMessage = ChatMessage(
            id: UUID().uuidString,
            username: username,
            text: messageText,
            timestamp: Date()
        )
        chatMessages.append(localMessage)
        trimLobbyMessages()
        NSLog("💬 Added own message locally: '\(messageText)'")

        // Send via Realtime only (no database involvement)
        Task { [weak self] in
            guard let self = self else { return }

            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: Date().timeIntervalSince1970,
                isPlaying: nil,
                senderId: self.participantId,
                chatText: messageText,
                chatUsername: username
            )

            do {
                if let manager = self.realtimeManager, await manager.isRealtimeConnected() {
                    try await manager.sendSyncMessage(syncMsg)
                    NSLog("📡 Chat message sent via Realtime only")
                } else {
                    NSLog("⚠️ Realtime not connected, message not sent")
                    // Could add user-facing error here if needed
                }
            } catch {
                NSLog("❌ Failed to send chat message via Realtime: \(error)")
                // Could add user-facing error here if needed
            }
        }

        print("💬 Lobby: Sent message via Realtime")
    }

    func toggleReady() {
        let wasReady = isReady
        isReady.toggle()

        // Get current username for logging
        let currentUsername = appState?.currentUsername ?? "Guest"
        let readyStatus = isReady ? "READY" : "NOT READY"

        NSLog("🟢 Guest '\(currentUsername)' marked as \(readyStatus) in room \(room.id)")
        NSLog("   Previous state: \(wasReady ? "Ready" : "Not Ready") → New state: \(readyStatus)")

        let messageType: LobbyMessageType = isReady ? .userReady : .userNotReady
        addMessage(messageType, userName: currentUsername)

        // Update participant ready state locally
        if let index = participants.firstIndex(where: { $0.id == participantId }) {
            participants[index].isReady = isReady
            NSLog("✅ Updated local participant ready state for \(currentUsername)")
        } else {
            NSLog("⚠️ Could not find participant with ID \(participantId) to update ready state")
        }

        // Broadcast ready state via Realtime with enhanced error handling
        Task { [weak self] in
            guard let self = self else { return }

            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: self.participantId,
                chatText: self.isReady ? "LOBBY_READY" : "LOBBY_UNREADY",
                chatUsername: currentUsername
            )

            do {
                // Check Realtime connection status first
                if let manager = self.realtimeManager, await manager.isRealtimeConnected() {
                    try await manager.sendSyncMessage(syncMsg)
                    NSLog("📡 Successfully broadcasted \(readyStatus) state via Realtime to room \(self.room.id)")
                } else {
                    NSLog("⚠️ Realtime not connected, falling back to database polling for \(readyStatus) state")
                    // Message will be delivered through database polling
                    return
                }

                // Log room-wide ready status
                let readyCount = self.participants.filter { $0.isReady }.count
                let totalCount = self.participants.count
                NSLog("👥 Room ready status updated: \(readyCount)/\(totalCount) participants ready")

            } catch RealtimeError.connectionTimeout {
                NSLog("⏰ Realtime connection timeout while broadcasting \(readyStatus) state - falling back to database")
                // Continue with database polling fallback
            } catch RealtimeError.connectionFailed {
                NSLog("❌ Realtime connection failed while broadcasting \(readyStatus) state - falling back to database")
                // Continue with database polling fallback
            } catch {
                NSLog("❌ Failed to broadcast \(readyStatus) state via Realtime: \(error)")
                NSLog("   Room: \(self.room.id), User: \(currentUsername)")
                // Continue with database polling fallback
            }
        }

        print("✓ Lobby: \(currentUsername) toggled ready to \(isReady)")
    }

    func toggleMute(participantId: String) {
        if mutedUserIds.contains(participantId) {
            mutedUserIds.remove(participantId)
            addMessage(.systemInfo, userName: "System", data: ["message": "Unmuted participant"])
        } else {
            mutedUserIds.insert(participantId)
            addMessage(.systemInfo, userName: "System", data: ["message": "Muted participant"])
        }
    }

    func kickParticipant(_ participant: Participant) {
        guard isHost else { return }

        addMessage(.userKicked, userName: participant.name)

        participants.removeAll { $0.id == participant.id }

        // Send kick command via Realtime
        Task { [weak self] in
            guard let self = self else { return }
            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: self.participantId,
                chatText: "LOBBY_KICK:\(participant.id)",
                chatUsername: "Host"
            )
            try? await self.realtimeManager?.sendSyncMessage(syncMsg)
        }

        print("🚫 Lobby: Kicked \(participant.name)")
    }

    func startMovie(appState: AppState) async {
        guard isHost else { return }
        guard let mediaItem = room.mediaItem else {
            NSLog("❌ Host: Cannot start playback - no media selected")
            return
        }

        NSLog("🎬 Host: Starting movie for \(participants.count) participants")
        isStarting = true
        transitionState.isStarting = true
        addMessage(.hostStarting, userName: "Host")

        // 1. Resolve and persist stream explicitly BEFORE broadcasting signal
        // This ensures guests don't fetch nil stream details
        isResolvingStream = true
        var preResolvedStream: Stream?
        do {
            preResolvedStream = try await appState.resolveAndPersistForWatchParty(
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
                await self.addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal (Realtime not ready)",
                    "reason": "Channel not ready"
                ])
            } catch {
                NSLog("⚠️ Host: Unknown Realtime error: \(error) - will use database fallback")
                await self.addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal",
                    "error": "\(error.localizedDescription)"
                ])
            }
        }

        // Database fallback: Update room state to indicate playback starting
        Task {
            do {
                try await SupabaseClient.shared.startRoomPlayback(roomId: room.id)
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
            appState.isWatchPartyHost = true
            appState.currentWatchMode = .watchParty
            appState.currentRoomId = room.id

            // CRITICAL FIX: Update AppState season/episode so Player UI shows correct title
            if let mediaItem = room.mediaItem, mediaItem.type == "series" {
                appState.selectedSeason = room.season
                appState.selectedEpisode = room.episode
                print("✅ Host: Updated AppState selection to S\(room.season ?? 0)E\(room.episode ?? 0)")
            }

            // Sync Playlist State to AppState
            if var currentRoom = appState.currentWatchPartyRoom {
                currentRoom.playlist = self.playlist
                currentRoom.currentPlaylistIndex = self.currentPlaylistIndex
                appState.currentWatchPartyRoom = currentRoom
                print("✅ Host: Synced playlist state to AppState (Index: \(self.currentPlaylistIndex))")
            }

            appState.navigateToPlayer(stream: finalStream)
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
            if var room = self.appState?.currentWatchPartyRoom {
                room.playlist = self.playlist
                room.currentPlaylistIndex = self.currentPlaylistIndex
                self.appState?.currentWatchPartyRoom = room
            }

            // Persist to Supabase
            self.updatePlaylistInDatabase()
        }
    }

    private func addMessage(_ type: LobbyMessageType, userName: String, data: [String: String]? = nil) {
        let message = LobbyMessage(
            id: UUID().uuidString,
            type: type,
            userId: participantId,
            userName: userName,
            timestamp: Date(),
            data: data
        )

        messages.append(message)
        trimLobbyMessages()
    }

    // MARK: - Realtime Message Handling

    private func handleLobbyMessage(_ syncMessage: SyncMessage) async {
        guard let chatText = syncMessage.chatText else {
            NSLog("⚠️ Received Realtime message with no chat text")
            return
        }

        // Log incoming Realtime message
        let senderInfo = syncMessage.chatUsername ?? syncMessage.senderId ?? "Unknown"
        // NSLog("📥 Received Realtime message: '\(chatText)' from \(senderInfo)") // Reduced log spam

        // MUTE CHECK: Ignore chat if user is muted
        if let senderId = syncMessage.senderId, mutedUserIds.contains(senderId), syncMessage.type == .chat, !chatText.starts(with: "LOBBY_") {
             // System messages (LOBBY_*) are never muted
             return
        }

        // Handle special lobby commands
        if chatText.starts(with: "LOBBY_") {
            if chatText == "LOBBY_JOIN" {
                // Guest joined
                if isHost {
                    let guestUsername = syncMessage.chatUsername ?? "Guest"
                    let guestId = syncMessage.senderId ?? UUID().uuidString
                    NSLog("👋 Host received: Guest '\(guestUsername)' joined room \(room.id)")
                    NSLog("   Guest ID: \(guestId), Total participants: \(participants.count + 1)")

                    // REMOVED: addMessage(.userJoined, userName: guestUsername)
                    // Reason: Presence callback handles this already. Removing to prevent double messages.

                    let guest = Participant(
                        id: guestId,
                        name: guestUsername,
                        isHost: false,
                        isReady: false,
                        joinedAt: Date()
                    )
                    participants.append(guest)

                    // Log updated room status
                    let readyCount = participants.filter { $0.isReady }.count
                    NSLog("👥 Room status after join: \(participants.count) participants, \(readyCount) ready")
                } else {
                    // Non-host received guest join notification
                    let guestUsername = syncMessage.chatUsername ?? "Guest"
                    NSLog("👋 Received: Guest '\(guestUsername)' joined room \(room.id)")
                }
            } else if chatText == "LOBBY_READY" {
                // Guest marked as ready
                if let senderId = syncMessage.senderId,
                   let index = participants.firstIndex(where: { $0.id == senderId }) {
                    let username = participants[index].name
                    participants[index].isReady = true
                    let recipientRole = isHost ? "Host" : "Guest"
                    NSLog("📡 \(recipientRole) received: '\(username)' marked as READY via Realtime")
                    NSLog("   Sender ID: \(senderId), Room: \(room.id)")

                    // Log room-wide ready status
                    let readyCount = participants.filter { $0.isReady }.count
                    let totalCount = participants.count
                    NSLog("👥 Room ready status updated: \(readyCount)/\(totalCount) participants ready")

                    addMessage(.userReady, userName: username) // RESTORED
                } else {
                    NSLog("⚠️ Received LOBBY_READY from unknown participant: \(syncMessage.senderId ?? "unknown")")
                }
            } else if chatText == "LOBBY_UNREADY" {
                // Guest marked as not ready
                if let senderId = syncMessage.senderId,
                   let index = participants.firstIndex(where: { $0.id == senderId }) {
                    let username = participants[index].name
                    participants[index].isReady = false
                    let recipientRole = isHost ? "Host" : "Guest"
                    NSLog("📡 \(recipientRole) received: '\(username)' marked as NOT READY via Realtime")
                    NSLog("   Sender ID: \(senderId), Room: \(room.id)")

                    // Log room-wide ready status
                    let readyCount = participants.filter { $0.isReady }.count
                    let totalCount = participants.count
                    NSLog("👥 Room ready status updated: \(readyCount)/\(totalCount) participants ready")

                    addMessage(.userNotReady, userName: username) // RESTORED
                } else {
                    NSLog("⚠️ Received LOBBY_UNREADY from unknown participant: \(syncMessage.senderId ?? "unknown")")
                }
            } else if chatText.starts(with: "LOBBY_KICK:") {
                // Host kicked someone
                let kickedId = chatText.replacingOccurrences(of: "LOBBY_KICK:", with: "")
                if participantId == kickedId {
                    // We were kicked - disconnect and return to browse
                    print("❌ Lobby: Kicked by host")

                    // Show alert via lobby message? Or just leave.
                    // Ideally we'd show an alert but we can't easily trigger one from VM -> View without state binding
                    // Just force leave

                    await MainActor.run {
                        self.disconnect()
                        self.appState?.currentView = .browse
                        self.appState?.restoreWindowFromLobby()
                    }
                }
            } else if chatText == "LOBBY_START_COUNTDOWN" {
                // Host started countdown
                if !isHost {
                    NSLog("🎬 Guest: Received LOBBY_START_COUNTDOWN signal")
                    isStarting = true
                    transitionState.isStarting = true
                    countdown = Int(syncMessage.timestamp)
                    addMessage(.hostStarting, userName: "Host")

                    // Guest automatically starts playback after countdown
                    Task { @MainActor [weak self] in
                        guard let self = self else { return }
                        NSLog("🎬 Guest: Received LOBBY_START_COUNTDOWN signal")

                        // CRITICAL FIX: Update lastRoomPlayingState to prevent DB polling from triggering double-start
                        self.lastRoomPlayingState = true

                        // CRITICAL: Fetch fresh room state BEFORE countdown
                        // This ensures we have correct season/episode AND don't delay playback start
                        let fetchStartTime = Date()
                        guard let roomState = try? await SupabaseClient.shared.getRoomState(roomId: room.id) else {
                            NSLog("⚠️ Guest: Failed to fetch room state, using local state")
                            // Fallback to local state
                            if let season = room.season, let episode = room.episode {
                                await MainActor.run {
                                    appState?.selectedSeason = season
                                    appState?.selectedEpisode = episode

                                    // CRITICAL FIX: Clear stale stream optimization data to force fresh resolution
                                    // If we failed to get fresh room state, the existing optimization data (URL/Hash)
                                    // likely points to the PREVIOUS episode. We must clear it to avoid playing wrong content.
                                    if var currentRoom = appState?.currentWatchPartyRoom {
                                        currentRoom.selectedStreamHash = nil
                                        currentRoom.selectedFileIdx = nil
                                        currentRoom.selectedQuality = nil
                                        currentRoom.unlockedStreamURL = nil
                                        appState?.currentWatchPartyRoom = currentRoom
                                        print("🛡️ Guest: Cleared stale stream optimization data (Fallback Mode)")
                                    }
                                }
                                NSLog("📺 Guest: Set season/episode from local state: S\(season)E\(episode)")
                            }
                            // Continue with playback even if we couldn't fetch fresh state
                            guard let mediaItem = room.mediaItem, let appState = appState else {
                                NSLog("❌ Guest: Cannot start playback - missing media or appState")
                                return
                            }
                            await appState.playMedia(
                                mediaItem,
                                quality: .fullHD,
                                watchMode: .watchParty,
                                roomId: room.id,
                                isHost: false
                            )
                            return
                        }

                        // CRITICAL: Check for media mismatch (e.g. host changed movie to show)
                        // This fixes the "Mirror" vs "Breaking Bad" issue
                        await self.updateMediaItemFromRoomState(roomState)

                        // Re-fetch mediaItem as it might have changed
                        guard let currentMediaItem = self.room.mediaItem else {
                             NSLog("❌ Guest: Media item missing after update check")
                             return
                        }

                        // Use fresh DB state (same logic as database fallback path)
                        let season = roomState.season ?? room.season
                        let episode = roomState.episode ?? room.episode

                        if var currentRoom = appState?.currentWatchPartyRoom {
                            currentRoom.season = season ?? currentRoom.season
                            currentRoom.episode = episode ?? currentRoom.episode

                            // IMPORTANT: Copy stream details from fetched roomState to appState
                            // This ensures AppState.playMedia sees the "Guest Optimization" data
                            currentRoom.selectedStreamHash = roomState.streamHash
                            currentRoom.selectedFileIdx = roomState.fileIdx
                            currentRoom.selectedQuality = roomState.quality
                            currentRoom.unlockedStreamURL = roomState.unlockedStreamUrl

                            appState?.currentWatchPartyRoom = currentRoom
                            NSLog("✅ Guest: Synced stream details from host (Hash: \(roomState.streamHash?.prefix(8) ?? "nil"))")
                        }

                        if let season = season, let episode = episode {
                            await MainActor.run {
                                appState?.selectedSeason = season
                                appState?.selectedEpisode = episode

                                // Also update local room state
                                self.room.season = season
                                self.room.episode = episode
                            }
                            NSLog("📺 Guest: Set season/episode from DB (Realtime path): S\(season)E\(episode)")
                        } else {
                            // Only warn if it's a series
                            if self.room.mediaItem?.type == "series" {
                                NSLog("⚠️ Guest: No season/episode found in DB or local state for series")
                            }
                        }

                        // NOW wait for countdown (DB fetch already done, so timing is accurate)
                        // Compensate for fetch time to ensure we start exactly 3s after signal
                        // PLUS add 0.25s buffer to match Host's UI/processing overhead
                        let fetchDuration = Date().timeIntervalSince(fetchStartTime)
                        let remainingWait = max(0, 3.25 - fetchDuration)

                        NSLog("🎬 Guest: Fetch took \(String(format: "%.3f", fetchDuration))s, waiting \(String(format: "%.3f", remainingWait))s (includes 0.25s sync buffer)")

                        if remainingWait > 0 {
                            try? await Task.sleep(nanoseconds: UInt64(remainingWait * 1_000_000_000))
                        }

                        NSLog("🎬 Guest: Starting playback after countdown")

                        // Start playback
                        guard let mediaItem = room.mediaItem else {
                            NSLog("❌ Guest: Cannot start playback - no media selected")
                            return
                        }

                        guard let appState = appState else {
                            NSLog("❌ Guest: Cannot start playback - no appState")
                            return
                        }

                        NSLog("🎬 Guest: Launching player for \(mediaItem.name)")

                        await appState.playMedia(
                            mediaItem,
                            quality: .fullHD,
                            watchMode: .watchParty,
                            roomId: room.id,
                            isHost: false
                        )

                    }
                }
            } else {
                // Unknown LOBBY command - log warning
                NSLog("⚠️ Unknown lobby command received: '\(chatText)' from \(senderInfo)")
            }
        } else if syncMessage.type == .roomClosed {
             // Host closed the room
             NSLog("🔒 Received Room Closed signal from Host")
             addMessage(.systemInfo, userName: "System", data: ["message": "Host has left the room"])
             
             addMessage(.systemInfo, userName: "System", data: ["message": "Host has left the room"])
             
             Task { @MainActor [weak self] in
                 guard let self = self else { return }
                 self.roomClosedMessage = "The host has left the room."
                 self.showRoomClosedAlert = true
                 // We don't disconnect immediately, we let the user click OK or wait for the alert dismissal
                 // The alert's dismiss button handles navigation
             }
        } else {
            // Regular chat message - add to chat UI
            // CRITICAL: Skip messages from self (already added locally when sent)
            NSLog("🔍 Chat message received - senderId: '\(syncMessage.senderId ?? "nil")', participantId: '\(participantId)'")

            if syncMessage.senderId == participantId {
                NSLog("💬 Skipping own message (already displayed locally): '\(chatText)'")
                return
            }

            NSLog("💬 Adding received message from other participant: '\(chatText)'")
            let chatMessage = ChatMessage(
                id: UUID().uuidString,
                username: syncMessage.chatUsername ?? "Unknown",
                text: chatText,
                timestamp: Date(timeIntervalSince1970: syncMessage.timestamp)
            )
            chatMessages.append(chatMessage)
            trimLobbyMessages()
            print("💬 Lobby chat received: [\(syncMessage.chatUsername ?? "Unknown")] \(chatText)")
        }
    }

    /// Keep lobby chat/messages bounded to avoid unbounded memory growth during long sessions
    private func trimLobbyMessages(maxCount: Int = 300) {
        if messages.count > maxCount {
            messages.removeFirst(messages.count - maxCount)
        }
        if chatMessages.count > maxCount {
            chatMessages.removeFirst(chatMessages.count - maxCount)
        }
    }

    private func loadMetadata() {
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

        // Poll participants every 2 seconds
        participantsPollingTask = Task { [weak self] in
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                guard let self = self else { return }
                await self.pollParticipants()
            }
        }

        // Poll room state every 2 seconds for database fallback (guests only)
        if !isHost {
            roomStatePollingTask = Task { [weak self] in
                while !Task.isCancelled {
                    try? await Task.sleep(nanoseconds: 2_000_000_000)
                    guard let self = self else { return }
                    await self.pollRoomState()
                }
            }
        }

        // Heartbeat Loop (every 30 seconds)
        // Keeps the user "active" in the room_participants table
        startHeartbeatLoop()

        // Do initial fetch immediately (no chat message polling)
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            await self.pollParticipants()
            if !isHost {
                await self.pollRoomState() // Get initial room state
            }
        }
    }

    private func startHeartbeatLoop() {
        print("💓 Lobby: Starting heartbeat loop...")
        Task { [weak self] in
            while !Task.isCancelled {
                guard let self = self else { return }

                // Send heartbeat
                if let userId = self.appState?.currentUserId {
                    do {
                        try await SupabaseClient.shared.sendHeartbeat(roomId: self.room.id, userId: userId)
                        // print("💓 Heartbeat sent") // Verbose logging disabled
                    } catch {
                        print("⚠️ Heartbeat failed: \(error)")
                    }
                }

                // Wait 30 seconds
                try? await Task.sleep(nanoseconds: 30_000_000_000)
            }
        }
    }



    private func stopPolling() {
        participantsPollingTask?.cancel()
        participantsPollingTask = nil

        roomStatePollingTask?.cancel()
        roomStatePollingTask = nil

        print("🛑 Lobby: Polling stopped (chat via Realtime only)")
    }

    private func pollParticipants() async {
        do {
            let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: room.id)

            // Convert to Participant objects
            var updatedParticipants: [Participant] = []

            for participant in roomParticipants {
                var username = "User"
                if let user = try? await SupabaseClient.shared.getUserById(userId: participant.userId) {
                    username = user.username
                }

                // Preserve existing ready state for known participants
                let existingParticipant = participants.first { $0.id == participant.userId.uuidString }
                let isReady = existingParticipant?.isReady ?? false

                let p = Participant(
                    id: participant.userId.uuidString,
                    name: username,
                    isHost: participant.isHost,
                    isReady: isReady,  // Preserve ready state from local state
                    joinedAt: participant.joinedAt
                )
                updatedParticipants.append(p)

                // If this is the current user (guest), ensure their ID matches
                if !isHost && participant.userId.uuidString == participantId {
                    NSLog("🔍 Current guest participant found in polling: \(p.name) with ID \(p.id)")
                }
            }

            // Check if participants changed
            let participantIds = Set(updatedParticipants.map { $0.id })
            let currentIds = Set(participants.map { $0.id })

            if participantIds != currentIds {
                // Someone joined or left
                let newParticipants = participantIds.subtracting(currentIds)
                let leftParticipants = currentIds.subtracting(participantIds)

                // Only add messages if realtime is NOT connected (fallback mode)
                // When realtime is connected, presence callbacks handle the messages
                let shouldAddMessages = realtimeConnectionStatus != .connected

                for newId in newParticipants {
                    if let newParticipant = updatedParticipants.first(where: { $0.id == newId }) {
                        if shouldAddMessages {
                            addMessage(.userJoined, userName: newParticipant.name)
                        }
                        NSLog("👋 \(newParticipant.name) joined room")
                    }
                }

                for leftId in leftParticipants {
                    if let leftParticipant = participants.first(where: { $0.id == leftId }) {
                        if shouldAddMessages {
                            addMessage(.userLeft, userName: leftParticipant.name)
                        }
                        NSLog("👋 \(leftParticipant.name) left room")
                    }
                }

                participants = updatedParticipants

                // CRITICAL FIX: "Presence Guarantee" (Self-Healing)
                // If I am the Host, I MUST be in the participant list.
                // If I am missing (e.g. timed out during playback), re-join immediately.
                if isHost && !isLeavingExplicitly {
                    // Check if my ID is in the list
                    let amIPresent = participants.contains(where: { $0.id == participantId })

                    if !amIPresent {
                        // Debounce/Log carefully to avoid spam, but this is critical
                        print("⚠️ Lobby: Host missing from participant list (Self-Healing activated)")

                        Task { [weak self] in
                            if let userId = UUID(uuidString: self?.participantId ?? "") {
                                guard let self = self else { return }
                                try? await SupabaseClient.shared.joinRoom(roomId: self.room.id, userId: userId, isHost: true)
                                print("✅ Lobby: Host self-healed presence in DB")
                            }
                        }
                    }
                }
            }

        } catch {
            NSLog("⚠️ Lobby: Failed to poll participants: \(error)")
        }
    }

    /// Fetch fresh room state from Supabase (Host & Guest)
    /// This ensures we have the latest playlist and room details, as AppState might be stale
    private func fetchFreshRoomState() async {
        print("🔄 Lobby: Fetching fresh room state from Supabase...")
        do {
            guard let freshRoom = try await SupabaseClient.shared.getRoomState(roomId: room.id) else {
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

                // Update AppState to keep it in sync
                appState?.currentWatchPartyRoom?.playlist = freshRoom.playlist
                appState?.currentWatchPartyRoom?.currentPlaylistIndex = freshRoom.currentPlaylistIndex ?? 0

                // CRITICAL FIX: Sync UI Metadata on Init (Fixes Art Reversion)
                // Construct MediaItem from SupabaseRoom flat properties
                var freshMedia: MediaItem? = nil
                if let imdbId = freshRoom.imdbId {
                    let type = (freshRoom.season != nil || freshRoom.episode != nil) ? "series" : "movie"
                    freshMedia = MediaItem(
                        id: imdbId,
                        type: type,
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
                       self.room.episode != freshRoom.episode {

                        // Update local room state
                        self.room.mediaItem = mediaItem
                        self.room.season = freshRoom.season
                        self.room.episode = freshRoom.episode

                        // Update UI Bindings
                        self.posterURL = mediaItem.poster
                        self.backdropURL = mediaItem.background
                        self.logoURL = mediaItem.logo // Reset logo (will be nil for DB state, triggering fetch)

                        print("✅ Lobby: Synced Initial Metadata -> \(mediaItem.name)")

                        // Trigger metadata load if assets are missing
                        if self.logoURL == nil {
                            self.loadMetadata()
                        }
                    }
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
                            try await SupabaseClient.shared.updateRoomPlaylist(
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

    /// Poll room state for database fallback (guests only)
    private func pollRoomState() async {
        // CRITICAL FIX: Don't poll/trigger if we are already starting
        guard !isStarting else { return }

        do {
            guard let roomState = try await SupabaseClient.shared.getRoomState(roomId: room.id) else {
                return
            }
            // CRITICAL FIX: Sync UI Metadata (Guest UI was not updating when Host changed item)
            // Extract values needed for UI update to avoid complex captures

            // Construct MediaItem from SupabaseRoom flat properties
            var freshMedia: MediaItem? = nil
            if let imdbId = roomState.imdbId {
                let type = (roomState.season != nil || roomState.episode != nil) ? "series" : "movie"
                freshMedia = MediaItem(
                    id: imdbId,
                    type: type,
                    name: roomState.name, // The room name is updated to content name by Host
                    poster: roomState.posterUrl,
                    background: roomState.backdropUrl,
                    logo: nil,
                    description: roomState.description,
                    releaseInfo: nil,
                    year: nil,
                    imdbRating: nil,
                    genres: nil,
                    runtime: nil
                )
            }

            let freshPlaylist = roomState.playlist
            let freshSeason = roomState.season
            let freshEpisode = roomState.episode
            let freshIndex = roomState.currentPlaylistIndex

            await MainActor.run {
                // 1. Update Media Item & UI Assets if changed
                if let mediaItem = freshMedia {
                    if self.room.mediaItem?.id != mediaItem.id ||
                       self.room.season != freshSeason ||
                       self.room.episode != freshEpisode {

                        // Update local room state
                        self.room.mediaItem = mediaItem
                        self.room.season = freshSeason
                        self.room.episode = freshEpisode

                        // Update UI Bindings
                        self.posterURL = mediaItem.poster
                        self.backdropURL = mediaItem.background
                        self.logoURL = mediaItem.logo // Reset logo (will be nil for DB state, triggering fetch)

                        NSLog("✅ Guest: Synced Metadata Update -> \(mediaItem.name)")

                        // Trigger fetch for full metadata (logo etc) if needed
                        if self.logoURL == nil {
                            self.loadMetadata()
                        }
                    }
                }

                // 2. Update Playlist & Index
                if let playlist = freshPlaylist {
                    if self.playlist.count != playlist.count || self.room.currentPlaylistIndex != freshIndex {
                        self.playlist = playlist
                        self.room.playlist = playlist
                        if let idx = freshIndex {
                            self.currentPlaylistIndex = idx
                            self.room.currentPlaylistIndex = idx
                        }
                        self.isPlaylistMode = !playlist.isEmpty
                    }
                }
            }

            // Check if room state is playing (event if it was already playing)
            if roomState.isPlaying && !isStarting {
                // CRITICAL FIX: Race Condition Check
                // 1. Check if we just finished playback (grace period)
                if let endedAt = playbackEndedTimestamp, Date().timeIntervalSince(endedAt) < 5 {
                    NSLog("🛑 Guest: Ignoring playback signal - just finished playback (Grace Period)")
                    return
                }

                // 2. Causality Check (The Reference Fix)
                // If we have a record of when we LAST finished playback, verify the DB signal is NEWER.
                // This prevents "Infinite Loop" where we act on a STALE signal from the session we just moved from.
                if let endedAt = playbackEndedTimestamp {
                    // Check if the signal is OLDER than our end time (with small buffer for clock skew)
                    if roomState.lastActivity < endedAt {
                         NSLog("🛑 Guest: Ignoring STALE playback signal (Signal Time: \(roomState.lastActivity) < Local End Time: \(endedAt))")
                         return
                    }
                    
                    // If signal is newer, it's a NEW movie. Proceed.
                }

                // 3. Check for stale "is_playing" signal (e.g. Host crashed or failed to clear DB)
                // If last_activity is old (> 60s) and we just joined, it's likely a stale flag.
                let activityAge = Date().timeIntervalSince(roomState.lastActivity)
                if activityAge > 60 {
                    NSLog("🛑 Guest: Ignoring stale playback signal (Age: \(Int(activityAge))s)")
                    return
                }

                NSLog("🎬 Guest: Detected room playback via database fallback")
                // NOTE: Don't add .hostStarting message here - guest already received it via Realtime

                // Start countdown and playback
                isStarting = true
                transitionState.isStarting = true
                countdown = 3

                Task { @MainActor [weak self] in
                    guard let self = self else { return }
                    // Wait for countdown (same duration as host)
                    for i in (1...3).reversed() {
                        self.countdown = i
                        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
                    }

                    NSLog("🎬 Guest: Starting playback after database fallback detection")

                    // Start playback
                    guard room.mediaItem != nil else {
                        NSLog("❌ Guest: Cannot start playback - no media selected")
                        return
                    }

                    guard let appState = appState else {
                        NSLog("❌ Guest: Cannot start playback - no appState")
                        return
                    }

                    // CRITICAL: Check for media mismatch (e.g. host changed movie to show)
                    await self.updateMediaItemFromRoomState(roomState)

                    // Check if room has media item
                    guard self.room.mediaItem != nil else {
                        print("⚠️ Cannot join room: No media item")
                        return
                    }

                    NSLog("🎬 Guest: Launching player via database fallback")

                    // CRITICAL FIX: Sync stream details from fresh roomState to AppState
                    // This ensures we use the HOST'S resolved stream (E02) and not the stale one (E01)
                    if var currentRoom = appState.currentWatchPartyRoom {
                        currentRoom.selectedStreamHash = roomState.streamHash
                        currentRoom.selectedFileIdx = roomState.fileIdx
                        currentRoom.selectedQuality = roomState.quality
                        currentRoom.unlockedStreamURL = roomState.unlockedStreamUrl

                        appState.currentWatchPartyRoom = currentRoom
                        NSLog("✅ Guest: Synced stream details from DB fallback (Hash: \(roomState.streamHash?.prefix(8) ?? "nil"))")
                    } else {
                        // If currentWatchPartyRoom is nil, we should try to set it if possible,
                        // or at least clear stale state if we could.
                        // But playMedia will set it up. Main risk is STALE data, which we just overwrote above.
                    }

                    // CRITICAL: Set season/episode from room BEFORE playMedia()
                    // This ensures the guest resolves the correct episode for subtitles and metadata
                    // Use roomState (fresh from DB) instead of room (local state) to ensure we have latest data
                    let season = roomState.season ?? room.season
                    let episode = roomState.episode ?? room.episode

                    if let season = season, let episode = episode {
                        await MainActor.run {
                            appState.selectedSeason = season
                            appState.selectedEpisode = episode

                            // Also update local room state
                            self.room.season = season
                            self.room.episode = episode
                        }
                        NSLog("📺 Guest: Set season/episode from DB: S\(season)E\(episode)")
                    } else {
                        // Only warn if it's a series
                        if self.room.mediaItem?.type == "series" {
                            NSLog("⚠️ Guest: No season/episode found in DB or local state for series")
                        }
                    }

                    // CRITICAL: Set resume timestamp so guest starts exactly where host is!
                    if roomState.playbackPosition > 5 {
                        await MainActor.run {
                            appState.resumeFromTimestamp = TimeInterval(roomState.playbackPosition)
                            NSLog("⏩ Guest: Pre-setting start time to host position: \(roomState.playbackPosition)s")
                        }
                    }

                    // Stop polling before transition
                    self.stopPolling()

                    await appState.playMedia(
                        self.room.mediaItem!,
                        quality: .fullHD,
                        watchMode: .watchParty,
                        roomId: room.id,
                        isHost: false
                    )
                }
            }

            // Update last known state
            lastRoomPlayingState = roomState.isPlaying

        } catch {
            NSLog("⚠️ Lobby: Failed to poll room state: \(error)")
        }
    }

    // MARK: - Helper Functions


    private func autoStartSystemEvent() {
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
        appState.eventStartTime = room.createdAt
        appState.resumeFromTimestamp = nil  // Don't use static timestamp for events

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

                await self.appState?.playMedia(
                    mediaItem,
                    quality: .fullHD,
                    watchMode: .watchParty,
                    roomId: self.room.id,
                    isHost: false // System is host, user is guest
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
    private func updateMediaItemFromRoomState(_ roomState: SupabaseRoom) async {
        // Check if IMDB ID matches
        guard let newImdbId = roomState.imdbId else { return }

        // Infer expected type from season/episode presence
        // If season/episode are present, it MUST be a series
        let expectedType = (roomState.season != nil || roomState.episode != nil) ? "series" : "movie"

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
                    // Also update poster/backdrop
                    self.posterURL = mediaItem.posterURL?.absoluteString
                    self.backdropURL = mediaItem.backgroundURL?.absoluteString
                    self.logoURL = mediaItem.logo
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
        if let appStateIndex = appState?.currentWatchPartyRoom?.currentPlaylistIndex {
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
        self.room.season = item.season
        self.room.episode = item.episode
        self.room.currentPlaylistIndex = index

        // Sync to AppState so MPVPlayerView sees it immediately if active
        if var room = self.appState?.currentWatchPartyRoom {
            room.currentPlaylistIndex = index
            self.appState?.currentWatchPartyRoom = room
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
                try await SupabaseClient.shared.updateRoomMetadata(
                    roomId: self.room.id,
                    name: item.mediaItem.name,
                    imdbId: item.mediaItem.id,
                    season: item.season,
                    episode: item.episode,
                    posterUrl: finalPoster ?? "",
                    backdropUrl: finalBackdrop ?? ""
                )

                // Also update playlist index
                try await SupabaseClient.shared.updateRoomPlaylist(
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
        if var room = self.appState?.currentWatchPartyRoom {
            room.playlist = self.playlist
            room.currentPlaylistIndex = self.currentPlaylistIndex
            self.appState?.currentWatchPartyRoom = room
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
        if var room = self.appState?.currentWatchPartyRoom {
            room.playlist = self.playlist
            room.currentPlaylistIndex = self.currentPlaylistIndex
            self.appState?.currentWatchPartyRoom = room
        }

        updatePlaylistInDatabase()
    }

    private func updatePlaylistInDatabase() {
        Task { [weak self] in
            guard let self = self else { return }
            do {
                try await SupabaseClient.shared.updateRoomPlaylist(
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
                try await SupabaseClient.shared.updateRoomPlaylist(
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


