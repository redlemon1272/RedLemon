import XCTest
import Combine
@testable import RedLemon

@MainActor
final class AppStateTests: XCTestCase {
    var sut: AppState!
    var mockMetadata: MockMetadataProvider!
    var mockResolver: MockStreamResolver!
    var mockRoomManager: MockRoomManager!
    
    override func setUp() async throws {
        mockMetadata = MockMetadataProvider()
        mockResolver = MockStreamResolver()
        mockRoomManager = MockRoomManager()
        
        // Initialize AppState with mocks
        sut = AppState(
            metadataProvider: mockMetadata,
            streamResolver: mockResolver,
            roomManager: mockRoomManager,
            userManager: mockRoomManager
        )
    }
    
    func testHandleMovieFinished_PersistentRoom_ReturnsToLobby() async {
        // GIVEN a persistent watch party room
        let hostId = UUID()
        let room = WatchPartyRoom(
            id: "room_123",
            hostId: hostId.uuidString,
            hostName: "Host",
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
            quality: .fullHD, sourceQuality: nil, description: nil, posterURL: nil,
            participants: [],
            state: .playing,
            createdAt: Date(), lastActivity: Date(),
            playlist: nil, currentPlaylistIndex: 0,
            lobbyDuration: 300, shouldLoop: false,
            isPersistent: true, // IMPORTANT
            playbackPosition: nil, runtime: nil,
            selectedStreamHash: nil, selectedFileIdx: nil, selectedQuality: nil, unlockedStreamURL: nil
        )
        
        sut.player.currentWatchPartyRoom = room
        sut.currentView = .player
        sut.player.currentWatchMode = .watchParty
        sut.player.currentRoomId = "room_123"
        
        // WHEN movie finishes
        await sut.player.handleMovieFinished()
        
        // THEN it should return to lobby (not clear state completely)
        XCTAssertEqual(sut.currentView, .watchPartyLobby)
        XCTAssertEqual(sut.player.currentRoomId, "room_123") // Should stay in room
    }
    
    func testHandleMovieFinished_Event_ReturnsToEvents() async {
        // GIVEN an event playback
        sut.isEventPlayback = true
        sut.currentEventId = "event_123"
        sut.currentView = .player
        
        // WHEN movie finishes
        await sut.player.handleMovieFinished()
        
        // THEN it should return to events view
        XCTAssertEqual(sut.currentView, .events)
        XCTAssertFalse(sut.isEventPlayback)
        XCTAssertNil(sut.currentEventId)
        XCTAssertTrue(sut.player.finishedEventIds.contains("event_123"))
    }
    
    func testExitPlayer_ClearsState() async {
        // GIVEN player is active
        sut.player.showPlayer = true
        sut.player.selectedStream = Stream(url: "http://test", title: "Test", quality: "1080p", provider: "RD")
        sut.currentView = .player
        
        // WHEN exit player
        await sut.player.exitPlayer(keepRoomState: false)
        
        // THEN state is cleared
        XCTAssertFalse(sut.player.showPlayer)
        XCTAssertNil(sut.player.selectedStream)
        XCTAssertNil(sut.player.selectedMediaItem)
        XCTAssertEqual(sut.currentView, .browse) // Default
    }
}
