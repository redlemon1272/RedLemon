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
    func scanEmbeddedTracks() async

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

    // MARK: - Initialization
    init(mpvController: any MPVController) {
        self.mpvController = mpvController
    }

    // MARK: - Protocol Implementation

    func loadExternalSubtitles(_ items: [(url: String, label: String)]) async {
        self.subtitles = items
        guard let mpv = mpvController else { return }

        // Logic extracted from MPVPlayerViewModel
        let areSubtitlesLocal = items.allSatisfy { $0.url.starts(with: "/") }

        if areSubtitlesLocal && !items.isEmpty {
            NSLog("✅ Subtitles already downloaded, loading as additional options...")
            for (index, subtitle) in items.enumerated() {
                NSLog("📝 Loading external subtitle %d (%@): %@", index + 1, subtitle.label, subtitle.url)
                mpv.loadSubtitle(url: subtitle.url, title: subtitle.label)
            }
            // Update tracks after loading
            await scanEmbeddedTracks()
        } else if !items.isEmpty {
            // Check for SubDL URLs which need proxy handling
             let hasSubDLSubtitles = items.contains { $0.url.contains("/subtitles/subdl/") }

            if hasSubDLSubtitles {
                NSLog("ℹ️ SubDL subtitles detected - downloading to local files in background...")

                // Download sequentially to avoid overwhelming server or logic
                for (index, subtitle) in items.enumerated() {
                    // Start download
                    if let localPath = await downloadSubtitle(url: subtitle.url) {
                        NSLog("✅ Subtitle %d downloaded to: %@", index + 1, localPath)
                        mpv.loadSubtitle(url: localPath, title: subtitle.label)
                    } else {
                         NSLog("❌ Failed to download subtitle %d", index + 1)
                    }
                }

                // Update tracks after loading all
                await scanEmbeddedTracks()
                // Ensure we re-evaluate best subtitle after adding new ones
                await mpv.refreshSubtitleSelection()
            } else {
                 // Standard URL loading (MPV can handle many http urls directly, but safer to download)
                 // For now, assuming direct load for non-SubDL or falling back to download logic
                 // Implementing simple direct load for non-proxy URLs if MPV supports it,
                 // BUT previous logic suggested downloading everything. Let's stick to downloading.
                for (index, subtitle) in items.enumerated() {
                    if let localPath = await downloadSubtitle(url: subtitle.url) {
                         mpv.loadSubtitle(url: localPath, title: subtitle.label)
                    }
                }
                await scanEmbeddedTracks()
                // Ensure we re-evaluate best subtitle after adding new ones
                await mpv.refreshSubtitleSelection()
            }
        }
    }

    func scanEmbeddedTracks() async {
        guard let mpv = mpvController else { return }

        // Retry logic: Tracks often appear slightly AFTER file load/video ready
        // We poll for 5 seconds to ensure we catch all embedded streams
        print("🔍 SubtitleService: Starting embedded track scan (polling 5s)...")

        for i in 0..<5 {
            let tracks = await mpv.getSubtitleTracks()

            // Always update to ensure we catch all state changes (optimization was causing missed updates)
            self.availableTracks = tracks

            let currentid = await mpv.getCurrentSubtitleTrack()
            if let current = tracks.first(where: { $0.id == currentid }) {
                self.currentTrack = current
            } else {
                self.currentTrack = nil
            }

            NSLog("✅ SubtitleService: Scanned %d tracks (Attempt %d/5)", tracks.count, i+1)
            for t in tracks {
                NSLog("   Track: ID=%d, Title=%@, External=%d", t.id, t.displayName, t.isExternal)
            }

            // Wait 1 second before next poll
            if i < 4 {
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
        NSLog("🔍 SubtitleService: Downloading %@", url)
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

            // Convert to VTT if needed (MPV likes VTT)
            if !subtitleText.hasPrefix("WEBVTT") {
                 subtitleText = convertSRTToVTT(srt: subtitleText)
            }

            return try saveSubtitleLocally(content: subtitleText, extension: "vtt")

        } catch {
            NSLog("❌ SubtitleService: Download failed: %@", error.localizedDescription)
            return nil
        }
    }

    nonisolated private func saveSubtitleLocally(content: String, extension ext: String) throws -> String {
        let tempDir = FileManager.default.temporaryDirectory
        let fileName = "sub_\(UUID().uuidString).\(ext)"
        let fileURL = tempDir.appendingPathComponent(fileName)
        try content.write(to: fileURL, atomically: true, encoding: .utf8)
        return fileURL.path
    }

    nonisolated private func extractSRTFromZip(data: Data) throws -> String {
        let tempDir = FileManager.default.temporaryDirectory
        let zipFile = tempDir.appendingPathComponent("temp_\(UUID().uuidString).zip")
        let extractDir = tempDir.appendingPathComponent("extract_\(UUID().uuidString)")

        try data.write(to: zipFile)
        try FileManager.default.createDirectory(at: extractDir, withIntermediateDirectories: true)

        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
        process.arguments = ["-q", "-o", zipFile.path, "-d", extractDir.path]

        try process.run()
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
        var vtt = "WEBVTT\n\n"
        let cues = srt.components(separatedBy: "\n\n")
        for cue in cues {
            let trimmed = cue.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty { continue }
            let converted = trimmed.replacingOccurrences(of: ",", with: ".")
            vtt += converted + "\n\n"
        }
        return vtt
    }
}
