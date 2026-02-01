import Foundation

/// Centralized configuration for RedLemon
struct Config {
    // Server configuration - respects REDLEMON_PORT environment variable
    // Default: 47253 (high port, unlikely to conflict in production)
    static var serverPort: Int {
        let envPort = ProcessInfo.processInfo.environment["REDLEMON_PORT"]
        return Int(envPort ?? "47253") ?? 47253
    }

    static var serverURL: String {
        "http://127.0.0.1:\(serverPort)"
    }

    // Supabase configuration
    // IMPORTANT: These are PUBLIC anon keys - safe to share
    // Never commit service_role keys or database passwords
    static let supabaseURL = "https://redlemon.live.placeholder.nip.io"
    static let supabaseAnonKey = "SUPABASE_ANON_KEY_PLACEHOLDER"


    // Local Server Security
    // Ephemeral token generated per-launch to secure local API
    static let localAuthToken = UUID().uuidString

    // Metadata endpoints
    static func metadataMovieURL(imdbId: String) -> URL? {
        guard var components = URLComponents(string: serverURL) else { return nil }
        components.path = "/api/metadata/meta/movie/\(imdbId)"
        return components.url
    }

    static func metadataTVURL(imdbId: String, season: Int, episode: Int) -> URL? {
        guard var components = URLComponents(string: serverURL) else { return nil }
        components.path = "/api/metadata/meta/tv/\(imdbId)/\(season)/\(episode)"
        return components.url
    }
}