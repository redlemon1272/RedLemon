//
//  ProxyRoutes.swift
//  RedLemon
//
//  Stream proxy routes for RealDebrid playback
//  Simplified for Swift/MPV - no browser workarounds
//

import Foundation
import Vapor

func registerProxyRoutes(_ app: Application) {

    // GET /play/rd/:infoHash/:fileIdx?
    // Main stream proxy endpoint
    app.get("play", "rd", ":infoHash", ":fileIdx") { req async throws -> Response in
        return try await handleStreamRequest(req)
    }

    // GET /play/rd/:infoHash (default to file 0)
    app.get("play", "rd", ":infoHash") { req async throws -> Response in
        return try await handleStreamRequest(req)
    }

    print("✅ Proxy routes registered:")
    print("   GET /play/rd/:infoHash/:fileIdx")
    print("   GET /play/rd/:infoHash")
}

private func handleStreamRequest(_ req: Request) async throws -> Response {
    guard let infoHash = req.parameters.get("infoHash") else {
        throw Abort(.badRequest, reason: "Missing infoHash")
    }

    let fileIdx = req.parameters.get("fileIdx", as: Int.self) ?? 0

    print("🎬 Stream request: \(infoHash):\(fileIdx)")

    // Get RealDebrid token - FIXED: Removed unnecessary try
    guard let rdToken = await KeychainManager.shared.get(service: "realdebrid") else {
        throw Abort(.unauthorized, reason: "No RealDebrid token found")
    }

    // Get stream URL (cached or unlock)
    let result = try await StreamProxyService.shared.getStreamURL(
        infoHash: infoHash,
        fileIdx: fileIdx,
        rdToken: rdToken
    )

    // Proxy the stream with range support
    return try await proxyStream(url: result.url, req: req)
}

private func proxyStream(url: String, req: Request) async throws -> Response {
    guard let streamURL = URL(string: url) else {
        throw Abort(.internalServerError, reason: "Invalid stream URL")
    }

    print("📡 Proxying stream from: \(url.prefix(60))...")

    // Build request with range header if provided
    var request = URLRequest(url: streamURL)
    if let rangeHeader = req.headers.first(name: "Range") {
        request.setValue(rangeHeader, forHTTPHeaderField: "Range")
        print("   Range: \(rangeHeader)")
    }

    // Fetch from upstream
    let (asyncBytes, response) = try await URLSession.shared.bytes(for: request)

    guard let httpResponse = response as? HTTPURLResponse else {
        throw Abort(.internalServerError, reason: "Invalid response")
    }

    print("   Status: \(httpResponse.statusCode)")

    // Create Vapor response
    let vaporResponse = Response(status: HTTPStatus(statusCode: httpResponse.statusCode))

    // Forward important headers
    if let contentType = httpResponse.value(forHTTPHeaderField: "Content-Type") {
        vaporResponse.headers.add(name: "Content-Type", value: contentType)
    }

    if let contentLength = httpResponse.value(forHTTPHeaderField: "Content-Length") {
        vaporResponse.headers.add(name: "Content-Length", value: contentLength)
    }

    if let contentRange = httpResponse.value(forHTTPHeaderField: "Content-Range") {
        vaporResponse.headers.add(name: "Content-Range", value: contentRange)
    }

    // Add range support headers
    vaporResponse.headers.add(name: "Accept-Ranges", value: "bytes")

    // CORS headers
    vaporResponse.headers.add(name: "Access-Control-Allow-Origin", value: "*")
    vaporResponse.headers.add(name: "Access-Control-Expose-Headers", value: "Content-Range, Content-Length, Accept-Ranges")

    // Stream the response body
    vaporResponse.body = .init(asyncStream: { writer in
        do {
            var bytesStreamed = 0
            for try await byte in asyncBytes {
                try await writer.write(.buffer(ByteBuffer(bytes: [byte])))
                bytesStreamed += 1
            }
            print("   ✅ Streamed \(bytesStreamed) bytes")
        } catch {
            print("   ❌ Stream error: \(error.localizedDescription)")
        }
    })

    return vaporResponse
}
