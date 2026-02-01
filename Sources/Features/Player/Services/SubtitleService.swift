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

    /// Clear all external and embedded track state
    func clearSubtitles() async

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

    /// Documentation #105: Guard against re-entrancy race conditions by tracking in-flight loads.
    private var loadingUrls: Set<String> = []

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
        Task.detached { [weak self] in
            await self?.setupObservers()
        }
    }

    deinit {
        for observer in observers {
            observer.cancel()
        }
    }

    private func setupObservers() async {
        guard let mpv = mpvController else { return }

        observers.append(Task.detached { [weak self] in
            for await _ in mpv.tracksChangedPublisher.values {
                await self?.scanEmbeddedTracks(isFastPath: true)
            }
        })
    }

    // MARK: - Protocol Implementation

    func loadExternalSubtitles(_ items: [(url: String, label: String)]) async {
        // 1. Deduplicate the incoming items themselves (unique URLs only)
        var uniqueIncoming: [(url: String, label: String)] = []
        var seenUrlsInThisCall = Set<String>()
        for item in items {
            if !seenUrlsInThisCall.contains(item.url) {
                uniqueIncoming.append(item)
                seenUrlsInThisCall.insert(item.url)
            }
        }

        // 2. Filter against already registered subtitles and IN-PROGRESS loads.
        // Documentation #105: Also check for identical labels to prevent race condition duplicates.
        let newItems = uniqueIncoming.filter { item in
            let isUrlSeen = self.subtitles.contains(where: { $0.url == item.url })
            let isUrlLoading = self.loadingUrls.contains(item.url)
            let isLabelSeen = self.subtitles.contains(where: {
                $0.label.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) ==
                item.label.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            })

            if isUrlSeen || isUrlLoading || isLabelSeen {
                LoggingManager.shared.debug(.subtitles, message: "SubtitleService: Filtering out seen/loading track: \(item.label)")
                return false
            }
            return true
        }

        // 3. Mark as loading
        for item in newItems {
            self.loadingUrls.insert(item.url)
        }

        // 3. Update the persistent list (append unique new ones)
        // We SHOULD merge them to allow late arrivals (healing loop)
        for item in newItems {
            self.subtitles.append(item)
        }

        // 4. Register with MPV
        defer {
            // Documentation #105: Clean up loading state even on failure
            for item in newItems {
                self.loadingUrls.remove(item.url)
            }
        }

        guard let mpv = mpvController else { return }
        if newItems.isEmpty {
            LoggingManager.shared.debug(.subtitles, message: "SubtitleService: No new subtitles to load (already in list)")
            return
        }

        // Logic extracted from MPVPlayerViewModel
        let areNewSubtitlesLocal = newItems.allSatisfy { $0.url.starts(with: "/") }

        if areNewSubtitlesLocal {
            LoggingManager.shared.debug(.subtitles, message: "Loading \(newItems.count) local subtitles...")
            for subtitle in newItems {
                LoggingManager.shared.debug(.subtitles, message: "Loading local external subtitle (\(subtitle.label)): \(subtitle.url)")
                mpv.loadSubtitle(url: subtitle.url, title: subtitle.label)
            }
            // Update tracks after loading
            await scanEmbeddedTracks(isFastPath: true)
        } else {
            LoggingManager.shared.info(.subtitles, message: "Parallel loading \(newItems.count) new external subtitles...")

            await withTaskGroup(of: Void.self) { group in
                for subtitle in newItems {
                    group.addTask {
                        if let localPath = await self.downloadSubtitle(url: subtitle.url) {
                            LoggingManager.shared.info(.subtitles, message: "Subtitle ready: \(subtitle.label)")
                            await self.mpvController?.loadSubtitle(url: localPath, title: subtitle.label)
                            // Update tracks immediately after each successful load to populate menu
                            await self.scanEmbeddedTracks(isFastPath: true)
                        }
                    }
                    // Prevent flooding the network/MPV with too many simultaneous loads
                    try? await Task.sleep(nanoseconds: 100_000_000) // 100ms
                }
            }
        }

        // Initial scan after starting all downloads
        await scanEmbeddedTracks(isFastPath: true)
    }

    func scanEmbeddedTracks(isFastPath: Bool = false) async {
        guard let mpv = mpvController else { return }

        // Retry logic: Tracks often appear slightly AFTER file load/video ready
        // FAST PATH: Only check once (used for reactive updates from MPV events)
        // Initial scan logic: Tracks often appear slightly AFTER file load/video ready
        // FAST PATH: Only check once (used for reactive updates from MPV events or late arrivals)
        let maxAttempts = isFastPath ? 1 : 3
        let sleepInterval: UInt64 = 500_000_000 // 500ms

        LoggingManager.shared.debug(.social, message: "SubtitleService: Scanning tracks (FastPath: \(isFastPath))...")

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
                try? await Task.sleep(nanoseconds: sleepInterval)
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

    func clearSubtitles() async {
        self.subtitles = []
        self.loadingUrls = []
        self.availableTracks = []
        self.currentTrack = nil
        self.offset = 0.0
        print("🧹 SubtitleService: Cleared all subtitles and tracks")
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
                // Robust decoding for non-UTF8 subtitles (common on SubDL)
                guard let text = decodeRobustly(data: data) else {
                    LoggingManager.shared.warn(.subtitles, message: "Could not decode subtitle data with common encodings")
                    return nil
                }
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
        guard let srtFile = contents.first(where: { ["srt", "ass", "vtt"].contains($0.pathExtension.lowercased()) }) else {
            throw NSError(domain: "SubtitleExtraction", code: -1, userInfo: [NSLocalizedDescriptionKey: "No supported subtitle file found in zip"])
        }

        let fileData = try Data(contentsOf: srtFile)
        guard let srtContent = decodeRobustly(data: fileData) else {
            throw NSError(domain: "SubtitleExtraction", code: -2, userInfo: [NSLocalizedDescriptionKey: "Could not decode extracted subtitle"])
        }

        try? FileManager.default.removeItem(at: zipFile)
        try? FileManager.default.removeItem(at: extractDir)

        return srtContent
    }

    nonisolated private func convertSRTToVTT(srt: String) -> String {
        let normalized = srt.replacingOccurrences(of: "\r\n", with: "\n")
                            .replacingOccurrences(of: "\r", with: "\n")

        var vtt = "WEBVTT\n\n"
        let cues = normalized.components(separatedBy: "\n\n")

        for cue in cues {
            let trimmed = cue.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty { continue }

            var lines = trimmed.components(separatedBy: "\n")

            // SRT Heuristic:
            // Line 0: ID (Optional, numeric)
            // Line 1: Timestamp (00:00:20,000 --> 00:00:24,400)

            if lines.count >= 2 {
                if lines[0].contains("-->") {
                    lines[0] = sanitizeSRTTimestamp(lines[0])
                } else if lines[1].contains("-->") {
                    lines[1] = sanitizeSRTTimestamp(lines[1])
                }
            } else if lines.count == 1 && lines[0].contains("-->") {
                 lines[0] = sanitizeSRTTimestamp(lines[0])
            }

            vtt += lines.joined(separator: "\n") + "\n\n"
        }
        return vtt
    }

    nonisolated private func sanitizeSRTTimestamp(_ line: String) -> String {
        // Replace ONLY commas that are part of a timestamp (3 digits after comma)
        // 00:00:20,000 -> 00:00:20.000
        // We use a simple replacement here as most SRT timestamps follow this pattern rigidly.
        return line.replacingOccurrences(of: ",", with: ".")
    }

    nonisolated private func decodeRobustly(data: Data) -> String? {
        // Try encodings in order of likelihood
        let encodings: [String.Encoding] = [
            .utf8,
            .windowsCP1252,
            .isoLatin1,
            .macOSRoman,
            .utf16
        ]

        for encoding in encodings {
            if let decoded = String(data: data, encoding: encoding) {
                return decoded
            }
        }
        return nil
    }
}
