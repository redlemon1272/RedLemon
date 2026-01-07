import XCTest
@testable import RedLemon

@MainActor
final class LobbyViewModelTests: XCTestCase {

    var viewModel: LobbyViewModel!
    var mockRealtimeManager: MockRealtimeManager!
    var mockRoom: WatchPartyRoom!

    override func setUpWithError() throws {
        // Setup shared mock data
        let host = Participant.host()
        mockRoom = WatchPartyRoom(
            id: "test_room_123",
            hostId: host.id,
            hostName: "TestHost",
            mediaItem: nil,
            quality: .fullHD,
            participants: [host],
            participantCount: 1,
            state: .lobby,
            createdAt: Date(),
            lastActivity: Date(),
            currentPlaylistIndex: 0,
            lobbyDuration: 300,
            shouldLoop: false,
            isPersistent: false
        )
        
        mockRealtimeManager = MockRealtimeManager()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockRealtimeManager = nil
    }

    func testInitialState() {
        // Given
        viewModel = LobbyViewModel(room: mockRoom, isHost: true, realtimeManager: mockRealtimeManager)
        
        // Then
        XCTAssertEqual(viewModel.room.id, "test_room_123")
        XCTAssertTrue(viewModel.participants.contains(where: { $0.name == "Host" }))
        XCTAssertEqual(viewModel.messages.count, 1) // Host joined message
    }

    func testPresenceJoin() async throws {
        // Given
        viewModel = LobbyViewModel(room: mockRoom, isHost: true, realtimeManager: mockRealtimeManager)
        
        // When: We simulate a presence JOIN action
        let newUserId = "guest_123"
        let newUsername = "GuestUser"
        
        // We need to wait for setupRealtimeSubscription to complete
        // Since it's fired in a Task in init, we yield to let it run
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // Trigger the callback explicitly (simulating what RealtimeChannelManager would do)
        // We access the callback stored in our mock
        guard let callback = await mockRealtimeManager.presenceCallback else {
            XCTFail("Presence callback was not registered")
            return
        }
        
        let metadata: [String: Any] = ["username": newUsername]
        callback(.join, newUserId, metadata)
        
        // Allow MainActor to process the update
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // Then
        XCTAssertTrue(viewModel.participants.contains(where: { $0.id == newUserId }), "Participant list should contain new user")
        XCTAssertEqual(viewModel.participants.first(where: { $0.id == newUserId })?.name, newUsername)
    }
    
    func testChatSyncMessage() async throws {
        // Given
        viewModel = LobbyViewModel(room: mockRoom, isHost: true, realtimeManager: mockRealtimeManager)
        
        // When: We receive a chat SyncMessage
        let chatText = "Hello World"
        let senderId = "guest_123"
        let senderName = "GuestUser"
        
        let message = SyncMessage(
            type: .chat,
            timestamp: Date().timeIntervalSince1970,
            isPlaying: false,
            senderId: senderId,
            chatText: chatText,
            chatUsername: senderName
        )
        
        // Wait for setup
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // Simulate incoming message
        await mockRealtimeManager.simulateIncomingMessage(message)
        
        // Allow MainActor task to process
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // Then
        XCTAssertEqual(viewModel.chatMessages.count, 1)
        XCTAssertEqual(viewModel.chatMessages.first?.text, chatText)
        XCTAssertEqual(viewModel.chatMessages.first?.username, senderName)
    }
    func testStartCountdown() async throws {
        // Given
        viewModel = LobbyViewModel(room: mockRoom, isHost: true, realtimeManager: mockRealtimeManager)
        
        // When
        viewModel.startCountdown()
        
        // Then
        XCTAssertTrue(viewModel.isStarting)
        XCTAssertEqual(viewModel.countdown, 3)
        
        // Wait for countdown (1.1s) to allow first tick
        try? await Task.sleep(nanoseconds: 1_100_000_000)
        XCTAssertEqual(viewModel.countdown, 2, "Countdown should have ticked down to 2")
        
        // Wait for full countdown (another 2.1s)
        try? await Task.sleep(nanoseconds: 2_100_000_000)
        XCTAssertEqual(viewModel.countdown, 0, "Countdown should have reached 0")
    }
}
