import Foundation
import Combine

@MainActor
class EventChatService: ObservableObject {
    static let shared = EventChatService()
    
    @Published var messages: [ChatMessage] = []
    @Published var isConnected: Bool = false
    @Published var participantCount: Int = 0
    
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
        
        print("🎫 EventChatService: Connecting to event lobby \(eventId)...")
        
        // Initialize Realtime Manager
        // distinct from the Room one to allow side-by-side connections if needed (though usually exclusive)
        let client = SupabaseClient.shared.realtimeClient
        self.realtimeManager = RealtimeChannelManager(realtimeClient: client)
        
        do {
            try await realtimeManager?.setup(
                roomId: eventId, // Treating Event ID as a Room ID for chat purposes
                isHost: false,   // Public events have no "Host" in this context
                userId: userId,
                username: username,
                onSync: { [weak self] message in
                    Task { @MainActor [weak self] in
                        self?.handleSyncMessage(message)
                    }
                }
            )
            self.isConnected = true
            print("✅ EventChatService: Connected!")
            
            // Send join message silently (or visible if desired)
            // let joinMsg = SyncMessage(type: .chat, timestamp: Date().timeIntervalSince1970, isPlaying: nil, senderId: userId, chatText: "LOBBY_JOIN", chatUsername: username)
            // try? await realtimeManager?.sendSyncMessage(joinMsg)
            
        } catch {
            print("❌ EventChatService: Failed to connect: \(error)")
        }
    }
    
    func disconnect() async {
        guard let _ = currentEventId else { return }
        print("🎫 EventChatService: Disconnecting...")
        
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
        let message = ChatMessage(
            id: tempId,
            username: username,
            text: text,
            timestamp: Date()
        )
        self.messages.append(message)
        
        // Send via Realtime
        let syncMsg = SyncMessage(
            type: .chat,
            timestamp: Date().timeIntervalSince1970, // Not tied to playback time for simple chat
            isPlaying: nil,
            senderId: userId,
            chatText: text,
            chatUsername: username
        )
        
        do {
            try await realtimeManager?.sendSyncMessage(syncMsg)
        } catch {
            print("❌ EventChatService: Failed to send message: \(error)")
            self.messages.removeAll { $0.id == tempId }
        }
    }
    
    private func handleSyncMessage(_ message: SyncMessage) {
        guard message.type == .chat,
              let text = message.chatText,
              let username = message.chatUsername,
              message.senderId != self.userId else { return } // Ignore self (handled logically) or non-chat
        
        // Filter system messages
        if text.starts(with: "LOBBY_") { return }
        
        let chatMessage = ChatMessage(
            id: UUID().uuidString,
            username: username,
            text: text,
            timestamp: Date(timeIntervalSince1970: message.timestamp)
        )
        self.messages.append(chatMessage)
        
        // Limit message count
        if self.messages.count > 100 {
            self.messages.removeFirst(self.messages.count - 100)
        }
    }
}
