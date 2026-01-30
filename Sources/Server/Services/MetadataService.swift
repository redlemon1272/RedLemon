//
//  MetadataService.swift
//  RedLemon
//
//  Fetches movie/series metadata from Cinemeta and TVMaze
//  Used by Zilean provider (needs titles) and for background art
//

import Foundation

actor MetadataService {
    static let shared = MetadataService()

    private var cache: [String: Metadata] = [:]
    private let cacheDuration: TimeInterval = 86400 // 24 hours

    private init() {
        print("✅ MetadataService initialized")
    }

    /// Fetch metadata for a movie or series
    /// - Parameters:
    ///   - imdbId: IMDB ID (e.g., "tt0133093")
    ///   - type: "movie" or "series"
    /// - Returns: Metadata or nil if not found
    func getMetadata(imdbId: String, type: String) async -> Metadata? {
        // Check cache first
        if let cached = cache[imdbId] {
            print("✅ Metadata cache hit for \(imdbId): \(cached.title)")
            return cached
        }

        // Try TVMaze for series (free, no key required)
        if type == "series" {
            if let metadata = await fetchFromTVMaze(imdbId: imdbId) {
                cache[imdbId] = metadata
                return metadata
            }
        }

        // Fallback to Cinemeta (works for both movies and series)
        if let metadata = await fetchFromCinemeta(imdbId: imdbId, type: type) {
            cache[imdbId] = metadata
            return metadata
        }

        // Final fallback: hardcoded popular titles
        if let metadata = getKnownTitle(imdbId: imdbId, type: type) {
            cache[imdbId] = metadata
            return metadata
        }

        print("⚠️ All metadata sources failed for \(imdbId)")
        return nil
    }

    /// Resolve a Kitsu ID to an IMDB ID by fetching anime metadata
    /// - Parameter kitsuId: Kitsu ID in format "kitsu:12345"
    /// - Returns: IMDB ID (e.g., "tt1234567") or nil if not found
    func resolveKitsuToImdb(kitsuId: String) async -> String? {
        guard kitsuId.hasPrefix("kitsu:") else {
            // Not a Kitsu ID, return as-is (caller should handle)
            return nil
        }

        // Check cache first (we may have already resolved this)
        let cacheKey = "kitsu_imdb_\(kitsuId)"
        if let cached = cache[cacheKey] {
            NSLog("%@", "✅ Kitsu→IMDB cache hit: \(kitsuId) → \(cached.imdbId)")
            return cached.imdbId
        }

        // Fetch from anime-kitsu addon (same endpoint used for metadata display)
        let urlString = "https://anime-kitsu.strem.fun/meta/anime/\(kitsuId).json"
        guard let url = URL(string: urlString) else {
            NSLog("%@", "⚠️ Invalid Kitsu URL: \(urlString)")
            return nil
        }

        NSLog("%@", "🎌 Resolving Kitsu→IMDB: \(kitsuId)")

        do {
            var request = URLRequest(url: url)
            request.timeoutInterval = 5
            request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent") // Security Check #83
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                NSLog("%@", "⚠️ Kitsu metadata fetch failed: HTTP \((response as? HTTPURLResponse)?.statusCode ?? 0)")
                return nil
            }

            // Parse response - anime-kitsu uses same structure as Cinemeta
            let cinemataResponse = try JSONDecoder().decode(CinemetaResponse.self, from: data)
            let meta = cinemataResponse.meta

            // Extract IMDB ID from the response
            if let imdbId = meta.imdb_id, !imdbId.isEmpty, imdbId.hasPrefix("tt") {
                NSLog("%@", "✅ Resolved \(kitsuId) → \(imdbId) (\(meta.name))")

                // Cache this mapping
                let cacheEntry = Metadata(
                    imdbId: imdbId,
                    title: meta.name,
                    type: "series",
                    year: meta.year,
                    poster: meta.poster,
                    background: meta.background,
                    logo: meta.logo,
                    description: meta.description,
                    releaseInfo: meta.releaseInfo
                )
                cache[cacheKey] = cacheEntry

                return imdbId
            } else {
                NSLog("%@", "⚠️ No IMDB ID found in Kitsu metadata for \(kitsuId) (Title: \(meta.name))")
                return nil
            }

        } catch {
            NSLog("%@", "⚠️ Kitsu metadata fetch error: \(error.localizedDescription)")
            return nil
        }
    }

    /// Search for content by title
    func search(query: String) async -> [CinemetaSearchResult] {
        guard query.count >= 2 else {
            print("⚠️ Search query too short: \(query)")
            return []
        }

        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let urlString = "https://v3-cinemeta.stremio.com/search/query=\(encodedQuery)"

        guard let url = URL(string: urlString) else {
            return []
        }

        print("🔍 Searching Cinemeta for: \(query)")

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(CinemetaSearchResponse.self, from: data)

            // Score and sort results by relevance
            let queryLower = query.lowercased()
            let queryWords = queryLower.split(separator: " ").map { String($0) }

            var scoredResults = response.metas.map { result -> (CinemetaSearchResult, Int) in
                let titleLower = result.name.lowercased()
                var score = 0

                // Exact match (highest priority)
                if titleLower == queryLower {
                    score += 1000
                }
                // Starts with query
                else if titleLower.hasPrefix(queryLower) {
                    score += 500
                }
                // Contains exact query
                else if titleLower.contains(queryLower) {
                    score += 300
                }
                // Contains all query words
                else if queryWords.allSatisfy({ titleLower.contains($0) }) {
                    score += 150
                }
                // Contains some query words
                else {
                    score += queryWords.filter { titleLower.contains($0) }.count * 20
                }

                return (result, score)
            }

            scoredResults.sort { $0.1 > $1.1 }

            let results = scoredResults.map { $0.0 }
            print("✅ Found \(results.count) result(s) for \"\(query)\" (top score: \(scoredResults.first?.1 ?? 0))")

            return results

        } catch {
            print("⚠️ Cinemeta search failed: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Private Methods

    private func fetchFromTVMaze(imdbId: String) async -> Metadata? {
        let urlString = "https://api.tvmaze.com/lookup/shows?imdb=\(imdbId)"
        guard let url = URL(string: urlString) else { return nil }

        print("📡 Fetching metadata from TVMaze: \(urlString)")

        do {
            var request = URLRequest(url: url)
            request.timeoutInterval = 5
            request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent") // Security Check #83
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return nil
            }

            let show = try JSONDecoder().decode(TVMazeShow.self, from: data)

            let year = show.premiered?.split(separator: "-").first.map(String.init)
            let poster = show.image?.original ?? show.image?.medium

            let metadata = Metadata(
                imdbId: imdbId,
                title: show.name,
                type: "series",
                year: year,
                poster: poster,
                background: nil,
                logo: nil,
                description: show.summary,
                releaseInfo: nil
            )

            print("✅ Metadata fetched from TVMaze for \(imdbId): \(metadata.title) (\(year ?? "?"))")
            return metadata

        } catch {
            print("⚠️ TVMaze API failed: \(error.localizedDescription)")
            return nil
        }
    }

    private func fetchFromCinemeta(imdbId: String, type: String) async -> Metadata? {
        let urlString = "https://v3-cinemeta.strem.io/meta/\(type)/\(imdbId).json"
        guard let url = URL(string: urlString) else { return nil }

        print("📡 Fetching metadata from Cinemeta: \(urlString)")

        do {
            var request = URLRequest(url: url)
            request.timeoutInterval = 5
            request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36", forHTTPHeaderField: "User-Agent") // Security Check #83
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return nil
            }

            let cinemataResponse = try JSONDecoder().decode(CinemetaResponse.self, from: data)
            let meta = cinemataResponse.meta

            let metadata = Metadata(
                imdbId: imdbId,
                title: meta.name,
                type: meta.type,
                year: meta.year,
                poster: meta.poster,
                background: meta.background,
                logo: meta.logo,
                description: meta.description,
                releaseInfo: meta.releaseInfo
            )

            print("✅ Metadata fetched from Cinemeta for \(imdbId): \(metadata.title) (\(meta.year ?? "?"))")
            return metadata

        } catch {
            print("⚠️ Cinemeta API failed: \(error.localizedDescription)")
            return nil
        }
    }

    private func getKnownTitle(imdbId: String, type: String) -> Metadata? {
        let knownTitles: [String: String] = [
            "tt0959621": "Breaking Bad",
            "tt0386676": "The Office",
            "tt0944947": "Game of Thrones",
            "tt2861424": "Rick and Morty",
            "tt1475582": "Stranger Things",
            "tt0303461": "Firefly",
            "tt0773262": "Dexter",
            "tt0133093": "The Matrix"
        ]

        if let title = knownTitles[imdbId] {
            print("✅ Using hardcoded fallback title for \(imdbId): \(title)")
            return Metadata(
                imdbId: imdbId,
                title: title,
                type: type,
                year: nil,
                poster: nil,
                background: nil,
                logo: nil,
                description: nil,
                releaseInfo: nil
            )
        }

        return nil
    }
}
