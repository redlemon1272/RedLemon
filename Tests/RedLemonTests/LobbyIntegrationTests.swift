import XCTest
import Combine
@testable import RedLemon

@MainActor
class LobbyIntegrationTests: XCTestCase {
    
    var viewModel: LobbyViewModel!
    var mockDataService: MockLobbyDataService!
    var mockRealtimeManager: MockRealtimeManager!
    var mockRoom: WatchPartyRoom!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() async throws {
        try await super.setUp()
        cancellables = []
        
        // 1. Setup Data Service Mock
        mockDataService = MockLobbyDataService()
        
        // 2. Setup Realtime Manager Mock
        mockRealtimeManager = MockRealtimeManager()
        
        // 3. Setup Test Room
        mockRoom = WatchPartyRoom(
            id: "test-room-123",
            hostId: "host-user-id", // Lowercase for normalization check
            hostName: "HostUser",
            mediaItem: MediaItem(
                id: "tt123",
                type: "movie",
                name: "Test Movie",
                poster: nil,
                background: nil,
                logo: nil,
                description: nil,
                releaseInfo: nil,
                year: nil,
                imdbRating: nil,
                genres: nil,
                runtime: nil
            ),
            season: nil, episode: nil,
            quality: .fullHD, sourceQuality: nil, description: "Test Room", posterURL: nil,
            participants: [],
            participantCount: 0,
            state: .lobby,
            createdAt: Date(),
            lastActivity: Date(),
            playlist: nil, currentPlaylistIndex: 0,
            lobbyDuration: 600, shouldLoop: false,
            isPersistent: true,
            playbackPosition: 0, runtime: nil,
            selectedStreamHash: nil, selectedFileIdx: nil, selectedQuality: nil, unlockedStreamURL: nil
        )
        
        // 4. Setup Mock Room State
        mockDataService.roomStateToReturn = SupabaseRoom(
            id: mockRoom.id,
            name: "Test Room", // Hardcoded as WatchPartyRoom lacks name
            hostUserId: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
            hostUsername: mockRoom.hostName ?? "HostUser",
            streamHash: nil,
            imdbId: nil,
            posterUrl: nil,
            backdropUrl: nil,
            playbackPosition: 0,
            isPlaying: false,
            participantsCount: 1,
            maxParticipants: 10,
            isPublic: true,
            createdAt: Date(),
            lastActivity: Date(),
            season: nil,
            episode: nil,
            fileIdx: 0,
            quality: "1080p",
            unlockedStreamUrl: nil,
            playlist: [],
            currentPlaylistIndex: 0,
            description: nil,
            subtitleUrl: nil
        )
        
        // 5. Initialize ViewModel
        // Note: isHost = true to test host flows
        viewModel = LobbyViewModel(
            room: mockRoom,
            isHost: true,
            realtimeManager: mockRealtimeManager,
            dataService: mockDataService
        )
    }
    
    override func tearDown() async throws {
        viewModel = nil
        mockDataService = nil
        mockRealtimeManager = nil
        cancellables = nil
        try await super.tearDown()
    }
    
    // MARK: - State Machine & Lifecycle Tests
    
    func testInitialState() {
        XCTAssertEqual(viewModel.stateMachine.currentState, .initializing)
    }
    
    func testConnectTransition() async {
        // When
        viewModel.connect()
        
        // Then
        // Wait for async task to complete (connect spawns a Task)
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // Should have attempted to join room
        let isConnected = await mockRealtimeManager.isRealtimeConnected()
        XCTAssertTrue(isConnected)
        XCTAssertEqual(mockDataService.joinRoomCallCount, 1) // Host joins DB too
        
        // State should be connected
        XCTAssertEqual(viewModel.stateMachine.currentState, .connected)
    }
    
    func testStartCountdown() {
        // Given
        viewModel.stateMachine.transition(to: .connected)
        
        // When
        viewModel.startCountdown()
        
        // Then
        if case .startingCountdown(let seconds) = viewModel.stateMachine.currentState {
            XCTAssertEqual(seconds, 3)
        } else {
            XCTFail("State should be startingCountdown, got \(viewModel.stateMachine.currentState)")
        }
        
        XCTAssertTrue(viewModel.isStarting)
    }
    
    // MARK: - Feature Tests
    
    func testKickParticipant() async {
        // Given
        viewModel.stateMachine.transition(to: .connected)
        let guestIdx = "guest-id-123"
        let guest = Participant(id: guestIdx, name: "Bad Guest", isHost: false, isReady: true, joinedAt: Date(), phxRefs: [])
        viewModel.participants.append(guest)
        
        // When
        viewModel.presenceManager.kickParticipant(guest)
        
        // Then
        // Wait for async kick tasks
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // 1. Participant removed locally
        XCTAssertFalse(viewModel.participants.contains(where: { $0.id == guestIdx }))
        
        // 2. Mock Kick Command sent via Realtime
        let sentMessages = await mockRealtimeManager.sentMessages
        let sentKick = sentMessages.first { msg in
            msg.chatText == "LOBBY_KICK:\(guestIdx)"
        }
        XCTAssertNotNil(sentKick, "Should have sent kick command")
        
        // 3. Removed from DB
        XCTAssertEqual(mockDataService.leaveRoomCallCount, 1)
    }
    
    func testCloseRoom() async {
        // Given
        viewModel.stateMachine.transition(to: .connected)
        viewModel.isLeavingExplicitly = true // Simulate user clicking Leave
        
        // When
        viewModel.disconnect()
        
        // Then
        try? await Task.sleep(nanoseconds: 100_000_000)
        
        // State should be closed
        XCTAssertEqual(viewModel.stateMachine.currentState, .closed)
        
        // Should delete room (Host leave + explicit)
        XCTAssertEqual(mockDataService.deleteRoomCallCount, 1)
    }
    
    func testPresenceDuringPlayback() async {
        // Given
        viewModel.stateMachine.transition(to: .connected)
        let guestId = "guest-1"
        let guest = Participant(
            id: guestId, 
            name: "Leaver", 
            isHost: false, 
            isReady: true, 
            joinedAt: Date().addingTimeInterval(-10), // Joined 10s ago (Not in grace period)
            phxRefs: []
        )
        viewModel.participants = [guest]
        
        // Setup Mock DB to return EMPTY list (Guest left)
        mockDataService.participantsToReturn = []
        
        // When
        await viewModel.presenceManager.pollParticipants()
        
        // Then
        // 1. Guest should be removed
        XCTAssertFalse(viewModel.participants.contains(where: { $0.id == guestId }))
        
        // 2. "User Left" message should be in chat
        // (ChatManager adds it to ViewModel's list, but we can check if ChatManager's addSystemMessage was called? 
        // ChatManager implementation adds to `appState.pendingLobbyMessage` or similar? 
        // Actually ChatManager adds to `viewModel.addMessage`.
        // We can check if `viewModel.messages` (if exposed) or `chatManager` state changed.
        // `LobbyViewModel` has `messages`? No, it delegates to `ChatManager`.
        // But `LobbyChatManager` methods might not be easily inspectable unless we check `messages` array if public.
        // Let's check `LobbyViewModel` properties.
    }
}
