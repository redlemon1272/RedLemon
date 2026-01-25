import Foundation
import Combine

/// Protocol definition for Playback Service
protocol PlaybackService: Actor {
    // State
    var videoURL: String { get }
    var isPlaying: Bool { get }
    var playbackFinished: Bool { get }
    var currentTime: Double { get }
    var duration: Double { get }
    var volume: Double { get }
    var isBuffering: Bool { get }
    var isFileLoaded: Bool { get }

    // Actions
    func loadVideo(url: String, autoplay: Bool, expectedSubtitleCount: Int) async
    func play() async
    func pause() async
    func togglePlayPause() async
    func stop() async
    func seek(to time: Double) async
    func setVolume(_ level: Double) async
    func setSpeed(_ speed: Double) async

    // Publishers
    // Publishers
    var isPlayingPublisher: AnyPublisher<Bool, Never> { get }
    var playbackFinishedPublisher: AnyPublisher<Bool, Never> { get }
    var currentTimePublisher: AnyPublisher<Double, Never> { get }
    var durationPublisher: AnyPublisher<Double, Never> { get }
    var videoURLPublisher: AnyPublisher<String, Never> { get }
    var isBufferingPublisher: AnyPublisher<Bool, Never> { get }
    var isFileLoadedPublisher: AnyPublisher<Bool, Never> { get }
}

/// Actor-based implementation of PlaybackService
actor MPVPlaybackService: PlaybackService {

    // MARK: - State
    @Published var videoURL: String = ""
    @Published var isPlaying: Bool = false
    @Published var playbackFinished: Bool = false
    @Published var currentTime: Double = 0.0
    @Published var duration: Double = 0.0
    @Published var volume: Double = 100.0
    @Published var isBuffering: Bool = false
    @Published var isFileLoaded: Bool = false

    // MARK: - Publishers
    var isPlayingPublisher: AnyPublisher<Bool, Never> { $isPlaying.eraseToAnyPublisher() }
    var playbackFinishedPublisher: AnyPublisher<Bool, Never> { $playbackFinished.eraseToAnyPublisher() }
    var currentTimePublisher: AnyPublisher<Double, Never> { $currentTime.eraseToAnyPublisher() }
    var durationPublisher: AnyPublisher<Double, Never> { $duration.eraseToAnyPublisher() }
    var videoURLPublisher: AnyPublisher<String, Never> { $videoURL.eraseToAnyPublisher() }
    var isBufferingPublisher: AnyPublisher<Bool, Never> { $isBuffering.eraseToAnyPublisher() }
    var isFileLoadedPublisher: AnyPublisher<Bool, Never> { $isFileLoaded.eraseToAnyPublisher() }

    // MARK: - Dependencies
    private weak var mpvController: (any MPVController)?
    private var observers: [Task<Void, Never>] = []

    // MARK: - Initialization
    init(mpvController: any MPVController) {
        self.mpvController = mpvController
        Task.detached { [weak self] in
            await self?.setupObservers()
        }
    }

    deinit {
        for observer in observers {
            observer.cancel()
        }

        // Ensure assertion is released if actor is deallocated while playing
        if let assertion = sleepAssertion {
            ProcessInfo.processInfo.endActivity(assertion)
        }
    }

    // MARK: - Protocol Implementation

    func loadVideo(url: String, autoplay: Bool, expectedSubtitleCount: Int) async {
        self.videoURL = url
        mpvController?.loadVideo(url: url, autoplay: autoplay, expectedSubtitleCount: expectedSubtitleCount)
    }

    func play() async {
        mpvController?.play()
    }

    func pause() async {
        mpvController?.pause()
    }

    func togglePlayPause() async {
        mpvController?.togglePlayPause()
    }

    func stop() async {
        mpvController?.stop()
    }

    func seek(to time: Double) async {
        mpvController?.seek(to: time)
    }

    func setVolume(_ level: Double) async {
        self.volume = level
        mpvController?.setVolume(Int(level))
    }

    func setSpeed(_ speed: Double) async {
        mpvController?.setSpeed(speed)
    }

    // MARK: - Observers

    private func setupObservers() {
        guard let mpv = mpvController else { return }

        observers.append(Task.detached { [weak self] in
            for await playing in mpv.isPlayingPublisher.values {
                await self?.updateIsPlaying(playing)
            }
        })

        observers.append(Task.detached { [weak self] in
            for await finished in mpv.playbackFinishedPublisher.values {
                await self?.updatePlaybackFinished(finished)
            }
        })

        observers.append(Task.detached { [weak self] in
            for await time in mpv.currentTimePublisher.values {
                await self?.updateCurrentTime(time)
            }
        })

        observers.append(Task.detached { [weak self] in
            for await dur in mpv.durationPublisher.values {
                await self?.updateDuration(dur)
            }
        })

        observers.append(Task.detached { [weak self] in
            for await buffering in mpv.isBufferingPublisher.values {
                await self?.updateIsBuffering(buffering)
            }
        })

        observers.append(Task.detached { [weak self] in
            for await loaded in mpv.isFileLoadedPublisher.values {
                await self?.updateIsFileLoaded(loaded)
            }
        })
    }

    // MARK: - State Updates (Internal)

    // Sleep Prevention
    private var sleepAssertion: NSObjectProtocol?

    private func updateIsPlaying(_ playing: Bool) {
        self.isPlaying = playing

        if playing {
            if sleepAssertion == nil {
                LoggingManager.shared.debug(.videoRendering, message: "PlaybackService: creating sleep assertion (preventing idle sleep)")
                sleepAssertion = ProcessInfo.processInfo.beginActivity(
                    options: [.userInitiated, .idleSystemSleepDisabled, .idleDisplaySleepDisabled],
                    reason: "RedLemon Video Playback"
                )
            }
        } else {
            if let assertion = sleepAssertion {
                LoggingManager.shared.debug(.videoRendering, message: "PlaybackService: releasing sleep assertion")
                ProcessInfo.processInfo.endActivity(assertion)
                sleepAssertion = nil
            }
        }
    }
    private func updatePlaybackFinished(_ finished: Bool) { self.playbackFinished = finished }
    private func updateCurrentTime(_ time: Double) { self.currentTime = time }
    private func updateDuration(_ dur: Double) { self.duration = dur }
    private func updateIsBuffering(_ buffering: Bool) { self.isBuffering = buffering }
    private func updateIsFileLoaded(_ loaded: Bool) { self.isFileLoaded = loaded }
}
