import XCTest
import Combine
@testable import RedLemon

final class PlaybackServiceTests: XCTestCase {
    
    var mockController: MockMPVController!
    var service: MPVPlaybackService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() async throws {
        mockController = MockMPVController()
        service = MPVPlaybackService(mpvController: mockController)
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        mockController = nil
        service = nil
    }
    
    func testLoadVideo() async {
        await service.loadVideo(url: "http://example.com/video.mp4", autoplay: true)
        
        XCTAssertEqual(mockController.loadVideoCalls.count, 1)
        XCTAssertEqual(mockController.loadVideoCalls.first?.url, "http://example.com/video.mp4")
        XCTAssertTrue(mockController.loadVideoCalls.first?.autoplay ?? false)
    }
    
    func testPlaybackControls() async {
        await service.play()
        XCTAssertTrue(mockController.isPlaying)
        XCTAssertEqual(mockController.playCalledCount, 1)
        
        await service.pause()
        XCTAssertFalse(mockController.isPlaying)
        XCTAssertEqual(mockController.pauseCalledCount, 1)
        
        await service.togglePlayPause()
        XCTAssertTrue(mockController.isPlaying)
        XCTAssertEqual(mockController.togglePlayPauseCalledCount, 1)
        
        await service.stop()
        XCTAssertFalse(mockController.isPlaying)
        XCTAssertEqual(mockController.stopCalledCount, 1)
    }
    
    func testSeekAndVolume() async {
        await service.seek(to: 120.0)
        XCTAssertEqual(mockController.seekCalls.last, 120.0)
        
        await service.setVolume(50.0)
        XCTAssertEqual(mockController.setVolumeCalls.last, 50)
        
        await service.setSpeed(1.5)
        XCTAssertEqual(mockController.setSpeedCalls.last, 1.5)
    }
    
    func testStatePropagation() async throws {
        // Test that updates on the controller propagate to the service
        
        // 1. IsPlaying
        let playingExpectation = expectation(description: "IsPlaying updates")
        var receivedPlaying: Bool?
        
        // Await publisher access from actor
        let isPlayingP = await service.isPlayingPublisher
        isPlayingP
            .dropFirst() // Ignore initial
            .sink { val in
                receivedPlaying = val
                playingExpectation.fulfill()
            }
            .store(in: &cancellables)
            
        await mockController.setPlaying(true)
        
        wait(for: [playingExpectation], timeout: 1.0)
        XCTAssertTrue(receivedPlaying ?? false)
        
        // 2. CurrentTime
        let timeExpectation = expectation(description: "Time updates")
        var receivedTime: Double?
        
        let currentTimeP = await service.currentTimePublisher
        currentTimeP
            .dropFirst()
            .sink { val in
                receivedTime = val
                timeExpectation.fulfill()
            }
            .store(in: &cancellables)
            
        mockController.currentTime = 42.0
        
        wait(for: [timeExpectation], timeout: 1.0)
        XCTAssertEqual(receivedTime, 42.0)
    }
}

// Helper extension for Mock
extension MockMPVController {
    func setPlaying(_ value: Bool) async {
        // On MainActor? Or just update property.
        // MockMPVController is a Class, so non-isolated access is allowed.
        // But published updates might need yield.
        isPlaying = value
    }
}
