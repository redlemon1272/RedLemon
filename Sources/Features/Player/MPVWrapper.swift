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

        // Hardware decoding - TRY DISABLING for Pro freeze debugging
        mpv_set_option_string(handle, "hwdec", "no") // Was "auto"

        // Explicit VideoToolbox support for macOS (better for Intel Macs)
        mpv_set_option_string(handle, "hwdec-codecs", "all")

        // OpenGL for better compatibility with older Intel graphics
        mpv_set_option_string(handle, "gpu-api", "opengl")
        mpv_set_option_string(handle, "gpu-hwdec-interop", "auto")

        // No audio display
        mpv_set_option_string(handle, "audio-display", "no")

        // Performance - Reduced buffers for lower memory usage
        mpv_set_option_string(handle, "cache-secs", "15")  // Was 30s
        mpv_set_option_string(handle, "demuxer-max-bytes", "100M")  // Was 200M
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

        // CRITICAL: Enable subs even when audio language matches subtitle language
        // Without this, embedded English subs won't show when audio is also English
        mpv_set_option_string(handle, "subs-with-matching-audio", "yes")

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

        // Observe duration property for updates (critical for network streams)
        mpv_observe_property(handle, 0, "duration", MPV_FORMAT_DOUBLE)
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
            // Natural cleanup point - video starting
            // Cleanup removed to prevent crash
            // Reset finished state on new file start
            playbackFinished = false
        case MPV_EVENT_FILE_LOADED:
            updateDuration()
            // Auto-select English audio and subtitles BEFORE playback starts (no stutter)
            autoSelectEnglishAudio()
            autoSelectEnglishSubtitles()
        case MPV_EVENT_PLAYBACK_RESTART:
            isBuffering = false
            isPlaying = true
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
            if let name = prop.pointee.name, String(cString: name) == "duration" {
                // Duration updated
                updateDuration()
            }
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

        // CRITICAL FIX: When loading in paused mode (watch party), add a small delay
        // to ensure the render context is fully set up. Without this, loadfile fails with error -4
        // because the command is executed before MPV is ready to accept it.
        if !autoplay {
            NSLog("⏸️ Loading in paused mode (watch party), adding 100ms delay for render context setup...")
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 100_000_000)  // 100ms delay
                self.executeLoadVideo(url: url, autoplay: autoplay)
            }
            return
        }

        // Normal autoplay mode - execute immediately
        executeLoadVideo(url: url, autoplay: autoplay)
    }

    private func executeLoadVideo(url: String, autoplay: Bool) {
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

        // Add the subtitle WITHOUT auto-selecting (use "cached" instead of "select")
        // This prevents external subs from overriding embedded English subs
        var args: [UnsafePointer<CChar>?] = [
            UnsafePointer(strdup("sub-add")),
            UnsafePointer(strdup(url)),
            UnsafePointer(strdup("cached")),  // Add to list but don't auto-select
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

    /// Auto-select English audio track (called on FILE_LOADED event)
    private func autoSelectEnglishAudio() {
        guard let handle = mpvHandle, isInitialized else { return }

        print("🔍 AUDIO AUTO-SELECT: Starting audio track scan during FILE_LOADED event")

        var trackCount: Int64 = 0
        mpv_get_property(handle, "track-list/count", MPV_FORMAT_INT64, &trackCount)
        print("🔍 AUDIO AUTO-SELECT: Found \(trackCount) total tracks")

        var englishAudioTrack: (id: Int, name: String)? = nil
        var surroundAudioTrack: (id: Int, name: String)? = nil
        var firstAudioTrack: (id: Int, name: String)? = nil

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
            guard mpv_get_property(handle, idKey, MPV_FORMAT_INT64, &trackId) >= 0 else {
                continue
            }

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

            let displayName = title ?? lang ?? "Track \(trackId)"
            let langLower = lang?.lowercased() ?? ""
            let titleLower = title?.lowercased() ?? ""

            print("🔍 AUDIO AUTO-SELECT: Track \(i) - ID: \(trackId), lang: '\(lang ?? "nil")', title: '\(title ?? "nil")'")

            // Save first audio track as fallback
            if firstAudioTrack == nil {
                firstAudioTrack = (Int(trackId), displayName)
            }

            // Check if English by language tag
            let isEnglish = langLower.contains("eng") || langLower == "en" || titleLower.contains("english")

            if isEnglish {
                if englishAudioTrack == nil {
                    englishAudioTrack = (Int(trackId), displayName)
                    print("🎵 Found English audio track: \(displayName) (ID: \(trackId))")
                }
            }

            // Check if surround (typically English in dual-audio releases)
            let isSurround = titleLower.contains("surround") ||
                            titleLower.contains("5.1") ||
                            titleLower.contains("7.1") ||
                            titleLower.contains("atmos")

            if isSurround && surroundAudioTrack == nil {
                surroundAudioTrack = (Int(trackId), displayName)
                print("🔊 Found surround audio track: \(displayName) (ID: \(trackId))")
            }
        }

        // Priority: English tagged > Surround > First track
        if let english = englishAudioTrack {
            print("✅ Auto-selecting English audio: \(english.name) (ID: \(english.id))")
            var trackId = Int64(english.id)
            mpv_set_property(handle, "aid", MPV_FORMAT_INT64, &trackId)
        } else if let surround = surroundAudioTrack {
            print("ℹ️ No English-tagged audio, selecting surround: \(surround.name) (ID: \(surround.id))")
            var trackId = Int64(surround.id)
            mpv_set_property(handle, "aid", MPV_FORMAT_INT64, &trackId)
        } else if let first = firstAudioTrack {
            print("ℹ️ Using default first audio track: \(first.name) (ID: \(first.id))")
        } else {
            print("⚠️ No audio tracks found")
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
