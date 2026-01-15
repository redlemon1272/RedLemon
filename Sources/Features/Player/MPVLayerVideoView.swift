//
//  MPVLayerVideoView.swift
//  RedLemon
//
//  Layer-backed video view using IINA's proven CAOpenGLLayer approach
//

import SwiftUI
import AppKit
import CoreVideo
import Quartz

// Global log throttling for DisplayLink callbacks
private var lastDisplayLinkLogTime: CFTimeInterval = 0

/// NSView that hosts CAOpenGLLayer for MPV rendering (IINA-style)
class MPVLayerHostView: NSView {
    var videoLayer: MPVViewLayer?
    var displayLink: CVDisplayLink?
    weak var wrapper: MPVWrapper?

    override init(frame: NSRect) {
        super.init(frame: frame)

        // Enable layer backing
        wantsLayer = true
        layerContentsRedrawPolicy = .duringViewResize
        LoggingManager.shared.debug(.videoRendering, message: "MPVLayerHostView initialized")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Mouse Event Passthrough
    // Prevent this view from capturing mouse events - let SwiftUI handle them

    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        return false // Don't become first responder on mouse clicks
    }

    override func mouseDown(with event: NSEvent) {
        // Pass through to next responder - don't consume the event
        nextResponder?.mouseDown(with: event)
    }

    override func mouseUp(with event: NSEvent) {
        // Pass through to next responder
        nextResponder?.mouseUp(with: event)
    }

    override func rightMouseDown(with event: NSEvent) {
        // Pass through to next responder
        nextResponder?.rightMouseDown(with: event)
    }

    override func rightMouseUp(with event: NSEvent) {
        // Pass through to next responder
        nextResponder?.rightMouseUp(with: event)
    }

    override func makeBackingLayer() -> CALayer {
        // This will be set externally once MPVWrapper is ready
        return videoLayer ?? CALayer()
    }

    func setupWithWrapper(_ wrapper: MPVWrapper) {
        // Store wrapper reference
        self.wrapper = wrapper

        // Create and assign the video layer
        let layer = MPVViewLayer(wrapper: wrapper)
        self.videoLayer = layer
        self.layer = layer

        LoggingManager.shared.debug(.videoRendering, message: "Video layer assigned to host view")

        // Initialize MPV first
        wrapper.setupVideo(in: self)

        // Create the render context now that the layer is ready (IINA pattern)
        wrapper.lockAndSetOpenGLContext()
        wrapper.createRenderContext(with: layer)
        wrapper.unlockOpenGLContext()

        // Start CVDisplayLink
        startDisplayLink()
    }

    // MARK: - CVDisplayLink (IINA-style)

    func startDisplayLink() {
        guard displayLink == nil else { return }

        var link: CVDisplayLink?
        let result = CVDisplayLinkCreateWithActiveCGDisplays(&link)

        guard result == kCVReturnSuccess, let displayLink = link else {
            LoggingManager.shared.error(.videoRendering, message: "Failed to create display link")
            return
        }

        self.displayLink = displayLink

        // Set output callback
        CVDisplayLinkSetOutputCallback(
            displayLink,
            displayLinkCallback,
            Unmanaged.passUnretained(self).toOpaque()
        )

        // Link to current display
        if let screen = window?.screen,
           let displayId = screen.deviceDescription[NSDeviceDescriptionKey("NSScreenNumber")] as? UInt32 {
            CVDisplayLinkSetCurrentCGDisplay(displayLink, displayId)
        }

        // Start the link
        CVDisplayLinkStart(displayLink)

        LoggingManager.shared.debug(.videoRendering, message: "CVDisplayLink started")
    }

    func stopDisplayLink() {
        guard let link = displayLink else { return }

        LoggingManager.shared.debug(.videoRendering, message: "Stopping CVDisplayLink...")

        if CVDisplayLinkIsRunning(link) {
            CVDisplayLinkStop(link)
        }

        // Immediately nil out the reference to break retain cycle
        displayLink = nil

        LoggingManager.shared.debug(.videoRendering, message: "CVDisplayLink stopped and released")
    }

    deinit {
        stopDisplayLink()
        videoLayer?.uninit()
        LoggingManager.shared.debug(.videoRendering, message: "MPVLayerHostView deinit")
    }
}

// MARK: - CVDisplayLink Callback

private func displayLinkCallback(
    _ displayLink: CVDisplayLink,
    _ inNow: UnsafePointer<CVTimeStamp>,
    _ inOutputTime: UnsafePointer<CVTimeStamp>,
    _ flagsIn: CVOptionFlags,
    _ flagsOut: UnsafeMutablePointer<CVOptionFlags>,
    _ context: UnsafeMutableRawPointer?
) -> CVReturn {

    guard let context = context else { return kCVReturnError }

    let hostView = Unmanaged<MPVLayerHostView>.fromOpaque(context).takeUnretainedValue()

    // Only report swap if we have a valid wrapper and render context
    guard let wrapper = hostView.wrapper,
          wrapper.renderContext != nil else {
        return kCVReturnSuccess
    }

    // IINA's pattern: report swap to mpv in the display link callback
    // This keeps mpv's frame timing accurate
    // Log throttling - only print once per second to reduce spam
    let currentTime = CACurrentMediaTime()
    if currentTime - lastDisplayLinkLogTime > 1.0 {
        LoggingManager.shared.debug(.videoRendering, message: "DisplayLink: reportSwap() (throttled)")
        lastDisplayLinkLogTime = currentTime
    }
    wrapper.reportSwap()

    return kCVReturnSuccess
}

// MARK: - SwiftUI Wrapper

struct MPVLayerVideoView: NSViewRepresentable {
    let wrapper: MPVWrapper

    func makeNSView(context: Context) -> MPVLayerHostView {
        let view = MPVLayerHostView(frame: .zero)

        // Setup with wrapper once view is created
        Task { @MainActor in
            view.setupWithWrapper(wrapper)
        }

        return view
    }

    func updateNSView(_ nsView: MPVLayerHostView, context: Context) {
        // No updates needed - layer handles everything
    }

    static func dismantleNSView(_ nsView: MPVLayerHostView, coordinator: ()) {
        nsView.stopDisplayLink()
        nsView.videoLayer?.uninit()
    }
}
