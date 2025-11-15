//
//  MPVWrapper.swift
//  RedLemon
//
//  Embedded libmpv for integrated video + chat overlay
//  Memory Leak Fixes Applied - Smooth Playback Edition
//

import Foundation
import Combine
import AppKit
import MetalKit

/// Small MPV wrapper that manages an embedded mpv instance and its render context.
class MPVWrapper: ObservableObject {
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    @Published var isBuffering = false
    @Published var volume: Int = 100

    internal var mpvHandle: OpaquePointer?
    internal var renderContext: OpaquePointer?  // MPV render context (thread-safe per MPV docs)
    private var openGLContext: CGLContextObj?  // OpenGL context for locking (IINA pattern)
    private var isInitialized = false
    private var eventPollingTask: Task<Void, Never>?
    private var timeUpdateTimer: Timer?
    private var memoryMonitorTimer: Timer?

    // Memory pressure monitoring
    private var memoryPressureSource: DispatchSourceMemoryPressure?
    private var lastMemoryCheck: Date = .distantPast

    init() {
        print("🎬 MPVWrapper: Creating embedded MPV with render context...")
        mpvHandle = mpv_create()

        guard mpvHandle != nil else {
            print("❌ Failed to create MPV handle")
            return
        }

        print("✅ MPV handle created")

        // Start memory monitoring
        startMemoryMonitoring()
    }

    func setupVideo(in view: NSView) {
        guard let handle = mpvHandle, !isInitialized else {
            NSLog("⚠️ MPV already initialized or no handle")
            return
        }

        NSLog("🖼️ Setting up MPV with native macOS video output...")

        // Use libmpv render API (IINA's exact settings)
        mpv_set_option_string(handle, "vo", "libmpv")
        mpv_set_option_string(handle, "hwdec", "auto-safe")
        mpv_set_option_string(handle, "gpu-hwdec-interop", "auto")
        mpv_set_option_string(handle, "keep-open", "yes")

        // No audio display
        mpv_set_option_string(handle, "audio-display", "no")

        // Performance
        mpv_set_option_string(handle, "cache-secs", "5")
        mpv_set_option_string(handle, "demuxer-max-bytes", "25M")
        mpv_set_option_string(handle, "vd-lavc-threads", "2")

        // UI
        mpv_set_option_string(handle, "keep-open", "yes")
        mpv_set_option_string(handle, "input-default-bindings", "no")
        mpv_set_option_string(handle, "input-vo-keyboard", "no")
        mpv_set_option_string(handle, "osc", "no")
        mpv_set_option_string(handle, "border", "no")
        mpv_set_option_string(handle, "ontop", "no")
        mpv_set_option_string(handle, "keepaspect", "yes")

        // Language preferences: English audio and subtitles by default
        mpv_set_option_string(handle, "alang", "eng,en,english")
        mpv_set_option_string(handle, "slang", "eng,en,english")

        let initResult = mpv_initialize(handle)
        guard initResult >= 0 else {
            NSLog("❌ MPV initialization failed: \(initResult)")
            return
        }

        NSLog("✅ MPV initialized with native GPU rendering")

        isInitialized = true
        // Render context will be created by the layer when it's ready

        // Start event polling and time updates
        eventPollingTask = Task { [weak self] in await self?.pollEvents() }
        startTimeUpdates()
    }

    // MARK: - Smart Memory Monitoring (No Stutter)

    private func startMemoryMonitoring() {
        memoryMonitorTimer = Timer.scheduledTimer(withTimeInterval: 120.0, repeats: true) { [weak self] _ in
            guard let strongSelf = self else { return }

            // Only check memory during natural breaks
            if strongSelf.shouldCheckMemory() {
                strongSelf.performBackgroundMemoryCheck()
            }
        }
    }

    private func shouldCheckMemory() -> Bool {
        // Only check every 2 minutes OR during pauses/seek
        let timeSinceLastCheck = Date().timeIntervalSince(lastMemoryCheck)
        return !isPlaying || timeSinceLastCheck > 120
    }

    private func performBackgroundMemoryCheck() {
        guard let _ = mpvHandle, isInitialized else { return }

        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4

        let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }

        if kerr == KERN_SUCCESS {
            let usedMB = Double(info.resident_size) / 1024.0 / 1024.0
            print("📊 MPV Memory: \(String(format: "%.1f", usedMB))MB")

            // Only cleanup during natural pauses
            if usedMB > 250.0 && !isPlaying {
                print("⚠️ High memory usage detected during pause - gentle cleanup")
                performGentleCleanup()
            }

            lastMemoryCheck = Date()
        }
    }

    private func performGentleCleanup() {
        guard let handle = mpvHandle, isInitialized, !isPlaying else { return }

        print("🧹 Gentle MPV buffer cleanup (no playback interruption)...")

        // Gentle cache adjustment - NO buffer cycling during playback
        mpv_command_string(handle, "set cache-secs 3")

        // Small delay to let changes take effect
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            mpv_command_string(handle, "set cache-secs 5")
        }
    }

    // MARK: - Render Context Setup (IINA Implementation)

    internal func createRenderContext(with layer: MPVViewLayer) {
        guard let handle = mpvHandle else { return }

        print("🎬 Creating MPV render context with OpenGL (IINA method)...")

        // Use IINA's proven get_proc_address implementation
        let apiType = UnsafeMutableRawPointer(mutating: (MPV_RENDER_API_TYPE_OPENGL as NSString).utf8String)
        var openGLInitParams = mpv_opengl_init_params(
            get_proc_address: mpvGetOpenGLFunc,
            get_proc_address_ctx: nil
        )

        withUnsafeMutablePointer(to: &openGLInitParams) { openGLInitParams in
            var advanced: CInt = 1
            withUnsafeMutablePointer(to: &advanced) { advanced in
                var params = [
                    mpv_render_param(type: MPV_RENDER_PARAM_API_TYPE, data: apiType),
                    mpv_render_param(type: MPV_RENDER_PARAM_OPENGL_INIT_PARAMS, data: openGLInitParams),
                    mpv_render_param(type: MPV_RENDER_PARAM_ADVANCED_CONTROL, data: advanced),
                    mpv_render_param()
                ]

                var ctx: OpaquePointer?
                let result = mpv_render_context_create(&ctx, handle, &params)
                guard result >= 0, let renderCtx = ctx else {
                    print("❌ Failed to create render context: \(result)")
                    return
                }

                self.renderContext = renderCtx

                // Store the current OpenGL context for later locking
                self.openGLContext = CGLGetCurrentContext()

                // Set IINA's update callback with the layer as context
                let layerPtr = Unmanaged.passUnretained(layer).toOpaque()
                mpv_render_context_set_update_callback(renderCtx, mpvUpdateCallback, layerPtr)

                print("✅ Render context created successfully (IINA method)")
            }
        }
    }

    // MARK: - OpenGL Context Locking (IINA Implementation)

    /// Lock the OpenGL context and set it as current (required by mpv)
    func lockAndSetOpenGLContext() {
        guard let context = openGLContext else { return }
        CGLLockContext(context)
        CGLSetCurrentContext(context)
    }

    /// Unlock the OpenGL context
    func unlockOpenGLContext() {
        guard let context = openGLContext else { return }
        CGLUnlockContext(context)
    }

    // MARK: - Smart Event Polling (Playback-Aware)

    private func pollEvents() async {
        guard let handle = mpvHandle else { return }

        while !Task.isCancelled {
            // Adaptive timeout based on playback state
            let timeout = isPlaying ? 0.5 : 0.1
            let event = mpv_wait_event(handle, timeout)
            guard let eventPtr = event else { continue }

            // Check cancellation after each event
            if Task.isCancelled { break }

            let eventId = eventPtr.pointee.event_id
            await MainActor.run { self.handleMPVEvent(eventId: eventId, eventPtr: eventPtr) }
        }

        print("🛑 Event polling task cancelled cleanly")
    }

    private func handleMPVEvent(eventId: mpv_event_id, eventPtr: UnsafePointer<mpv_event>) {
        switch eventId {
        case MPV_EVENT_NONE: break
        case MPV_EVENT_START_FILE:
            isBuffering = true
            // Natural cleanup point - video starting
            if memoryUsage > 200 {
                performGentleCleanup()
            }
        case MPV_EVENT_FILE_LOADED:
            updateDuration()
        case MPV_EVENT_PLAYBACK_RESTART:
            isBuffering = false
            isPlaying = true
        case MPV_EVENT_END_FILE:
            isPlaying = false
            // Perfect time for cleanup - video ended naturally
            performNaturalCleanup()
        case MPV_EVENT_IDLE:
            isBuffering = false
        default:
            if eventId.rawValue != MPV_EVENT_LOG_MESSAGE.rawValue {
                print(" MPV Event: \(eventId.rawValue)")
            }
        }
    }

    private var memoryUsage: Double {
        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4

        let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }

        if kerr == KERN_SUCCESS {
            return Double(info.resident_size) / 1024.0 / 1024.0
        }
        return 0.0
    }

    private func performNaturalCleanup() {
        guard let handle = mpvHandle, isInitialized else { return }

        print("🧹 Natural cleanup - optimizing after video end...")

        // More thorough cleanup during natural breaks
        mpv_command_string(handle, "set cache-secs 2")

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            mpv_command_string(handle, "set cache-secs 5")
        }
    }

    // MARK: - Enhanced Timer Management

    private func startTimeUpdates() {
        timeUpdateTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            guard let strongSelf = self else { return }
            Task { @MainActor in
                strongSelf.updateCurrentTime()
            }
        }
    }

    private func updateCurrentTime() {
        guard let handle = mpvHandle, isInitialized, isPlaying else { return }
        var time: Double = 0
        mpv_get_property(handle, "time-pos", MPV_FORMAT_DOUBLE, &time)
        currentTime = time
    }

    private func updateDuration() {
        guard let handle = mpvHandle, isInitialized else { return }
        var dur: Double = 0
        mpv_get_property(handle, "duration", MPV_FORMAT_DOUBLE, &dur)
        duration = dur
    }

    // MARK: - Public Controls

    func loadVideo(url: String, autoplay: Bool = true) {
        NSLog("🎬 MPV loadVideo called with URL: %@, autoplay: %@", String(url.prefix(100)), autoplay ? "true" : "false")
        if !isInitialized {
            NSLog("⚠️ MPV not initialized yet, waiting 500ms and retrying...")
            Task { @MainActor in try? await Task.sleep(nanoseconds: 500_000_000); if isInitialized { loadVideo(url: url, autoplay: autoplay) } }
            return
        }
        guard let handle = mpvHandle else {
            NSLog("❌ MPV handle is nil!")
            return
        }

        let command: String
        if autoplay {
            command = "loadfile \"\(url)\""
        } else {
            command = "loadfile \"\(url)\" pause"
        }

        NSLog("🎬 MPV executing command: %@", command)
        let result = mpv_command_string(handle, command)
        NSLog("🎬 MPV loadfile result: %d", result)
        if result >= 0 {
            isPlaying = autoplay
            NSLog("✅ MPV loadfile succeeded, isPlaying set to %@", autoplay ? "true" : "false")
        } else {
            NSLog("❌ MPV loadfile failed with code: %d", result)
        }
    }

    func loadSubtitle(url: String, title: String = "English") {
        guard let handle = mpvHandle, isInitialized else {
            NSLog("❌ Cannot load subtitle: MPV not initialized")
            return
        }
        NSLog("📝 Loading subtitle from: %@", String(url.prefix(80)))

        // First add the subtitle with language and title
        var args: [UnsafePointer<CChar>?] = [
            UnsafePointer(strdup("sub-add")),
            UnsafePointer(strdup(url)),
            UnsafePointer(strdup("select")),  // Auto-select this subtitle
            UnsafePointer(strdup(title)),     // Title (release name)
            UnsafePointer(strdup("en")),      // Language
            nil
        ]

        let result = args.withUnsafeMutableBufferPointer { ptr in
            mpv_command(handle, ptr.baseAddress)
        }

        // Free the allocated strings
        for i in 0..<5 {
            if let arg = args[i] { free(UnsafeMutablePointer(mutating: arg)) }
        }

        if result >= 0 {
            NSLog("✅ Subtitle added successfully, now enabling it...")
            // Enable subtitle visibility
            var visFlag: Int32 = 1
            mpv_set_property(handle, "sub-visibility", MPV_FORMAT_FLAG, &visFlag)

            // Get the track count to find our newly added subtitle
            var trackCount: Int64 = 0
            if mpv_get_property(handle, "track-list/count", MPV_FORMAT_INT64, &trackCount) >= 0 && trackCount > 0 {
                // Get the actual track ID of the last track (our newly added subtitle)
                let lastTrackIndex = trackCount - 1
                let idKey = "track-list/\(lastTrackIndex)/id"
                var trackId: Int64 = 0
                if mpv_get_property(handle, idKey, MPV_FORMAT_INT64, &trackId) >= 0 {
                    NSLog("📺 Setting subtitle track to ID: %lld (from index %lld)", trackId, lastTrackIndex)
                    mpv_set_property(handle, "sid", MPV_FORMAT_INT64, &trackId)
                } else {
                    NSLog("❌ Failed to get track ID for index %lld", lastTrackIndex)
                }
            }
        } else {
            NSLog("❌ Failed to load subtitle, MPV error code: %d", result)
        }
    }

    func play() {
        guard let handle = mpvHandle, isInitialized else { return }
        var flag: Int64 = 0
        mpv_set_property(handle, "pause", MPV_FORMAT_FLAG, &flag)
        isPlaying = true
    }

    func pause() {
        guard let handle = mpvHandle, isInitialized else { return }
        var flag: Int64 = 1
        mpv_set_property(handle, "pause", MPV_FORMAT_FLAG, &flag)
        isPlaying = false

        // Safe cleanup point during pause
        if memoryUsage > 150 {
            performGentleCleanup()
        }
    }

    func togglePlayPause() { isPlaying ? pause() : play() }

    func seek(to seconds: Double) {
        guard let handle = mpvHandle, isInitialized else { return }
        var t = seconds
        mpv_set_property(handle, "time-pos", MPV_FORMAT_DOUBLE, &t)

        // Natural cleanup point during seek
        if memoryUsage > 180 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.performGentleCleanup()
            }
        }
    }

    func seekRelative(seconds: Double) {
        guard let handle = mpvHandle, isInitialized else { return }
        let command = "seek \(seconds) relative"
        _ = mpv_command_string(handle, command)
    }

    /// Set playback speed (1.0 = normal, 0.95-1.05 for subtle sync adjustments)
    func setSpeed(_ speed: Double) {
        guard let handle = mpvHandle, isInitialized else { return }
        var s = speed
        mpv_set_property(handle, "speed", MPV_FORMAT_DOUBLE, &s)
        if speed != 1.0 {
            print("⚡ Playback speed adjusted to \(String(format: "%.2f", speed))x for sync")
        }
    }

    func setVolume(_ level: Int) {
        guard let handle = mpvHandle, isInitialized else { return }
        var v = Int64(level)
        mpv_set_property(handle, "volume", MPV_FORMAT_INT64, &v)
        volume = level
    }

    // MARK: - Track Management

    struct AudioTrack {
        let id: Int
        let lang: String?
        let title: String?

        var displayName: String {
            // Translate common language names to English
            let translatedTitle = translateToEnglish(title)
            let translatedLang = languageCodeToEnglish(lang)

            if let title = translatedTitle, !title.isEmpty {
                return title
            } else if let lang = translatedLang, !lang.isEmpty {
                return lang
            } else {
                return "Track \(id)"
            }
        }
    }

    struct SubtitleTrack {
        let id: Int
        let lang: String?
        let title: String?

        var displayName: String {
            // Translate common language names to English
            let translatedTitle = translateToEnglish(title)
            let translatedLang = languageCodeToEnglish(lang)

            if let title = translatedTitle, !title.isEmpty {
                return title
            } else if let lang = translatedLang, !lang.isEmpty {
                return lang
            } else {
                return "Track \(id)"
            }
        }
    }

    // Helper function to translate common language names
    private static func translateToEnglish(_ text: String?) -> String? {
        guard let text = text else { return nil }
        let lower = text.lowercased()

        let translations: [String: String] = [
            "español": "Spanish",
            "espanol": "Spanish",
            "inglés": "English",
            "ingles": "English",
            "français": "French",
            "francais": "French",
            "deutsch": "German",
            "italiano": "Italian",
            "português": "Portuguese",
            "portugues": "Portuguese",
            "日本語": "Japanese",
            "中文": "Chinese",
            "한국어": "Korean",
            "русский": "Russian"
        ]

        for (foreign, english) in translations {
            if lower.contains(foreign) {
                return text.replacingOccurrences(of: foreign, with: english, options: .caseInsensitive)
            }
        }

        return text
    }

    // Helper function to convert language codes to full English names
    private static func languageCodeToEnglish(_ code: String?) -> String? {
        guard let code = code else { return nil }
        let lower = code.lowercased()

        let languageNames: [String: String] = [
            "en": "English",
            "eng": "English",
            "es": "Spanish",
            "spa": "Spanish",
            "fr": "French",
            "fre": "French",
            "fra": "French",
            "de": "German",
            "ger": "German",
            "deu": "German",
            "it": "Italian",
            "ita": "Italian",
            "pt": "Portuguese",
            "por": "Portuguese",
            "ja": "Japanese",
            "jpn": "Japanese",
            "zh": "Chinese",
            "chi": "Chinese",
            "zho": "Chinese",
            "ko": "Korean",
            "kor": "Korean",
            "ru": "Russian",
            "rus": "Russian",
            "ar": "Arabic",
            "ara": "Arabic",
            "hi": "Hindi",
            "hin": "Hindi"
        ]

        return languageNames[lower] ?? code.uppercased()
    }

    func getAudioTracks() -> [AudioTrack] {
        guard let handle = mpvHandle, isInitialized else { return [] }

        var trackCount: Int64 = 0
        mpv_get_property(handle, "track-list/count", MPV_FORMAT_INT64, &trackCount)

        var tracks: [AudioTrack] = []

        for i in 0..<Int(trackCount) {
            // Get track type
            let typeKey = "track-list/\(i)/type"
            var typeStr: UnsafeMutablePointer<CChar>?
            if mpv_get_property(handle, typeKey, MPV_FORMAT_STRING, &typeStr) >= 0,
               let type = typeStr.map({ String(cString: $0) }) {
                mpv_free(typeStr)

                if type == "audio" {
                    // Get track ID
                    let idKey = "track-list/\(i)/id"
                    var trackId: Int64 = 0
                    mpv_get_property(handle, idKey, MPV_FORMAT_INT64, &trackId)

                    // Get language
                    let langKey = "track-list/\(i)/lang"
                    var langStr: UnsafeMutablePointer<CChar>?
                    let lang: String? = (mpv_get_property(handle, langKey, MPV_FORMAT_STRING, &langStr) >= 0)
                        ? langStr.map { String(cString: $0) }
                        : nil
                    mpv_free(langStr)

                    // Get title
                    let titleKey = "track-list/\(i)/title"
                    var titleStr: UnsafeMutablePointer<CChar>?
                    let title: String? = (mpv_get_property(handle, titleKey, MPV_FORMAT_STRING, &titleStr) >= 0)
                        ? titleStr.map { String(cString: $0) }
                        : nil
                    mpv_free(titleStr)

                    tracks.append(AudioTrack(id: Int(trackId), lang: lang, title: title))
                }
            }
        }

        return tracks
    }

    func getSubtitleTracks() -> [SubtitleTrack] {
        guard let handle = mpvHandle, isInitialized else {
            NSLog("❌ getSubtitleTracks: MPV not initialized")
            return []
        }

        var trackCount: Int64 = 0
        mpv_get_property(handle, "track-list/count", MPV_FORMAT_INT64, &trackCount)
        NSLog("🔍 MPV track-list/count: %lld", trackCount)

        var tracks: [SubtitleTrack] = []
        var hasOffTrack = false

        for i in 0..<Int(trackCount) {
            // Get track type
            let typeKey = "track-list/\(i)/type"
            var typeStr: UnsafeMutablePointer<CChar>?
            if mpv_get_property(handle, typeKey, MPV_FORMAT_STRING, &typeStr) >= 0,
               let type = typeStr.map({ String(cString: $0) }) {
                mpv_free(typeStr)

                NSLog("🔍 Track %d type: %@", i, type)

                if type == "sub" {
                    // Get track ID
                    let idKey = "track-list/\(i)/id"
                    var trackId: Int64 = 0
                    mpv_get_property(handle, idKey, MPV_FORMAT_INT64, &trackId)

                    // Check if this is the "Off" track (ID 0)
                    if trackId == 0 {
                        hasOffTrack = true
                    }

                    // Get language
                    let langKey = "track-list/\(i)/lang"
                    var langStr: UnsafeMutablePointer<CChar>?
                    let lang: String? = (mpv_get_property(handle, langKey, MPV_FORMAT_STRING, &langStr) >= 0)
                        ? langStr.map { String(cString: $0) }
                        : nil
                    mpv_free(langStr)

                    // Get title
                    let titleKey = "track-list/\(i)/title"
                    var titleStr: UnsafeMutablePointer<CChar>?
                    let title: String? = (mpv_get_property(handle, titleKey, MPV_FORMAT_STRING, &titleStr) >= 0)
                        ? titleStr.map { String(cString: $0) }
                        : nil
                    mpv_free(titleStr)

                    NSLog("✅ Found subtitle track: ID=%lld, lang=%@, title=%@", trackId, lang ?? "nil", title ?? "nil")
                    tracks.append(SubtitleTrack(id: Int(trackId), lang: lang, title: title))
                }
            }
        }

        // Only add "Off" track if MPV doesn't already provide one
        if !hasOffTrack {
            tracks.insert(SubtitleTrack(id: 0, lang: nil, title: "Off"), at: 0)
        }

        NSLog("📊 Total subtitle tracks found: %d (including Off if needed)", tracks.count)
        return tracks
    }

    func cycleSubtitles() {
        guard let handle = mpvHandle, isInitialized else { return }
        _ = mpv_command_string(handle, "cycle sub")
    }

    func cycleAudio() {
        guard let handle = mpvHandle, isInitialized else { return }
        _ = mpv_command_string(handle, "cycle audio")
    }

    func setSubtitleTrack(_ id: Int) {
        guard let handle = mpvHandle, isInitialized else { return }

        // Store current pause state
        let wasPaused = !isPlaying

        // Set subtitle track (use "no" string for disabling, or track ID)
        if id <= 0 {
            // Disable subtitles
            let noStr = "no".cString(using: .utf8)
            var noPtr = noStr?.withUnsafeBufferPointer { UnsafeMutablePointer(mutating: $0.baseAddress) }
            mpv_set_property(handle, "sid", MPV_FORMAT_STRING, &noPtr)
            print("🔇 Disabled subtitles")
        } else {
            // Enable specific subtitle track
            var trackId = Int64(id)
            mpv_set_property(handle, "sid", MPV_FORMAT_INT64, &trackId)
            print("📝 Set subtitle track to: \(id)")
        }

        // Restore pause state if it was paused
        if wasPaused && isPlaying {
            pause()
        }
    }

    /// Adjust subtitle timing offset in milliseconds
    /// - Parameter offsetMs: Offset in milliseconds (positive = delay subtitles, negative = advance subtitles)
    func setSubtitleOffset(_ offsetMs: Double) {
        guard let handle = mpvHandle, isInitialized else { return }
        var offset = offsetMs / 1000.0  // Convert to seconds for MPV
        mpv_set_property(handle, "sub-delay", MPV_FORMAT_DOUBLE, &offset)
        print("⏱️ Subtitle offset set to \(String(format: "%.1f", offsetMs))ms")
    }

    /// Get current subtitle offset in milliseconds
    func getSubtitleOffset() -> Double {
        guard let handle = mpvHandle, isInitialized else { return 0.0 }
        var offset: Double = 0.0
        mpv_get_property(handle, "sub-delay", MPV_FORMAT_DOUBLE, &offset)
        return offset * 1000.0  // Convert from seconds to milliseconds
    }

    /// Adjust subtitle speed (for fixing gradual sync drift)
    /// - Parameter speedFactor: Speed multiplier (1.0 = normal, 0.95-1.05 for minor adjustments)
    func setSubtitleSpeed(_ speedFactor: Double) {
        guard let handle = mpvHandle, isInitialized else { return }
        var speed = speedFactor
        mpv_set_property(handle, "sub-speed", MPV_FORMAT_DOUBLE, &speed)
        print("⚡ Subtitle speed set to \(String(format: "%.3f", speedFactor))x")
    }

    /// Get current subtitle speed multiplier
    func getSubtitleSpeed() -> Double {
        guard let handle = mpvHandle, isInitialized else { return 1.0 }
        var speed: Double = 1.0
        mpv_get_property(handle, "sub-speed", MPV_FORMAT_DOUBLE, &speed)
        return speed
    }

    /// Reset subtitle timing to default (no offset, normal speed)
    func resetSubtitleTiming() {
        setSubtitleOffset(0.0)
        setSubtitleSpeed(1.0)
        print("🔄 Subtitle timing reset to default")
    }

    func setAudioTrack(_ id: Int) {
        guard let handle = mpvHandle, isInitialized else { return }
        var trackId = Int64(id)
        mpv_set_property(handle, "aid", MPV_FORMAT_INT64, &trackId)
    }

    func getCurrentSubtitleTrack() -> Int {
        guard let handle = mpvHandle, isInitialized else { return 0 }

        // Try to get as string first (in case it's "no")
        var strValue: UnsafeMutablePointer<CChar>?
        if mpv_get_property(handle, "sid", MPV_FORMAT_STRING, &strValue) >= 0,
           let str = strValue.map({ String(cString: $0) }) {
            mpv_free(strValue)
            if str == "no" || str == "false" {
                print("📊 Current subtitle track: disabled (string: \(str))")
                return 0  // Return 0 for disabled
            }
        }

        // Otherwise get as integer
        var trackId: Int64 = 0
        if mpv_get_property(handle, "sid", MPV_FORMAT_INT64, &trackId) >= 0 {
            print("📊 Current subtitle track: \(trackId)")
            return Int(trackId)
        }

        return 0
    }

    func getCurrentAudioTrack() -> Int {
        guard let handle = mpvHandle, isInitialized else { return -1 }
        var trackId: Int64 = -1
        mpv_get_property(handle, "aid", MPV_FORMAT_INT64, &trackId)
        return Int(trackId)
    }

    func stop() {
        guard let handle = mpvHandle, isInitialized else { return }

        print("🛑 Stopping MPV playback...")

        // Stop playback
        _ = mpv_command_string(handle, "stop")
        isPlaying = false

        // Natural cleanup point when stopping
        performNaturalCleanup()
    }

    /// Get cache buffering percentage (0-100) for large seek validation
    func getCacheBufferingPercent() -> Double {
        guard let handle = mpvHandle, isInitialized else { return 0.0 }

        // Get cache buffer fill percentage
        var cacheBuffering: Double = 0.0
        let result = mpv_get_property(handle, "cache-buffering-state", MPV_FORMAT_DOUBLE, &cacheBuffering)

        if result >= 0 {
            // MPV returns 0-100 for buffering percentage
            return max(0.0, min(100.0, cacheBuffering))
        }

        // Fallback: try demuxer cache percentage
        var demuxerCache: Double = 0.0
        let demuxerResult = mpv_get_property(handle, "demuxer-cache-state", MPV_FORMAT_DOUBLE, &demuxerCache)

        if demuxerResult >= 0 {
            return max(0.0, min(100.0, demuxerCache))
        }

        // If no cache info available, assume 100% (buffered)
        return 100.0
    }

    /// Safe cleanup - must be called from the OpenGL thread
    func destroyRenderContext() {
        guard let context = renderContext else { return }
        print("🧹 Freeing render context on OpenGL thread...")
        mpv_render_context_free(context)
        renderContext = nil
    }

    // MARK: - Render Context Methods

    /// Check if MPV has a frame ready to render (IINA implementation)
    func shouldRenderUpdateFrame() -> Bool {
        guard let context = renderContext else { return false }
        let flags = mpv_render_context_update(context)
        return (flags & UInt64(MPV_RENDER_UPDATE_FRAME.rawValue)) != 0
    }

    func checkForRenderUpdate() -> UInt64 {
        guard let context = renderContext else { return 0 }
        return mpv_render_context_update(context)
    }

    func render(fbo: Int32, width: Int32, height: Int32) {
        guard let context = renderContext else { return }
        var flip: CInt = 1
        var fboData = mpv_opengl_fbo(fbo: fbo, w: width, h: height, internal_format: 0)
        withUnsafeMutablePointer(to: &fboData) { fPtr in
            withUnsafeMutablePointer(to: &flip) { flipPtr in
                var params: [mpv_render_param] = [
                    mpv_render_param(type: MPV_RENDER_PARAM_OPENGL_FBO, data: UnsafeMutableRawPointer(fPtr)),
                    mpv_render_param(type: MPV_RENDER_PARAM_FLIP_Y, data: UnsafeMutableRawPointer(flipPtr)),
                    mpv_render_param()
                ]
                mpv_render_context_render(context, &params)
            }
        }
    }

    func reportSwap() {
        guard let context = renderContext else { return }
        mpv_render_context_report_swap(context)
    }

    // MARK: - Enhanced Cleanup (Smooth Playback)

    deinit {
        print("🗑️ MPVWrapper deinit - cleaning up...")

        // Cancel event polling FIRST with immediate effect
        eventPollingTask?.cancel()
        eventPollingTask = nil

        // Cancel memory monitoring
        memoryMonitorTimer?.invalidate()
        memoryMonitorTimer = nil

        // Cancel time update timer
        timeUpdateTimer?.invalidate()
        timeUpdateTimer = nil

        // Wait a moment for cancellation to propagate
        let semaphore = DispatchSemaphore(value: 0)
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            semaphore.signal()
        }
        semaphore.wait()

        // Clean up MPV resources
        if let handle = mpvHandle {
            if isInitialized {
                print("🗑️ Terminating MPV instance...")
                mpv_terminate_destroy(handle)
            } else {
                print("🗑️ Destroying MPV instance...")
                mpv_destroy(handle)
            }
            mpvHandle = nil
        }

        // Clean up memory pressure monitoring
        memoryPressureSource?.cancel()
        memoryPressureSource = nil

        print("✅ MPVWrapper cleanup complete")
    }
}
