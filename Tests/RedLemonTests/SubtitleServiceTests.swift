import XCTest
import Combine
@testable import RedLemon

final class SubtitleServiceTests: XCTestCase {
    
    var mockController: MockMPVController!
    var service: MPVSubtitleService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() async throws {
        mockController = MockMPVController()
        service = MPVSubtitleService(mpvController: mockController)
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        mockController = nil
        service = nil
    }
    
    func testScanTracks() async {
        // Setup stub
        let tracks = [
            SubtitleTrack(id: 1, lang: "en", title: "English", isExternal: false),
            SubtitleTrack(id: 2, lang: "es", title: "Spanish", isExternal: false)
        ]
        mockController.stubbedSubtitleTracks = tracks
        mockController.stubbedCurrentSubtitleTrackID = 2
        
        // Execute
        await service.scanEmbeddedTracks()
        
        // Verify State
        let available = await service.availableTracks
        XCTAssertEqual(available.count, 2)
        XCTAssertEqual(available.first?.lang, "en")
        
        let current = await service.currentTrack
        XCTAssertEqual(current?.id, 2)
    }
    
    func testSelectTrack() async {
        // Setup stub
        let tracks = [SubtitleTrack(id: 1, lang: "en", title: "English", isExternal: false)]
        mockController.stubbedSubtitleTracks = tracks
        
        // Execute
        await service.selectTrack(1)
        
        // Verify call
        XCTAssertEqual(mockController.setSubtitleTrackCalls.count, 1)
        XCTAssertEqual(mockController.setSubtitleTrackCalls.first, 1)
        
        // Verify internal state update (it re-scans)
        let current = await service.currentTrack
        XCTAssertEqual(current?.id, 1)
    }
    
    func testSetOffset() async {
        await service.setOffset(1.5)
        
        XCTAssertEqual(mockController.setSubtitleOffsetCalls.count, 1)
        XCTAssertEqual(mockController.setSubtitleOffsetCalls.first, 1.5)
        
        let offset = await service.offset
        XCTAssertEqual(offset, 1.5)
    }
    
    func testLoadLocalSubtitles() async {
        let items = [
            (url: "/path/to/subs.srt", label: "Local Sub")
        ]
        
        await service.loadExternalSubtitles(items)
        
        XCTAssertEqual(mockController.loadSubtitleCalls.count, 1)
        XCTAssertEqual(mockController.loadSubtitleCalls.first?.url, "/path/to/subs.srt")
        XCTAssertEqual(mockController.loadSubtitleCalls.first?.title, "Local Sub")
    }
}
