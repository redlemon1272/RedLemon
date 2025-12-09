//
//  UnlockRoutes.swift
//  RedLemon
//
//  Stream unlock endpoint
//  POST /api/streams/unlock
//

import Foundation
import Vapor

func registerUnlockRoutes(_ app: Application) {
    let rdClient = RealDebridClient.shared
    let keychain = KeychainManager.shared

    // POST /api/streams/unlock
    app.post("api", "streams", "unlock") { req async throws -> Response in
        struct UnlockRequest: Codable {
            let infoHash: String
            let fileIdx: Int?
            let service: String?
            let debridService: String?
            let season: Int?
            let episode: Int?
            let title: String?
        }

        let body = try req.content.decode(UnlockRequest.self)
        let serviceKey = body.service ?? body.debridService ?? "realdebrid"

        NSLog("🔓 Unlock request: infoHash=\(body.infoHash.prefix(12))..., fileIdx=\(body.fileIdx ?? 0)")
        if let season = body.season, let episode = body.episode {
            NSLog("   📺 TV Show: S\(season)E\(episode)")
        }

        guard !body.infoHash.isEmpty else {
            NSLog("❌ Missing infoHash")
            throw Abort(.badRequest, reason: "Missing infoHash")
        }

        // Get token from keychain
        guard let token = await keychain.get(service: serviceKey) else {
            NSLog("❌ No token for service: \(serviceKey)")
            throw Abort(.badRequest, reason: "No token stored for service: \(serviceKey)")
        }

        NSLog("✅ Token found, attempting unlock...")

        // Unlock via RealDebrid
        do {
            guard let result = try await rdClient.unlock(
                infoHash: body.infoHash,
                fileIdx: body.fileIdx,
                token: token,
                maxPolls: 2, // Reduced from 3 - pre-validated streams should be faster
                season: body.season,
                episode: body.episode,
                title: body.title
            ) else {
                NSLog("❌ Unlock failed - torrent not cached")
                throw Abort(.badGateway, reason: "Unlock failed - torrent may not be cached")
            }

            let response = Response(status: .ok)
            let json = try JSONEncoder().encode([
                "url": result.url,
                "filename": result.filename
            ])
            response.body = .init(data: json)
            response.headers.contentType = .json

            NSLog("✅ Unlocked successfully: \(result.filename)")

            return response

        } catch RDError.notCached {
            NSLog("❌ RealDebrid: torrent not cached")
            throw Abort(.badGateway, reason: "Torrent not cached on RealDebrid")
        } catch RDError.timeout {
            NSLog("❌ RealDebrid: timeout - treating as not cached to try next stream")
            throw Abort(.badGateway, reason: "RealDebrid timeout - trying next stream")
        } catch RDError.addMagnetFailed(let status, let message) { // FIXED: Use both parameters properly
            NSLog("❌ RealDebrid: invalid torrent (status \(status)): \(message) - trying next stream")
            throw Abort(.badGateway, reason: "Invalid torrent - trying next stream")
        } catch {
            NSLog("❌ Unlock error: \(error)")
            throw Abort(.internalServerError, reason: "Unlock failed: \(error.localizedDescription)")
        }
    }

    print("✅ Unlock routes registered:")
    print("   POST /api/streams/unlock")
}
