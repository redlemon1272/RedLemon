
import Foundation
import SwiftUI

// Phase 3: Extract Presence Logic
@MainActor
class LobbyPresenceManager: ObservableObject {
    private weak var viewModel: LobbyViewModel?

    // Tasks
    private var participantsPollingTask: Task<Void, Never>?
    private var heartbeatTask: Task<Void, Never>? // Replaces 'startHeartbeatLoop' inline task
    private var isPresenceSetup = false // Guard against duplicate observer registration
    private var pendingLeaveTasks: [String: Task<Void, Never>] = [:] // Deduping leave events

    // Return-to-Lobby Transition Tracking
    // When host returns group to lobby, Realtime connections reset. This causes false presence_leave events.
    // We track users who are transitioning to suppress false "user left" messages during this window.
    private var transitioningUsers: Set<String> = []
    private var transitionExpiryDate: Date?

    init(viewModel: LobbyViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Return-to-Lobby Transition Tracking

    /// Call this when returning to lobby to prevent false "user left" messages
    /// during the Realtime connection reset.
    func markAllUsersAsTransitioning() {
        guard let viewModel = viewModel else { return }
        // Mark all current participants as transitioning
        transitioningUsers = Set(viewModel.participants.map { $0.id.lowercased() })
        // Set expiry date 60 seconds from now
        transitionExpiryDate = Date().addingTimeInterval(60)
        NSLog("🔄 Lobby: Marked %d users as transitioning (return-to-lobby)", transitioningUsers.count)
    }

    /// Check if a user is currently transitioning (returning to lobby)
    /// Also clears expired transitions
    private func isUserTransitioning(_ userId: String) -> Bool {
        // Check if transition window has expired
        if let expiry = transitionExpiryDate, Date() > expiry {
            if !transitioningUsers.isEmpty {
                NSLog("✅ Lobby: Transition window expired, clearing %d transitioning users", transitioningUsers.count)
                transitioningUsers.removeAll()
                transitionExpiryDate = nil
            }
            return false
        }
        return transitioningUsers.contains(userId.lowercased())
    }

    // MARK: - Update Buffering (Security Check #50 Defense)
    private var pendingJoins: [Participant] = []
    private var pendingLeaves: Set<String> = []
    private var flushTask: Task<Void, Never>?
    private let flushInterval: UInt64 = 500_000_000 // 500ms

    private func scheduleFlush() {
        if flushTask == nil {
            flushTask = Task { @MainActor [weak self] in
                try? await Task.sleep(nanoseconds: self?.flushInterval ?? 500_000_000)
                self?.flushUpdates()
                self?.flushTask = nil
            }
        }
    }

    private func flushUpdates() {
        guard let viewModel = viewModel else { return }

        // 1. Process Leaves first
        if !pendingLeaves.isEmpty {
            viewModel.participants.removeAll { participant in
                if pendingLeaves.contains(participant.id) {
                    // Double check grace period (in case they rejoined during buffer)
                    let timeSinceJoin = Date().timeIntervalSince(participant.joinedAt)
                    if timeSinceJoin > 1.0 {
                         return true
                    }
                }
                return false
            }

            // Log System Message for Leaves (Batched?)
            // For now, simple loop is fine as leaves are less frequent than joins
            for _ in pendingLeaves {
                // Determine name from deleted participants? Too late.
                // We'll rely on the original leave event trigger for logs if needed,
                // but ChatManager handles messages.
                // Actually, existing logic logged immediately.
                // Let's iterate leaves to log? N/A - we don't have names anymore easily.
                // Compromise: We log "User Left" when adding to pendingLeaves because names are available then.
            }
            pendingLeaves.removeAll()
        }

        // 2. Process Joins
        if !pendingJoins.isEmpty {
            // Deduplicate pending joins against CURRENT participants
            // (in case they were already added by polling or re-join)
            var toAdd: [Participant] = []


            for newP in pendingJoins {
                // Update existing
                if let index = viewModel.participants.firstIndex(where: { $0.id == newP.id }) {
                    viewModel.participants[index] = newP
                } else {
                    toAdd.append(newP)

                }
            }

            if !toAdd.isEmpty {
                viewModel.participants.append(contentsOf: toAdd)
            }

            // DUPLICATE PREVENTION:
            // We rely on the explicit LOBBY_JOIN broadcast (handled in LobbyEventRouter.swift) for "User Joined" messages.
            // This prevents duplicate messages during connection flapping or re-syncs.

            pendingJoins.removeAll()
        }
    }

    // MARK: - Realtime Presence

    func setupPresence(realtimeManager: any RealtimeService) async {
        // CRITICAL FIX: Prevent duplicate observer registration
        // Multiple calls to setupPresence() (e.g., from double onAppear, returnToLobby transition)
        // can cause duplicate presence tracking entries and "Suppressing false User Left" messages
        guard !isPresenceSetup else {
            let roomId = viewModel?.room.id ?? "unknown"
            NSLog("ℹ️ RealtimeChannelManager: Already setup for room %@, filtering duplicate setup call.", roomId)
            return
        }
        isPresenceSetup = true

        // CRITICAL FIX: Initialize connection tracking from existing participants.
        // This handles VM recreation (Security Check #93) by ensuring the new VM knows
        // which users are already connected via Realtime.
        if let viewModel = viewModel {
            for participant in viewModel.participants {
                if !participant.phxRefs.isEmpty {
                    viewModel.connectedUserIds.insert(participant.id.lowercased())
                    NSLog("🛡️ Lobby Sync: Inherited Realtime connection for user %@", participant.id)
                }
            }
        }

        // Handle Postgres Changes (Room Deletion)
        await realtimeManager.setPostgresCallback { [weak self] payload in
            Task { @MainActor [weak self] in
                guard let self = self else { return }

                if let data = payload["data"] as? [String: Any],
                   let table = data["table"] as? String,
                   let type = data["type"] as? String,
                   table == "rooms" {

                    if type == "DELETE" {
                         NSLog("❌ Lobby: Room deleted by host (Postgres Event)")
                         guard let viewModel = self.viewModel else { return }

                         // FIX: Ignore room closed messages for event rooms (they are persistent)
                         if viewModel.room.type == .event {
                             NSLog("⚠️ Ignoring Room DELETE signal for event room: %@", viewModel.room.id)
                             return
                         }

                         // FIX: Don't show alert for the host who initiated the delete, or if we are already leaving
                         if !viewModel.isHost && !viewModel.isDisconnecting {
                             // Global Alert + Immediate Exit
                             viewModel.appState?.activeAlert = AppState.AppAlert(
                                 title: "Room Closed",
                                 message: "The host has left the room."
                             )

                             viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Room closed by host"])

                             // Exit Lobby
                             viewModel.disconnect()
                             viewModel.appState?.currentView = viewModel.room.type == .event ? .events : .rooms
                             viewModel.appState?.restoreWindowFromLobby()
                         }
                    } else if type == "UPDATE" {
                         NSLog("📨 Lobby: Received Room UPDATE from Realtime")
                         guard let viewModel = self.viewModel else { return }
                         await viewModel.fetchFreshRoomState()
                    }
                }
            }
        }


        await realtimeManager.registerObserver(id: "lobby", onPresence: { [weak self] (action: PresenceAction, userId: String, metadata: [String: Any]?) in
            _ = Task { @MainActor [weak self] in
                guard let strongSelf = self else { return }
                guard let strongViewModel: LobbyViewModel = strongSelf.viewModel else { return }

                // Update participants list
                switch action {
                case .join:
                    // RESOLVE TRUE USER ID:
                    // The `userId` param here is the Presence Ref (Connection ID), NOT the user's UUID.
                    // We must extract the actual user_id from metadata if available.
                    let metaUserId = metadata?["user_id"] as? String
                    let metaUsername = metadata?["username"] as? String

                    var normalizedID = (metaUserId ?? metaUsername ?? userId).lowercased()

                    // Documentation Security Check #47 Fix: If metadata is missing (common on sparse .leave events),
                    // resolve the true stable User ID (UUID) from our connection map.
                    if metaUserId == nil && metaUsername == nil {
                        if let resolvedParticipant = strongViewModel.participants.first(where: { $0.phxRefs.contains(userId) }) {
                            normalizedID = resolvedParticipant.id.lowercased()
                            NSLog("🛡️ Lobby: Resolved sparse presence Ref %@ to stable ID %@", userId, normalizedID)
                        }
                    }

                    // Cancel any pending leave task for this user
                    strongSelf.pendingLeaveTasks[normalizedID]?.cancel()
                    strongSelf.pendingLeaveTasks.removeValue(forKey: normalizedID)

                    // Determine if we should show a notification (New Connection)
                    // We use `connectedUserIds` to track distinct active sessions
                    let isNewConnection = !strongViewModel.connectedUserIds.contains(normalizedID)
                    if isNewConnection {
                        strongViewModel.connectedUserIds.insert(normalizedID)
                    }

                    // Check if already exists (CASE INSENSITIVE)
                    if let index = strongViewModel.participants.firstIndex(where: { $0.id.lowercased() == normalizedID }) {
                        // CRITICAL FIX: Preserve original joinedAt timestamp
                        // Do NOT update joinedAt when reconnecting via Realtime
                        // This prevents the "stale presence leave" bug where users appear to have just joined
                        // when they've actually been in the room the whole time (their connection just reset).
                        // joinedAt is only set once: when the user first joins the room.
                        strongViewModel.participants[index].phxRefs.insert(userId) // Add connection ID (Map Key)

                        // Parse metadata
                        if let username = metadata?["username"] as? String {
                            strongViewModel.participants[index].name = username
                        }
                        if let isHost = metadata?["is_host"] as? Bool {
                            strongViewModel.participants[index].isHost = isHost
                        }
                        if let isPremium = metadata?["is_premium"] as? Bool {
                            strongViewModel.participants[index].isPremium = isPremium
                        }
                        if let expiryInterval = metadata?["subscription_expires_at"] as? TimeInterval {
                            strongViewModel.participants[index].subscriptionExpiresAt = Date(timeIntervalSince1970: expiryInterval)
                        }

                        // If it's a new Realtime connection, we accept it for connection tracking.
                        // Chat Notification is handled by LOBBY_JOIN broadcast to prevent duplicates.
                    } else {
                        // New user
                        var username = "Guest"
                        var isHost = false // Default

                        // Parse metadata
                        if let name = metadata?["username"] as? String {
                            username = name
                        }
                        if let hostStatus = metadata?["is_host"] as? Bool {
                            isHost = hostStatus
                        }
                        let isPremium = metadata?["is_premium"] as? Bool ?? false
                        let expiryInterval = metadata?["subscription_expires_at"] as? TimeInterval
                        let subscriptionExpiresAt = expiryInterval.flatMap { Date(timeIntervalSince1970: $0) }

                        let newParticipant = Participant(
                            id: normalizedID,
                            name: username,
                            isHost: isHost,
                            isReady: false,
                            isPremium: isPremium,
                            subscriptionExpiresAt: subscriptionExpiresAt,
                            joinedAt: Date(),
                            phxRefs: Set([userId]) // Store Connection ID (Map Key)
                        )

                        // BUFFERED UPDATE:
                        // 1. Update immediate logic state (connectedUserIds)
                         if isNewConnection {
                            // Already done above: strongViewModel.connectedUserIds.insert(normalizedID)
                            // Queue for visual update
                            strongSelf.pendingJoins.append(newParticipant)
                            strongSelf.scheduleFlush()
                        } else {
                            // If they are just reconnecting (not new), update immediately without toast
                            // or maybe buffer this too? consistently buffer everything.
                            strongSelf.pendingJoins.append(newParticipant)
                            strongSelf.scheduleFlush()
                        }
                    }
                case .leave:
                    // RESOLVE TRUE USER ID (Same as Join)
                    let metaUserId = metadata?["user_id"] as? String
                    let metaUsername = metadata?["username"] as? String

                    let leavingPhxRef = userId
                    var normalizedID = (metaUserId ?? metaUsername ?? userId).lowercased()

                    // Documentation Security Check #47 Fix: If metadata is missing (common on sparse .leave events),
                    // resolve the true stable User ID (UUID) from our connection map.
                    if metaUserId == nil && metaUsername == nil {
                        if let resolvedParticipant = strongViewModel.participants.first(where: { $0.phxRefs.contains(userId) }) {
                            normalizedID = resolvedParticipant.id.lowercased()
                            NSLog("🛡️ Lobby: Resolved sparse leave Ref %@ to stable ID %@", leavingPhxRef, normalizedID)
                        }
                    }
                    let capturedUsername = metaUsername ?? "User"

                    // Defer leave processing to avoid false positives from metadata updates
                    let task: Task<Void, Never> = Task { @MainActor [weak self, leavingPhxRef, normalizedID, capturedUsername] in
                        // Wait 2 seconds to handle network flaps and seek-induced connection drops
                        try? await Task.sleep(nanoseconds: 2_000_000_000) // 2s (Phase 6 Tuning)

                        guard let strongSelf = self else { return }

                        // Handle task cancellation
                        if Task.isCancelled { return }
                        guard let strongViewModel: LobbyViewModel = strongSelf.viewModel else { return }

                        // CRITICAL FIX (Security Check #93): Suppress false 'User Left' from VM recreation
                        // During Double onAppear, VM1 deinits and triggers a presence leave.
                        // 3 seconds later, this code runs - but by then, VM2 is connected and the user never actually left.
                        // Check if they recently broadcast LOBBY_JOIN (within 5s). If so, this leave is a false positive.
                        if let lastJoin = strongViewModel.lastLobbyJoinBroadcast,
                           Date().timeIntervalSince(lastJoin) < 5.0 {
                            NSLog("🛡️ Lobby: Suppressing false 'User Left' - user %@ just joined %.1fs ago (VM recreation)", normalizedID, Date().timeIntervalSince(lastJoin))
                            return
                        }

                        // 1. Check against active participants list
                        if let index = strongViewModel.participants.firstIndex(where: { $0.id.lowercased() == normalizedID }) {
                            // Security Check #51: Only consider user Offline when their ref count drops to zero
                            strongViewModel.participants[index].phxRefs.remove(leavingPhxRef)

                            if strongViewModel.participants[index].phxRefs.isEmpty {
                                let name = strongViewModel.participants[index].name
                                let joinedAt = strongViewModel.participants[index].joinedAt

                                // CRITICAL FIX: Suppress false 'User Left' for users who JUST joined
                                // When user auto-joins a new event lobby, their old Realtime connection disconnects.
                                // This sends a stale 'leave' event which we must ignore if they joined recently.
                                let timeSinceJoin = Date().timeIntervalSince(joinedAt)
                                if timeSinceJoin < 5.0 {
                                    NSLog("🛡️ Lobby: Suppressing false 'User Left' for %@ - joined %.1fs ago (stale presence leave)", name, timeSinceJoin)
                                    return
                                }

                                // CRITICAL FIX: Suppress false 'User Left' during return-to-lobby transition
                                // When host returns group to lobby, Realtime connections reset. This causes temporary
                                // presence_leave events for users who are still present but reconnecting.
                                if strongSelf.isUserTransitioning(normalizedID) {
                                    NSLog("🛡️ Lobby: Suppressing false 'User Left' for %@ - user is transitioning (return-to-lobby)", name)
                                    // Don't remove them from the list - they'll reconnect shortly
                                    // If they truly left, DB polling will catch them after the transition window
                                    return
                                }

                                // 2. Final removal from UI list (via buffer)
                                strongSelf.pendingLeaves.insert(normalizedID)

                                // 💬 Log: User Left
                                strongViewModel.chatManager.addSystemMessage(.userLeft, userName: name)
                                strongSelf.scheduleFlush()

                                // 3. Update logical state IMMEDIATELY
                                strongViewModel.connectedUserIds.remove(normalizedID)
                            } else {
                                NSLog("🛡️ Lobby: User %@ remains online (Remaining Refs: %d)", normalizedID, strongViewModel.participants[index].phxRefs.count)
                            }
                        } else {
                            // User already missing from participants list (e.g. removed by DB poll)
                            // We still need to announce it if they were tracked in Realtime
                            if strongViewModel.connectedUserIds.contains(normalizedID) {
                                // CRITICAL FIX: Suppress false 'User Left' during return-to-lobby transition
                                if strongSelf.isUserTransitioning(normalizedID) {
                                    NSLog("🛡️ Lobby: Suppressing false 'User Left' for %@ - user is transitioning (return-to-lobby, missing from list)", capturedUsername)
                                    return
                                }
                                strongViewModel.chatManager.addSystemMessage(.userLeft, userName: capturedUsername)
                                NSLog("📉 User %@ left (removed from tracking, was missing from list)", normalizedID)
                            }
                            strongViewModel.connectedUserIds.remove(normalizedID)
                            strongSelf.pendingLeaves.insert(normalizedID)
                            strongSelf.scheduleFlush()
                        }

                        strongSelf.pendingLeaveTasks.removeValue(forKey: normalizedID)
                    }

                    strongSelf.pendingLeaveTasks[normalizedID]?.cancel()
                    strongSelf.pendingLeaveTasks[normalizedID] = task
                }
            }
        }, onSync: nil, onConnectionState: nil)
    }

    // MARK: - user Actions

    func toggleReady() {
        guard let viewModel = viewModel else { return }

        viewModel.isReady.toggle()

        let currentUsername = viewModel.appState?.currentUsername ?? "Guest"
        let readyStatus = viewModel.isReady ? "READY" : "NOT READY"
        let isReady = viewModel.isReady

        let messageType: LobbyMessageType = isReady ? .userReady : .userNotReady
        viewModel.chatManager.addSystemMessage(messageType, userName: currentUsername, data: [:]) // Simplified delegation

        // Update participant ready state locally
        if let index = viewModel.participants.firstIndex(where: { $0.id == viewModel.participantId }) {
            viewModel.participants[index].isReady = isReady
            NSLog("✅ Updated local participant ready state for %@", currentUsername)
        } else {
            NSLog("⚠️ Could not find participant with ID %@ to update ready state", viewModel.participantId)
        }

        // Broadcast ready state via Realtime
        Task { [weak self] in
            guard let self = self, let strongViewModel = self.viewModel else { return }

            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: strongViewModel.participantId,
                chatText: isReady ? "LOBBY_READY" : "LOBBY_UNREADY",
                chatUsername: currentUsername
            )

            do {
                if let manager = viewModel.realtimeManager, await manager.isRealtimeConnected() {
                    try await manager.sendSyncMessage(syncMsg)
                    NSLog("📡 Successfully broadcasted %@ state via Realtime to room %@", readyStatus, viewModel.room.id)
                } else {
                    NSLog("⚠️ Realtime not connected, falling back to database polling for %@ state", readyStatus)
                }

                // Log room-wide ready status
                let readyCount = viewModel.participants.filter { $0.isReady }.count
                let totalCount = viewModel.participants.count
                NSLog("👥 Room ready status updated: %d/%d participants ready", readyCount, totalCount)

            } catch {
                NSLog("❌ Failed to broadcast %@ state via Realtime: %@", readyStatus, String(describing: error))
                // Continue with database polling fallback
            }
        }

        print("✓ Lobby: \(currentUsername) toggled ready to \(isReady)")
    }

    func toggleMute(participantId: String) {
        guard let viewModel = viewModel else { return }

        if viewModel.mutedUserIds.contains(participantId) {
            NSLog("🔊 Lobby: Unmuting participant %@", participantId)
            viewModel.mutedUserIds.remove(participantId)
            viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Unmuted participant"])
        } else {
            NSLog("🔇 Lobby: Muting participant %@", participantId)
            viewModel.mutedUserIds.insert(participantId)
            viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Muted participant"])
        }
    }

    func toggleVote(for itemId: String) {
        guard let viewModel = viewModel else { return }

        let userId = viewModel.participantId
        let currentUsername = viewModel.appState?.currentUsername ?? "Guest"

        // Toggle vote locally
        var votes = viewModel.playlistVotes[itemId] ?? Set<String>()
        let isVoting = !votes.contains(userId)

        if isVoting {
            // SINGLE VOTE ENFORCEMENT: Remove vote from any other item first
            for (otherItemId, var otherVotes) in viewModel.playlistVotes {
                if otherItemId != itemId && otherVotes.contains(userId) {
                    otherVotes.remove(userId)
                    viewModel.playlistVotes[otherItemId] = otherVotes
                    NSLog("👍 Lobby: Removed previous vote from item %@ (single vote enforcement)", String(otherItemId.prefix(8)))
                }
            }
            votes.insert(userId)
        } else {
            votes.remove(userId)
        }
        viewModel.playlistVotes[itemId] = votes

        let itemTitle = viewModel.playlist.first(where: { $0.id == itemId })?.displayTitle ?? "a video"

        let action = isVoting ? "voted for" : "unvoted from"
        NSLog("👍 Lobby: %@ %@ playlist item %@", currentUsername, action, String(itemId.prefix(8)))

        // Local Echo (Security Check #61)
        viewModel.chatManager.addSystemMessage(isVoting ? .userVoted : .userUnvoted, userName: currentUsername, data: ["title": itemTitle])

        // Broadcast via Realtime
        Task { [weak self] in
            guard let self = self, let viewModel = self.viewModel else { return }

            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: viewModel.participantId,
                chatText: isVoting ? "LOBBY_VOTE:\(itemId)" : "LOBBY_UNVOTE:\(itemId)",
                chatUsername: currentUsername
            )

            do {
                if let manager = viewModel.realtimeManager, await manager.isRealtimeConnected() {
                    try await manager.sendSyncMessage(syncMsg)
                    NSLog("📡 Successfully broadcasted vote state via Realtime")
                }
            } catch {
                NSLog("❌ Failed to broadcast vote state: %@", String(describing: error))
            }
        }
    }

    func kickParticipant(_ participant: Participant) {
        guard let viewModel = viewModel, viewModel.isHost else { return }

        viewModel.chatManager.addSystemMessage(.userKicked, userName: participant.name, data: [:])
        viewModel.participants.removeAll { $0.id == participant.id }

        // Send kick command via Realtime
        Task { [weak self] in
            guard let self = self, let strongViewModel = self.viewModel else { return }

            // 1. Private Command: Kick the target user
            let kickCmd = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: strongViewModel.participantId,
                chatText: "LOBBY_KICK:\(participant.id)",
                chatUsername: "Host"
            )
            try? await strongViewModel.realtimeManager?.sendSyncMessage(kickCmd)

            // 2. Public Announcement: Inform room
            try? await Task.sleep(nanoseconds: 100_000_000) // Slight delay to ensure order
            let publicMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: strongViewModel.participantId,
                chatText: "\(participant.name) has been kicked.",
                chatUsername: "System"
            )
            try? await strongViewModel.realtimeManager?.sendSyncMessage(publicMsg)
        }

        // Kick via Database (Remove from room_participants)
        Task { [weak self] in
            guard let self = self, let strongViewModel = self.viewModel else { return }
            do {
                try await strongViewModel.dataService.leaveRoom(
                    roomId: strongViewModel.room.id,
                    userId: UUID(uuidString: participant.id) ?? UUID()
                )
                print("✅ Kicked participant \(participant.name) from database")
            } catch {
                print("❌ Failed to kick participant from database: \(error)")
            }
        }
    }

    // MARK: - Polling

    func startPolling() {
        guard viewModel != nil else { return }

        // Start Heartbeat (Host only or everyone? Logic says check appState currentUserId)
        startHeartbeatLoop()

        // OPTIMIZATION: Reduced from 2s to 5s - Realtime is primary, polling is fallback
        participantsPollingTask?.cancel()
        participantsPollingTask = Task { [weak self] in
            while !Task.isCancelled {
                guard let self = self else { return }
                await self.pollParticipants()
                try? await Task.sleep(nanoseconds: 5_000_000_000) // 5s (was 2s)
            }
        }
    }

    func stopPolling() {
        participantsPollingTask?.cancel()
        participantsPollingTask = nil

        heartbeatTask?.cancel()
        heartbeatTask = nil

        print("🛑 LobbyPresence: Polling stopped")
    }

    private func startHeartbeatLoop() {
        guard viewModel != nil else { return }
        print("💓 Lobby: Starting heartbeat loop...")

        heartbeatTask?.cancel()
        heartbeatTask = Task { [weak self] in
            while !Task.isCancelled {
                guard let self = self, let strongViewModel = self.viewModel else { return }

                if let userId = strongViewModel.appState?.currentUserId {
                    do {
                        try await strongViewModel.dataService.sendHeartbeat(roomId: strongViewModel.room.id, userId: userId)
                    } catch {
                        print("⚠️ Heartbeat failed: \(error)")
                    }
                }

                // OPTIMIZATION: 35s (was 30s) to stagger from WebSocket heartbeat
                try? await Task.sleep(nanoseconds: 35_000_000_000)
            }
        }
    }

    func pollParticipants() async {
        guard let viewModel = viewModel else { return }

        do {
            let roomParticipants = try await viewModel.dataService.getRoomParticipants(roomId: viewModel.room.id)

            var dbParticipants: [Participant] = []
            let currentParticipants = viewModel.participants
            var consumedLocalIds = Set<String>() // Track which local participants matched DB rows (by ID or Heuristic)

            for participant in roomParticipants {
                var username = "User"
                var fetchedIsPremium: Bool? = nil

                var fetchedSubscriptionExpiresAt: Date? = nil
                if let user = try? await viewModel.dataService.getUserById(userId: participant.userId) {
                    username = user.username
                    fetchedSubscriptionExpiresAt = user.subscriptionExpiresAt

                    // Validate premium status against expiration date (Client-Side Trust)
                    if let expiresAt = user.subscriptionExpiresAt {
                        fetchedIsPremium = (expiresAt > Date())
                    } else {
                        fetchedIsPremium = user.isPremium // OK
                    }
                }

                // Match DB row to local participant state
                // 1. Primary Match: UUID Case-Insensitive (Canonical Match)
                var existingLocal = currentParticipants.first(where: {
                    $0.id.caseInsensitiveCompare(participant.userId.uuidString) == .orderedSame
                })

                 // 2. Secondary Match: Name Fallback (Fix for random-ID local user)
                 if existingLocal == nil {
                      existingLocal = currentParticipants.first(where: {
                          let cleanName = $0.name.trimmingCharacters(in: .whitespacesAndNewlines)
                          let cleanTarget = username.trimmingCharacters(in: .whitespacesAndNewlines)
                          return cleanName.caseInsensitiveCompare(cleanTarget) == .orderedSame
                      })
                 }

                if let found = existingLocal {
                    consumedLocalIds.insert(found.id)
                }

                // GHOST PROTECTION:
                // If Realtime is active, only add DB participants that are also tracked in Realtime Presence.
                // This prevents stale DB heartbeat rows (which last 35s) from re-adding users who just left via Realtime.
                let isRealtimeActive = viewModel.realtimeConnectionStatus == .connected
                let isTrackingInRealtime = viewModel.connectedUserIds.contains(participant.userId.uuidString.lowercased())

                if isRealtimeActive && !isTrackingInRealtime && !participant.isHost {
                    // Skip stale row - user left Realtime but DB row is still lingering.
                    continue
                }

                // Preserve existing ready state
                let isReady = existingLocal?.isReady ?? false

                // Use the NEWER of the two joinedAt times
                let localJoinedAt = existingLocal?.joinedAt ?? Date.distantPast
                let dbJoinedAt = participant.joinedAt
                let finalJoinedAt = localJoinedAt > dbJoinedAt ? localJoinedAt : dbJoinedAt

                let p = Participant(
                    id: existingLocal?.id ?? participant.userId.uuidString.lowercased(),
                    name: username,
                    isHost: participant.isHost,
                    isReady: isReady,
                    isPremium: fetchedIsPremium ?? existingLocal?.isPremium ?? false,
                    subscriptionExpiresAt: fetchedSubscriptionExpiresAt ?? existingLocal?.subscriptionExpiresAt,
                    joinedAt: finalJoinedAt,
                    phxRefs: existingLocal?.phxRefs ?? []
                )
                dbParticipants.append(p)
            }

            // MERGE LOGIC: Combine DB participants with recent local joiners (Grace Period)
            // This prevents the polling loop from deleting a user who just joined via Realtime
            // but hasn't appeared in the DB query yet (race condition).

            var finalParticipants = dbParticipants
            let dbIds = Set(dbParticipants.map { $0.id.lowercased() })

            // Check for locally existing participants that are missing from DB AND weren't merged
            let localOnly = viewModel.participants.filter {
                !consumedLocalIds.contains($0.id) &&
                !dbIds.contains($0.id.lowercased())
            }

            for localP in localOnly {
                // Host Protection: Host logic is authoritative locally.
                // If DB temporarily misses the host (RLS/Latency), do NOT evict them.
                if localP.isHost {
                    // NSLog("🛡️ Preserving Host '\(localP.name)' despite missing from DB poll")
                    finalParticipants.append(localP)
                    continue
                }

                // CRITICAL FIX: Self Protection
                // If the local user is missing from DB results (e.g. due to RLS race or latency),
                // we MUST NOT evict ourselves. We are obviously present.
                if localP.id.caseInsensitiveCompare(viewModel.participantId) == .orderedSame {
                    // NSLog("🛡️ Preserving Self '\(localP.name)' despite missing from DB poll")
                    finalParticipants.append(localP)
                    continue
                }

                // REALTIME PROTECTION REMOVED:
                // We previously trusted Realtime to keep users in the list even if DB missed them.
                // However, this caused "Ghost/Zombie" users if Realtime missed a 'leave' event.
                // We now allow DB Polling to authoritative remove users who are gone > 3s.
                // The Realtime 'leave' event is still the primary fast-path, but DB is the garbage collector.

                let timeSinceJoin = Date().timeIntervalSince(localP.joinedAt)

                // CRITICAL FIX: Extended to 90s for events to cover observed 61.5s polling/latency.
                // 60s was just barely insufficient. 90s provides a robust buffer for 2h events.
                // ALSO: Extend grace period during return-to-lobby transition to prevent false "User Left" messages
                // when guest DB join fails due to RLS or replication lag.
                let baseGracePeriod: TimeInterval = (viewModel.room.type == .event) ? 90.0 : 3.0
                let returnToLobbyBonus: TimeInterval = viewModel.shouldDelayConnectAfterLobbyReturn ? 10.0 : 0.0
                let gracePeriod: TimeInterval = baseGracePeriod + returnToLobbyBonus

                if timeSinceJoin < gracePeriod {
                    // KEEP THEM: They joined less than N seconds ago (Grace Period)
                    // This protects against "blips" where Realtime connects before DB syncs or replication lag
                   //  NSLog("🛡️ Preserving recent joiner '\(localP.name)' (joined \(String(format: "%.1f", timeSinceJoin))s ago)")
                    finalParticipants.append(localP)
                } else if isUserTransitioning(localP.id) {
                    // CRITICAL FIX: Suppress false 'User Left' during return-to-lobby transition
                    // Guest DB presence may fail due to RLS, but they're still present via Realtime.
                    // Keep them in the list until the transition window expires.
                    // Also update their joinedAt to reset the grace period clock for future polling cycles.
                    // Participant is a struct, so create a modified copy.
                    var updatedParticipant = localP
                    updatedParticipant.joinedAt = Date()
                    finalParticipants.append(updatedParticipant)
                    NSLog("🛡️ Lobby: Preserving transitioning user '%@' (missing from DB but returning to lobby, reset joinedAt)", localP.name)
                } else {
                    // REMOVE THEM: They've been gone from DB for too long
                    // This is a legitimate "User Left" event
                    viewModel.chatManager.addSystemMessage(.userLeft, userName: localP.name, data: [:])
                    viewModel.connectedUserIds.remove(localP.id) // Ensure we track this disconnect
                    NSLog("👋 %@ left room (confirmed by DB polling - Zombie Cleanup)", localP.name)
                }
            }

            // Check for NEW DB participants (that weren't local) ensures we log joins from polling too
            let currentIds = Set(viewModel.participants.map { $0.id.lowercased() })
            for p in dbParticipants {
                if !currentIds.contains(p.id.lowercased()) {
                     // We don't log here to avoid double-logging if Realtime caught it
                     // specific logging could happen if needed
                     NSLog("👋 %@ synced from database", p.name)
                }
            }

            // Update the source of truth
            viewModel.participants = finalParticipants

            // Self-Healing
            // If Host is missing, re-join.
            if viewModel.isHost && !viewModel.isLeavingExplicitly {
                     if !dbIds.contains(viewModel.participantId.lowercased()) {
                         print("⚠️ Lobby: Host missing from DB participants list - attempting self-heal re-join")
                         if let userId = UUID(uuidString: viewModel.participantId) {
                             do {
                                 try await viewModel.dataService.joinRoom(roomId: viewModel.room.id, userId: userId, isHost: true)
                                 print("✅ Lobby: Host self-healed presence in DB")
                             } catch {
                                print("❌ Lobby: Failed to self-heal host presence: \(error)")
                                // CRITICAL FIX: Detect deleted room during self-heal
                                let errStr = String(describing: error)
                                print("🔍 Lobby: Self-Heal Error Debug: '\(errStr)'") // Trap log

                                if errStr.localizedCaseInsensitiveContains("foreign key constraint") ||
                                   errStr.localizedCaseInsensitiveContains("room_participants_room_id_fkey") {
                                     print("💀 Lobby: Room deleted during Host Self-Heal. Exiting.")
                                     await MainActor.run {
                                         viewModel.appState?.currentView = viewModel.room.type == .event ? .events : .rooms
                                         // Clear invalid room state
                                         viewModel.appState?.player.currentRoomId = nil
                                         viewModel.appState?.player.currentWatchPartyRoom = nil
                                     }
                                     viewModel.stopPolling() // Stop this loop
                                     return
                                }
                            }
                         }
                     }
                }

        } catch {
            NSLog("⚠️ Lobby: Failed to poll participants: %@", String(describing: error))
        }
    }
}
