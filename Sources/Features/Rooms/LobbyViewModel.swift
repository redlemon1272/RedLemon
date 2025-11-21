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

    // Realtime connection status for UI feedback
    @Published var realtimeConnectionStatus: RealtimeConnectionStatus = .disconnected

    private var room: WatchPartyRoom
    private let isHost: Bool
    private var participantId: String
    private var realtimeManager: RealtimeChannelManager?
    private var watchPartyManager: WatchPartyManager?
    private var countdownTimer: Timer?
    private var participantsPollingTimer: Timer?
    private var roomStatePollingTimer: Timer?
    private var lastRoomPlayingState: Bool = false
    private var isDisconnecting: Bool = false
    weak var appState: AppState?  // Weak reference to avoid retain cycle

    // Helper to track state safely across actor boundaries (specifically for deinit)
    private class TransitionState {
        var isStarting: Bool = false
    }
    private let transitionState = TransitionState()

    init(room: WatchPartyRoom, isHost: Bool) {
        self.room = room
        self.isHost = isHost
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

        // Initialize WatchPartyManager for stream synchronization
        watchPartyManager = WatchPartyManager()
        watchPartyManager?.delegate = self

        // Set up WatchPartyManager for guests to receive host stream info
        if !isHost {
            Task {
                do {
                    try await watchPartyManager?.connect(
                        roomId: room.id,
                        userId: participantId,
                        isHost: false
                    )
                    NSLog("✅ Guest: WatchPartyManager connected for stream sync")
                } catch {
                    NSLog("⚠️ Guest: Failed to connect WatchPartyManager: \(error)")
                }
            }
        }

        // Add initial join message
        if isHost {
            addMessage(.userJoined, userName: "Host")
        }
    }

    deinit {
        // Ensure all timers and realtime resources are released when the view model goes away
        // Capture values needed for cleanup
        let manager = realtimeManager
        let starting = transitionState.isStarting
        
        // Invalidate timers synchronously (safe if deinit is on main, best effort otherwise)
        countdownTimer?.invalidate()
        participantsPollingTimer?.invalidate()
        roomStatePollingTimer?.invalidate()
        
        Task {
            // Only disconnect if we're NOT starting the movie
            // If starting, we keep the connection alive for the player
            if !starting {
                await manager?.disconnect()
            }
        }
    }

    func connect() {
        print("🎭 Lobby: Connecting to room \(room.id)...")

        Task { [self] in
            do {
                // Guest needs to join room in database first
                if !isHost {
                    guard let userId = appState?.currentUserId else {
                        print("❌ Lobby: Cannot join room - no user ID")
                        return
                    }

                    // Update participantId to match actual user ID
                    self.participantId = userId.uuidString

                    try await SupabaseClient.shared.joinRoom(roomId: room.id, userId: userId, isHost: false)
                    NSLog("✅ Guest joined room \(room.id) in database")
                }

                // Initialize Realtime channel for lobby chat/signaling
                realtimeConnectionStatus = .connecting
                realtimeManager = RealtimeChannelManager(realtimeClient: RedLemon.SupabaseClient.shared.realtimeClient)

                try await realtimeManager?.setup(
                    roomId: room.id,
                    isHost: isHost,
                    userId: participantId,
                    onSync: { [weak self] syncMessage in
                        Task { @MainActor in
                            await self?.handleLobbyMessage(syncMessage)
                        }
                    }
                )

                print("✅ Lobby: Realtime connected to room \(room.id)")
                realtimeConnectionStatus = .connected

                // Set up Realtime connection state callback
                Task {
                    await realtimeManager?.setConnectionStateCallback { [weak self] state in
                        Task { @MainActor in
                            guard let self = self else { return }
                            switch state {
                            case .connected:
                                self.realtimeConnectionStatus = .connected
                            case .connecting:
                                self.realtimeConnectionStatus = .connecting
                            case .failed, .disconnected:
                                self.realtimeConnectionStatus = .disconnected
                            }
                        }
                    }
                }

                // Set up presence callback to track joins/leaves
                Task {
                    await realtimeManager?.setPresenceCallback { action, userId in
                        Task { @MainActor in
                            switch action {
                            case .join:
                                print("👤 User joined via presence: \(userId)")
                                // Presence changes will be handled by database polling
                            case .leave:
                                print("👋 User left via presence: \(userId)")
                                // Presence changes will be handled by database polling
                            }
                        }
                    }
                }

                if !isHost {
                    // Guest joining - notify everyone
                    let guestName = appState?.currentUsername ?? "Guest"
                    addMessage(.userJoined, userName: guestName)

                    // Send join message via Realtime
                    let joinMsg = SyncMessage(
                        type: .chat,
                        timestamp: 0,
                        isPlaying: nil,
                        senderId: participantId,
                        chatText: "LOBBY_JOIN",
                        chatUsername: guestName
                    )
                    try? await realtimeManager?.sendSyncMessage(joinMsg)
                }
            } catch RealtimeError.connectionFailed {
                NSLog("❌ Lobby: Realtime connection failed - will use database polling fallback")
                addMessage(.systemInfo, userName: "System", data: [
                    "message": "Realtime connection failed. Using database fallback for synchronization.",
                    "reason": "Network connection issues"
                ])
                realtimeConnectionStatus = .disconnected
            } catch RealtimeError.connectionTimeout {
                NSLog("⏰ Lobby: Realtime connection timeout - will use database polling fallback")
                addMessage(.systemInfo, userName: "System", data: [
                    "message": "Realtime connection timed out. Using database fallback for synchronization.",
                    "reason": "Connection took too long to establish"
                ])
                realtimeConnectionStatus = .disconnected
            } catch RealtimeError.channelNotReady {
                NSLog("⚠️ Lobby: Realtime channel not ready - will use database polling fallback")
                addMessage(.systemInfo, userName: "System", data: [
                    "message": "Realtime channel not ready. Using database fallback for synchronization.",
                    "reason": "Channel initialization failed"
                ])
                realtimeConnectionStatus = .disconnected
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
                        "message": "Realtime setup failed. Using database polling for synchronization.",
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

        Task {
            // If we are starting the movie, DO NOT leave the room or disconnect
            // This ensures the player can take over the existing connection and DB presence
            if isStarting {
                print("🎬 Lobby: Starting movie - skipping disconnect to preserve connection and presence")
                isDisconnecting = false
                return
            }

            // Leave Supabase room (use current user ID, not just host ID)
            if isHost {
                do {
                    try await SupabaseClient.shared.leaveRoom(roomId: room.id, userId: UUID(uuidString: room.hostId)!)
                    NSLog("✅ Left room \(room.id)")
                } catch {
                    NSLog("❌ Failed to leave room: \(error)")
                }
            } else if let userId = appState?.currentUserId {
                do {
                    try await SupabaseClient.shared.leaveRoom(roomId: room.id, userId: userId)
                    NSLog("✅ Left room \(room.id)")
                } catch {
                    NSLog("❌ Failed to leave room: \(error)")
                }
            }

            // Disconnect Realtime channel
            await realtimeManager?.disconnect()
            
            // Reset flag after completion (though we likely won't use this instance again)
            isDisconnecting = false
        }
        countdownTimer?.invalidate()

        print("🎭 Lobby: Disconnected from room \(room.id)")
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

    func kickParticipant(_ participant: Participant) {
        guard isHost else { return }

        addMessage(.userKicked, userName: participant.name)

        participants.removeAll { $0.id == participant.id }

        // Send kick command via Realtime
        Task {
            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: participantId,
                chatText: "LOBBY_KICK:\(participant.id)",
                chatUsername: "Host"
            )
            try? await realtimeManager?.sendSyncMessage(syncMsg)
        }

        print("🚫 Lobby: Kicked \(participant.name)")
    }

    func startMovie(appState: AppState) async {
        guard isHost else { return }

        NSLog("🎬 Host: Starting movie for \(participants.count) participants")
        isStarting = true
        transitionState.isStarting = true
        addMessage(.hostStarting, userName: "Host")

        var realtimeSuccess = false

        // Broadcast via Realtime with error handling
        Task {
            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: Double(countdown),
                isPlaying: nil,
                senderId: participantId,
                chatText: "LOBBY_START_COUNTDOWN",
                chatUsername: "Host"
            )
            do {
                try await realtimeManager?.sendSyncMessage(syncMsg)
                realtimeSuccess = true
                NSLog("✅ Host: Successfully broadcast LOBBY_START_COUNTDOWN via Realtime")
                NSLog("📡 Realtime delivery confirmed for \(participants.count) guests")
            } catch RealtimeError.channelNotReady {
                NSLog("⚠️ Host: Realtime channel not ready - will use database fallback")
                addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal (Realtime not ready)",
                    "reason": "Channel not ready"
                ])
            } catch RealtimeError.connectionTimeout {
                NSLog("⏰ Host: Realtime connection timeout - will use database fallback")
                addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal (Realtime timeout)",
                    "reason": "Connection timeout"
                ])
            } catch RealtimeError.connectionFailed {
                NSLog("❌ Host: Realtime connection failed - will use database fallback")
                addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal (Realtime failed)",
                    "reason": "Connection failed"
                ])
            } catch {
                NSLog("⚠️ Host: Unknown Realtime error: \(error) - will use database fallback")
                addMessage(.systemInfo, userName: "System", data: [
                    "message": "Using database fallback for start signal (Realtime error)",
                    "error": "\(error.localizedDescription)"
                ])
            }
        }

        // Database fallback: Update room state to indicate playback starting
        Task {
            do {
                try await SupabaseClient.shared.startRoomPlayback(roomId: room.id)
                NSLog("✅ Host: Set room playback state in database as fallback")
                NSLog("💾 Database delivery confirmed for start signal")

                if !realtimeSuccess {
                    addMessage(.systemInfo, userName: "System", data: [
                        "message": "✅ Start signal sent via database (Realtime unavailable)",
                        "guestCount": "\(participants.count)"
                    ])
                }
            } catch {
                NSLog("❌ Host: Failed to update room state in database: \(error)")
                addMessage(.systemError, userName: "System", data: [
                    "message": "⚠️ Warning: Both Realtime and database fallback failed for start signal",
                    "error": "\(error.localizedDescription)"
                ])
            }
        }

        // Countdown
        for i in (1...3).reversed() {
            countdown = i
            try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
        }

        // Start playback for everyone (only if media is selected)
        guard let mediaItem = room.mediaItem else {
            NSLog("❌ Host: Cannot start playback - no media selected")
            return
        }

        NSLog("🎬 Host: Launching player for \(mediaItem.name)")

        await appState.playMedia(
            mediaItem,
            quality: room.quality,
            watchMode: .watchParty,
            roomId: room.id,
            isHost: true
        )

        // After host starts playback, send stream info to guests via WatchPartyManager
        if let streamHash = room.selectedStreamHash,
           let quality = room.selectedQuality {

            Task {
                await watchPartyManager?.sendStreamSelection(
                    infoHash: streamHash,
                    fileIdx: room.selectedFileIdx,
                    quality: quality,
                    unlockedURL: room.unlockedStreamURL
                )
                NSLog("📡 Host: Sent stream selection to guests via WatchPartyManager")
                NSLog("   InfoHash: \(streamHash)")
                NSLog("   FileIdx: \(room.selectedFileIdx ?? -1)")
                NSLog("   Quality: \(quality)")
            }
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
        NSLog("📥 Received Realtime message: '\(chatText)' from \(senderInfo) in room \(room.id)")

        // Handle special lobby commands
        if chatText.starts(with: "LOBBY_") {
            if chatText == "LOBBY_JOIN" {
                // Guest joined
                if isHost {
                    let guestUsername = syncMessage.chatUsername ?? "Guest"
                    let guestId = syncMessage.senderId ?? UUID().uuidString
                    NSLog("👋 Host received: Guest '\(guestUsername)' joined room \(room.id)")
                    NSLog("   Guest ID: \(guestId), Total participants: \(participants.count + 1)")

                    addMessage(.userJoined, userName: guestUsername)
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

                    addMessage(.userReady, userName: username)
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

                    addMessage(.userNotReady, userName: username)
                } else {
                    NSLog("⚠️ Received LOBBY_UNREADY from unknown participant: \(syncMessage.senderId ?? "unknown")")
                }
            } else if chatText.starts(with: "LOBBY_KICK:") {
                // Host kicked someone
                let kickedId = chatText.replacingOccurrences(of: "LOBBY_KICK:", with: "")
                if participantId == kickedId {
                    // We were kicked - disconnect and return to browse
                    print("❌ Lobby: Kicked by host")
                    disconnect()
                    // Navigation handled by disconnect() or parent view
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
                    Task { @MainActor in
                        // Wait for countdown (same duration as host)
                        try? await Task.sleep(nanoseconds: 3_000_000_000) // 3 seconds

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
                        
                        // CRITICAL: Set season/episode from room BEFORE playMedia()
                        // This ensures the guest resolves the correct episode for subtitles and metadata
                        if let season = room.season, let episode = room.episode {
                            await MainActor.run {
                                appState.selectedSeason = season
                                appState.selectedEpisode = episode
                            }
                            NSLog("📺 Guest: Set season/episode from room: S\(season)E\(episode)")
                        }

                        await appState.playMedia(
                            mediaItem,
                            quality: room.quality,
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

        Task {
            do {
                // Fetch metadata from local API
                let metadata = try await LocalAPIClient.shared.fetchMetadata(
                    type: mediaItem.type,
                    id: mediaItem.id
                )

                // Extract poster and backdrop URLs
                await MainActor.run {
                    posterURL = metadata.posterURL
                    backdropURL = metadata.backgroundURL
                    logoURL = metadata.logoURL
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
        participantsPollingTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task { @MainActor [weak self] in
                guard let self = self else { return }
                await self.pollParticipants()
            }
        }

        // Poll room state every 2 seconds for database fallback (guests only)
        if !isHost {
            roomStatePollingTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                Task { @MainActor [weak self] in
                    guard let self = self else { return }
                    await self.pollRoomState()
                }
            }
        }

        // Do initial fetch immediately (no chat message polling)
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            await self.pollParticipants()
            if !isHost {
                await self.pollRoomState() // Get initial room state
            }
        }

        print("✅ Lobby: Polling started (chat via Realtime only)")
    }

    private func stopPolling() {
        participantsPollingTimer?.invalidate()
        participantsPollingTimer = nil

        roomStatePollingTimer?.invalidate()
        roomStatePollingTimer = nil

        print("🛑 Lobby: Polling stopped (chat via Realtime only)")
    }

    private func pollParticipants() async {
        do {
            let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: room.id)

            // Convert to Participant objects
            var updatedParticipants: [Participant] = []

            for participant in roomParticipants {
                if let user = try? await SupabaseClient.shared.getUserById(userId: participant.userId) {
                    // Preserve existing ready state for known participants
                    let existingParticipant = participants.first { $0.id == participant.userId.uuidString }
                    let isReady = existingParticipant?.isReady ?? false

                    let p = Participant(
                        id: participant.userId.uuidString,
                        name: user.username,
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
            }

            // Check if participants changed
            let participantIds = Set(updatedParticipants.map { $0.id })
            let currentIds = Set(participants.map { $0.id })

            if participantIds != currentIds {
                // Someone joined or left
                let newParticipants = participantIds.subtracting(currentIds)
                let leftParticipants = currentIds.subtracting(participantIds)

                for newId in newParticipants {
                    if let newParticipant = updatedParticipants.first(where: { $0.id == newId }) {
                        addMessage(.userJoined, userName: newParticipant.name)
                        NSLog("👋 \(newParticipant.name) joined room")
                    }
                }

                for leftId in leftParticipants {
                    if let leftParticipant = participants.first(where: { $0.id == leftId }) {
                        addMessage(.userLeft, userName: leftParticipant.name)
                        NSLog("👋 \(leftParticipant.name) left room")
                    }
                }

                participants = updatedParticipants
            }

        } catch {
            NSLog("⚠️ Lobby: Failed to poll participants: \(error)")
        }
    }

    /// Poll room state for database fallback (guests only)
    private func pollRoomState() async {
        do {
            guard let roomState = try await SupabaseClient.shared.getRoomState(roomId: room.id) else {
                return
            }

            // Check if room state changed from not playing to playing
            if !lastRoomPlayingState && roomState.isPlaying {
                NSLog("🎬 Guest: Detected room playback start via database fallback")
                addMessage(.hostStarting, userName: "Host")

                // Start countdown and playback
                isStarting = true
                transitionState.isStarting = true
                countdown = 3

                Task { @MainActor in
                    // Wait for countdown (same duration as host)
                    for i in (1...3).reversed() {
                        countdown = i
                        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second
                    }

                    NSLog("🎬 Guest: Starting playback after database fallback detection")

                    // Start playback
                    guard let mediaItem = room.mediaItem else {
                        NSLog("❌ Guest: Cannot start playback - no media selected")
                        return
                    }

                    guard let appState = appState else {
                        NSLog("❌ Guest: Cannot start playback - no appState")
                        return
                    }

                    NSLog("🎬 Guest: Launching player for \(mediaItem.name) via database fallback")
                    
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
                        NSLog("⚠️ Guest: No season/episode found in DB or local state")
                    }

                    await appState.playMedia(
                        mediaItem,
                        quality: room.quality,
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
}

// MARK: - WatchPartyManagerDelegate

extension LobbyViewModel: WatchPartyManagerDelegate {
    func watchPartyManager(_ manager: WatchPartyManager, didUpdateStream streamInfo: StreamInfo) {
        NSLog("🎬 Lobby: Received stream info from host")
        NSLog("   InfoHash: \(streamInfo.infoHash), File: \(streamInfo.fileIdx ?? -1), Quality: \(streamInfo.quality)")
        NSLog("   This guest should use host's stream when starting playback")

        // Store stream info in room for guest use
        room.selectedStreamHash = streamInfo.infoHash
        room.selectedFileIdx = streamInfo.fileIdx
        room.selectedQuality = streamInfo.quality
        room.unlockedStreamURL = streamInfo.unlockedURL
    }

    func watchPartyManager(_ manager: WatchPartyManager, didChangeConnectionState state: RealtimeConnectionState) {
        NSLog("📡 WatchPartyManager connection state changed: \(state)")
        // Update UI connection status if needed
        switch state {
        case .connected:
            // Connection is established
            break
        case .connecting:
            // Connection is being established
            break
        case .disconnected:
            // Connection was lost
            break
        case .failed:
            // Connection failed
            break
        }
    }

    func watchPartyManager(_ manager: WatchPartyManager, didReceiveSyncMessage message: SyncMessage) {
        NSLog("📡 WatchPartyManager received sync message: \(message.type)")
        // Handle sync messages from WatchPartyManager
        switch message.type {
        case .play:
            // Handle play command
            break
        case .pause:
            // Handle pause command
            break
        case .seek:
            // Handle seek command
            break
        case .playbackState:
            // Handle playback state update
            break
        case .streamSelected, .requestStream:
            // Handle stream-related messages
            break
        default:
            break
        }
    }

    func watchPartyManager(_ manager: WatchPartyManager, didUpdatePresence participants: [String: String]) {
        NSLog("👥 WatchPartyManager presence updated: \(participants)")
        // Update participants list if needed
        // This is handled by the main LobbyViewModel polling mechanism
    }

    func watchPartyManager(_ manager: WatchPartyManager, didReceiveChatMessage message: SyncMessage) {
        NSLog("💬 WatchPartyManager received chat message: \(message.chatText ?? "")")
        // Handle chat messages from WatchPartyManager
        if let chatText = message.chatText, let username = message.chatUsername {
            let chatMessage = ChatMessage(
                id: UUID().uuidString,
                username: username,
                text: chatText,
                timestamp: Date(timeIntervalSince1970: message.timestamp)
            )
            chatMessages.append(chatMessage)
        }
    }
}
