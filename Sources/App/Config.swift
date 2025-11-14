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
    static let supabaseURL = "https://nhvsojszwfvcinkyvzmf.supabase.co"
    static let supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5odnNvanN6d2Z2Y2lua3l2em1mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI1NjE5MTYsImV4cCI6MjA3ODEzNzkxNn0.1u8C04lu1r_Jsy7m8bdGD-dT33Ml1EautcPNib93bWw"

    // Metadata endpoints
    static func metadataMovieURL(imdbId: String) -> URL? {
        URL(string: "\(serverURL)/api/metadata/meta/movie/\(imdbId)")
    }

    static func metadataTVURL(imdbId: String, season: Int, episode: Int) -> URL? {
        URL(string: "\(serverURL)/api/metadata/meta/tv/\(imdbId)/\(season)/\(episode)")
    }
}