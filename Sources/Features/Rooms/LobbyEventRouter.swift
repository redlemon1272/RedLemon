
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

        // MUTE CHECK: Ignore chat if user is muted
        if let senderId = syncMessage.senderId,
           viewModel.mutedUserIds.contains(senderId),
           syncMessage.type == .chat,
           !chatText.starts(with: "LOBBY_") {
             // System messages (LOBBY_*) are never muted
             return
        }

        // Handle special lobby commands
        if chatText.starts(with: "LOBBY_") {
            await handleLobbyCommand(chatText, syncMessage: syncMessage)
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
            mutedUserIds: viewModel.mutedUserIds
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
        } else if chatText.starts(with: "LOBBY_KICK:") {
            await handleLobbyKick(chatText)
        } else if chatText == "LOBBY_START_COUNTDOWN" {
            await handleLobbyStartCountdown(syncMessage)
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
         } else {
             // Non-host received guest join notification
             let guestUsername = syncMessage.chatUsername ?? "Guest"
             NSLog("👋 Received: Guest '\(guestUsername)' joined room \(viewModel.room.id)")
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

        NSLog("🎬 Guest: Starting playback after countdown")

        // Start playback
        guard let mediaItem = viewModel.room.mediaItem else {
            NSLog("❌ Guest: Cannot start playback - no media selected")
            return
        }

        guard let appState = viewModel.appState else {
            NSLog("❌ Guest: Cannot start playback - no appState")
            return
        }

        NSLog("🎬 Guest: Launching player for \(mediaItem.name)")

        await appState.player.playMedia(
            mediaItem,
            quality: .fullHD,
            watchMode: .watchParty,
            roomId: viewModel.room.id,
            isHost: false
        )
    }
}
