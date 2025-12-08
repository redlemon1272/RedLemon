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
    @Published var playbackFinished = false
    @Published var isFileLoaded = false

    internal var mpvHandle: OpaquePointer?
    internal var renderContext: OpaquePointer?  // MPV render context (thread-safe per MPV docs)
    private var openGLContext: CGLContextObj?  // OpenGL context for locking (IINA pattern)
    private var isInitialized = false
    private var eventPollingTask: Task<Void, Never>?
    private var timeUpdateTimer: Timer?
    // Memory monitoring removed to prevent crashes

    // ✅ Throttling Properties
    private var lastUIUpdateTime: Date = .distantPast
    private let minUIUpdateInterval: TimeInterval = 0.25 // 4Hz maximum
    private let minTimeChangeThreshold: Double = 0.1 // 100ms minimum change

    init() {
        print("🎬 MPVWrapper: Creating embedded MPV with render context...")
        mpvHandle = mpv_create()

        guard mpvHandle != nil else {
            print("❌ Failed to create MPV handle")
            return
        }

        print("✅ MPV handle created")

        print("✅ MPV handle created")
    }

    func setupVideo(in view: NSView) {
        guard let handle = mpvHandle, !isInitialized else {
            NSLog("⚠️ MPV already initialized or no handle")
            return
        }

        NSLog("🖼️ Setting up MPV with native macOS video output...")

        // Use libmpv render API with optimized settings for Intel Macs
        mpv_set_option_string(handle, "vo", "libmpv")

        // Hardware decoding - Enable for smooth x265 playback
        mpv_set_option_string(handle, "hwdec", "auto")

        // Explicit VideoToolbox support for macOS (better for Intel Macs)
        mpv_set_option_string(handle, "hwdec-codecs", "all")

        // OpenGL for better compatibility with older Intel graphics
        mpv_set_option_string(handle, "gpu-api", "opengl")
        mpv_set_option_string(handle, "gpu-hwdec-interop", "auto")

        // No audio display
        mpv_set_option_string(handle, "audio-display", "no")

        // Performance - Reduced buffers for lower memory usage
        // Performance - Increased buffers for 4K streaming
        mpv_set_option_string(handle, "cache-secs", "60")  // Allow up to 60s of buffer
        mpv_set_option_string(handle, "demuxer-max-bytes", "500M")  // 500MB buffer for high-bitrate streams
        
        // Anti-Stutter: Wait for buffer to fill before resuming
        // This prevents the "play-buffer-play-buffer" loop by forcing a 5s buffer fill
        mpv_set_option_string(handle, "cache-pause-wait", "5")
        mpv_set_option_string(handle, "vd-lavc-threads", "4")

        // Audio buffering for watch party sync (prevents crackling during speed changes)
        mpv_set_option_string(handle, "audio-buffer", "1.0")  // 1 second audio buffer
        mpv_set_option_string(handle, "audio-samplerate", "48000")  // Standard sample rate
        mpv_set_option_string(handle, "audio-pitch-correction", "yes")  // Maintain pitch during speed changes
        mpv_set_option_string(handle, "af", "scaletempo2")  // Better audio resampling for speed changes

        // UI
        mpv_set_option_string(handle, "keep-open", "no")  // Exit on EOF
        mpv_set_option_string(handle, "loop", "no")  // Don't loop/restart
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
        
        // Enable detailed logging for network diagnostics
        mpv_request_log_messages(handle, "info")

        // Observe duration property for updates (critical for network streams)
        mpv_observe_property(handle, 0, "duration", MPV_FORMAT_DOUBLE)
        
        // Observe pause property to correctly track playback state
        mpv_observe_property(handle, 0, "pause", MPV_FORMAT_FLAG)
        
        // Observe buffering state (detects network stalls)
        mpv_observe_property(handle, 0, "paused-for-cache", MPV_FORMAT_FLAG)
    }

    // MARK: - Smart Memory Monitoring (Removed)
    // Memory monitoring logic removed to prevent race conditions during playback transitions

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
            isFileLoaded = false
            // Natural cleanup point - video starting
            // Cleanup removed to prevent crash
            // Reset finished state on new file start
            playbackFinished = false
        case MPV_EVENT_FILE_LOADED:
            updateDuration()
            isFileLoaded = true
            // Auto-select English audio and subtitles BEFORE playback starts (no stutter)
            autoSelectEnglishAudio()
            autoSelectEnglishSubtitles()
        case MPV_EVENT_PLAYBACK_RESTART:
            isBuffering = false
            // Don't blindly set isPlaying = true here.
            // Rely on the "pause" property change event to set isPlaying.
            // This prevents false positives when loading a file in paused state.
        case MPV_EVENT_END_FILE:
            isPlaying = false
            // Perfect time for cleanup - video ended naturally
            // Cleanup removed to prevent crash

            // Check if it was EOF (natural finish) using the event data
            if let data = eventPtr.pointee.data?.assumingMemoryBound(to: mpv_event_end_file.self) {
                let reason = data.pointee.reason
                // MPV_END_FILE_REASON_EOF = 0 means natural end of file
                if reason.rawValue == 0 {
                    print("🏁 MPV: Playback finished (EOF - reason: \(reason.rawValue))")
                    print("🏁 MPV: Setting playbackFinished = true")
                    playbackFinished = true
                    print("🏁 MPV: playbackFinished is now \(playbackFinished)")
                } else {
                    print("⚠️ MPV: END_FILE event but not EOF (reason: \(reason.rawValue))")
                }
            } else {
                print("⚠️ MPV: END_FILE event but no event data available")
            }
        case MPV_EVENT_IDLE:
            isBuffering = false
        case MPV_EVENT_PROPERTY_CHANGE:
            guard let data = eventPtr.pointee.data else { break }
            let prop = data.assumingMemoryBound(to: mpv_event_property.self)
            guard let name = prop.pointee.name else { break }
            let nameStr = String(cString: name)
            
            if nameStr == "duration" {
                // Duration updated
                updateDuration()
            } else if nameStr == "pause" {
                // Pause state changed - update isPlaying
                // MPV_FORMAT_FLAG returns int (0 or 1)
                if let value = prop.pointee.data {
                    let isPaused = value.assumingMemoryBound(to: Int32.self).pointee != 0
                    // Only update if changed to avoid loop
                    if self.isPlaying == isPaused {
                        self.isPlaying = !isPaused
                        print("⏯️ MPV: Pause state changed to \(isPaused) -> isPlaying = \(self.isPlaying)")
                    }
                }
            } else if nameStr == "paused-for-cache" {
                 // Buffering state changed
                 if let value = prop.pointee.data {
                     let isBufferingNow = value.assumingMemoryBound(to: Int32.self).pointee != 0
                     if self.isBuffering != isBufferingNow {
                         self.isBuffering = isBufferingNow
                         print("⏳ MPV: Buffering state changed: \(isBufferingNow) (paused-for-cache)")
                     }
                 }
            }
        case MPV_EVENT_LOG_MESSAGE:
            guard let data = eventPtr.pointee.data else { break }
            let log = data.assumingMemoryBound(to: mpv_event_log_message.self)
            guard let text = log.pointee.text else { break }
            let message = String(cString: text).trimmingCharacters(in: .whitespacesAndNewlines)
            // Filter out noisy logs if needed, but keeping "info" level is good for diagnostics
            print("[MPV] \(message)")
        default:
            if eventId.rawValue != MPV_EVENT_LOG_MESSAGE.rawValue {
                print(" MPV Event: \(eventId.rawValue)")
            }
        }
    }



    // MARK: - Enhanced Timer Management

    private func startTimeUpdates() {
        timeUpdateTimer?.invalidate()
        timeUpdateTimer = nil

        // ✅ Reduce from 2Hz to 4Hz maximum (0.25s)
        timeUpdateTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { [weak self] _ in
            guard let strongSelf = self else { return }
            Task { @MainActor in
                strongSelf.updateCurrentTime()
            }
        }
    }

    private func updateCurrentTime() {
        guard let handle = mpvHandle, isInitialized, isPlaying else { return }

        let now = Date()
        guard now.timeIntervalSince(lastUIUpdateTime) >= minUIUpdateInterval else { return }
        lastUIUpdateTime = now

        var time: Double = 0
        mpv_get_property(handle, "time-pos", MPV_FORMAT_DOUBLE, &time)

        // ✅ Only update if significant change
        guard abs(currentTime - time) >= minTimeChangeThreshold else { return }
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

        // Execute load immediately
        executeLoadVideo(url: url, autoplay: autoplay)
    }

    private func executeLoadVideo(url: String, autoplay: Bool) {
        guard let handle = mpvHandle else {
            NSLog("❌ MPV handle is nil!")
            return
        }

        // CRITICAL FIX: For paused loads (watch party), we load normally then immediately pause
        // Using 'loadfile "URL" pause' was failing with error -4
        // Instead, we load the file and set pause=yes immediately after
        if !autoplay {
            NSLog("⏸️ Loading in paused mode (watch party)")
            NSLog("🔗 URL: %@", url)

            // CRITICAL FIX: Set pause=yes BEFORE loading the file
            // This ensures MPV initializes the file (firing FILE_LOADED and updating duration)
            // but starts in a paused state.
            mpv_set_property_string(handle, "pause", "yes")

            // Load the file normally
            let loadCommand = "loadfile \"\(url)\""
            NSLog("🎬 MPV executing: %@", loadCommand)
            let loadResult = mpv_command_string(handle, loadCommand)
            NSLog("🎬 MPV loadfile result: %d", loadResult)

            if loadResult >= 0 {
                isPlaying = false
                NSLog("✅ MPV loadfile succeeded (started paused)")
            } else {
                NSLog("❌ MPV loadfile failed with code: %d", loadResult)
                NSLog("❌ Failed URL was: %@", url)
                // Revert pause state if load failed
                mpv_set_property_string(handle, "pause", "no")
            }
        } else {
            // Normal autoplay mode
            // CRITICAL FIX: Explicitly set pause=no to ensure we don't inherit paused state from previous session
            mpv_set_property_string(handle, "pause", "no")

            let command = "loadfile \"\(url)\""
            NSLog("🎬 MPV executing command: %@", command)
            let result = mpv_command_string(handle, command)
            NSLog("🎬 MPV loadfile result: %d", result)
            if result >= 0 {
                isPlaying = true
                NSLog("✅ MPV loadfile succeeded, isPlaying set to true")
            } else {
                NSLog("❌ MPV loadfile failed with code: %d", result)
                NSLog("❌ Failed URL was: %@", url)
            }
        }
    }


    func loadSubtitle(url: String, title: String = "English") {
        guard let handle = mpvHandle, isInitialized else {
            NSLog("❌ Cannot load subtitle: MPV not initialized")
            return
        }
        NSLog("📝 Loading subtitle from: %@", String(url.prefix(80)))

        // Add the subtitle WITHOUT auto-selecting (use "cached" instead of "select")
        // This prevents external subs from overriding embedded English subs
        var args: [UnsafePointer<CChar>?] = [
            UnsafePointer(strdup("sub-add")),
            UnsafePointer(strdup(url)),
            UnsafePointer(strdup("auto")),    // Add to list but don't auto-select (use "auto" flag)
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
            NSLog("✅ External subtitle added to track list (not auto-selected)")
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
        // Cleanup removed to prevent crash
    }

    func togglePlayPause() { isPlaying ? pause() : play() }

    func seek(to seconds: Double) {
        guard let handle = mpvHandle, isInitialized else { return }
        var t = seconds
        mpv_set_property(handle, "time-pos", MPV_FORMAT_DOUBLE, &t)

        // Natural cleanup point during seek
        // Cleanup removed to prevent crash
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
            "angielski": "English",  // Polish for "English"
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

    /// Auto-select best audio track using scoring system (Language + Channels - Commentary)
    private func autoSelectEnglishAudio() {
        guard let handle = mpvHandle, isInitialized else { return }

        print("🔍 AUDIO AUTO-SELECT: Starting smart audio track scan")

        var trackCount: Int64 = 0
        mpv_get_property(handle, "track-list/count", MPV_FORMAT_INT64, &trackCount)

        // Keywords to AVOID
        let commentaryKeywords = ["commentary", "narration", "description", "director", "comment", "visually impaired", "audio description"]

        var bestTrackId: Int64 = -1
        var bestScore: Int = -99999
        var bestTrackName: String = ""

        // Scan all audio tracks
        for i in 0..<Int(trackCount) {
            // Check if it's an audio track
            let typeKey = "track-list/\(i)/type"
            var typeStr: UnsafeMutablePointer<CChar>?
            guard mpv_get_property(handle, typeKey, MPV_FORMAT_STRING, &typeStr) >= 0,
                  let type = typeStr.map({ String(cString: $0) }),
                  type == "audio" else {
                mpv_free(typeStr)
                continue
            }
            mpv_free(typeStr)

            // Get track ID
            let idKey = "track-list/\(i)/id"
            var trackId: Int64 = 0
            guard mpv_get_property(handle, idKey, MPV_FORMAT_INT64, &trackId) >= 0 else { continue }

            // Get language
            let langKey = "track-list/\(i)/lang"
            var langStr: UnsafeMutablePointer<CChar>?
            let lang = (mpv_get_property(handle, langKey, MPV_FORMAT_STRING, &langStr) >= 0)
                ? langStr.map { String(cString: $0) }
                : nil
            mpv_free(langStr)

            // Get title
            let titleKey = "track-list/\(i)/title"
            var titleStr: UnsafeMutablePointer<CChar>?
            let title = (mpv_get_property(handle, titleKey, MPV_FORMAT_STRING, &titleStr) >= 0)
                ? titleStr.map { String(cString: $0) }
                : nil
            mpv_free(titleStr)

            // Get channel count
            let channelsKey = "track-list/\(i)/audio-channels"
            var channels: Int64 = 2 // Default to stereo if unknown
            mpv_get_property(handle, channelsKey, MPV_FORMAT_INT64, &channels)

            let displayName = title ?? lang ?? "Track \(trackId)"
            let langLower = lang?.lowercased() ?? ""
            let titleLower = title?.lowercased() ?? ""

            // --- SCORING SYSTEM ---
            var score = 0

            // 1. Language Score (+1000 for English)
            // Check for: "en", "en-US", "en-GB", "eng", "english" in title
            let isEnglish = langLower.hasPrefix("en") || langLower.contains("eng") || titleLower.contains("english")
            if isEnglish { score += 1000 }

            // 2. Channel Score (+10 per channel)
            // 5.1 (6ch) = +60, Stereo (2ch) = +20
            score += Int(channels) * 10

            // 3. Commentary Penalty (-10000)
            let isCommentary = commentaryKeywords.contains { keyword in
                titleLower.contains(keyword)
            }
            if isCommentary { score -= 10000 }

            // 4. Default Flag Bonus (+5) - Tiebreaker
            let defaultKey = "track-list/\(i)/default"
            var isDefaultFlag: Int64 = 0
            mpv_get_property(handle, defaultKey, MPV_FORMAT_FLAG, &isDefaultFlag)
            if isDefaultFlag == 1 { score += 5 }

            print("🔍 Track \(trackId): \(displayName) | \(channels)ch | English: \(isEnglish) | Commentary: \(isCommentary) -> Score: \(score)")

            if score > bestScore {
                bestScore = score
                bestTrackId = trackId
                bestTrackName = displayName
            }
        }

        if bestTrackId != -1 {
            print("🏆 Selected best audio track: \(bestTrackName) (ID: \(bestTrackId), Score: \(bestScore))")
            var tid = bestTrackId
            mpv_set_property(handle, "aid", MPV_FORMAT_INT64, &tid)
        } else {
            print("⚠️ No suitable audio tracks found")
        }
    }

    /// Auto-select first English embedded subtitle track (called on FILE_LOADED event)
    private func autoSelectEnglishSubtitles() {
        guard let handle = mpvHandle, isInitialized else { return }

        print("🔍 AUTO-SELECT: Starting subtitle scan during FILE_LOADED event")

        var trackCount: Int64 = 0
        mpv_get_property(handle, "track-list/count", MPV_FORMAT_INT64, &trackCount)
        print("🔍 AUTO-SELECT: Found \(trackCount) total tracks")

        struct SubCandidate {
            let id: Int
            let name: String
            let isExternal: Bool
            let isForced: Bool
            let isDefault: Bool
            let title: String
        }

        var candidates: [SubCandidate] = []

        // Scan all subtitle tracks
        for i in 0..<Int(trackCount) {
            // Check if it's a subtitle track
            let typeKey = "track-list/\(i)/type"
            var typeStr: UnsafeMutablePointer<CChar>?
            guard mpv_get_property(handle, typeKey, MPV_FORMAT_STRING, &typeStr) >= 0,
                  let type = typeStr.map({ String(cString: $0) }),
                  type == "sub" else {
                mpv_free(typeStr)
                continue
            }
            mpv_free(typeStr)

            // Get track ID
            let idKey = "track-list/\(i)/id"
            var trackId: Int64 = 0
            guard mpv_get_property(handle, idKey, MPV_FORMAT_INT64, &trackId) >= 0, trackId != 0 else {
                continue
            }

            // Check properties
            let externalKey = "track-list/\(i)/external"
            var isExternalVal: Int64 = 0
            let _ = mpv_get_property(handle, externalKey, MPV_FORMAT_FLAG, &isExternalVal)
            let isExternal = isExternalVal != 0

            let forcedKey = "track-list/\(i)/forced"
            var isForcedVal: Int64 = 0
            let _ = mpv_get_property(handle, forcedKey, MPV_FORMAT_FLAG, &isForcedVal)
            let isForced = isForcedVal != 0

            let defaultKey = "track-list/\(i)/default"
            var isDefaultVal: Int64 = 0
            let _ = mpv_get_property(handle, defaultKey, MPV_FORMAT_FLAG, &isDefaultVal)
            let isDefault = isDefaultVal != 0

            // Get language & title
            let langKey = "track-list/\(i)/lang"
            var langStr: UnsafeMutablePointer<CChar>?
            let lang = (mpv_get_property(handle, langKey, MPV_FORMAT_STRING, &langStr) >= 0)
                ? langStr.map { String(cString: $0) }
                : nil
            mpv_free(langStr)

            let titleKey = "track-list/\(i)/title"
            var titleStr: UnsafeMutablePointer<CChar>?
            let title = (mpv_get_property(handle, titleKey, MPV_FORMAT_STRING, &titleStr) >= 0)
                ? titleStr.map { String(cString: $0) }
                : nil
            mpv_free(titleStr)

            // Check if English
            let langLower = lang?.lowercased() ?? ""
            let titleLower = title?.lowercased() ?? ""
            let isEnglish = langLower.contains("eng") || langLower == "en" || titleLower.contains("english")

            print("🔍 AUTO-SELECT: Track \(i) - ID: \(trackId), lang: '\(lang ?? "nil")', title: '\(title ?? "nil")', forced: \(isForced), default: \(isDefault)")

            if isEnglish {
                let displayName = title ?? lang ?? "Track \(trackId)"

                // Filter out known bad patterns
                let isPartialSub = titleLower.contains("valyrian") ||
                                   titleLower.contains("foreign") ||
                                   titleLower.contains("parts") ||
                                   titleLower.contains("commentary")

                if !isPartialSub {
                    candidates.append(SubCandidate(
                        id: Int(trackId),
                        name: displayName,
                        isExternal: isExternal,
                        isForced: isForced,
                        isDefault: isDefault,
                        title: titleLower
                    ))
                } else {
                    print("⚠️ Ignoring partial/commentary subtitle: \(displayName)")
                }
            }
        }

        // Select best candidate
        // Scoring:
        // +100 for Embedded (vs External)
        // +50 for SDH/CC
        // -50 for Forced (unless it's the only one)
        // -10 for Default (often foreign default in dual audio)
        // +1 for Higher ID (often later tracks are better/fixed)

        let bestCandidate = candidates.max { a, b in
            var scoreA = 0
            var scoreB = 0

            // Prefer Embedded
            if !a.isExternal { scoreA += 100 }
            if !b.isExternal { scoreB += 100 }

            // Prefer SDH/CC
            if a.title.contains("sdh") || a.title.contains("cc") { scoreA += 50 }
            if b.title.contains("sdh") || b.title.contains("cc") { scoreB += 50 }

            // Avoid Forced
            if a.isForced { scoreA -= 50 }
            if b.isForced { scoreB -= 50 }

            // Avoid Default (in dual audio, default is often the foreign one)
            if a.isDefault { scoreA -= 10 }
            if b.isDefault { scoreB -= 10 }

            // Tie-breaker: Prefer later tracks (often better/fixed)
            if a.id > b.id { scoreA += 1 }
            if b.id > a.id { scoreB += 1 }

            return scoreA < scoreB
        }

        if let best = bestCandidate {
            print("✅ Auto-selecting BEST English subtitle: \(best.name) (ID: \(best.id)) [External: \(best.isExternal), Forced: \(best.isForced), Default: \(best.isDefault)]")
            var trackId = Int64(best.id)
            mpv_set_property(handle, "sid", MPV_FORMAT_INT64, &trackId)

            // Enable subtitle visibility
            var visFlag: Int32 = 1
            mpv_set_property(handle, "sub-visibility", MPV_FORMAT_FLAG, &visFlag)
        } else {
            print("ℹ️ No suitable English subtitles found")
        }
    }

    func cycleSubtitles() {
        guard let handle = mpvHandle, isInitialized else { return }
        _ = mpv_command_string(handle, "cycle sub")
    }

    func cycleAudio() {
        guard let handle = mpvHandle, isInitialized else { return }
        _ = mpv_command_string(handle, "cycle audio")
    }

    func setSubtitleTrack(_ id: Int, completion: @escaping () -> Void = {}) {
        guard let handle = mpvHandle, isInitialized else { return }

        // Run on background queue to prevent main thread blocking (UI stutter)
        DispatchQueue.global(qos: .userInitiated).async {
            // Set subtitle track (use "no" string for disabling, or track ID)
            if id <= 0 {
                // Disable subtitles
                let noStr = "no".cString(using: .utf8)
                var noPtr = noStr?.withUnsafeBufferPointer { UnsafeMutablePointer(mutating: $0.baseAddress) }
                mpv_set_property(handle, "sid", MPV_FORMAT_STRING, &noPtr)
                print("🔇 Disabled subtitles (async)")
            } else {
                // Enable specific subtitle track
                var trackId = Int64(id)
                mpv_set_property(handle, "sid", MPV_FORMAT_INT64, &trackId)
                print("📝 Set subtitle track to: \(id) (async)")
            }

            // Notify completion on main thread
            DispatchQueue.main.async {
                completion()
            }
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

        // ✅ IMMEDIATE: Cancel event polling
        eventPollingTask?.cancel()
        eventPollingTask = nil

        // Stop playback
        _ = mpv_command_string(handle, "stop")
        isPlaying = false

        // Stop internal timers immediately
        timeUpdateTimer?.invalidate()
        timeUpdateTimer = nil

        // ✅ WAIT: Give event loop time to exit cleanly
        let cleanupDelay = Task {
            try? await Task.sleep(nanoseconds: 100_000_000) // 100ms
        }
        Task {
            _ = await cleanupDelay.value
            print("✅ MPV stop completed with clean event loop exit")
        }
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

        // Cancel time update timer
        timeUpdateTimer?.invalidate()
        timeUpdateTimer = nil

        // Clean up MPV resources
        // Clean up MPV resources
        if let handle = mpvHandle {
            // Explicitly clear render context pointer to prevent any further access
            renderContext = nil
            // Clear handle immediately so no other calls can use it
            mpvHandle = nil

            let wasInitialized = isInitialized

            // CRITICAL: Destroy MPV on background thread to prevent blocking Main Thread
            // mpv_terminate_destroy can take significant time (flushing caches, closing streams)
            // which causes "spinning beach ball" freezes if run on Main Thread.
            Task.detached(priority: .background) {
                if wasInitialized {
                    print("🗑️ Terminating MPV instance (background)...")
                    mpv_terminate_destroy(handle)
                } else {
                    print("🗑️ Destroying MPV instance (background)...")
                    mpv_destroy(handle)
                }
                print("✅ MPV instance destroyed")
            }
        }

        // Clean up memory pressure monitoring
        // memoryPressureSource?.cancel()
        // memoryPressureSource = nil

        print("✅ MPVWrapper cleanup complete")
    }
}
