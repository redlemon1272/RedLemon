//
//  MPVOpenGLBridge.swift
//  RedLemon
//
//  OpenGL function pointer retrieval for mpv (from IINA)
//

import Foundation
import OpenGL
import Quartz

/// Get OpenGL function pointers for mpv (IINA implementation)
///
/// This is a C-compatible function that mpv uses to get OpenGL function addresses.
/// IINA retrieves these from the com.apple.opengl framework bundle.
func mpvGetOpenGLFunc(_ ctx: UnsafeMutableRawPointer?, _ name: UnsafePointer<Int8>?) -> UnsafeMutableRawPointer? {
    let symbolName: CFString = CFStringCreateWithCString(
        kCFAllocatorDefault,
        name,
        kCFStringEncodingASCII
    )

    guard let addr = CFBundleGetFunctionPointerForName(
        CFBundleGetBundleWithIdentifier(
            CFStringCreateCopy(kCFAllocatorDefault, "com.apple.opengl" as CFString)
        ),
        symbolName
    ) else {
        LoggingManager.shared.error(.videoRendering, message: "Cannot get OpenGL function pointer for \(String(cString: name!))")
        return nil
    }

    return addr
}

// Global log throttling for MPV callbacks
private var lastMPVFrameLogTime: CFTimeInterval = 0

/// Update callback that mpv calls when a new frame is ready (IINA implementation)
func mpvUpdateCallback(_ ctx: UnsafeMutableRawPointer?) {
    guard let ctx = ctx else { return }
    let layer = Unmanaged<MPVViewLayer>.fromOpaque(ctx).takeUnretainedValue()

    // Log throttling - only print every 2 seconds to reduce spam
    let currentTime = CACurrentMediaTime()
    if currentTime - lastMPVFrameLogTime > 2.0 {
        LoggingManager.shared.debug(.videoRendering, message: "MPV: Frame ready! Calling layer.update() (throttled)")
        lastMPVFrameLogTime = currentTime
    }
    layer.update()
}
