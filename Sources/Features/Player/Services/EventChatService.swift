import Foundation
import Combine

@MainActor
class EventChatService: ObservableObject {
    static let shared = EventChatService()
    
    @Published var messages: [ChatMessage] = []
    @Published var isConnected: Bool = false
    @Published var participantCount: Int = 0
    
    // Reactions
    let reactionTriggers = PassthroughSubject<String, Never>()
    private var reactionTimestamps: [Date] = []
    
    private var realtimeManager: RealtimeChannelManager?
    private var currentEventId: String?
    private var userId: String?
    private var username: String?
    
    private init() {}
    
    func connect(eventId: String, userId: String, username: String) async {
        guard eventId != currentEventId else { return } // Already connected
        
        // Cleanup previous connection
        if let current = currentEventId {
            await disconnect()
        }
        
        self.currentEventId = eventId
        self.userId = userId
        self.username = username
        self.messages = [] // Clear previous chat
        
        LoggingManager.shared.debug(.social, message: "EventChatService: Connecting to event lobby \(eventId)...")
        
        // Initialize Realtime Manager
        // distinct from the Room one to allow side-by-side connections if needed (though usually exclusive)
        let client = SupabaseClient.shared.realtimeClient
        self.realtimeManager = RealtimeChannelManager(realtimeClient: client)
        
        do {
            if let manager = realtimeManager {
                try await manager.setup(
                    roomId: eventId, // Treating Event ID as a Room ID for chat purposes
                    isHost: false,   // Public events have no "Host" in this context
                    userId: userId,
                    username: username
                )
                
                await manager.registerObserver(
                    id: "event-chat",
                    onPresence: nil,
                    onSync: { [weak self] message in
                        Task { @MainActor [weak self] in
                            if message.type == .reaction {
                                self?.handleReaction(message)
                            } else {
                                self?.handleSyncMessage(message)
                            }
                        }
                    },
                    onConnectionState: nil
                )
            }
            self.isConnected = true
            LoggingManager.shared.info(.social, message: "EventChatService: Connected!")
            
            // Send join message silently (or visible if desired)
            // let joinMsg = SyncMessage(type: .chat, timestamp: Date().timeIntervalSince1970, isPlaying: nil, senderId: userId, chatText: "LOBBY_JOIN", chatUsername: username)
            // try? await realtimeManager?.sendSyncMessage(joinMsg)
            
        } catch {
            LoggingManager.shared.error(.social, message: "EventChatService: Failed to connect: \(error)")
        }
    }
    
    func disconnect() async {
        guard let _ = currentEventId else { return }
        LoggingManager.shared.debug(.social, message: "EventChatService: Disconnecting...")
        
        await realtimeManager?.disconnect()
        realtimeManager = nil
        currentEventId = nil
        isConnected = false
        messages = []
        participantCount = 0
    }
    
    func sendMessage(_ text: String) async {
        guard let userId = userId, let username = username else { return }
        
        // Optimistic update
        let tempId = UUID().uuidString
        let isPremium = LicenseManager.shared.isPremium
        let hostingStreak = SupabaseClient.shared.auth.currentUser?.hostingStreak ?? 0
        
        let message = ChatMessage(
            id: tempId,
            username: username,
            text: text,
            timestamp: Date(),
            senderId: userId,
            isPremium: isPremium,
            hostingStreak: hostingStreak
        )
        self.messages.append(message)
        
        // Send via Realtime
        let syncMsg = SyncMessage(
            type: .chat,
            timestamp: Date().timeIntervalSince1970, // Not tied to playback time for simple chat
            isPlaying: nil,
            senderId: userId,
            chatText: text,
            chatUsername: username,
            isPremium: isPremium,
            hostingStreak: hostingStreak
        )
        
        do {
            if let manager = realtimeManager {
                try await manager.sendSyncMessage(syncMsg)
            }
        } catch {
            LoggingManager.shared.error(.social, message: "EventChatService: Failed to send message: \(error)")
            self.messages.removeAll { $0.id == tempId }
        }
    }
    
    func sendReaction(_ emoji: String) {
         // Rate Limiting: Max 5 per 2 seconds, Min 0.15s gap
         let now = Date()
         
         if let last = reactionTimestamps.last, now.timeIntervalSince(last) < 0.15 { return }
         
         reactionTimestamps = reactionTimestamps.filter { now.timeIntervalSince($0) < 2.0 }
         if reactionTimestamps.count >= 5 { return }
         
         reactionTimestamps.append(now)

         guard let userId = userId, let username = username else { return }

         // Show locally immediately
         reactionTriggers.send(emoji)

         // Send via Realtime
         let syncMsg = SyncMessage(
             type: .reaction,
             timestamp: Date().timeIntervalSince1970,
             isPlaying: nil,
             senderId: userId,
             chatText: emoji, // Store emoji here
             chatUsername: username
         )

         Task {
             if let manager = realtimeManager {
                 try? await manager.sendSyncMessage(syncMsg)
             }
         }
     }
    
    // Batching State
    private var pendingChatMessages: [ChatMessage] = []
    private var isFlushingChat: Bool = false

    private func handleSyncMessage(_ message: SyncMessage) {
        guard message.type == .chat,
              let text = message.chatText,
              let username = message.chatUsername,
              message.senderId != self.userId else { return } // Ignore self (handled logically) or non-chat
        
        // Filter system messages
        if text.starts(with: "LOBBY_") { return }
        
        // Block check
        if let senderId = message.senderId, SocialService.shared.blockedUserIds.contains(senderId.lowercased()) {
             return
        }
        
        let chatMessage = ChatMessage(
            id: UUID().uuidString,
            username: username,
            text: text,
            timestamp: Date(timeIntervalSince1970: message.timestamp),
            senderId: message.senderId,
            isPremium: message.isPremium ?? false,
            hostingStreak: message.hostingStreak ?? 0
        )
        
        // BATCHING LOGIC (Ported from MPVPlayerViewModel)
        pendingChatMessages.append(chatMessage)

        if !isFlushingChat {
            isFlushingChat = true
            Task { @MainActor [weak self] in
                try? await Task.sleep(nanoseconds: 200_000_000) // 200ms Buffer
                guard let self = self else { return }
                
                if !self.pendingChatMessages.isEmpty {
                    self.messages.append(contentsOf: self.pendingChatMessages)
                    // FORENSIC LOG: Validate batching efficiency
                    LoggingManager.shared.debug(.social, message: "⚖️ [EVENT BATCH] Added \(self.pendingChatMessages.count) messages in single UI update")
                    self.pendingChatMessages.removeAll()
                    
                    // Limit message count
                    if self.messages.count > 100 {
                        self.messages.removeFirst(self.messages.count - 100)
                    }
                }
                self.isFlushingChat = false
            }
        }
    }
    
    private func handleReaction(_ message: SyncMessage) {
        guard let emoji = message.chatText, message.senderId != self.userId else { return }
        reactionTriggers.send(emoji)
    }
}
