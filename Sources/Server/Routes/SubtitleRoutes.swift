//
//  SubtitleRoutes.swift
//  RedLemon
//
//  Subtitle routes for SubDL integration
//  GET /subtitles/subdl/:encodedPath - Download and serve subtitle as VTT
//

import Foundation
import Vapor

func registerSubtitleRoutes(_ app: Application) {

    // GET /subtitles/search?imdbId=tt1234567&type=movie
    // Search for subtitles by IMDb ID
    app.get("subtitles", "search") { req async throws -> [SubDLSubtitle] in
        guard let imdbId: String = req.query["imdbId"] else {
            throw Abort(.badRequest, reason: "Missing imdbId parameter")
        }
        guard let type: String = req.query["type"] else {
            throw Abort(.badRequest, reason: "Missing type parameter")
        }
        let season: Int? = req.query["season"]
        let episode: Int? = req.query["episode"]
        let languages: String = req.query["languages"] ?? "en"
        let name: String? = req.query["name"]
        let year: Int? = req.query["year"]

        // Get SubDL API key from Keychain
        guard let subdlKey = await KeychainManager.shared.get(service: "subdl") else {
            throw Abort(.custom(code: 503, reasonPhrase: "SubDL API key not configured"), reason: "SubDL API key missing")
        }

        let subtitles = try await SubDLClient.shared.search(
            imdbId: imdbId,
            type: type,
            season: season,
            episode: episode,
            languages: languages,
            name: name,
            year: year,
            apiKey: subdlKey
        )

        return subtitles
    }

    // GET /subtitles/subdl/:encodedPath
    // Downloads subtitle from SubDL CDN, converts to VTT, serves with optional offset
    app.get("subtitles", "subdl", ":encodedPath") { req async throws -> Response in
        guard let encodedPath = req.parameters.get("encodedPath") else {
            throw Abort(.badRequest, reason: "Missing encodedPath")
        }

        // Extract optional offset parameter (milliseconds)
        let offset = req.query[Int.self, at: "offset"] ?? 0
        let season = req.query[Int.self, at: "season"]
        let episode = req.query[Int.self, at: "episode"]
        
        print("📄 Subtitle request: \(encodedPath.prefix(20))... (offset: \(offset)ms)")

        // Get SubDL API key from Keychain
        guard let subdlKey = await KeychainManager.shared.get(service: "subdl") else {
            throw Abort(.unauthorized, reason: "No SubDL API key found")
        }

        // Decode the base64 path
        guard let decodedData = Data(base64Encoded: encodedPath),
              let downloadPath = String(data: decodedData, encoding: .utf8) else {
            throw Abort(.badRequest, reason: "Invalid encoded path")
        }

        // Download and convert subtitle
        let vttText = try await SubDLClient.shared.download(
            downloadPath: downloadPath,
            offset: offset,
            season: season,
            episode: episode
        )

        // Return as VTT
        let response = Response(status: .ok)
        response.headers.contentType = HTTPMediaType(type: "text", subType: "vtt", parameters: ["charset": "utf-8"])
        response.headers.add(name: "Content-Disposition", value: "inline; filename=\"subtitle.vtt\"")
        response.headers.add(name: "Access-Control-Allow-Origin", value: "*")
        response.headers.add(name: "Access-Control-Allow-Methods", value: "GET, OPTIONS")
        response.headers.add(name: "Access-Control-Allow-Headers", value: "Content-Type")
        response.body = .init(string: vttText)

        return response
    }

    print("✅ Subtitle routes registered:")
    print("   GET /subtitles/search?imdbId=&type=")
    print("   GET /subtitles/subdl/:encodedPath")
}
