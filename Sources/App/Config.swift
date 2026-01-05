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
    static let supabaseURL = "https://151.243.109.243.nip.io"
    static let supabaseAnonKey = "eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJyb2xlIjogImFub24iLCAiaXNzIjogInN1cGFiYXNlIiwgImlhdCI6IDE3Njc2NTAwMzIsICJleHAiOiAyMDgzMDEwMDMyfQ.zY-FKTBjIi4dvhR7En5i5ULALx9QM_2O4QWMbedkBus"
    static let supabaseServiceKey = "eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJyb2xlIjogInNlcnZpY2Vfcm9sZSIsICJpc3MiOiAic3VwYWJhc2UiLCAiaWF0IjogMTc2NzY1MDAzMiwgImV4cCI6IDIwODMwMTAwMzJ9.E0sn2kRDP82qO1SV_CRZcNCT9Ho47sSuGaDxSKhoIT4"

    // Local Server Security
    // Ephemeral token generated per-launch to secure local API
    static let localAuthToken = UUID().uuidString

    // Metadata endpoints
    static func metadataMovieURL(imdbId: String) -> URL? {
        URL(string: "\(serverURL)/api/metadata/meta/movie/\(imdbId)")
    }

    static func metadataTVURL(imdbId: String, season: Int, episode: Int) -> URL? {
        URL(string: "\(serverURL)/api/metadata/meta/tv/\(imdbId)/\(season)/\(episode)")
    }
}