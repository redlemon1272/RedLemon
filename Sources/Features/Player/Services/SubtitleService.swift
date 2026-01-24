import Foundation
import Combine

/// Protocol definition for Subtitle Service
protocol SubtitleService: Actor {
    var subtitles: [(url: String, label: String)] { get }
    var availableTracks: [SubtitleTrack] { get }
    var currentTrack: SubtitleTrack? { get }
    var offset: Double { get }

    /// Load a list of external subtitle URLs (e.g. from OpenSubtitles/Stremio)
    func loadExternalSubtitles(_ items: [(url: String, label: String)]) async

    /// Scan for embedded tracks in the current file
    func scanEmbeddedTracks(isFastPath: Bool) async

    /// Select a specific track by ID
    func selectTrack(_ id: Int) async

    /// Set subtitle delay/offset in seconds
    func setOffset(_ offset: Double) async

    /// Stream of available tracks for UI binding
    var availableTracksPublisher: AnyPublisher<[SubtitleTrack], Never> { get }

    /// Stream of current track for UI binding
    var currentTrackPublisher: AnyPublisher<SubtitleTrack?, Never> { get }

    /// Stream of offset for UI binding
    var offsetPublisher: AnyPublisher<Double, Never> { get }
}

extension SubtitleService {
    func scanEmbeddedTracks() async {
        await scanEmbeddedTracks(isFastPath: false)
    }
}

/// Actor-based implementation of SubtitleService
actor MPVSubtitleService: SubtitleService {

    // MARK: - State
    @Published var subtitles: [(url: String, label: String)] = []
    @Published var availableTracks: [SubtitleTrack] = []
    @Published var currentTrack: SubtitleTrack?

    @Published var offset: Double = 0.0

    // MARK: - Publishers
    var availableTracksPublisher: AnyPublisher<[SubtitleTrack], Never> {
        $availableTracks.eraseToAnyPublisher()
    }

    var currentTrackPublisher: AnyPublisher<SubtitleTrack?, Never> {
        $currentTrack.eraseToAnyPublisher()
    }

    var offsetPublisher: AnyPublisher<Double, Never> {
        $offset.eraseToAnyPublisher()
    }

    // MARK: - Dependencies
    private weak var mpvController: (any MPVController)?
    private var observers: [Task<Void, Never>] = []

    // MARK: - Initialization
    init(mpvController: any MPVController) {
        self.mpvController = mpvController
        Task { await setupObservers() }
    }
    
    deinit {
        for observer in observers {
            observer.cancel()
        }
    }

    private func setupObservers() async {
        guard let mpv = mpvController else { return }
        
        observers.append(Task { [weak self] in
            for await _ in mpv.tracksChangedPublisher.values {
                await self?.scanEmbeddedTracks(isFastPath: true)
            }
        })
    }

    // MARK: - Protocol Implementation

    func loadExternalSubtitles(_ items: [(url: String, label: String)]) async {
        self.subtitles = items
        guard let mpv = mpvController else { return }

        // Logic extracted from MPVPlayerViewModel
        let areSubtitlesLocal = items.allSatisfy { $0.url.starts(with: "/") }

        if areSubtitlesLocal && !items.isEmpty {
            LoggingManager.shared.debug(.subtitles, message: "Subtitles already downloaded, loading as additional options...")
            for (index, subtitle) in items.enumerated() {
                LoggingManager.shared.debug(.subtitles, message: "Loading external subtitle \(index + 1) (\(subtitle.label)): \(subtitle.url)")
                mpv.loadSubtitle(url: subtitle.url, title: subtitle.label)
            }
            // Update tracks after loading
            await scanEmbeddedTracks()
        }
        if !items.isEmpty {
            LoggingManager.shared.info(.subtitles, message: "Parallel loading \(items.count) external subtitles...")
            
            await withTaskGroup(of: Void.self) { group in
                for subtitle in items {
                    group.addTask {
                        if let localPath = await self.downloadSubtitle(url: subtitle.url) {
                            LoggingManager.shared.info(.subtitles, message: "Subtitle ready: \(subtitle.label)")
                            await self.mpvController?.loadSubtitle(url: localPath, title: subtitle.label)
                        }
                    }
                }
            }
            
            // Initial scan after starting all downloads
            await scanEmbeddedTracks()
        }
    }

    func scanEmbeddedTracks(isFastPath: Bool = false) async {
        guard let mpv = mpvController else { return }

        // Retry logic: Tracks often appear slightly AFTER file load/video ready
        // FAST PATH: Only check once (used for reactive updates from MPV events)
        let maxAttempts = isFastPath ? 1 : 5
        
        LoggingManager.shared.debug(.subtitles, message: "SubtitleService: Scanning tracks (FastPath: \(isFastPath))...")

        for i in 0..<maxAttempts {
            let tracks = await mpv.getSubtitleTracks()
            self.availableTracks = tracks

            let currentid = await mpv.getCurrentSubtitleTrack()
            if let current = tracks.first(where: { $0.id == currentid }) {
                self.currentTrack = current
            } else {
                self.currentTrack = nil
            }

            if i < maxAttempts - 1 {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
    }

    func selectTrack(_ id: Int) async {
        guard let mpv = mpvController else { return }

        mpv.setSubtitleTrack(id)

        // Re-scan to confirm state
        let tracks = await mpv.getSubtitleTracks()
        self.availableTracks = tracks

        // Update current track based on ID
        if let current = tracks.first(where: { $0.id == id }) {
             self.currentTrack = current
        } else {
             self.currentTrack = nil // Off or not found
        }
    }

    func setOffset(_ offset: Double) async {
        guard let mpv = mpvController else { return }
        self.offset = offset
        // MPVWrapper expects milliseconds
        mpv.setSubtitleOffset(offset)
    }

    // MARK: - Private Helpers (Extracted from VM)

    nonisolated private func downloadSubtitle(url: String) async -> String? {
        LoggingManager.shared.debug(.subtitles, message: "SubtitleService: Downloading \(url)")
        guard let subtitleURL = URL(string: url) else { return nil }

        do {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 30.0
            let session = URLSession(configuration: config)

            let (data, response) = try await session.data(from: subtitleURL)

            // Check for VTT content (even if zip extension)
            if let text = String(data: data, encoding: .utf8), text.hasPrefix("WEBVTT") {
               return try saveSubtitleLocally(content: text, extension: "vtt")
            }

            // Check for ZIP magic bytes
            let isZip = data.count > 4 && data[0] == 0x50 && data[1] == 0x4B && data[2] == 0x03 && data[3] == 0x04

            var subtitleText: String
            if isZip {
                subtitleText = try extractSRTFromZip(data: data)
            } else {
                guard let text = String(data: data, encoding: .utf8) else { return nil }
                subtitleText = text
            }

            // Check for ASS format
            if subtitleText.contains("[Script Info]") {
                return try saveSubtitleLocally(content: subtitleText, extension: "ass")
            }

            // Convert to VTT if needed (MPV likes VTT)
            if !subtitleText.hasPrefix("WEBVTT") {
                 subtitleText = convertSRTToVTT(srt: subtitleText)
            }

            return try saveSubtitleLocally(content: subtitleText, extension: "vtt")

        } catch {
            LoggingManager.shared.error(.subtitles, message: "SubtitleService: Download failed: \(error.localizedDescription)")
            return nil
        }
    }

    nonisolated private func saveSubtitleLocally(content: String, extension ext: String) throws -> String {
        let tempDir = FileManager.default.temporaryDirectory // OK
        let fileName = "sub_\(UUID().uuidString).\(ext)"
        let fileURL = tempDir.appendingPathComponent(fileName)
        try content.write(to: fileURL, atomically: true, encoding: .utf8) // OK
        return fileURL.path
    }

    nonisolated private func extractSRTFromZip(data: Data) throws -> String {
        let tempDir = FileManager.default.temporaryDirectory // OK
        let zipFile = tempDir.appendingPathComponent("temp_\(UUID().uuidString).zip")
        let extractDir = tempDir.appendingPathComponent("extract_\(UUID().uuidString)")

        try data.write(to: zipFile) // OK
        try FileManager.default.createDirectory(at: extractDir, withIntermediateDirectories: true) // OK

        let process = Process() // OK - subtitle extraction
        process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        process.arguments = ["-q", "-o", zipFile.path, "-d", extractDir.path]

        try process.run() // OK
        process.waitUntilExit()

        let contents = try FileManager.default.contentsOfDirectory(at: extractDir, includingPropertiesForKeys: nil)
        guard let srtFile = contents.first(where: { $0.pathExtension.lowercased() == "srt" }) else {
            throw NSError(domain: "SubtitleExtraction", code: -1, userInfo: [NSLocalizedDescriptionKey: "No SRT file found"])
        }

        let srtContent = try String(contentsOf: srtFile, encoding: .utf8)

        try? FileManager.default.removeItem(at: zipFile)
        try? FileManager.default.removeItem(at: extractDir)

        return srtContent
    }

    nonisolated private func convertSRTToVTT(srt: String) -> String {
        // Fix 1: Normalize newlines for Windows (CRLF) support
        let normalized = srt.replacingOccurrences(of: "\r\n", with: "\n")
                            .replacingOccurrences(of: "\r", with: "\n")

        var vtt = "WEBVTT\n\n"
        let cues = normalized.components(separatedBy: "\n\n")
        
        for cue in cues {
            let trimmed = cue.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty { continue }
            
            // Fix 2: Only replace commas in timestamps, not dialogue
            var lines = trimmed.components(separatedBy: "\n")
            
            // Basic SRT heuristic:
            // Line 0: ID (Optional)
            // Line 1: Timestamp (00:00:00,000 --> ...)
            
            if lines.count >= 2 {
                // If line 0 matches "-->", it's the timestamp (ID omitted)
                if lines[0].contains("-->") {
                    lines[0] = lines[0].replacingOccurrences(of: ",", with: ".")
                } 
                // If line 1 matches "-->", line 0 is likely ID
                else if lines[1].contains("-->") {
                    lines[1] = lines[1].replacingOccurrences(of: ",", with: ".")
                }
                // Fallback: If neither matches clearly, rely on old behavior but safer? 
                // Actually the old behavior was replace all commas. 
                // If we can't find the timestamp, we might default to no replacement or full replacement.
                // Given SRT strictness, one of the first two lines MUST be the timestamp.
            } else if lines.count == 1 && lines[0].contains("-->") {
                 lines[0] = lines[0].replacingOccurrences(of: ",", with: ".")
            }
            
            let convertedChunk = lines.joined(separator: "\n")
            vtt += convertedChunk + "\n\n"
        }
        return vtt
    }
}
