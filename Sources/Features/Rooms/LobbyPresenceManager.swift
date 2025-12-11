
import Foundation
import SwiftUI

// Phase 3: Extract Presence Logic
@MainActor
class LobbyPresenceManager: ObservableObject {
    private weak var viewModel: LobbyViewModel?
    
    // Tasks
    private var participantsPollingTask: Task<Void, Never>?
    private var heartbeatTask: Task<Void, Never>? // Replaces 'startHeartbeatLoop' inline task
    
    init(viewModel: LobbyViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - user Actions
    
    func toggleReady() {
        guard let viewModel = viewModel else { return }
        
        let wasReady = viewModel.isReady
        viewModel.isReady.toggle()
        
        let currentUsername = viewModel.appState?.currentUsername ?? "Guest"
        let readyStatus = viewModel.isReady ? "READY" : "NOT READY"
        let isReady = viewModel.isReady
        
        let messageType: LobbyMessageType = isReady ? .userReady : .userNotReady
        viewModel.chatManager.addSystemMessage(messageType, userName: currentUsername, data: [:]) // Simplified delegation
        
        // Update participant ready state locally
        if let index = viewModel.participants.firstIndex(where: { $0.id == viewModel.participantId }) {
            viewModel.participants[index].isReady = isReady
            NSLog("✅ Updated local participant ready state for \(currentUsername)")
        } else {
            NSLog("⚠️ Could not find participant with ID \(viewModel.participantId) to update ready state")
        }
        
        // Broadcast ready state via Realtime
        Task { [weak self] in
            guard let self = self, let viewModel = self.viewModel else { return }
            
            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: viewModel.participantId,
                chatText: isReady ? "LOBBY_READY" : "LOBBY_UNREADY",
                chatUsername: currentUsername
            )
            
            do {
                if let manager = viewModel.realtimeManager, await manager.isRealtimeConnected() {
                    try await manager.sendSyncMessage(syncMsg)
                    NSLog("📡 Successfully broadcasted \(readyStatus) state via Realtime to room \(viewModel.room.id)")
                } else {
                    NSLog("⚠️ Realtime not connected, falling back to database polling for \(readyStatus) state")
                }
                
                // Log room-wide ready status
                let readyCount = viewModel.participants.filter { $0.isReady }.count
                let totalCount = viewModel.participants.count
                NSLog("👥 Room ready status updated: \(readyCount)/\(totalCount) participants ready")
                
            } catch {
                NSLog("❌ Failed to broadcast \(readyStatus) state via Realtime: \(error)")
                // Continue with database polling fallback
            }
        }
        
        print("✓ Lobby: \(currentUsername) toggled ready to \(isReady)")
    }
    
    func toggleMute(participantId: String) {
        guard let viewModel = viewModel else { return }
        
        if viewModel.mutedUserIds.contains(participantId) {
            viewModel.mutedUserIds.remove(participantId)
            viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Unmuted participant"])
        } else {
            viewModel.mutedUserIds.insert(participantId)
            viewModel.chatManager.addSystemMessage(.systemInfo, userName: "System", data: ["message": "Muted participant"])
        }
    }
    
    func kickParticipant(_ participant: Participant) {
        guard let viewModel = viewModel, viewModel.isHost else { return }
        
        viewModel.chatManager.addSystemMessage(.userKicked, userName: participant.name, data: [:])
        viewModel.participants.removeAll { $0.id == participant.id }
        
        // Send kick command via Realtime
        Task { [weak self] in
            guard let self = self, let viewModel = self.viewModel else { return }
            
            let syncMsg = SyncMessage(
                type: .chat,
                timestamp: 0,
                isPlaying: nil,
                senderId: viewModel.participantId,
                chatText: "LOBBY_KICK:\(participant.id)",
                chatUsername: "Host"
            )
            try? await viewModel.realtimeManager?.sendSyncMessage(syncMsg)
        }
        
        // Kick via Database (Remove from room_participants)
        Task { [weak self] in
            guard let self = self, let viewModel = self.viewModel else { return }
            do {
                try await SupabaseClient.shared.leaveRoom(
                    roomId: viewModel.room.id,
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
        guard let viewModel = viewModel else { return }
        
        // Start Heartbeat (Host only or everyone? Logic says check appState currentUserId)
        startHeartbeatLoop()
        
        // Poll participants every 2 seconds
        participantsPollingTask?.cancel()
        participantsPollingTask = Task { [weak self] in
            while !Task.isCancelled {
                guard let self = self else { return }
                await self.pollParticipants()
                try? await Task.sleep(nanoseconds: 2_000_000_000)
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
        guard let viewModel = viewModel else { return }
        print("💓 Lobby: Starting heartbeat loop...")
        
        heartbeatTask?.cancel()
        heartbeatTask = Task { [weak self] in
            while !Task.isCancelled {
                guard let self = self, let viewModel = self.viewModel else { return }
                
                if let userId = viewModel.appState?.currentUserId {
                    do {
                        try await SupabaseClient.shared.sendHeartbeat(roomId: viewModel.room.id, userId: userId)
                    } catch {
                        print("⚠️ Heartbeat failed: \(error)")
                    }
                }
                
                // Wait 30 seconds
                try? await Task.sleep(nanoseconds: 30_000_000_000)
            }
        }
    }
    
    private func pollParticipants() async {
        guard let viewModel = viewModel else { return }
        
        do {
            let roomParticipants = try await SupabaseClient.shared.getRoomParticipants(roomId: viewModel.room.id)
            
            // Convert to Participant objects
            var updatedParticipants: [Participant] = []
            
            for participant in roomParticipants {
                var username = "User"
                if let user = try? await SupabaseClient.shared.getUserById(userId: participant.userId) {
                    username = user.username
                }
                
                // Preserve existing ready state
                let existingParticipant = viewModel.participants.first { $0.id == participant.userId.uuidString }
                let isReady = existingParticipant?.isReady ?? false // Default to false if new
                
                let p = Participant(
                    id: participant.userId.uuidString,
                    name: username,
                    isHost: participant.isHost,
                    isReady: isReady,
                    joinedAt: participant.joinedAt // Use DB joinedAt or local? VM used DB joinedAt? Logic check needed
                )
                updatedParticipants.append(p)
                
                // Self-discovery logging (reduced)
                if p.id == viewModel.participantId {
                    // NSLog("🔍 Current guest participant found...")
                }
            }
            
            // MERGE LOGIC: Combine DB participants with recent local joiners (Grace Period)
            // This prevents the polling loop from deleting a user who just joined via Realtime
            // but hasn't appeared in the DB query yet (race condition).
            
            var finalParticipants = updatedParticipants
            let dbIds = Set(updatedParticipants.map { $0.id })
            
            // Check for locally existing participants that are missing from DB
            let localOnly = viewModel.participants.filter { !dbIds.contains($0.id) }
            
            for localP in localOnly {
                let timeSinceJoin = Date().timeIntervalSince(localP.joinedAt)
                if timeSinceJoin < 10.0 {
                    // KEEP THEM: They joined less than 10 seconds ago
                    // NSLog("🛡️ Preserving recent joiner '\(localP.name)' (joined \(String(format: "%.1f", timeSinceJoin))s ago) despite missing from DB")
                    finalParticipants.append(localP)
                } else {
                    // REMOVE THEM: They've been gone from DB for too long
                    // This is a legitimate "User Left" event
                    viewModel.chatManager.addSystemMessage(.userLeft, userName: localP.name, data: [:])
                    NSLog("👋 \(localP.name) left room (confirmed by DB polling)")
                }
            }
            
            // Check for NEW DB participants (that weren't local) ensures we log joins from polling too
            let currentIds = Set(viewModel.participants.map { $0.id })
            for p in updatedParticipants {
                if !currentIds.contains(p.id) {
                     // We don't log here to avoid double-logging if Realtime caught it
                     // specific logging could happen if needed
                     NSLog("👋 \(p.name) synced from database")
                }
            }
            
            // Update the source of truth
            viewModel.participants = finalParticipants
                
            // Self-Healing
            // If Host is missing, re-join.
            if viewModel.isHost && !viewModel.isLeavingExplicitly {
                     if !dbIds.contains(viewModel.participantId) {
                         print("⚠️ Lobby: Host missing from DB participants list - attempting self-heal re-join")
                         if let userId = UUID(uuidString: viewModel.participantId) {
                             do {
                                 try await SupabaseClient.shared.joinRoom(roomId: viewModel.room.id, userId: userId, isHost: true)
                                 print("✅ Lobby: Host self-healed presence in DB")
                             } catch {
                                 print("❌ Lobby: Failed to self-heal host presence: \(error)")
                             }
                         }
                     }
                }

        } catch {
            NSLog("⚠️ Lobby: Failed to poll participants: \(error)")
        }
    }
}
