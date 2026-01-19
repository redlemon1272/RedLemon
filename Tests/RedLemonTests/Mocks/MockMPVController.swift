import Foundation
import Combine
@testable import RedLemon

class MockMPVController: MPVController {
    
    // MARK: - Publishers State
    @Published var isPlaying = false
    @Published var playbackFinished = false
    @Published var currentTime: Double = 0.0
    @Published var duration: Double = 0.0
    @Published var isBuffering = false
    @Published var isFileLoaded = false
    
    var isPlayingPublisher: AnyPublisher<Bool, Never> { $isPlaying.eraseToAnyPublisher() }
    var playbackFinishedPublisher: AnyPublisher<Bool, Never> { $playbackFinished.eraseToAnyPublisher() }
    var currentTimePublisher: AnyPublisher<Double, Never> { $currentTime.eraseToAnyPublisher() }
    var durationPublisher: AnyPublisher<Double, Never> { $duration.eraseToAnyPublisher() }
    var isBufferingPublisher: AnyPublisher<Bool, Never> { $isBuffering.eraseToAnyPublisher() }
    var isFileLoadedPublisher: AnyPublisher<Bool, Never> { $isFileLoaded.eraseToAnyPublisher() }
    
    // MARK: - Spies
    // MARK: - Spies
    var loadVideoCalls: [(url: String, autoplay: Bool, expectedSubtitleCount: Int, startTime: Double)] = []
    var seekCalls: [Double] = []
    var setVolumeCalls: [Int] = []
    var setSpeedCalls: [Double] = []
    var loadSubtitleCalls: [(url: String, title: String)] = []
    var setSubtitleTrackCalls: [Int] = []
    var setSubtitleOffsetCalls: [Double] = []
    
    var playCalledCount = 0
    var pauseCalledCount = 0
    var togglePlayPauseCalledCount = 0
    var stopCalledCount = 0
    
    // MARK: - Stubs
    var stubbedSubtitleTracks: [SubtitleTrack] = []
    var stubbedCurrentSubtitleTrackID: Int = 0
    
    // MARK: - Implementation
    
    func loadVideo(url: String, autoplay: Bool, expectedSubtitleCount: Int, startTime: Double) {
        loadVideoCalls.append((url, autoplay, expectedSubtitleCount, startTime))
        // Auto-simulate load success for ease of testing
        isFileLoaded = true
        if autoplay { isPlaying = true }
        if startTime > 0 { currentTime = startTime }
    }
    
    func play() {
        playCalledCount += 1
        isPlaying = true
    }
    
    func pause() {
        pauseCalledCount += 1
        isPlaying = false
    }
    
    func togglePlayPause() {
        togglePlayPauseCalledCount += 1
        isPlaying.toggle()
    }
    
    func stop() {
        stopCalledCount += 1
        isPlaying = false
        isFileLoaded = false
    }
    
    func seek(to time: Double) {
        seekCalls.append(time)
        currentTime = time
    }
    
    func setVolume(_ level: Int) {
        setVolumeCalls.append(level)
    }
    
    func setSpeed(_ speed: Double) {
        setSpeedCalls.append(speed)
    }
    
    func loadSubtitle(url: String, title: String) {
        loadSubtitleCalls.append((url, title))
    }
    
    func getSubtitleTracks() async -> [SubtitleTrack] {
        return stubbedSubtitleTracks
    }
    
    func getCurrentSubtitleTrack() async -> Int {
        return stubbedCurrentSubtitleTrackID
    }
    
    func setSubtitleTrack(_ id: Int) {
        setSubtitleTrackCalls.append(id)
        stubbedCurrentSubtitleTrackID = id
    }
    
    func setSubtitleOffset(_ offsetMs: Double) {
        setSubtitleOffsetCalls.append(offsetMs)
    }
    
    func refreshSubtitleSelection() {
        // No-op for mock
    }
}
