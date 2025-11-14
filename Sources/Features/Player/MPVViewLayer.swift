//
//  MPVViewLayer.swift
//  RedLemon
//
//  IINA-style CAOpenGLLayer rendering for smooth playback
//  Based on proven IINA implementation: github.com/iina/iina
//

import Cocoa
import OpenGL.GL
import OpenGL.GL3
import Quartz

/// OpenGL layer for embedded MPV rendering with CVDisplayLink
///
/// This implementation follows IINA's proven approach:
/// - CAOpenGLLayer for better macOS compositor integration
/// - Background thread rendering to avoid blocking display link
/// - Proper CATransaction management for smooth frame delivery
class MPVViewLayer: CAOpenGLLayer {

    // MARK: - Properties

    private weak var wrapper: MPVWrapper?
    private let mpvGLQueue = DispatchQueue(label: "com.redlemon.mpvgl", qos: .userInteractive)

    private let cglContext: CGLContextObj
    private let cglPixelFormat: CGLPixelFormatObj

    /// Lock to single-thread calls to display
    private let displayLock = NSRecursiveLock()

    private var fbo: GLint = 1

    /// When true, the frame needs to be rendered
    @Atomic private var needsFlip = false

    /// When true, drawing proceeds even if mpv indicates nothing needs to be done
    @Atomic private var forceDraw = false

    /// Indicates whether view is being resized
    @Atomic var inLiveResize: Bool = false {
        didSet {
            if inLiveResize {
                isAsynchronous = true
            }
            update(force: true)
        }
    }

    var isUninited = false

    // MARK: - Log Throttling

    /// Throttles canDraw logging to once every 5 seconds
    private static var lastCanDrawLogTime: CFTimeInterval = 0

    /// Throttles layer.update() logging to once every 3 seconds
    private static var lastLayerUpdateLogTime: CFTimeInterval = 0

    /// Throttles draw() logging to once every 5 seconds
    private static var lastDrawLogTime: CFTimeInterval = 0

    // MARK: - Initialization

    init(wrapper: MPVWrapper) {
        self.wrapper = wrapper

        // Create pixel format and context
        let (pixelFormat, _) = MPVViewLayer.createPixelFormat()
        self.cglPixelFormat = pixelFormat
        self.cglContext = MPVViewLayer.createContext(pixelFormat)

        super.init()

        // Critical CAOpenGLLayer settings for async rendering (IINA pattern)
        self.isAsynchronous = true
        self.contentsScale = NSScreen.main?.backingScaleFactor ?? 2.0

        print("🎬 MPVViewLayer initialized with async rendering")
    }

    override init(layer: Any) {
        let previousLayer = layer as! MPVViewLayer
        wrapper = previousLayer.wrapper
        cglPixelFormat = previousLayer.cglPixelFormat
        cglContext = previousLayer.cglContext

        super.init(layer: layer)

        autoresizingMask = previousLayer.autoresizingMask
        backgroundColor = previousLayer.backgroundColor
        inLiveResize = previousLayer.inLiveResize
        isAsynchronous = previousLayer.isAsynchronous

        print("🎬 MPVViewLayer shadow copy created")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - OpenGL Setup (IINA-style)

    private static func createPixelFormat() -> (CGLPixelFormatObj, GLint) {
        var pix: CGLPixelFormatObj?
        var npix: GLint = 0

        // OpenGL Core Profile 3.2 attributes
        let attributes: [CGLPixelFormatAttribute] = [
            kCGLPFAOpenGLProfile, CGLPixelFormatAttribute(kCGLOGLPVersion_3_2_Core.rawValue),
            kCGLPFAAccelerated,
            kCGLPFADoubleBuffer,
            kCGLPFAColorSize, CGLPixelFormatAttribute(24),
            kCGLPFAAlphaSize, CGLPixelFormatAttribute(8),
            kCGLPFADepthSize, CGLPixelFormatAttribute(0),
            _CGLPixelFormatAttribute(rawValue: 0)
        ]

        let err = CGLChoosePixelFormat(attributes, &pix, &npix)

        guard let pixelFormat = pix, err == kCGLNoError else {
            fatalError("Cannot create OpenGL pixel format: \(err)")
        }

        print("🎬 Created CGL pixel format (Core Profile 3.2)")
        return (pixelFormat, 8)
    }

    private static func createContext(_ pixelFormat: CGLPixelFormatObj) -> CGLContextObj {
        var ctx: CGLContextObj?
        CGLCreateContext(pixelFormat, nil, &ctx)

        guard let context = ctx else {
            fatalError("Cannot create OpenGL context!")
        }

        // Sync to vertical retrace
        var swapInterval: GLint = 1
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)

        // Enable multi-threaded GL engine
        CGLEnable(context, kCGLCEMPEngine)

        CGLSetCurrentContext(context)

        print("🎬 Created CGL context with vsync enabled")
        return context
    }

    // MARK: - Drawing (IINA-style)

    override func canDraw(inCGLContext ctx: CGLContextObj,
                         pixelFormat pf: CGLPixelFormatObj,
                         forLayerTime t: CFTimeInterval,
                         displayTime ts: UnsafePointer<CVTimeStamp>?) -> Bool {

        // When in live resize, skip drawing on main thread
        guard !(inLiveResize && Thread.isMainThread) else { return false }

        guard !isUninited, let wrapper = wrapper else { return false }

        if !inLiveResize {
            isAsynchronous = false
        }

        // Use IINA's shouldRenderUpdateFrame method
        let shouldRender = forceDraw || wrapper.shouldRenderUpdateFrame()
        if shouldRender {
            // Log throttling - only print every 5 seconds to reduce spam
            let currentTime = CACurrentMediaTime()
            if currentTime - Self.lastCanDrawLogTime > 5.0 {
                print("🎬 canDraw() = true (forceDraw:\(forceDraw), hasFrame:\(wrapper.shouldRenderUpdateFrame())) (throttled)")
                Self.lastCanDrawLogTime = currentTime
            }
        }
        return shouldRender
    }

    override func draw(inCGLContext ctx: CGLContextObj,
                      pixelFormat pf: CGLPixelFormatObj,
                      forLayerTime t: CFTimeInterval,
                      displayTime ts: UnsafePointer<CVTimeStamp>?) {

        guard !isUninited, let wrapper = wrapper else { return }

        needsFlip = false
        forceDraw = false

        // Log throttling - only print every 5 seconds to reduce spam
        let currentTime = CACurrentMediaTime()
        if currentTime - Self.lastDrawLogTime > 5.0 {
            print("🎬 draw() - Rendering frame! (throttled)")
            Self.lastDrawLogTime = currentTime
        }

        // Clear to black
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))

        // Get current framebuffer
        var i: GLint = 0
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)

        // Get viewport dimensions
        var dims: [GLint] = [0, 0, 0, 0]
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)

        // Render MPV frame directly (thread-safe per MPV docs)
        guard let renderContext = wrapper.renderContext else { return }

        var flip: CInt = 1
        var data = mpv_opengl_fbo(
            fbo: Int32(i != 0 ? i : fbo),
            w: Int32(dims[2]),
            h: Int32(dims[3]),
            internal_format: 0
        )

        withUnsafeMutablePointer(to: &flip) { flipPtr in
            withUnsafeMutablePointer(to: &data) { dataPtr in
                var params: [mpv_render_param] = [
                    mpv_render_param(type: MPV_RENDER_PARAM_OPENGL_FBO, data: UnsafeMutableRawPointer(dataPtr)),
                    mpv_render_param(type: MPV_RENDER_PARAM_FLIP_Y, data: UnsafeMutableRawPointer(flipPtr)),
                    mpv_render_param()
                ]
                mpv_render_context_render(renderContext, &params)
            }
        }

        glFlush()
    }

    // MARK: - Context Management

    override func copyCGLPixelFormat(forDisplayMask mask: UInt32) -> CGLPixelFormatObj {
        return cglPixelFormat
    }

    override func copyCGLContext(forPixelFormat pf: CGLPixelFormatObj) -> CGLContextObj {
        return cglContext
    }

    // MARK: - Update Mechanism (IINA-style)

    /// Reload the content of this layer (IINA's approach)
    override func display() {
        displayLock.lock()
        defer { displayLock.unlock() }

        _ = needsFlip

        if Thread.isMainThread {
            super.display()
        } else {
            // When not on main thread, use explicit transaction
            CATransaction.begin()
            super.display()
            CATransaction.commit()
        }

        // Flush to ensure rendering completes
        CATransaction.flush()

        // Note: reportSwap is called in displayLinkCallback, not here (IINA's pattern)
        // This keeps frame timing synchronized with the display refresh
    }

    /// Queue an update on background thread (IINA's key pattern)
    func update(force: Bool = false) {
        mpvGLQueue.async { [self] in
            if force { forceDraw = true }
            needsFlip = true

            // Log throttling - only print every 3 seconds to reduce spam
            let currentTime = CACurrentMediaTime()
            if currentTime - Self.lastLayerUpdateLogTime > 3.0 {
                print("🎬 Layer.update() called - forceDraw:\(forceDraw) needsFlip:\(needsFlip) (throttled)")
                Self.lastLayerUpdateLogTime = currentTime
            }

            // CRITICAL: Tell Core Animation we need to redraw
            setNeedsDisplay()
            display()
        }
    }

    // MARK: - Cleanup

    func uninit() {
        guard !isUninited else { return }
        isUninited = true
        print("🎬 MPVViewLayer uniniting...")

        // Stop all rendering and cleanup OpenGL resources on the GL queue
        mpvGLQueue.sync { [weak self] in
            guard let self = self else { return }

            // Cleanup MPV render context on the OpenGL thread
            self.wrapper?.destroyRenderContext()

            print("🎬 MPVViewLayer cleanup complete")
        }
    }

    deinit {
        print("🗑️ MPVViewLayer deinit")
        uninit()
    }
}// MARK: - Atomic Property Wrapper

@propertyWrapper
struct Atomic<Value> {
    private var value: Value
    private let lock = NSLock()

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get {
            lock.lock()
            defer { lock.unlock() }
            return value
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            value = newValue
        }
    }
}
