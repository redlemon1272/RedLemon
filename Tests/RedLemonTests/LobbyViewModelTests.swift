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
            maxParticipants: 10,
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

    func testSingleVotePerUser() async throws {
        // Given: A lobby with playlist items
        viewModel = LobbyViewModel(room: mockRoom, isHost: true, realtimeManager: mockRealtimeManager)

        // Add mock playlist items directly to viewModel
        // We don't need to test the full playlist structure, just the voting dictionary
        let item1Id = "item_1"
        let item2Id = "item_2"

        // Wait for setup
        try? await Task.sleep(nanoseconds: 100_000_000)

        // When: User votes for item1
        viewModel.toggleVote(for: item1Id)

        // Then: item1 should have their vote
        XCTAssertTrue(viewModel.playlistVotes[item1Id]?.contains(viewModel.participantId) ?? false, "Item1 should have user's vote")

        // When: User votes for item2 (different item)
        viewModel.toggleVote(for: item2Id)

        // Then: item2 now has their vote, item1 does NOT (single vote enforcement)
        XCTAssertTrue(viewModel.playlistVotes[item2Id]?.contains(viewModel.participantId) ?? false, "Item2 should have user's vote")
        XCTAssertFalse(viewModel.playlistVotes[item1Id]?.contains(viewModel.participantId) ?? true, "Item1 should NOT have user's vote (single vote enforcement)")
    }

    func testTogglePrivacy() async throws {
        // Given: Room is initialized (using mockRoom which defaults to Public=true in our mock setup)
        // Wait, mockRoom in setUp is initialized. Let's verify defaults.
        // We'll set up a fresh one to be sure.
        let host = Participant.host()
        let privacyRoom = WatchPartyRoom(
            id: "privacy_test_room",
            hostId: host.id,
            hostName: "TestHost",
            mediaItem: nil,
            quality: .fullHD,
            participants: [host],
            participantCount: 1,
            maxParticipants: 10,
            state: .lobby,
            createdAt: Date(),
            lastActivity: Date(),
            currentPlaylistIndex: 0,
            isPublic: true,
            lobbyDuration: 300,
            shouldLoop: false,
            isPersistent: false
        )

        let mockService = MockLobbyDataService() // Use local mock service to spy
        // We need to inject this mock service into the view model
        // CURRENTLY setUp uses `mockRoom` and defaults.
        // We will instantiate VM manually.

        viewModel = LobbyViewModel(
            room: privacyRoom,
            isHost: true,
            realtimeManager: mockRealtimeManager,
            dataService: mockService
        )

        // When: Host toggles privacy
        viewModel.togglePrivacy()

        // Then:
        // 1. Optimistic update
        XCTAssertFalse(viewModel.room.isPublic, "Room should be private after toggle")

        // Wait for async task to hit mock
        try? await Task.sleep(nanoseconds: 100_000_000)
    }
}
