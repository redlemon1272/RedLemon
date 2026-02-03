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
import LibMPV

/// Small MPV wrapper that manages an embedded mpv instance and its render context.
/// Thread-safe container for MPV handles to allow background rendering access
/// without violating MainActor isolation of the parent wrapper.
final class MPVHandleState: @unchecked Sendable {
    let lock = NSRecursiveLock()
    var handle: OpaquePointer?
    var renderContext: OpaquePointer?
    var openGLContext: CGLContextObj?
}


@MainActor
class MPVWrapper: ObservableObject {
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    @Published var isBuffering = false
    @Published var volume: Int = 100
    @Published var playbackFinished = false
    @Published var isFileLoaded = false
    @Published var mpvError: String? = nil // Expose critical errors to ViewModel

    // Track update notification
    let tracksChanged = PassthroughSubject<Void, Never>()
    @Published var hasCompletedInitialTrackSelection = false // Prevents duplicate re-scans

    // Track the current video filename for subtitle matching
    private var currentVideoFilename: String = ""

    // Track if we should resume playback after loading (Smart Paused Load)
    private var shouldResumeAfterLoad: Bool = false

    // Race Condition Fix: Track expected external subtitles to prevent premature resumption
    private var expectedExternalSubtitles: Int = 0

    // Security Check #89 Fix: Track highest position seen during playback.
    // Used for accurate EOF detection when currentTime resets to 0 during edge-case seeks.
    private var lastKnownGoodPosition: Double = 0

    // Thread-safe handle state
    private let state = MPVHandleState()

    // nonisolated thread-safe access for rendering paths (CAOpenGLLayer / CVDisplayLink)
    internal nonisolated var mpvHandle: OpaquePointer? { state.lock.withLock { state.handle } }
    internal nonisolated var renderContext: OpaquePointer? { state.lock.withLock { state.renderContext } }
    private nonisolated var openGLContext: CGLContextObj? { state.lock.withLock { state.openGLContext } }

    private var isInitialized = false
    private var eventPollingTask: Task<Void, Never>?
    private var timeUpdateTask: Task<Void, Never>?


    // ✅ Throttling Properties
    private var lastUIUpdateTime: Date = .distantPast
    private let minUIUpdateInterval: TimeInterval = 0.25 // 4Hz maximum
    private let minTimeChangeThreshold: Double = 0.1 // 100ms minimum change

    init() {
        LoggingManager.shared.info(.videoRendering, message: "MPVWrapper: Creating embedded MPV with render context...")
        // Initialize handle in state
        let handle = mpv_create()
        state.lock.withLock {
            state.handle = handle
        }

        guard handle != nil else {
            LoggingManager.shared.error(.videoRendering, message: "Failed to create MPV handle")
            return
        }

        LoggingManager.shared.info(.videoRendering, message: "MPV handle created")
        print("!!! MPVWrapper initialized - Build Version: 2026-01-28-PRESENCE-FIX-v3 !!!")
        NSLog("🛡️ MPVWrapper: Build Version: 2026-01-28-PRESENCE-FIX-v3")
    }

    func setupVideo(in view: NSView) {
        guard let handle = mpvHandle, !isInitialized else {
            LoggingManager.shared.warn(.videoRendering, message: "MPV already initialized or no handle")
            return
        }

        LoggingManager.shared.info(.videoRendering, message: "Setting up MPV with native macOS video output...")

        // Fix: Explicitly set user-writable config/cache directories
        // This prevents MPV from failing to write checks/fonts in Release builds
        if let appSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first {
            let mpvConfigDir = appSupport.appendingPathComponent("RedLemon/mpv")
            try? FileManager.default.createDirectory(at: mpvConfigDir, withIntermediateDirectories: true, attributes: nil)

            let configPath = mpvConfigDir.path
            mpv_set_option_string(handle, "config", "yes")
            mpv_set_option_string(handle, "config-dir", configPath)
            mpv_set_option_string(handle, "icc-cache-dir", mpvConfigDir.appendingPathComponent("icc").path)
            mpv_set_option_string(handle, "gpu-shader-cache-dir", mpvConfigDir.appendingPathComponent("shaders").path)
            mpv_set_option_string(handle, "watch-later-directory", mpvConfigDir.appendingPathComponent("watch_later").path)

            LoggingManager.shared.debug(.videoRendering, message: "MPV Config Dir set to: \(configPath)")
        }

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
        // Reduced from 5s to 0s to fix "Resume Delay" on Apple Silicon (5s latency on unpause)
        mpv_set_option_string(handle, "cache-pause-wait", "0")
        mpv_set_option_string(handle, "vd-lavc-threads", "4")

        // Audio buffering for watch party sync (prevents crackling during speed changes)
        mpv_set_option_string(handle, "audio-buffer", "1.0")  // 1 second audio buffer
        mpv_set_option_string(handle, "audio-samplerate", "48000")  // Standard sample rate
        mpv_set_option_string(handle, "audio-pitch-correction", "yes")  // Maintain pitch during speed changes
        mpv_set_option_string(handle, "af", "scaletempo2")  // Better audio resampling for speed changes
        mpv_set_option_string(handle, "audio-wait-for-video", "no")  // Start playback immediately without waiting for sync

        // UI
        mpv_set_option_string(handle, "keep-open", "no")  // Exit on EOF
        mpv_set_option_string(handle, "loop", "no")  // Don't loop/restart
        mpv_set_option_string(handle, "input-default-bindings", "no")
        mpv_set_option_string(handle, "input-vo-keyboard", "no")
        mpv_set_option_string(handle, "osd-level", "0")
        mpv_set_option_string(handle, "border", "no")
        mpv_set_option_string(handle, "ontop", "no")
        mpv_set_option_string(handle, "keepaspect", "yes")
        mpv_set_option_string(handle, "video-zoom", "0")
        mpv_set_option_string(handle, "panscan", "0")
        mpv_set_option_string(handle, "video-align-x", "0")
        mpv_set_option_string(handle, "video-align-y", "0")

        // Language preferences: English audio and subtitles by default
        mpv_set_option_string(handle, "alang", "eng,en,english")
        mpv_set_option_string(handle, "slang", "eng,en,english")

        // Network: Fail faster on bad streams (default is often too long)
        mpv_set_option_string(handle, "network-timeout", "15")

        // CRITICAL FIX: Disable built-in resume to prevent files starting at EOF (False EOF)
        // We handle resume manually in the ViewModel.
        mpv_set_option_string(handle, "save-position-on-quit", "no")

        let initResult = mpv_initialize(handle)
        guard initResult >= 0 else {
            LoggingManager.shared.error(.videoRendering, message: "MPV initialization failed: \(initResult)")
            return
        }

        LoggingManager.shared.info(.videoRendering, message: "MPV initialized with native GPU rendering")

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

        // Observe track list changes to update subtitle/audio menus reactively
        mpv_observe_property(handle, 0, "track-list", MPV_FORMAT_NONE)
        mpv_observe_property(handle, 0, "track-list/count", MPV_FORMAT_INT64)

        // Observe buffering state (detects network stalls)
        mpv_observe_property(handle, 0, "paused-for-cache", MPV_FORMAT_FLAG)
    }



    // MARK: - Render Context Setup (IINA Implementation)

    internal func createRenderContext(with layer: MPVViewLayer) {
        // Use the thread-safe computed property getter
        guard let handle = mpvHandle else { return }

        LoggingManager.shared.debug(.videoRendering, message: "🎬 Creating MPV render context with OpenGL (IINA method)...")

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
                    LoggingManager.shared.error(.videoRendering, message: "Failed to create render context: \(result)")
                    return
                }

                // Write to state using the lock
                state.lock.withLock {
                    state.renderContext = renderCtx
                    state.openGLContext = CGLGetCurrentContext()
                }

                // Set IINA's update callback with the layer as context
                let layerPtr = Unmanaged.passUnretained(layer).toOpaque()
                // Retrieve using safe getter inside the setup scope
                mpv_render_context_set_update_callback(renderCtx, mpvUpdateCallback, layerPtr)

                LoggingManager.shared.debug(.videoRendering, message: "Render context created successfully (IINA method)")
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

    // MARK: - Smart Paused Load Implementation

    /// Polls for subtitle tracks to appear, selects default, then resumes if needed
    private func pollForTracksAndResume() async {
        guard let handle = mpvHandle else { return }

        LoggingManager.shared.debug(.subtitles, message: "SMART-LOAD: Starting track polling loop...")
        LoggingManager.shared.debug(.subtitles, message: "SMART-LOAD: Expecting \(self.expectedExternalSubtitles) external subtitles to prevent race condition")

        // Timeout: allow more time if we are waiting for external subtitles (slow network)
        // 15 seconds for network-bound external subs; 4 seconds for purely local/embedded
        let timeoutDuration: TimeInterval = self.expectedExternalSubtitles > 0 ? 15.0 : 4.0
        let timeout = Date().addingTimeInterval(timeoutDuration)
        var tracksFound = false
        var allExpectedSubsLoaded = false

        // 1. Poll loop
        while Date() < timeout {
            // CRITICAL CHECK: Ensure we haven't been deallocated or cancelled
            guard !Task.isCancelled, let safeHandle = mpvHandle else {
                LoggingManager.shared.debug(.videoRendering, message: "SMART-LOAD: Polling cancelled or handle destroyed")
                return
            }

            var trackCount: Int64 = 0
            mpv_get_property(safeHandle, "track-list/count", MPV_FORMAT_INT64, &trackCount)

            // Count external subtitles
            var externalSubCount = 0
            for i in 0..<Int(trackCount) {
                let typeKey = "track-list/\(i)/type"
                var typeStr: UnsafeMutablePointer<CChar>?
                mpv_get_property(safeHandle, typeKey, MPV_FORMAT_STRING, &typeStr)
                let type = typeStr.map({ String(cString: $0) })
                mpv_free(typeStr)

                if type == "sub" {
                    let externalKey = "track-list/\(i)/external"
                    var isExternal: Int32 = 0
                    mpv_get_property(safeHandle, externalKey, MPV_FORMAT_FLAG, &isExternal)
                    if isExternal != 0 {
                        externalSubCount += 1
                    }
                }
            }

            // Check if we have enough tracks
            // Condition 1: Basic tracks exist (>2 implies Video + Audio + at least 1 sub/other)
            let basicTracksExist = trackCount > 2

            // Condition 2: External subtitles match expectation
            let subsReady = externalSubCount >= self.expectedExternalSubtitles

            if basicTracksExist && subsReady {
                tracksFound = true
                allExpectedSubsLoaded = true
                LoggingManager.shared.info(.subtitles, message: "SMART-LOAD: Found \(trackCount) tracks including \(externalSubCount)/\(self.expectedExternalSubtitles) external subs.")
                break
            }

            if basicTracksExist && !subsReady {
                 // Log regularly while waiting for external assets
                 let now = Date().timeIntervalSince1970
                 if Int(now * 2) % 2 == 0 { // log every 0.5s approx
                      LoggingManager.shared.debug(.subtitles, message: "SMART-LOAD: Still waiting for external subs... (Found \(externalSubCount)/\(self.expectedExternalSubtitles)) [Elapsed: \(String(format: "%.1f", 15.0 - timeout.timeIntervalSinceNow))s]")
                 }
            }

            try? await Task.sleep(nanoseconds: 100_000_000) // 100ms
        }

        if allExpectedSubsLoaded {
            LoggingManager.shared.info(.subtitles, message: "SMART-LOAD: All tracks ready! Proceeding to selection.")
        } else {
            LoggingManager.shared.warn(.subtitles, message: "SMART-LOAD: Timed out waiting for tracks. Proceeding best-effort.")
        }

        // 2. Select Tracks
        await MainActor.run {
             self.autoSelectEnglishAudio()
             // Run it twice just to be safe (idempotent)
             self.autoSelectEnglishAudio()
             self.refreshSubtitleSelection()
             // Mark that initial selection is complete to prevent ViewModel from re-scanning
             self.hasCompletedInitialTrackSelection = true
        }

        // Final stabilization delay (short) just to be safe
         try? await Task.sleep(nanoseconds: 100_000_000) // 100ms

        // 3. Execute Pending Seek (moved here to happen AFTER tracks ready)
        if let targetTime = self.pendingSeekTime {
             await MainActor.run {
                 LoggingManager.shared.info(.videoRendering, message: "MPV: Executing PENDING SEEK to \(String(format: "%.1f", targetTime))s (Smart Load)")
                 Task { await SessionRecorder.shared.log(category: .player, message: "Executing Pending Seek", metadata: ["target": "\(targetTime)"]) }
                 self.seek(to: targetTime)
                 self.pendingSeekTime = nil
             }
        }

        // 4. Resume Playback if Autoplay was requested
        if self.shouldResumeAfterLoad {
            LoggingManager.shared.debug(.videoRendering, message: "SMART-LOAD: Resuming playback (Autoplay requested)")
             await MainActor.run {
                if let safeHandle = self.mpvHandle {
                    mpv_set_property_string(safeHandle, "pause", "no")
                    self.isPlaying = true
                }
             }
        } else {
             LoggingManager.shared.debug(.videoRendering, message: "SMART-LOAD: Staying paused (Watch Party / User Request)")
        }
    }

    // MARK: - Smart Event Polling (Playback-Aware)

    nonisolated private func pollEvents() async {
        guard let handle = state.lock.withLock({ state.handle }) else { return }
        // Internal Note #1: Initial guard is fine, but we MUST re-acquire and check INSIDE the loop.
        guard let _ = state.lock.withLock({ state.handle }) else { return }

        LoggingManager.shared.debug(.videoRendering, message: "MPV: Event polling task started")

        while !Task.isCancelled {
            // CRITICAL FIX: Re-acquire handle from state lock for EVERY iteration.
            // This ensures we are NOT using a stale handle captured at the start of the task.
            guard let handle = state.lock.withLock({ state.handle }) else {
                LoggingManager.shared.debug(.videoRendering, message: "MPV: Polling loop exited - handle is nil")
                break
            }

            // Adaptive timeout: 0.5s if playing (less churning), 0.1s if paused (snappy response)
            let playing = await MainActor.run { self.isPlaying }
            let timeout = playing ? 0.5 : 0.1

            // mpv_wait_event is blocking. If destroy() is called, mpv_wakeup() will cause this to return.
            let event = mpv_wait_event(handle, timeout)

            // CRITICAL FIX: Immediately after wakeup/timeout, check for cancellation OR handle nullification.
            // If destroy() was called, state.handle will be nil.
            if Task.isCancelled || state.lock.withLock({ state.handle }) == nil {
                LoggingManager.shared.debug(.videoRendering, message: "MPV: Polling loop interrupted during wait - exiting")
                break
            }

            guard let eventPtr = event else { continue }

            let eventId = eventPtr.pointee.event_id
            if eventId == MPV_EVENT_SHUTDOWN {
                LoggingManager.shared.debug(.videoRendering, message: "MPV: Shutdown event received")
                break
            }

            // Sync back to MainActor for event handling
            await MainActor.run { [weak self] in
                guard let self = self else { return }
                self.handleMPVEvent(eventId: eventId, eventPtr: eventPtr)
            }
        }

        LoggingManager.shared.debug(.videoRendering, message: "MPV: Event polling task finished cleanly")
    }

    private func handleMPVEvent(eventId: mpv_event_id, eventPtr: UnsafePointer<mpv_event>) {
        // CRITICAL SAFETY CHECK:
        // If mpvHandle is nil, destroy() has been called and mpv_terminate_destroy is running
        // in the background. Accessing eventPtr or its data is now unsafe (SIGSEGV risk).
        guard mpvHandle != nil else {
            LoggingManager.shared.debug(.videoRendering, message: "MPV: Ignoring event \(eventId.rawValue) (Handle destroyed)")
            return
        }

        switch eventId {
        case MPV_EVENT_NONE: break
        case MPV_EVENT_START_FILE:
            isBuffering = true
            isFileLoaded = false
            // Natural cleanup point - video starting
            // Reset finished state on new file start
            playbackFinished = false
            lastKnownGoodPosition = 0 // Reset position tracker for new file
            mpvError = nil // Reset error state
        case MPV_EVENT_FILE_LOADED:
            updateDuration()
            isFileLoaded = true

            // Check true buffering state immediately (prevents stuck spinner if start_file set it true)
            if let handle = mpvHandle {
                var isBufferingNow: Int32 = 0
                mpv_get_property(handle, "paused-for-cache", MPV_FORMAT_FLAG, &isBufferingNow)
                self.isBuffering = (isBufferingNow != 0)
            }

            // Smart Paused Load Strategy:
            // 1. We are currently PAUSED (set by loadVideo).
            // 2. We POLL until tracks appear (handling race condition).
            // 3. We auto-select the best track.
            // 4. We RESUME if requested.

            Task {
                await self.pollForTracksAndResume()
            }

            Task { await SessionRecorder.shared.log(category: .player, message: "File Loaded", metadata: ["duration": "\(self.duration)"]) }
        case MPV_EVENT_PLAYBACK_RESTART:
            isBuffering = false
            // Don't blindly set isPlaying = true here.
            // Rely on the "pause" property change event to set isPlaying.
            // This prevents false positives when loading a file in paused state.
        case MPV_EVENT_END_FILE:
            isPlaying = false
            // Perfect time for cleanup - video ended naturally

            // Check if it was EOF (natural finish) using the event data
            if let data = eventPtr.pointee.data?.assumingMemoryBound(to: mpv_event_end_file.self) {
                let reason = data.pointee.reason
                // MPV_END_FILE_REASON_EOF = 0 means natural end of file
                if reason.rawValue == 0 {
                    // FIX: Debrid streams sometimes report 10s placeholder duration during initial load
                    // If duration is suspiciously short (< 60s) AND we're still buffering or file just loaded,
                    // this is likely a false EOF - ignore it and the stream will continue buffering
                    if duration < 60 && (isBuffering || !isFileLoaded) {
                        LoggingManager.shared.warn(.videoRendering, message: "MPV: Ignoring premature EOF - duration \(Int(duration))s is likely a placeholder (buffering: \(isBuffering), fileLoaded: \(isFileLoaded))")
                        Task { await SessionRecorder.shared.log(category: .player, message: "Ignoring Placeholder EOF", metadata: ["duration": "\(duration)"]) }
                        return // Don't trigger EOF handling
                    }

                    // FIX: Premature EOF check (Network Drop masked as EOF)
                    // If we receive EOF but are nowhere near the end (e.g. < 95% watched and > 1 min remaining),
                    // this is likely a network drop that MPV misinterpreted as end of stream.
                    // We should treat this as an ERROR to trigger retry/failover, or at minimum NOT exit.

                    // Security Check #89 Fix: Use lastKnownGoodPosition instead of currentTime for EOF check.
                    // When the user seeks to the very end, MPV's currentTime can reset to 0 before the
                    // END_FILE event fires. This caused legitimate EOFs to be classified as suspicious.
                    // lastKnownGoodPosition tracks the highest position seen during playback.
                    let effectivePosition = max(currentTime, lastKnownGoodPosition)
                    let timeRemaining = duration - effectivePosition
                    let progress = (duration > 0) ? (effectivePosition / duration) : 0

                    // FORENSIC LOGGING
                    print("!!! MPV EOF DETECTED !!! Duration: \(duration), CurrentTime: \(currentTime), LastKnownGood: \(lastKnownGoodPosition), EffectivePos: \(effectivePosition), TimeRemaining: \(timeRemaining), Progress: \(progress)")
                    LoggingManager.shared.warn(.videoRendering, message: "Forensic EOF Check: Dur=\(duration), Cur=\(currentTime), LastGood=\(lastKnownGoodPosition), Eff=\(effectivePosition), Rem=\(timeRemaining), Prog=\(progress)")

                    if (duration > 30 && progress < 0.1) || (duration > 300 && timeRemaining > 60 && progress < 0.95) {
                        LoggingManager.shared.warn(.videoRendering, message: "MPV: SUSPICIOUS EOF detected! Pos: \(Int(effectivePosition))s / Dur: \(Int(duration))s. Ignoring as False EOF.")
                         Task { await SessionRecorder.shared.log(category: .error, message: "Suspicious EOF (False Positive)", metadata: ["pos": "\(effectivePosition)", "dur": "\(duration)"]) }

                        // Treat as error to prevent exit, but don't set mpvError if it's just a skip-able glitch
                        // Set a specific error string that ViewModel can ignore or handle as 'auto-resume'
                        self.mpvError = "Transient EOF Glitch"
                        return
                    }

                    LoggingManager.shared.debug(.videoRendering, message: "MPV: Playback finished (EOF - reason: \(reason.rawValue))")
                    LoggingManager.shared.debug(.videoRendering, message: "MPV: Setting playbackFinished = true")
                    playbackFinished = true
                    LoggingManager.shared.debug(.videoRendering, message: "MPV: playbackFinished is now \(playbackFinished)")
                    Task { await SessionRecorder.shared.log(category: .player, message: "Playback Finished (EOF)") }
                } else {
                    LoggingManager.shared.warn(.videoRendering, message: "MPV: END_FILE event but not EOF (reason: \(reason.rawValue))")
                    Task { await SessionRecorder.shared.log(category: .player, message: "Playback Ended", metadata: ["reason": "\(reason.rawValue)"]) }

                    // CRITICAL: Expose error to ViewModel for immediate failover
                    if reason.rawValue == MPV_END_FILE_REASON_ERROR.rawValue {
                         self.mpvError = "Playback Error (Code: 4)"
                    } else {
                         // Treat other abnormal stops as errors too? Maybe.
                         // For now, only explicit ERROR or STOP is concern if not EOF.
                         self.mpvError = "Playback Stopped Abnormaly (Code: \(reason.rawValue))"
                    }
                }
            } else {
                LoggingManager.shared.warn(.videoRendering, message: "MPV: END_FILE event but no event data available")
                Task { await SessionRecorder.shared.log(category: .player, message: "Playback Ended (Unknown Reason)") }
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
                        LoggingManager.shared.info(.videoRendering, message: "MPV: Pause state changed to \(isPaused) -> isPlaying = \(self.isPlaying)")
                        Task { await SessionRecorder.shared.log(category: .player, message: isPaused ? "Paused" : "Resumed") }
                    }
                }
            } else if nameStr == "paused-for-cache" {
                 // Buffering state changed
                 if let value = prop.pointee.data {
                     let isBufferingNow = value.assumingMemoryBound(to: Int32.self).pointee != 0
                     if self.isBuffering != isBufferingNow {
                         self.isBuffering = isBufferingNow
                         LoggingManager.shared.info(.videoRendering, message: "MPV: Buffering state changed: \(isBufferingNow) (paused-for-cache)")
                         Task { await SessionRecorder.shared.log(category: .player, message: "Buffering State", metadata: ["buffering": "\(isBufferingNow)"]) }
                     }
                 }
            } else if nameStr == "track-list" || nameStr == "track-list/count" {
                 // Notify that tracks have changed
                 LoggingManager.shared.debug(.subtitles, message: "MPV: Track list change detected (\(nameStr))")
                 self.tracksChanged.send()
            }
        case MPV_EVENT_LOG_MESSAGE:
            guard let data = eventPtr.pointee.data else { break }
            let log = data.assumingMemoryBound(to: mpv_event_log_message.self)
            guard let text = log.pointee.text else { break }
            let message = String(cString: text).trimmingCharacters(in: .whitespacesAndNewlines)

            // Filter and route MPV internal logs via LoggingManager
            let lower = message.lowercased()
            if lower.contains("error") || lower.contains("failed") || lower.contains("panic") {
                LoggingManager.shared.error(.videoRendering, message: "[MPV] \(message)")
                Task { await SessionRecorder.shared.log(category: .error, message: "MPV Internal Error", metadata: ["details": message]) }
            } else if lower.contains("warn") {
                LoggingManager.shared.warn(.videoRendering, message: "[MPV] \(message)")
                Task { await SessionRecorder.shared.log(category: .player, message: "MPV Internal Warning", metadata: ["details": message]) }
            } else {
                // High frequency MPV logs are debug level
                LoggingManager.shared.debug(.videoRendering, message: "[MPV] \(message)")
            }

            // CRITICAL: Catch specific fatal errors that don't trigger END_FILE immediately
            if message.contains("Seek failed") {
                self.mpvError = "Seek Failed"
            } else if lower.contains("invalid data") {
                self.mpvError = "Invalid Data"
            } else if lower.contains("operation timed out") {
                self.mpvError = "Connection Timed Out"
            }
        default:
            if eventId.rawValue != MPV_EVENT_LOG_MESSAGE.rawValue {
                LoggingManager.shared.debug(.videoRendering, message: "MPV Event: \(eventId.rawValue)")
            }
        }
    }



    // MARK: - Enhanced Timer Management

    private func startTimeUpdates() {
        timeUpdateTask?.cancel()
        timeUpdateTask = nil

        timeUpdateTask = Task(priority: .userInitiated) { [weak self] in
            while !Task.isCancelled {
                // Throttled update rate (250ms / 4Hz)
                try? await Task.sleep(nanoseconds: 250_000_000)

                guard let self = self, !Task.isCancelled else { return }

                await MainActor.run {
                    self.updateCurrentTime()
                }
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

        // Security Check #89 Fix: Track highest position seen (for accurate EOF detection)
        if time > lastKnownGoodPosition {
            lastKnownGoodPosition = time
        }
    }

    private func updateDuration() {
        guard let handle = mpvHandle, isInitialized else { return }
        var dur: Double = 0
        mpv_get_property(handle, "duration", MPV_FORMAT_DOUBLE, &dur)
        duration = dur
    }

    // MARK: - Public Controls

    func loadVideo(url: String, autoplay: Bool = true, expectedSubtitleCount: Int = 0, startTime: Double = 0) {
        // Extract filename for subtitle matching (e.g. "Movie.2023.1080p.WEBRip.mp4")
        if let urlObj = URL(string: url) {
            self.currentVideoFilename = urlObj.lastPathComponent
            LoggingManager.shared.debug(.videoRendering, message: "MPV: Current video filename set to: \(self.currentVideoFilename)")
        } else {
            self.currentVideoFilename = url
        }

        self.expectedExternalSubtitles = expectedSubtitleCount
        LoggingManager.shared.info(.subtitles, message: "MPV: Expected external subtitles set to: \(expectedSubtitleCount)")

        // Execute load immediately (Array-based command handles spaces/quotes safely)
        executeLoadVideo(url: url, autoplay: autoplay, startTime: startTime)
    }

    private func executeLoadVideo(url: String, autoplay: Bool, startTime: Double) {
        guard let handle = mpvHandle else {
            LoggingManager.shared.error(.videoRendering, message: "MPV handle is nil!")
            return
        }

        // SMART PAUSED LOAD:
        // Always load PAUSED initially.
        // If autoplay=true, we set a flag to unpause AFTER tracks are found (in pollForTracksAndResume).

        self.shouldResumeAfterLoad = autoplay
        self.hasCompletedInitialTrackSelection = false // Reset for new video

        // CRITICAL: Always set pause=yes BEFORE loading
        mpv_set_property_string(handle, "pause", "yes")

        LoggingManager.shared.debug(.videoRendering, message: "MPV loading file (Safe Array Command): \(url.prefix(60)) start=\(startTime)")

        // Use property-based start time setting as backup
        // This affects the next loadfile command
        mpv_set_property_string(handle, "start", "\(startTime)")

        // Use array-based command to prevent injection/parsing issues
        // We use 2 arguments here as it's the most widely supported array-command format for loadfile
        var args: [UnsafePointer<CChar>?] = [
            UnsafePointer(strdup("loadfile")),
            UnsafePointer(strdup(url)),
            nil
        ]

        let result = args.withUnsafeMutableBufferPointer { ptr in
            mpv_command(handle, ptr.baseAddress)
        }

        // Free strings (index 0 and 1)
        for i in 0..<2 {
            if let arg = args[i] { free(UnsafeMutablePointer(mutating: arg)) }
        }

        if result >= 0 {
            // Update local state (we are technically paused right now)
             isPlaying = false
             LoggingManager.shared.debug(.videoRendering, message: "MPV loadfile succeeded (Started Paused, waiting for Smart Load)")
             Task { await SessionRecorder.shared.log(category: .player, message: "Load Video (Smart)", metadata: ["url": url]) }
        } else {
            LoggingManager.shared.error(.videoRendering, message: "MPV loadfile failed with code: \(result)")
             // Clean up
             self.shouldResumeAfterLoad = false
             mpv_set_property_string(handle, "pause", "no")
             // CRITICAL: Ensure buffering is reset so ViewModel detects the error
             self.isBuffering = false
            Task { await SessionRecorder.shared.log(category: .error, message: "Load Video Failed", metadata: ["url": url, "code": "\(result)"]) }
        }
    }


    func loadSubtitle(url: String, title: String = "English") {
        guard let handle = mpvHandle, isInitialized else {
            LoggingManager.shared.error(.videoRendering, message: "Cannot load subtitle: MPV not initialized")
            return
        }
        LoggingManager.shared.debug(.subtitles, message: "Loading subtitle from: \(String(url.prefix(80)))")

        // Add the subtitle WITHOUT auto-selecting (use "cached" instead of "select")
        // This prevents external subs from overriding embedded English subs
        var args: [UnsafePointer<CChar>?] = [
            UnsafePointer(strdup("sub-add")),
            UnsafePointer(strdup(url)),
            UnsafePointer(strdup("cached")),  // Add to list but don't auto-select (use "cached" flag)
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
            LoggingManager.shared.info(.subtitles, message: "Successfully added external subtitle: \(title)")

            // NEW: Refresh selections when a new track arrives late.
            // Since we relaxed the guard in refreshSubtitleSelection, this will now
            // auto-select this track if we are currently sitting at 'Off'.
            self.refreshSubtitleSelection()
        } else {
            LoggingManager.shared.error(.subtitles, message: "Failed to add external subtitle. Error code: \(result)")
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
    }

    func togglePlayPause() { isPlaying ? pause() : play() }

    // State for pending seeks (before FILE_LOADED)
    private var pendingSeekTime: Double?

    // ... (existing properties)

    func seek(to seconds: Double) {
        guard let handle = mpvHandle, isInitialized else { return }

        // If file isn't loaded yet, queue the seek
        if !isFileLoaded {
            LoggingManager.shared.debug(.videoRendering, message: "MPV: File not fully loaded yet. Queueing PENDING SEEK to \(String(format: "%.1f", seconds))s")
            pendingSeekTime = seconds
            return
        }

        let command = "seek \(seconds) absolute"

        // Try immediately
        let result = mpv_command_string(handle, command)

        if result >= 0 {
            // Update local state immediately for UI responsiveness
            currentTime = seconds
            // Clear any pending seek since we succeeded
            pendingSeekTime = nil
        } else {
            LoggingManager.shared.warn(.videoRendering, message: "MPV seek failed: \(result). Retrying in 200ms...")

            // Retry once after a short delay (still useful for transient errors)
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 200_000_000)
                guard let handle = self.mpvHandle else { return }

                let retryResult = mpv_command_string(handle, command)
                if retryResult >= 0 {
                    LoggingManager.shared.debug(.videoRendering, message: "MPV seek retry succeeded")
                    self.currentTime = seconds
                } else {
                    LoggingManager.shared.error(.videoRendering, message: "MPV seek retry failed: \(retryResult)")
                }
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
            LoggingManager.shared.debug(.videoRendering, message: "Playback speed adjusted to \(String(format: "%.2f", speed))x for sync")
        }
    }

    func setVolume(_ level: Int) {
        guard let handle = mpvHandle, isInitialized else { return }
        var v = Int64(level)
        mpv_set_property(handle, "volume", MPV_FORMAT_INT64, &v)
        volume = level
    }

    // MARK: - Track Management

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
            LoggingManager.shared.error(.subtitles, message: "getSubtitleTracks: MPV not initialized")
            return []
        }

        var trackCount: Int64 = 0
        mpv_get_property(handle, "track-list/count", MPV_FORMAT_INT64, &trackCount)
        LoggingManager.shared.debug(.subtitles, message: "MPV track-list/count: \(trackCount)")

        var tracks: [SubtitleTrack] = []
        var hasOffTrack = false

        for i in 0..<Int(trackCount) {
            // Get track type
            let typeKey = "track-list/\(i)/type"
            var typeStr: UnsafeMutablePointer<CChar>?
            if mpv_get_property(handle, typeKey, MPV_FORMAT_STRING, &typeStr) >= 0,
               let type = typeStr.map({ String(cString: $0) }) {
                mpv_free(typeStr)

                LoggingManager.shared.debug(.subtitles, message: "Track \(i) type: \(type)")

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

                    // Get external flag
                    let externalKey = "track-list/\(i)/external"
                    var isExternalVal: Int64 = 0
                    mpv_get_property(handle, externalKey, MPV_FORMAT_FLAG, &isExternalVal)
                    let isExternal = isExternalVal != 0

                    LoggingManager.shared.debug(.subtitles, message: "Found subtitle track: ID=\(trackId), lang=\(lang ?? "nil"), title=\(title ?? "nil"), external=\(isExternal)")
                    tracks.append(SubtitleTrack(id: Int(trackId), lang: lang, title: title, isExternal: isExternal))
                }
            }
        }

        // Only add "Off" track if MPV doesn't already provide one
        if !hasOffTrack {
            tracks.insert(SubtitleTrack(id: 0, lang: nil, title: "Off", isExternal: false), at: 0)
        }

        LoggingManager.shared.debug(.subtitles, message: "Total subtitle tracks found: \(tracks.count) (including Off if needed)")
        for (index, track) in tracks.enumerated() {
             LoggingManager.shared.debug(.subtitles, message: "   Start[\(index)]: ID=\(track.id), Title='\(track.title ?? "nil")', Lang='\(track.lang ?? "nil")', Ext=\(track.isExternal)")
        }
        return tracks
    }

    /// Auto-select best audio track using scoring system (Language + Channels - Commentary)
    private func autoSelectEnglishAudio() {
        guard let handle = mpvHandle, isInitialized else { return }

        LoggingManager.shared.debug(.videoRendering, message: "AUDIO AUTO-SELECT: Starting smart audio track scan")

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
            // Fix: Also check for "eng" in title (e.g. "AC3 5.1 ENG")
            let isEnglish = langLower.hasPrefix("en") || langLower.contains("eng") || titleLower.contains("english") || titleLower.contains("eng")
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

            LoggingManager.shared.debug(.videoRendering, message: "Track \(trackId): \(displayName) | \(channels)ch | English: \(isEnglish) | Commentary: \(isCommentary) -> Score: \(score)")

            if score > bestScore {
                bestScore = score
                bestTrackId = trackId
                bestTrackName = displayName
            }
        }

        if bestTrackId != -1 {
            LoggingManager.shared.info(.videoRendering, message: "Selected best audio track: \(bestTrackName) (ID: \(bestTrackId), Score: \(bestScore))")
            var tid = bestTrackId
            mpv_set_property(handle, "aid", MPV_FORMAT_INT64, &tid)
        } else {
            LoggingManager.shared.warn(.videoRendering, message: "No suitable audio tracks found")
        }
    }

    /// Refresh subtitle selection logic (called on file load and after loading external subs)
    /// Public to allow Service to trigger re-evaluation after asynchronous external sub load.
    ///
    /// ⚠️ Internal Note #41: This MUST NOT be called while video is actively playing.
    /// Changing subtitle tracks during playback causes MPV to rebuffer ("play-buffer-play" flash).
    /// Initial selection happens in pollForTracksAndResume() BEFORE playback starts.
    @MainActor func refreshSubtitleSelection() {
        guard let _ = mpvHandle, isInitialized else { return }

        // Wrap async operations in a Task since this method must be synchronous (protocol compliance)
        Task { @MainActor [weak self] in
            guard let self = self else { return }

            // DEFENSIVE GUARD: Prevent regression - only change tracks if none are currently active
            // Internal Note #41: Prevents buffer flash when swapping tracks.
            // FIX: If we have NO subtitles selected (sid == 0), we SHOULD allow the auto-selector to
            // light one up as they arrive late from the network.
            let currentSub = await self.getCurrentSubtitleTrack()
            if self.isPlaying && self.hasCompletedInitialTrackSelection && currentSub != 0 {
                LoggingManager.shared.warn(.subtitles, message: "⚠️ BLOCKED: refreshSubtitleSelection called during playback with active track. Ignoring to prevent flash.")
                return
            }

            // Re-acquire handle safely inside the task
            guard let safeHandle = self.mpvHandle else { return }

            LoggingManager.shared.debug(.subtitles, message: "AUTO-SELECT: Starting subtitle scan & selection refresh")

            var trackCount: Int64 = 0
            mpv_get_property(safeHandle, "track-list/count", MPV_FORMAT_INT64, &trackCount)
            LoggingManager.shared.debug(.subtitles, message: "AUTO-SELECT: Found \(trackCount) total tracks")

            struct SubCandidate {
                let id: Int
                let name: String
                let isExternal: Bool
                let isForced: Bool
                let isDefault: Bool
                let title: String
                let isHearingImpaired: Bool
            }

            var candidates: [SubCandidate] = []

            for i in 0..<Int(trackCount) {
                // Check if it's a subtitle track
                let typeKey = "track-list/\(i)/type"
                var typeStr: UnsafeMutablePointer<CChar>?
                let typeResult = mpv_get_property(safeHandle, typeKey, MPV_FORMAT_STRING, &typeStr)

                if typeResult >= 0, let type = typeStr.map({ String(cString: $0) }), type == "sub" {
                    mpv_free(typeStr)

                    // Get track ID
                    let idKey = "track-list/\(i)/id"
                    var trackId: Int64 = 0
                    guard mpv_get_property(safeHandle, idKey, MPV_FORMAT_INT64, &trackId) >= 0, trackId != 0 else {
                        continue
                    }

                    // Check properties
                    let externalKey = "track-list/\(i)/external"
                    var isExternalVal: Int64 = 0
                    let _ = mpv_get_property(safeHandle, externalKey, MPV_FORMAT_FLAG, &isExternalVal)
                    let isExternal = isExternalVal != 0

                    let forcedKey = "track-list/\(i)/forced"
                    var isForcedVal: Int64 = 0
                    let _ = mpv_get_property(safeHandle, forcedKey, MPV_FORMAT_FLAG, &isForcedVal)
                    let isForced = isForcedVal != 0

                    let defaultKey = "track-list/\(i)/default"
                    var isDefaultVal: Int64 = 0
                    let _ = mpv_get_property(safeHandle, defaultKey, MPV_FORMAT_FLAG, &isDefaultVal)
                    let isDefault = isDefaultVal != 0

                    let hiKey = "track-list/\(i)/hearing-impaired"
                    var isHIVal: Int64 = 0
                    let _ = mpv_get_property(safeHandle, hiKey, MPV_FORMAT_FLAG, &isHIVal)
                    let isHI = isHIVal != 0

                    // Get language & title
                    let langKey = "track-list/\(i)/lang"
                    var langStr: UnsafeMutablePointer<CChar>?
                    let lang = (mpv_get_property(safeHandle, langKey, MPV_FORMAT_STRING, &langStr) >= 0)
                        ? langStr.map { String(cString: $0) }
                        : nil
                    mpv_free(langStr)

                    let titleKey = "track-list/\(i)/title"
                    var titleStr: UnsafeMutablePointer<CChar>?
                    let title = (mpv_get_property(safeHandle, titleKey, MPV_FORMAT_STRING, &titleStr) >= 0)
                        ? titleStr.map { String(cString: $0) }
                        : nil
                    mpv_free(titleStr)

                    // Check if English
                    let langLower = lang?.lowercased() ?? ""
                    let titleLower = title?.lowercased() ?? ""
                    let isEnglish = langLower.hasPrefix("en") || langLower.contains("eng") || titleLower.contains("english")

                    if isEnglish {
                        let displayName = title ?? lang ?? "Track \(trackId)"
                        LoggingManager.shared.debug(.subtitles, message: "AUTO-SELECT: Track \(i) - ID: \(trackId), lang: '\(lang ?? "nil")', title: '\(title ?? "nil")', forced: \(isForced), default: \(isDefault), HI: \(isHI), Ext: \(isExternal)")

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
                                title: titleLower,
                                isHearingImpaired: isHI
                            ))
                        } else {
                            LoggingManager.shared.debug(.subtitles, message: "Ignoring partial/commentary subtitle: \(displayName)")
                        }
                    }
                } else {
                    mpv_free(typeStr)
                }
            }

            // Scoring Logic
            let bestCandidate = candidates.max { a, b in
                var scoreA = 0
                var scoreB = 0

                // 1. Prefer Embedded (+3000)
                if !a.isExternal { scoreA += 3000 }
                if !b.isExternal { scoreB += 3000 }

                // 2. Release Match (+500 range)
                let releaseScoreA = self.calculateReleaseMatchScore(videoName: self.currentVideoFilename, subtitleName: a.title)
                let releaseScoreB = self.calculateReleaseMatchScore(videoName: self.currentVideoFilename, subtitleName: b.title)
                scoreA += releaseScoreA
                scoreB += releaseScoreB

                // 3. Clean Title Bonus (+600)
                if a.title.count < 20 && (a.title.contains("sdh") || a.title.contains("english") || a.title.contains("en")) { scoreA += 600 }
                if b.title.count < 20 && (b.title.contains("sdh") || b.title.contains("english") || b.title.contains("en")) { scoreB += 600 }

                // 4. Prefer SDH/CC/HI (+250)
                if a.isHearingImpaired || a.title.contains("sdh") || a.title.contains("cc") { scoreA += 250 }
                if b.isHearingImpaired || b.title.contains("sdh") || b.title.contains("cc") { scoreB += 250 }

                // 5. Avoid Forced
                if a.isForced { scoreA -= 50 }
                if b.isForced { scoreB -= 50 }

                // 6. Avoid Default
                if a.isDefault { scoreA -= 10 }
                if b.isDefault { scoreB -= 10 }

                // 7. Tie-breaker: Prefer later tracks
                if a.id > b.id { scoreA += 1 }
                if b.id > a.id { scoreB += 1 }

                return scoreA < scoreB
            }

            if let best = bestCandidate {
                LoggingManager.shared.info(.subtitles, message: "Auto-selecting BEST English subtitle: \(best.name) (ID: \(best.id))")
                var tid = Int64(best.id)
                mpv_set_property(safeHandle, "sid", MPV_FORMAT_INT64, &tid)
            } else {
                LoggingManager.shared.debug(.subtitles, message: "No suitable subtitles found to auto-select.")
            }

            // Mark initial selection as complete
            self.hasCompletedInitialTrackSelection = true
        }
    }

    /// Calculate a matching score between video filename and subtitle name
    /// High score means good release match (e.g. WEBRip to WEBRip)
    private func calculateReleaseMatchScore(videoName: String, subtitleName: String) -> Int {
        let video = videoName.lowercased()
        let sub = subtitleName.lowercased()
        var score = 0

        // Tokens to check for matching
        let qualityTokens = ["1080p", "720p", "2160p", "4k", "480p"]
        let sourceTokens = ["webrip", "web-dl", "web", "bluray", "brrip", "bdrip", "dvdrip", "hdrip", "cam", "ts", "tc", "scr", "remux"]
        let codecTokens = ["x264", "h264", "x265", "h265", "hevc", "av1"]
        let groupTokens = ["yts", "rarbg", "galaxy", "psa", "qxr", "tgx"]

        // 1. Source Match (Critical for sync) - +500
        for token in sourceTokens {
            if video.contains(token) && sub.contains(token) {
                score += 500
            } else if video.contains(token) && !sub.contains(token) {
                 // Optimization: If video has a source but sub doesn't match it, check if sub has a *conflicting* source
                 // e.g. Video is WEBRip, Sub is BluRay -> Penalty
                 for otherToken in sourceTokens where otherToken != token {
                     if sub.contains(otherToken) {
                         // WEBRip vs BluRay mismatch is bad
                         score -= 200
                     }
                 }
            }
        }

        // 2. Quality Match - +100
        for token in qualityTokens {
            if video.contains(token) && sub.contains(token) {
                score += 100
            }
        }

        // 3. Codec Match - +50
        for token in codecTokens {
            if video.contains(token) && sub.contains(token) {
                score += 50
            }
        }

        // 4. Release Group Match - +50
        for token in groupTokens {
            if video.contains(token) && sub.contains(token) {
                score += 50
            }
        }

        return score
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
                LoggingManager.shared.debug(.subtitles, message: "Disabled subtitles (async)")
            } else {
                // Enable specific subtitle track
                var trackId = Int64(id)
                mpv_set_property(handle, "sid", MPV_FORMAT_INT64, &trackId)

                // Explicitly enable visibility (in case it was disabled)
                var visFlag: Int32 = 1
                mpv_set_property(handle, "sub-visibility", MPV_FORMAT_FLAG, &visFlag)

                LoggingManager.shared.debug(.subtitles, message: "Set subtitle track to: \(id) (async, visibility enabled)")
            }

            // Notify completion on main thread
            Task { @MainActor in
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
        LoggingManager.shared.debug(.subtitles, message: "Subtitle offset set to \(String(format: "%.1f", offsetMs))ms")
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
        LoggingManager.shared.debug(.subtitles, message: "Subtitle speed set to \(String(format: "%.3f", speedFactor))x")
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
        LoggingManager.shared.debug(.subtitles, message: "Subtitle timing reset to default")
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
                LoggingManager.shared.debug(.subtitles, message: "Current subtitle track: disabled (string: \(str))")
                return 0  // Return 0 for disabled
            }
        }

        // Otherwise get as integer
        var trackId: Int64 = 0
        if mpv_get_property(handle, "sid", MPV_FORMAT_INT64, &trackId) >= 0 {
            LoggingManager.shared.debug(.subtitles, message: "Current subtitle track: \(trackId)")
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

        LoggingManager.shared.debug(.videoRendering, message: "Stopping MPV playback...")

        // ✅ IMMEDIATE: Cancel event polling
        eventPollingTask?.cancel()
        eventPollingTask = nil

        // Stop playback
        _ = mpv_command_string(handle, "stop")
        isPlaying = false

        // Stop internal timers immediately
        timeUpdateTask?.cancel()
        timeUpdateTask = nil

        // ✅ WAIT: Give event loop time to exit cleanly
        let cleanupDelay = Task {
            try? await Task.sleep(nanoseconds: 100_000_000) // 100ms
        }
        Task {
            _ = await cleanupDelay.value
            LoggingManager.shared.debug(.videoRendering, message: "MPV stop completed with clean event loop exit")
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
    /// Safe cleanup - must be called from the OpenGL thread
    nonisolated func destroyRenderContext() {
        guard let context = renderContext else { return }
        LoggingManager.shared.debug(.videoRendering, message: "Freeing render context on OpenGL thread...")
        mpv_render_context_free(context)
        state.lock.withLock { state.renderContext = nil }
    }

    // MARK: - Render Context Methods

    /// Check if MPV has a frame ready to render (IINA implementation)
    nonisolated func shouldRenderUpdateFrame() -> Bool {
        guard let context = renderContext else { return false }
        let flags = mpv_render_context_update(context)
        return (flags & UInt64(MPV_RENDER_UPDATE_FRAME.rawValue)) != 0
    }

    nonisolated func checkForRenderUpdate() -> UInt64 {
        guard let context = renderContext else { return 0 }
        return mpv_render_context_update(context)
    }

    nonisolated func render(fbo: Int32, width: Int32, height: Int32) {
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

    nonisolated func reportSwap() {
        guard let context = renderContext else { return }
        mpv_render_context_report_swap(context)
    }

    // MARK: - Enhanced Cleanup (Smooth Playback)

    /// Manually destroy the MPV instance and release resources.
    /// Call this when the wrapper is no longer needed, especially if the owner might be retained.
    nonisolated func destroy() {
        print("MPVWrapper: destroy() called - cleaning up...")

        // 1. Sync lock to invalidate handle and capture it for terminal destruction
        let (handleToDestroy, contextToFree) = state.lock.withLock {
            let h = state.handle
            let c = state.renderContext

            // CRITICAL: Set to nil immediately. This causes pollEvents() to exit its loop.
            state.handle = nil
            state.renderContext = nil

            return (h, c)
        }

        // 2. Wake up the event polling loop if it's currently blocked in mpv_wait_event
        if let handle = handleToDestroy {
            print("MPV: Sending wakeup signal to interrupt pollEvents...")
            mpv_wakeup(handle)
        }

        // 3. Destroy render context
        if let context = contextToFree {
            print("MPVWrapper: Freeing render context...")
            mpv_render_context_free(context)
        }

        // 4. Destroy MPV instance on background thread to prevent deadlocks
        if let handle = handleToDestroy {
             Task.detached(priority: .background) {
                 // SMALL DELAY: Give the polling task a tiny window to react to wakeup and exit its loop
                 // before we pull the rug out with mpv_terminate_destroy.
                 try? await Task.sleep(nanoseconds: 50_000_000) // 50ms

                 print("MPVWrapper: Terminating MPV instance (background)...")
                 mpv_terminate_destroy(handle)
                 print("MPVWrapper: MPV instance destroyed")
             }
        }

        print("MPVWrapper: cleanup complete")
    }

    deinit {
        // LoggingManager might be unsafe here if deinit is called from background
        print("MPVWrapper: deinit")
        destroy()
    }
}

// MARK: - MPVController Conformance
extension MPVWrapper: MPVController {
    var isPlayingPublisher: AnyPublisher<Bool, Never> { $isPlaying.eraseToAnyPublisher() }
    var playbackFinishedPublisher: AnyPublisher<Bool, Never> { $playbackFinished.eraseToAnyPublisher() }
    var currentTimePublisher: AnyPublisher<Double, Never> { $currentTime.eraseToAnyPublisher() }
    var durationPublisher: AnyPublisher<Double, Never> { $duration.eraseToAnyPublisher() }
    var isBufferingPublisher: AnyPublisher<Bool, Never> { $isBuffering.eraseToAnyPublisher() }
    var isFileLoadedPublisher: AnyPublisher<Bool, Never> { $isFileLoaded.eraseToAnyPublisher() }
    var tracksChangedPublisher: AnyPublisher<Void, Never> { tracksChanged.eraseToAnyPublisher() }

    // Explicit witness for protocol to handle default argument mismatch?
    func setSubtitleTrack(_ id: Int) {
        setSubtitleTrack(id, completion: {})
    }
}
