
import Foundation
import SwiftUI

// Phase 2: Extract Event Logic
// This class handles the interpretation of SyncMessages and dispatching actions to the ViewModel
@MainActor
class LobbyEventRouter: ObservableObject {
    private weak var viewModel: LobbyViewModel?

    init(viewModel: LobbyViewModel) {
        self.viewModel = viewModel
    }

    func handle(_ syncMessage: SyncMessage) async {
        guard viewModel != nil else { return }

        // Handle TYPED messages first (which might not have chatText)
        if syncMessage.type == .returnToLobby {
             // Host returned to lobby (Typed)
             await handleLobbyReturn(syncMessage)
             return
        } else if syncMessage.type == .roomClosed {
             // Host closed the room (Typed)
             await handleRoomClosed(syncMessage)
             return
        }

        guard let chatText = syncMessage.chatText else {
            // Only log warning if it's NOT a known typed message handled above
            NSLog("%@", "⚠️ Received Realtime message with no chat text (Type: \(syncMessage.type))")
            return
        }

        // REMOVED MUTE CHECK: We now allow muted messages to reach the UI (where they are masked)
        // Block check is handled inside chatManager.handleIncomingChat

        // Handle special lobby commands
        if chatText.starts(with: "LOBBY_") {
            await handleLobbyCommand(chatText, syncMessage: syncMessage)
        } else if chatText == "LOBBY_RETURN" {
             // Host returned to lobby (Legacy Text Fallback)
             await handleLobbyReturn(syncMessage)
        } else {
            // Regular chat message - add to chat UI
            handleRegularChatMessage(chatText, syncMessage: syncMessage)
        }
    }

    private func handleRegularChatMessage(_ chatText: String, syncMessage: SyncMessage) {
        guard let viewModel = viewModel else { return }

        viewModel.chatManager.handleIncomingChat(
            chatText: chatText,
            senderId: syncMessage.senderId,
            username: syncMessage.chatUsername,
            timestamp: syncMessage.timestamp,
            currentUserId: viewModel.participantId,
            mutedUserIds: viewModel.mutedUserIds,
            blockedUserIds: SocialService.shared.blockedUserIds,
            isPremium: syncMessage.isPremium ?? false,
            subscriptionExpiresAt: syncMessage.subscriptionExpiresAt
        )
    }

    private func handleRoomClosed() async {
        // Redundant empty signature - logic moved to typed handler
    }

    private func handleRoomClosed(_ syncMessage: SyncMessage? = nil) async {
        guard let viewModel = viewModel else { return }

        // FIX: Ignore Self-Echo (Host shouldn't see their own "Host Left" message)
        if let senderId = syncMessage?.senderId, senderId.caseInsensitiveCompare(viewModel.participantId) == .orderedSame {
             NSLog("🛡️ Ignoring Room Closed signal from self (Self-Echo)")
             return
        }

        NSLog("🔒 Received Room Closed signal from Host")

        // FIX: Ignore room closed messages for event rooms (they are persistent)
        if viewModel.room.type == .event {
             NSLog("⚠️ Ignoring Room Closed signal for event room: %@", viewModel.room.id)
             return
        }

        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Host has left the room"])

        // FIX: Don't show alert for the host who initiated the leave, or if we are already leaving
        if !viewModel.isHost && !viewModel.isDisconnecting {
            // Global Alert + Immediate Exit
            viewModel.appState?.activeAlert = AppState.AppAlert(
                 title: "Room Closed",
                 message: "The host has left the room."
            )

            viewModel.disconnect()
            viewModel.appState?.currentView = viewModel.room.type == .event ? .events : .rooms
            viewModel.appState?.restoreWindowFromLobby()
        }
    }

    private func handleLobbyCommand(_ chatText: String, syncMessage: SyncMessage) async {
        guard viewModel != nil else { return }

        // Sanitize command text to remove accidental whitespace/newlines
        let command = chatText.trimmingCharacters(in: .whitespacesAndNewlines)

        if command == "LOBBY_JOIN" {
            await handleLobbyJoin(syncMessage)
        } else if command == "LOBBY_READY" {
            handleLobbyReadyChange(syncMessage, isReady: true)
        } else if command == "LOBBY_UNREADY" {
            handleLobbyReadyChange(syncMessage, isReady: false)
        } else if command.hasPrefix("LOBBY_VOTE:") {
            handleLobbyVote(command, syncMessage: syncMessage, isVoting: true)
        } else if command.hasPrefix("LOBBY_UNVOTE:") {
            handleLobbyVote(command, syncMessage: syncMessage, isVoting: false)
        } else if command.starts(with: "LOBBY_KICK:") {
            await handleLobbyKick(command)
        } else if command == "LOBBY_START_COUNTDOWN" {
            await handleLobbyStartCountdown(syncMessage)
        } else if command == "LOBBY_PREPARE_PLAYBACK" || command.hasPrefix("LOBBY_PREPARE_PLAYBACK|") {
             await handleLobbyPreparePlayback(syncMessage)
        } else if command == "LOBBY_READY_FOR_PLAYBACK" {
             handleLobbyReadyForPlayback(syncMessage)
        } else if command == "LOBBY_RESOLVING" {
             await handleLobbyResolving(syncMessage)
        } else if command == "LOBBY_PLAYBACK_STARTED" {
             await handleLobbyPlaybackStarted(syncMessage)
        } else if command == "LOBBY_RETURN" {
             // Explicit handler for text-based command (Redundancy)
             await handleLobbyReturn(syncMessage)
        } else {
             // Unknown LOBBY command - log warning with detailed scalar analysis for debug
             let senderInfo = syncMessage.chatUsername ?? syncMessage.senderId ?? "Unknown"
             let scalars = command.unicodeScalars.map { String(format: "%02x", $0.value) }.joined(separator: " ")
             NSLog("⚠️ Unknown lobby command received: '%@' from %@ (Hex: %@)", command, senderInfo, scalars)
        }
    }

    private func handleLobbyJoin(_ syncMessage: SyncMessage) async {
        guard let viewModel = viewModel else { return }

        let guestUsername = syncMessage.chatUsername ?? "Guest"
        let guestId = syncMessage.senderId ?? UUID().uuidString
        let normalizedId = guestId.lowercased()

        // CRITICAL FIX: Trust LOBBY_JOIN as a source of truth for both Hosts and Guests
        // This ensures all participants see the new joiner even if Realtime presence is flaky.
        
        // 1. Mark as connected in ViewModel (Protects from Ghost Protection eviction)
        viewModel.connectedUserIds.insert(normalizedId)

        // 2. Add to participant list if missing
        if let index = viewModel.participants.firstIndex(where: { $0.id.caseInsensitiveCompare(normalizedId) == .orderedSame }) {
             NSLog("ℹ️ Participant '%@' re-joined (Already in list at index %d)", guestUsername, index)
             viewModel.participants[index].name = guestUsername
        } else {
             NSLog("👋 Received LOBBY_JOIN: '%@' joined room %@", guestUsername, viewModel.room.id)
             if viewModel.isHost {
                 NSLog("   Guest ID: %@, Total participants: %d", guestId, viewModel.participants.count + 1)
             }

             let participant = Participant(
                 id: normalizedId,
                 name: guestUsername,
                 isHost: false, // LOBBY_JOIN is always from a guest-role broadcast
                 isReady: false,
                 isPremium: syncMessage.isPremium ?? false,
                 subscriptionExpiresAt: syncMessage.subscriptionExpiresAt.flatMap { Date(timeIntervalSince1970: $0) },
                 joinedAt: Date(),
                 phxRefs: []
             )
             viewModel.participants.append(participant)
        }

        // 3. Add system message (Host and Guests)
        if viewModel.isHost {
             // Host: Ensure guest joining is logged in chat
             viewModel.chatManager.addSystemMessage(.userJoined, userName: guestUsername)
        } else {
             // Guest: Ensure other guests joining are logged (Filter out self-echo to prevent duplicates)
             if normalizedId.caseInsensitiveCompare(viewModel.participantId) != .orderedSame {
                 viewModel.chatManager.addSystemMessage(.userJoined, userName: guestUsername)
             }
        }

        // 4. Host-only logic: Sync to AppState and broadcast votes
        if viewModel.isHost {
             // Log updated room status
             let readyCount = viewModel.participants.filter { $0.isReady }.count
             NSLog("👥 Room status after join: %d participants, %d ready", viewModel.participants.count, readyCount)

             // VOTE SYNC: Re-broadcast host's current vote
             await broadcastCurrentVotes()

             // Sync participants to AppState (Security Check #90)
             await MainActor.run {
                 viewModel.appState?.player.currentWatchPartyRoom?.participants = viewModel.participants
                 NSLog("✅ Lobby: Synced participants to AppState (Count: %d)", viewModel.participants.count)
             }
        }
    }

    /// Re-broadcasts host's current vote so late joiners can sync up
    private func broadcastCurrentVotes() async {
        guard let viewModel = viewModel else { return }

        // Only broadcast our own votes (other users will broadcast theirs)
        for (itemId, voters) in viewModel.playlistVotes {
            if voters.contains(where: { $0.caseInsensitiveCompare(viewModel.participantId) == .orderedSame }) {
                let syncMsg = SyncMessage(
                    type: .chat,
                    timestamp: 0,
                    isPlaying: nil,
                    senderId: viewModel.participantId,
                    chatText: "LOBBY_VOTE:\(itemId)",
                    chatUsername: viewModel.appState?.currentUsername ?? "Host"
                )
                try? await viewModel.realtimeManager?.sendSyncMessage(syncMsg)
                NSLog("📡 Vote sync: Re-broadcasted vote for item %@ to new joiner", String(itemId.prefix(8)))
            }
        }
    }

    private func handleLobbyReadyChange(_ syncMessage: SyncMessage, isReady: Bool) {
        guard let viewModel = viewModel else { return }

        if let senderId = syncMessage.senderId,
           let index = viewModel.participants.firstIndex(where: { $0.id.caseInsensitiveCompare(senderId) == .orderedSame }) {

            // Fix: Duplicate messages (Echo check)
            // If sender is ME, I already updated my local state and added a system message.
            // So we only process logic for OTHERS.
            if senderId.caseInsensitiveCompare(viewModel.participantId) == .orderedSame {
                return
            }

            let username = viewModel.participants[index].name
            viewModel.participants[index].isReady = isReady
            let recipientRole = viewModel.isHost ? "Host" : "Guest"
            let stateStr = isReady ? "READY" : "NOT READY"

            NSLog("📡 %@ received: '%@' marked as %@ via Realtime", recipientRole, username, stateStr)
            NSLog("   Sender ID: %@, Room: %@", senderId, viewModel.room.id)

            // Log room-wide ready status
            let readyCount = viewModel.participants.filter { $0.isReady }.count
            let totalCount = viewModel.participants.count
            NSLog("👥 Room ready status updated: %d/%d participants ready", readyCount, totalCount)

            viewModel.chatManager.addSystemMessage(isReady ? .userReady : .userNotReady, userName: username, data: [:])
        } else {
            let stateStr = isReady ? "LOBBY_READY" : "LOBBY_UNREADY"
            NSLog("⚠️ Received %@ from unknown participant: %@", stateStr, syncMessage.senderId ?? "unknown")
        }
    }

    private func handleLobbyVote(_ chatText: String, syncMessage: SyncMessage, isVoting: Bool) {
        guard let viewModel = viewModel,
              let senderId = syncMessage.senderId else { return }

        // Don't process our own votes (we already updated locally)
        if senderId.caseInsensitiveCompare(viewModel.participantId) == .orderedSame {
            return
        }

        let prefix = isVoting ? "LOBBY_VOTE:" : "LOBBY_UNVOTE:"
        let itemId = String(chatText.dropFirst(prefix.count))

        // SINGLE VOTE ENFORCEMENT: Remove sender's vote from any other item first
        if isVoting {
            for (otherItemId, var otherVotes) in viewModel.playlistVotes {
                if otherItemId != itemId && otherVotes.contains(senderId) {
                    otherVotes.remove(senderId)
                    viewModel.playlistVotes[otherItemId] = otherVotes
                }
            }
        }

        var votes = viewModel.playlistVotes[itemId] ?? Set<String>()
        if isVoting {
            votes.insert(senderId)
        } else {
            votes.remove(senderId)
        }
        viewModel.playlistVotes[itemId] = votes

        let action = isVoting ? "voted for" : "unvoted from"
        let username = syncMessage.chatUsername ?? "User"
        NSLog("👍 Received: %@ %@ playlist item %@", username, action, String(itemId.prefix(8)))

        let itemTitle = viewModel.playlist.first(where: { $0.id == itemId })?.displayTitle ?? "a video"
        viewModel.chatManager.addSystemMessage(isVoting ? .userVoted : .userUnvoted, userName: username, data: ["title": itemTitle])
    }

    private func handleLobbyKick(_ chatText: String) async {
        guard let viewModel = viewModel else { return }

        // Robust parsing: Remove prefix then trim whitespace
        let kickedIdRaw = chatText.replacingOccurrences(of: "LOBBY_KICK:", with: "")
        let kickedId = kickedIdRaw.trimmingCharacters(in: .whitespacesAndNewlines)

        // Case-insensitive comparison to prevent mismatches
        if viewModel.participantId.caseInsensitiveCompare(kickedId) == .orderedSame {
            // We were kicked - disconnect and return to browse
            print("❌ Lobby: Kicked by host (ID Match: \(kickedId))")

            await MainActor.run {
                // Show GLOBAL alert (persists after view change)
                viewModel.appState?.activeAlert = AppState.AppAlert(
                    title: "Kicked",
                    message: "You have been kicked from the room."
                )

                // Trigger disconnect and return to rooms
                viewModel.disconnect()
                viewModel.appState?.currentView = viewModel.room.type == .event ? .events : .rooms
                viewModel.appState?.restoreWindowFromLobby()
            }
        }
    }

    private func handleLobbyStartCountdown(_ syncMessage: SyncMessage) async {
        guard let viewModel = viewModel else { return }

        if !viewModel.isHost {
            // CRITICAL FIX: Ignore start signals for system events
            // Events are driven by wall-clock time (autoStartSystemEvent() in VM)
            // Receiving a LOBBY_START_COUNTDOWN for an event is usually a race condition
            // from a "Virtual Host" or a bug, and it yanks users into player prematurely.
            if viewModel.room.type == .event {
                NSLog("🛡️ Guest: Ignoring LOBBY_START_COUNTDOWN for system event. Relying on local sync.")
                return
            }

            NSLog("🎬 Guest: Received LOBBY_START_COUNTDOWN signal")
            viewModel.isStarting = true
            // viewModel.transitionState.isStarting = true // Access control issue likely, check if needed
            viewModel.countdown = Int(syncMessage.timestamp)

            // Start message is now handled in handleGuestStartLogic after state sync
            // to ensure correct media type (Episode vs Movie) is displayed.

            // Guest automatically starts playback after countdown
            // We delegate this complex logic back to ViewModel or handle locally using VM public methods
            // For now, delegating back to VM's logic via a new public method or replicate logic here using exposed properties

            // Replicating logic here requires access to many VM properties
            await handleGuestStartLogic(timestamp: syncMessage.timestamp)
        }
    }

    private func handleLobbyReturn(_ syncMessage: SyncMessage) async {
        guard let viewModel = viewModel else { return }

        // CRITICAL FIX: Ignore lobby return for System Events
        if viewModel.room.type == .event {
            NSLog("🛡️ Guest: Ignoring LOBBY_RETURN for system event")
            return
        }

        NSLog("🎬 Guest: Received LOBBY_RETURN signal from Host")

        // FIX: Ignore Self-Echo (Security Check #95) - Don't process return signal from self
        if let senderId = syncMessage.senderId, senderId.caseInsensitiveCompare(viewModel.participantId) == .orderedSame {
             NSLog("🛡️ Ignoring LOBBY_RETURN from self (Self-Echo)")
             return
        }

        // CRITICAL FIX: Mark all users as transitioning to prevent false "user left" messages
        // during the Realtime connection reset that occurs when returning to lobby.
        viewModel.presenceManager.markAllUsersAsTransitioning()

        // Add a system message
        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Host returned to lobby"])

        await MainActor.run {
            // RACE CONDITION FIX: Flag next connect() to wait for DB propagation
            viewModel.shouldDelayConnectAfterLobbyReturn = true

            // If the guest is currently in the player, switch back to lobby
            // We check if currentView is player (or if we are simply not in lobby?)
            if viewModel.appState?.currentView == .player {
                NSLog("🔄 Guest: Switching from Player to Lobby due to host return")
                viewModel.appState?.currentView = .watchPartyLobby

                // CRITICAL FIX: Ensure playback state is marked as ended locally
                // This resets isReady, canAutoJoin, and sets endedAt timestamp for causality checks
                viewModel.markPlaybackEnded()
            }
        }
    }

    private func handleGuestStartLogic(timestamp: Double) async {
        guard let viewModel = viewModel else { return }

        NSLog("🎬 Guest: Received LOBBY_START_COUNTDOWN signal processing")

        // CRITICAL FIX: Update lastRoomPlayingState to prevent DB polling from triggering double-start
        viewModel.lastRoomPlayingState = true

        // CRITICAL: Fetch fresh room state BEFORE countdown
        let fetchStartTime = Date()
        guard let roomState = try? await SupabaseClient.shared.getRoomState(roomId: viewModel.room.id) else {
            NSLog("⚠️ Guest: Failed to fetch room state, using local state")
            // Fallback to local state
            if let season = viewModel.room.season, let episode = viewModel.room.episode {
                await MainActor.run {
                    viewModel.appState?.selectedSeason = season
                    viewModel.appState?.selectedEpisode = episode

                    // CRITICAL FIX: Clear stale stream optimization data
                    if var currentRoom = viewModel.appState?.player.currentWatchPartyRoom {
                        currentRoom.selectedStreamHash = nil
                        currentRoom.selectedFileIdx = nil
                        currentRoom.selectedQuality = nil
                        currentRoom.unlockedStreamURL = nil
                        viewModel.appState?.player.currentWatchPartyRoom = currentRoom
                        print("🛡️ Guest: Cleared stale stream optimization data (Fallback Mode)")
                    }
                }
                NSLog("📺 Guest: Set season/episode from local state: S%dE%d", season, episode)
            }
            // Continue with playback even if we couldn't fetch fresh state
            guard let mediaItem = viewModel.room.mediaItem, let appState = viewModel.appState else {
                NSLog("❌ Guest: Cannot start playback - missing media or appState")
                return
            }
            // Use local room hash if available for direct unlock optimization
            let fallbackHash = viewModel.appState?.player.currentWatchPartyRoom?.selectedStreamHash
            await appState.player.playMedia(
                mediaItem,
                quality: .fullHD,
                watchMode: .watchParty,
                roomId: viewModel.room.id,
                isHost: false,
                preferredStreamHash: fallbackHash  // v1.0.83: Direct unlock optimization
            )
            return
        }

        // CRITICAL: Check for media mismatch
        await viewModel.updateMediaItemFromRoomState(roomState) // Requires this to be internal

        // Re-fetch mediaItem as it might have changed
        // Check if item exists in playlist
        guard viewModel.room.mediaItem != nil else {
            NSLog("⚠️ prepareNextItem: No media item in room")
            return
        }

        // Use fresh DB state
        let season = roomState.season ?? viewModel.room.season
        let episode = roomState.episode ?? viewModel.room.episode

        // Guarantee we have a room object to update
        var targetRoom = viewModel.appState?.player.currentWatchPartyRoom ?? viewModel.room

        targetRoom.season = season ?? targetRoom.season
        targetRoom.episode = episode ?? targetRoom.episode

        // CRITICAL SYNC: Enforce host's stream details onto the guest's session
        // This ensures the Guest's PlayerViewModel sees the specific file/hash the host selected
        targetRoom.selectedStreamHash = roomState.streamHash
        targetRoom.selectedFileIdx = roomState.fileIdx
        targetRoom.selectedQuality = roomState.quality
        targetRoom.selectedStreamTitle = roomState.sourceQuality // Internal Note #91: Title fallback
        targetRoom.sourceQuality = roomState.sourceQuality // Explicitly sync to both for safety

        // CRITICAL FIX: Sync latest participants for "Silent Join" Fix (Security Check #90)
        // Ensure the Guest's player has the full list of participants so syncExistingParticipantsToChat() works.
        targetRoom.participants = viewModel.participants

        // FIX (v1.0.80): Do NOT copy host's unlockedStreamURL!
        // Real-Debrid URLs are IP-locked to the user who unlocked them.
        // If we copy the host's URL, the guest's playback will hit EOF immediately
        // because RD rejects requests from non-owner IPs.
        // The guest will resolve their own URL using streamHash in playMedia().
        targetRoom.unlockedStreamURL = nil

        // Push update to AppState
        viewModel.appState?.player.currentWatchPartyRoom = targetRoom

        NSLog("✅ Guest: Synced stream info from Host (Hash: %@) - URL cleared for fresh unlock", String(roomState.streamHash?.prefix(8) ?? "nil"))

        // FIX (v1.0.81): CRITICAL - Also clear preResolvedStream!
        // preloadStream() cached the host's RD URL during LOBBY_PREPARE_PLAYBACK.
        // Clearing preResolvedStream forces playMedia() to call resolveStream()
        // which gets a FRESH download link for the guest.
        viewModel.appState?.player.preResolvedStream = nil
        NSLog("🛡️ Guest: preResolvedStream cleared to force fresh RD link")

        // FIX (v1.0.82): CRITICAL - Also clear RealDebridClient's in-memory cache!
        // The RD client caches unlock results for 60 minutes. When the host preloaded,
        // their URL was cached. If we don't clear it, playMedia() calls unlock() again,
        // which returns the CACHED host URL instead of generating a fresh one.
        // This is the REAL root cause of the EOF issue.
        if let hash = roomState.streamHash {
            Task {
                await RealDebridClient.shared.clearCache(forHash: hash)
                NSLog("🗑️ Guest: RD cache cleared for hash: %@...", String(hash.prefix(8)))
            }
        }

        // Also ensure currentRoomId is set so PlayerVM knows we are in a room
        viewModel.appState?.player.currentRoomId = viewModel.room.id

        // CRITICAL FIX: Ghost Stream Loop (v2)
        // We must cache the session ID NOW so that when the guest returns to the lobby,
        // the idempotency check knows this session has already been played.
        // We use ONLY the streamHash (not lastActivity) because lastActivity updates constantly during playback.
        let sessionId = roomState.streamHash ?? ""
        await MainActor.run {
            if !sessionId.isEmpty {
                viewModel.lastAutoStartedSessionId = sessionId
                print("📝 Guest: Marked session as started (Idempotency Lock): \(sessionId.prefix(8))")
            }
        }

        // Show start message to Guest (now that we have valid media type)
        let type = viewModel.room.mediaItem?.type.lowercased() ?? "movie"
        var msg = "Host is starting the media..."
        if type == "series" {
            msg = "Host is starting the episode..."
        } else if type == "movie" {
            msg = "Host is starting the movie..."
        }
        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": msg])

        if let season = season, let episode = episode {
            await MainActor.run {
                viewModel.appState?.selectedSeason = season
                viewModel.appState?.selectedEpisode = episode

                // Also update local room state
                viewModel.room.season = season
                viewModel.room.episode = episode
            }
            NSLog("📺 Guest: Set season/episode from DB (Realtime path): S%dE%d", season, episode)
        } else {
            // Only warn if it's a series
            if viewModel.room.mediaItem?.type == "series" {
                NSLog("⚠️ Guest: No season/episode found in DB or local state for series")
            }
        }

        // NOW wait for countdown
        let fetchDuration = Date().timeIntervalSince(fetchStartTime)
        // Adjust wait time based on countdown timestamp relative to now if possible,
        // but here we just rely on the '3' from the message minus fetch time.
        // We add a visual countdown loop here.

        // Total wait time: 3.25 seconds total wait (from resolve start) to ensure host has buffer
        let remainingWait = max(0, 3.25 - fetchDuration)
        NSLog("⏱️ Step 3: Artificial Delay - Waiting additional %.2fs to ensure Host buffer...", remainingWait)
        let startCount = 3

        Task { @MainActor in
            viewModel.countdown = startCount
            viewModel.isStarting = true // Ensure UI shows it
        }

        // Loop roughly every second to update UI
        for i in 0..<startCount {
             let remaining = startCount - i
             await MainActor.run { viewModel.countdown = remaining }

             // Sleep 1s (or partial for last frame)
             try? await Task.sleep(nanoseconds: 1_000_000_000)
        }

        // Final sync wait if needed (though loop is approx 3s)
        // We just proceed now.

        NSLog("🎬 Guest: Fetch took %@s, finished countdown loop", String(format: "%.3f", fetchDuration))

        // Final validation: Room still exists and is still playing?
        // (Prevent race condition where host stopped while guest was counting down)
        if let roomCheck = try? await SupabaseClient.shared.getRoomState(roomId: viewModel.room.id) {
            if !roomCheck.isPlaying {
                NSLog("🛑 Guest: Host stopped playing during countdown - aborting playback")
                await MainActor.run {
                    viewModel.isStarting = false
                    // viewModel.transitionState.isStarting = false
                }
                return
            }
        }

        NSLog("🎬 Guest: Countdown finished. Waiting for Host PLAYBACK_STARTED signal...")

        // RACE CONDITION FIX: Do NOT start playback yet.
        // Wait for LOBBY_PLAYBACK_STARTED to ensure Host has successfully entered the player.
        // This prevents the Guest from starting before the Host and being returned to lobby.
        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Waiting for host to start playback..."])
    }

    private func handleLobbyPlaybackStarted(_ syncMessage: SyncMessage) async {
        guard let viewModel = viewModel else { return }

        // Host has already started; Guests only.
        if viewModel.isHost { return }

        // Ignore for events (Auto-start handles it)
        if viewModel.room.type == .event {
            NSLog("🛡️ Guest: Ignoring LOBBY_PLAYBACK_STARTED for system event")
            return
        }

        guard let appState = viewModel.appState,
              let mediaItem = viewModel.room.mediaItem else {
            NSLog("❌ Cannot start playback - no appState or mediaItem")
            return
        }

        // Use the stream hash and title that was synced in handleLobbyPreparePlayback
        let preferredHash = appState.player.currentWatchPartyRoom?.selectedStreamHash
        let preferredTitle = appState.player.currentWatchPartyRoom?.selectedStreamTitle
        let preferredProvider = appState.player.currentWatchPartyRoom?.selectedProvider ?? appState.player.currentWatchPartyRoom?.sourceQuality

        logging("🎬 Guest: Launching player for %@ (Synced Start: Hash=%@, Title=%@, Provider=%@)", mediaItem.name, preferredHash ?? "nil", preferredTitle ?? "nil", preferredProvider ?? "nil")

        await appState.player.playMedia(
            mediaItem,
            quality: .fullHD,
            watchMode: .watchParty,
            roomId: viewModel.room.id,
            isHost: false,
            isEvent: false,
            triggerSource: "watch_party_sync_signal",
            preferredStreamHash: preferredHash,
            preferredStreamTitle: preferredTitle,
            preferredStreamProvider: preferredProvider
        )
    }

    private func logging(_ format: String, _ args: CVarArg...) {
        NSLog(String(format: format, arguments: args))
    }

    private func handleLobbyReadyForPlayback(_ syncMessage: SyncMessage) {
        guard let viewModel = viewModel, viewModel.isHost, let senderId = syncMessage.senderId else { return }
        viewModel.markStreamReady(participantId: senderId)
    }

    private func handleLobbyPreparePlayback(_ syncMessage: SyncMessage) async {
        guard let viewModel = viewModel, !viewModel.isHost else { return }

        // Ignore for events (Auto-start handles it)
        if viewModel.room.type == .event { return }

        let chatText = syncMessage.chatText ?? ""
        NSLog("🎬 Guest: Received PREPARE signal: %@", chatText)
        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Host is preparing playback..."])

        // 1. Extract Metadata from Payload (Fast Path)
        // Payload: LOBBY_PREPARE_PLAYBACK|<Hash>|<FileIdx>|<Title>|<Quality>|<Size>|<Provider>
        var targetHash: String?
        var targetTitle: String?
        var targetQuality: String?
        var targetSize: String?
        var targetProvider: String?
        // var targetFileIdx: Int? // Unused for resolution, used for validation if needed

        let parts = chatText.components(separatedBy: "|")
        if parts.count >= 2 {
            targetHash = parts[1]
            if targetHash?.isEmpty == true { targetHash = nil }
            NSLog("✅ Guest: Extracted Hash from Payload: %@", targetHash ?? "nil")
        }
        
        if parts.count >= 4 {
            targetTitle = parts[3]
            targetQuality = parts[4]
            if targetTitle?.isEmpty == true { targetTitle = nil }
            if targetQuality?.isEmpty == true { targetQuality = nil }
            NSLog("✅ Guest: Extracted Title fallback: %@ (%@)", targetTitle ?? "nil", targetQuality ?? "nil")
        }
        
        if parts.count >= 7 {
            targetSize = parts[5]
            targetProvider = parts[6]
            if targetSize?.isEmpty == true { targetSize = nil }
            if targetProvider?.isEmpty == true { targetProvider = nil }
            NSLog("✅ Guest: Extracted Identity info: Size=%@, Provider=%@", targetSize ?? "nil", targetProvider ?? "nil")
        }

        // 2. Fetch fresh room state (Fallback / Hydration)
        // We still fetch to ensure Metadata/Season/Episode is up to date
        guard let roomState = try? await SupabaseClient.shared.getRoomState(roomId: viewModel.room.id) else {
            NSLog("❌ Guest: Failed to fetch room state during prepare")
            return
        }

        // 3. Sync Media/Metadata
        await viewModel.updateMediaItemFromRoomState(roomState)

        guard let mediaItem = viewModel.room.mediaItem else { return }

        // 4. Preload Stream
        // Priority: Payload Hash > DB Hash > Unlocked URL (Direct) > Best Match (Double Fallback)
        let effectiveHash = targetHash ?? roomState.streamHash
        let effectiveTitle = targetTitle ?? roomState.sourceQuality // sourceQuality often holds title if hash is nil
        let effectiveProvider = targetProvider ?? (effectiveHash == nil ? "debrid" : nil)

        // Sync to Player State for playMedia() to inherit later
        if var room = viewModel.appState?.player.currentWatchPartyRoom {
            room.selectedStreamHash = effectiveHash
            room.selectedStreamTitle = targetTitle
            room.selectedQuality = targetQuality
            room.selectedProvider = targetProvider
            room.sourceQuality = targetTitle // Fallback for legacy UI
            viewModel.appState?.player.currentWatchPartyRoom = room
            NSLog("✅ Guest: Synced host metadata to Room State: Hash=%@, Title=%@, Provider=%@", effectiveHash ?? "nil", targetTitle ?? "nil", targetProvider ?? "nil")
        }

        do {
            // DEBUG: Check if appState is available
            guard let player = viewModel.appState?.player else {
                NSLog("❌ Guest: CRITICAL - viewModel.appState?.player is nil! Cannot preload stream.")
                return
            }

            try await player.preloadStream(
                mediaItem: mediaItem,
                quality: .fullHD,
                streamHash: effectiveHash,
                season: roomState.season,
                episode: roomState.episode,
                preferredTitle: effectiveTitle,
                preferredProvider: effectiveProvider
            )

            // DEBUG: Log the URL that was preloaded
            if let preloadedURL = player.preResolvedStream?.url {
                NSLog("✅ Guest: Stream preloaded with URL: %@", String(preloadedURL.prefix(80)))
            } else {
                NSLog("⚠️ Guest: preResolvedStream or URL is nil after preload!")
            }

            // 5. Report Ready
            NSLog("✅ Guest: Stream preloaded. Sending READY signal.")
            let readyMsg = SyncMessage(
                type: .chat,
                timestamp: Date().timeIntervalSince1970,
                isPlaying: nil,
                senderId: viewModel.participantId,
                chatText: "LOBBY_READY_FOR_PLAYBACK",
                chatUsername: viewModel.appState?.currentUsername
            )
            try? await viewModel.realtimeManager?.sendSyncMessage(readyMsg)

        } catch {
             NSLog("%@", "❌ Guest: Failed to preload stream: \(error)")
             viewModel.chatManager.addSystemMessage(.systemError, userName: "System", data: ["message": "Failed to prepare stream", "error": error.localizedDescription])
        }
    }
    private func handleLobbyResolving(_ syncMessage: SyncMessage) async {
        guard let viewModel = viewModel, !viewModel.isHost else { return }

        // Ignore for events
        if viewModel.room.type == .event { return }

        NSLog("🎬 Guest: Received RESOLVING signal")
        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Host is resolving stream..."])
    }
}
