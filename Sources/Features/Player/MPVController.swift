import Foundation
import Combine

/// Protocol abstracting MPVWrapper interactions for testability
protocol MPVController: AnyObject {
    // Actions
    func loadVideo(url: String, autoplay: Bool, expectedSubtitleCount: Int, startTime: Double)
    func play()
    func pause()
    func togglePlayPause()
    func stop()
    func seek(to time: Double)
    func setVolume(_ level: Int)
    func setSpeed(_ speed: Double)
    
    // Subtitle Actions
    func loadSubtitle(url: String, title: String)
    func getSubtitleTracks() async -> [SubtitleTrack]
    func getCurrentSubtitleTrack() async -> Int
    func setSubtitleTrack(_ id: Int)
    func setSubtitleOffset(_ offsetMs: Double)
    func refreshSubtitleSelection()
    
    // Publishers
    var isPlayingPublisher: AnyPublisher<Bool, Never> { get }
    var playbackFinishedPublisher: AnyPublisher<Bool, Never> { get }
    var currentTimePublisher: AnyPublisher<Double, Never> { get }
    var durationPublisher: AnyPublisher<Double, Never> { get }
    var isBufferingPublisher: AnyPublisher<Bool, Never> { get }
    var isFileLoadedPublisher: AnyPublisher<Bool, Never> { get }
    var tracksChangedPublisher: AnyPublisher<Void, Never> { get }
    
    // Async Streams (if needed for modern concurrency)
    // Services currently use .values on the @Published property.
    // If we expose publishers, services can use .values on them?
    // Publisher.values requires generic AsyncPublisher.
}

extension MPVController {
    func loadVideo(url: String, autoplay: Bool, expectedSubtitleCount: Int, startTime: Double = 0) {
        loadVideo(url: url, autoplay: autoplay, expectedSubtitleCount: expectedSubtitleCount, startTime: startTime)
    }
}
