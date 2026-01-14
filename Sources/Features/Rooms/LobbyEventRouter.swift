
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
        guard let viewModel = viewModel else { return }
        guard let chatText = syncMessage.chatText else {
            NSLog("⚠️ Received Realtime message with no chat text")
            return
        }

        // REMOVED MUTE CHECK: We now allow muted messages to reach the UI (where they are masked)
        // Block check is handled inside chatManager.handleIncomingChat

        // Handle special lobby commands
        if chatText.starts(with: "LOBBY_") {
            await handleLobbyCommand(chatText, syncMessage: syncMessage)
        } else if syncMessage.type == .returnToLobby || chatText == "LOBBY_RETURN" {
             // Host returned to lobby
             await handleLobbyReturn(syncMessage)
        } else if syncMessage.type == .roomClosed {
             // Host closed the room
             await handleRoomClosed()
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
            isPremium: syncMessage.isPremium ?? false
        )
    }

    private func handleRoomClosed() async {
        guard let viewModel = viewModel else { return }

        NSLog("🔒 Received Room Closed signal from Host")

        // FIX: Ignore room closed messages for event rooms (they are persistent)
        if viewModel.room.type == .event {
             NSLog("⚠️ Ignoring Room Closed signal for event room: \(viewModel.room.id)")
             return
        }

        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Host has left the room"])

        // FIX: Don't show alert for the host who initiated the leave
        if !viewModel.isHost {
            // Global Alert + Immediate Exit
            viewModel.appState?.activeAlert = AppState.AppAlert(
                 title: "Room Closed",
                 message: "The host has left the room."
            )

            viewModel.disconnect()
            viewModel.appState?.currentView = .browse
            viewModel.appState?.restoreWindowFromLobby()
        }
    }

    private func handleLobbyCommand(_ chatText: String, syncMessage: SyncMessage) async {
        guard let viewModel = viewModel else { return }

        if chatText == "LOBBY_JOIN" {
            await handleLobbyJoin(syncMessage)
        } else if chatText == "LOBBY_READY" {
            handleLobbyReadyChange(syncMessage, isReady: true)
        } else if chatText == "LOBBY_UNREADY" {
            handleLobbyReadyChange(syncMessage, isReady: false)
        } else if chatText.hasPrefix("LOBBY_VOTE:") {
            handleLobbyVote(chatText, syncMessage: syncMessage, isVoting: true)
        } else if chatText.hasPrefix("LOBBY_UNVOTE:") {
            handleLobbyVote(chatText, syncMessage: syncMessage, isVoting: false)
        } else if chatText.starts(with: "LOBBY_KICK:") {
            await handleLobbyKick(chatText)
        } else if chatText == "LOBBY_START_COUNTDOWN" {
            await handleLobbyStartCountdown(syncMessage)
        } else if chatText == "LOBBY_PREPARE_PLAYBACK" || chatText.hasPrefix("LOBBY_PREPARE_PLAYBACK|") {
             await handleLobbyPreparePlayback(syncMessage)
        } else if chatText == "LOBBY_READY_FOR_PLAYBACK" {
             handleLobbyReadyForPlayback(syncMessage)
        } else {
             // Unknown LOBBY command - log warning
             let senderInfo = syncMessage.chatUsername ?? syncMessage.senderId ?? "Unknown"
             NSLog("⚠️ Unknown lobby command received: '\(chatText)' from \(senderInfo)")
        }
    }

    private func handleLobbyJoin(_ syncMessage: SyncMessage) async {
        guard let viewModel = viewModel else { return }

        if viewModel.isHost {
             let guestUsername = syncMessage.chatUsername ?? "Guest"
             let guestId = syncMessage.senderId ?? UUID().uuidString
             NSLog("👋 Host received: Guest '\(guestUsername)' joined room \(viewModel.room.id)")
             NSLog("   Guest ID: \(guestId), Total participants: \(viewModel.participants.count + 1)")

             // Presence callback handles this already. Removing to prevent double messages.
             // But we add to local list just in case (though presence should sync it)
             let guest = Participant(
                 id: guestId,
                 name: guestUsername,
                 isHost: false,
                 isReady: false,
                 joinedAt: Date()
             )
             viewModel.participants.append(guest)

             // Log updated room status
             let readyCount = viewModel.participants.filter { $0.isReady }.count
             NSLog("👥 Room status after join: \(viewModel.participants.count) participants, \(readyCount) ready")

             // VOTE SYNC: Re-broadcast host's current vote so late joiners see it
             // (AI Bible Landmine #13: ephemeral state must be re-synced on join)
             await broadcastCurrentVotes()
         } else {
             // Non-host received guest join notification
             let guestUsername = syncMessage.chatUsername ?? "Guest"
             NSLog("👋 Received: Guest '\(guestUsername)' joined room \(viewModel.room.id)")
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
                NSLog("📡 Vote sync: Re-broadcasted vote for item \(itemId.prefix(8)) to new joiner")
            }
        }
    }

    private func handleLobbyReadyChange(_ syncMessage: SyncMessage, isReady: Bool) {
        guard let viewModel = viewModel else { return }

        if let senderId = syncMessage.senderId,
           let index = viewModel.participants.firstIndex(where: { $0.id == senderId }) {

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

            NSLog("📡 \(recipientRole) received: '\(username)' marked as \(stateStr) via Realtime")
            NSLog("   Sender ID: \(senderId), Room: \(viewModel.room.id)")

            // Log room-wide ready status
            let readyCount = viewModel.participants.filter { $0.isReady }.count
            let totalCount = viewModel.participants.count
            NSLog("👥 Room ready status updated: \(readyCount)/\(totalCount) participants ready")

            viewModel.chatManager.addSystemMessage(isReady ? .userReady : .userNotReady, userName: username, data: [:])
        } else {
            let stateStr = isReady ? "LOBBY_READY" : "LOBBY_UNREADY"
            NSLog("⚠️ Received \(stateStr) from unknown participant: \(syncMessage.senderId ?? "unknown")")
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
        NSLog("👍 Received: \(username) \(action) playlist item \(itemId.prefix(8))")
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

                // Trigger disconnect and return to browse
                viewModel.disconnect()
                viewModel.appState?.currentView = .browse
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
                
                // Reset player state if needed
                // viewModel.appState?.player.resetState() // If such method exists
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
                NSLog("📺 Guest: Set season/episode from local state: S\(season)E\(episode)")
            }
            // Continue with playback even if we couldn't fetch fresh state
            guard let mediaItem = viewModel.room.mediaItem, let appState = viewModel.appState else {
                NSLog("❌ Guest: Cannot start playback - missing media or appState")
                return
            }
            await appState.player.playMedia(
                mediaItem,
                quality: .fullHD,
                watchMode: .watchParty,
                roomId: viewModel.room.id,
                isHost: false
            )
            return
        }

        // CRITICAL: Check for media mismatch
        await viewModel.updateMediaItemFromRoomState(roomState) // Requires this to be internal

        // Re-fetch mediaItem as it might have changed
        guard let currentMediaItem = viewModel.room.mediaItem else {
             NSLog("❌ Guest: Media item missing after update check")
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
        targetRoom.unlockedStreamURL = roomState.unlockedStreamUrl

        // Push update to AppState
        viewModel.appState?.player.currentWatchPartyRoom = targetRoom

        NSLog("✅ Guest: Forced stream sync from Host (Hash: \(roomState.streamHash?.prefix(8) ?? "nil"))")

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
            NSLog("📺 Guest: Set season/episode from DB (Realtime path): S\(season)E\(episode)")
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

        let totalWaitTime = max(0, 3.25 - fetchDuration)

        // Visual Countdown Loop
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

        NSLog("🎬 Guest: Fetch took \(String(format: "%.3f", fetchDuration))s, finished countdown loop")

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

        NSLog("🎬 Guest: Starting playback after countdown")

        // Start playback
        guard let mediaItem = viewModel.room.mediaItem else {
            NSLog("❌ Guest: Cannot start playback - no media selected")
            await MainActor.run {
                viewModel.isStarting = false
            }
            return
        }

        guard let appState = viewModel.appState else {
            NSLog("❌ Guest: Cannot start playback - no appState")
            await MainActor.run {
                viewModel.isStarting = false
            }
            return
        }

        NSLog("🎬 Guest: Launching player for \(mediaItem.name)")

        await appState.player.playMedia(
            mediaItem,
            quality: .fullHD,
            watchMode: .watchParty,
            roomId: viewModel.room.id,
            isHost: false,
            isEvent: (viewModel.room.type == .event),
            triggerSource: "watch_party_sync"
        )
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
        NSLog("🎬 Guest: Received PREPARE signal: \(chatText)")
        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Host is preparing playback..."])

        // 1. Extract Hash/FileIdx from Payload (Fast Path)
        // Payload: LOBBY_PREPARE_PLAYBACK|<Hash>|<FileIdx>
        var targetHash: String?
        // var targetFileIdx: Int? // Unused for resolution, used for validation if needed

        let parts = chatText.components(separatedBy: "|")
        if parts.count >= 2 {
            targetHash = parts[1]
            if targetHash?.isEmpty == true { targetHash = nil } // Handle empty string
            NSLog("✅ Guest: Extracted Hash from Payload: \(targetHash ?? "nil")")
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
        
        // FIX (v1.0.77): When host's stream has no infoHash (e.g., cached DebridSearch links),
        // use the unlocked_stream_url directly instead of resolving independently.
        // This prevents host and guest from playing different videos (stream mismatch bug).
        // Symptom: Guest plays old cached stream while host plays new resolved stream.
        // Root Cause: DebridSearch streams don't have torrent hashes, so LOBBY_PREPARE_PLAYBACK
        // sends an empty hash, causing guest to resolve independently and find a different stream.
        if effectiveHash == nil, let hostUnlockedURL = roomState.unlockedStreamUrl, !hostUnlockedURL.isEmpty {
            NSLog("⚡️ Guest: No stream hash available, using host's unlocked URL directly")
            
            // Sync the unlocked URL to the room so playMedia can use it
            await MainActor.run {
                viewModel.room.unlockedStreamURL = hostUnlockedURL
                viewModel.room.selectedStreamHash = nil // Clear any stale hash
                viewModel.room.selectedQuality = roomState.quality
                
                // Also update AppState's currentWatchPartyRoom if it exists
                viewModel.appState?.player.currentWatchPartyRoom?.unlockedStreamURL = hostUnlockedURL
                viewModel.appState?.player.currentWatchPartyRoom?.selectedStreamHash = nil
                viewModel.appState?.player.currentWatchPartyRoom?.selectedQuality = roomState.quality
            }
            
            // Skip resolution - the URL will be used directly in playMedia
            // Report Ready immediately since we trust the host's URL
            NSLog("✅ Guest: Using host's direct URL. Sending READY signal.")
            let readyMsg = SyncMessage(
                type: .chat,
                timestamp: Date().timeIntervalSince1970,
                isPlaying: nil,
                senderId: viewModel.participantId,
                chatText: "LOBBY_READY_FOR_PLAYBACK",
                chatUsername: viewModel.appState?.currentUsername
            )
            try? await viewModel.realtimeManager?.sendSyncMessage(readyMsg)
            return
        }
        
        do {
            try await viewModel.appState?.player.preloadStream(
                mediaItem: mediaItem,
                quality: .fullHD,
                streamHash: effectiveHash,
                season: roomState.season,
                episode: roomState.episode
            )
            
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
}
