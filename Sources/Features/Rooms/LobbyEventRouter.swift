
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
        
        // CRITICAL: Skip messages from self (already added locally when sent)
        // NSLog("🔍 Chat message received - senderId: '\(syncMessage.senderId ?? "nil")', participantId: '\(viewModel.participantId)'")

        if syncMessage.senderId == viewModel.participantId {
            // NSLog("💬 Skipping own message (already displayed locally): '\(chatText)'")
            return
        }

        // NSLog("💬 Adding received message from other participant: '\(chatText)'")
        let chatMessage = ChatMessage(
            id: UUID().uuidString,
            username: syncMessage.chatUsername ?? "Unknown",
            text: chatText,
            timestamp: Date(timeIntervalSince1970: syncMessage.timestamp)
        )
        viewModel.chatManager.addChatMessage(chatMessage)
        print("💬 Lobby chat received: [\(syncMessage.chatUsername ?? "Unknown")] \(chatText)")
    }
    
    private func handleRoomClosed() async {
        guard let viewModel = viewModel else { return }
        
        NSLog("🔒 Received Room Closed signal from Host")
        viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Host has left the room"])
        
        viewModel.roomClosedMessage = "The host has left the room."
        viewModel.showRoomClosedAlert = true
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
                // Show alert before disconnecting
                viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "You have been kicked from the room."])
                
                // Trigger disconnect
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
            viewModel.chatManager.addSystemMessage(.hostStarting, userName: "Host", data: [:])

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
                    if var currentRoom = viewModel.appState?.currentWatchPartyRoom {
                        currentRoom.selectedStreamHash = nil
                        currentRoom.selectedFileIdx = nil
                        currentRoom.selectedQuality = nil
                        currentRoom.unlockedStreamURL = nil
                        viewModel.appState?.currentWatchPartyRoom = currentRoom
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
            await appState.playMedia(
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

        if var currentRoom = viewModel.appState?.currentWatchPartyRoom {
            currentRoom.season = season ?? currentRoom.season
            currentRoom.episode = episode ?? currentRoom.episode

            // IMPORTANT: Copy stream details
            currentRoom.selectedStreamHash = roomState.streamHash
            currentRoom.selectedFileIdx = roomState.fileIdx
            currentRoom.selectedQuality = roomState.quality
            currentRoom.unlockedStreamURL = roomState.unlockedStreamUrl

            viewModel.appState?.currentWatchPartyRoom = currentRoom
            NSLog("✅ Guest: Synced stream details from host (Hash: \(roomState.streamHash?.prefix(8) ?? "nil"))")
        }

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
        let remainingWait = max(0, 3.25 - fetchDuration)

        NSLog("🎬 Guest: Fetch took \(String(format: "%.3f", fetchDuration))s, waiting \(String(format: "%.3f", remainingWait))s")

        if remainingWait > 0 {
            try? await Task.sleep(nanoseconds: UInt64(remainingWait * 1_000_000_000))
        }

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

        await appState.playMedia(
            mediaItem,
            quality: .fullHD,
            watchMode: .watchParty,
            roomId: viewModel.room.id,
            isHost: false
        )
    }
}
