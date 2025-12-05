import Vapor
import Foundation

func registerMetadataRoutes(_ app: Application) {
    let metadata = app.grouped("api", "metadata")

    // Catalog endpoints (Cinemeta)
    metadata.get("catalog", ":type", ":category") { req -> EventLoopFuture<Response> in
        let type = req.parameters.get("type") ?? "movie"
        let category = req.parameters.get("category") ?? "popular"
        
        // Extract skip parameter
        let skip = (try? req.query.get(Int.self, at: "skip")) ?? 0
        
        // Construct Cinemeta URL with skip if present
        // Format: .../catalog/{type}/{category}/skip={skip}.json
        let cinemetaURL: String
        if skip > 0 {
            cinemetaURL = "https://v3-cinemeta.strem.io/catalog/\(type)/\(category)/skip=\(skip).json"
        } else {
            cinemetaURL = "https://v3-cinemeta.strem.io/catalog/\(type)/\(category).json"
        }
        
        print("🔍 [Server] Proxying catalog request to: \(cinemetaURL)")

        return req.client.get(URI(string: cinemetaURL)).flatMapThrowing { response in
            guard response.status == .ok else {
                throw Abort(.badGateway, reason: "Cinemeta API error")
            }

            return Response(status: .ok, body: .init(buffer: response.body ?? ByteBuffer()))
        }
    }

    // Meta details endpoint
    metadata.get("meta", ":type", ":id") { req -> EventLoopFuture<Response> in
        let type = req.parameters.get("type") ?? "movie"
        let id = req.parameters.get("id") ?? ""

        // Check if it's a Kitsu ID (format: kitsu:1234)
        if id.hasPrefix("kitsu:") {
            let kitsuURL = "https://anime-kitsu.strem.fun/meta/anime/\(id).json"

            return req.client.get(URI(string: kitsuURL)).flatMapThrowing { response in
                guard response.status == .ok else {
                    throw Abort(.badGateway, reason: "Kitsu API error")
                }

                return Response(status: .ok, body: .init(buffer: response.body ?? ByteBuffer()))
            }
        }

        // Default to Cinemeta
        let cinemetaURL = "https://v3-cinemeta.strem.io/meta/\(type)/\(id).json"

        return req.client.get(URI(string: cinemetaURL)).flatMapThrowing { response in
            guard response.status == .ok else {
                throw Abort(.badGateway, reason: "Cinemeta API error")
            }

            return Response(status: .ok, body: .init(buffer: response.body ?? ByteBuffer()))
        }
    }

    // Search endpoint
    metadata.get("search") { req -> EventLoopFuture<Response> in
        guard let query = try? req.query.get(String.self, at: "query") else {
            throw Abort(.badRequest, reason: "Missing query parameter")
        }

        let type = (try? req.query.get(String.self, at: "type")) ?? "movie"

        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let cinemetaURL = "https://v3-cinemeta.strem.io/catalog/\(type)/top/search=\(encodedQuery).json"

        return req.client.get(URI(string: cinemetaURL)).flatMapThrowing { response in
            guard response.status == .ok else {
                throw Abort(.badGateway, reason: "Cinemeta API error")
            }

            return Response(status: .ok, body: .init(buffer: response.body ?? ByteBuffer()))
        }
    }
}
