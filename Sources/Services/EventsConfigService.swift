//
//  EventsConfigService.swift
//  RedLemon
//
//  Service to fetch and cache centralized event configurations from Supabase
//  Ensures all RedLemon instances show identical movie/TV event schedules
//

import Foundation

/// Service for managing centralized event configurations
class EventsConfigService {
    static let shared = EventsConfigService()
    
    private let cacheKey = "events_config_cache"
    private let versionKey = "events_config_version"
    
    private init() {}
    
    // MARK: - Public API
    
    /// Fetch active movie events configuration
    /// Returns cached version if available and up-to-date
    func fetchMovieEventsConfig() async throws -> EventsConfig {
        return try await fetchConfig(type: "movie_events")
    }
    
    /// Fetch active TV events configuration
    func fetchTVEventsConfig() async throws -> EventsConfig {
        return try await fetchConfig(type: "tv_events")
    }
    
    /// Force refresh config from server (bypasses cache)
    func refreshConfig(type: String) async throws -> EventsConfig {
        print("🔄 [EventsConfig] Force refreshing \(type) config...")
        UserDefaults.standard.removeObject(forKey: "\(cacheKey)_\(type)")
        UserDefaults.standard.removeObject(forKey: "\(versionKey)_\(type)")
        return try await fetchConfig(type: type)
    }
    
    // MARK: - Private Methods
    
    private func fetchConfig(type: String) async throws -> EventsConfig {
        let cachedVersion = UserDefaults.standard.integer(forKey: "\(versionKey)_\(type)")
        
        // Try to load from cache first
        if let cachedData = UserDefaults.standard.data(forKey: "\(cacheKey)_\(type)"),
           let cachedConfig = try? JSONDecoder().decode(EventsConfig.self, from: cachedData),
           cachedVersion > 0 {
            print("✅ [EventsConfig] Using cached \(type) config (version \(cachedVersion), \(cachedConfig.movies.count) movies)")
            
            // Fetch latest version in background to check for updates
            Task.detached {
                await self.checkForUpdates(type: type, currentVersion: cachedVersion)
            }
            
            return cachedConfig
        }
        
        // No cache, fetch from server
        print("📡 [EventsConfig] Fetching \(type) config from Supabase...")
        let config = try await fetchFromSupabase(type: type)
        
        // Cache the result
        if let encoded = try? JSONEncoder().encode(config) {
            UserDefaults.standard.set(encoded, forKey: "\(cacheKey)_\(type)")
            UserDefaults.standard.set(config.version, forKey: "\(versionKey)_\(type)")
            print("💾 [EventsConfig] Cached \(type) config version \(config.version)")
        }
        
        return config
    }
    
    private func fetchFromSupabase(type: String) async throws -> EventsConfig {
        // Fetch active config for this type
        let data = try await SupabaseClient.shared.makeRequest(
            path: "/events_config",
            query: [
                "config_type": "eq.\(type)",
                "is_active": "eq.true",
                "select": "*",
                "order": "version.desc",
                "limit": "1"
            ]
        )
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            // Try fractional seconds first
            if let date = formatter.date(from: dateString) {
                return date
            }
            
            // Fallback to standard ISO8601
            let isoFormatter = ISO8601DateFormatter()
            if let date = isoFormatter.date(from: dateString) {
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
        }
        
        let configs = try decoder.decode([SupabaseEventsConfig].self, from: data)
        
        guard let supabaseConfig = configs.first else {
            throw EventsConfigError.noActiveConfig
        }
        
        print("✅ [EventsConfig] Fetched \(type) version \(supabaseConfig.version) with \(supabaseConfig.data.movies.count) movies")
        
        return EventsConfig(
            version: supabaseConfig.version,
            movies: supabaseConfig.data.movies,
            cycleDurationHours: supabaseConfig.data.cycle_duration_hours,
            bufferBetweenMoviesSeconds: supabaseConfig.data.buffer_between_movies_seconds,
            epochTimestamp: supabaseConfig.data.epoch_timestamp,
            generatedAt: supabaseConfig.data.generated_at
        )
    }
    
    private func checkForUpdates(type: String, currentVersion: Int) async {
        do {
            let latestConfig = try await fetchFromSupabase(type: type)
            
            if latestConfig.version > currentVersion {
                print("🆕 [EventsConfig] New version available: \(latestConfig.version) (current: \(currentVersion))")
                
                // Update cache
                if let encoded = try? JSONEncoder().encode(latestConfig) {
                    UserDefaults.standard.set(encoded, forKey: "\(cacheKey)_\(type)")
                    UserDefaults.standard.set(latestConfig.version, forKey: "\(versionKey)_\(type)")
                    print("✅ [EventsConfig] Auto-updated to version \(latestConfig.version)")
                }
            }
        } catch {
            print("⚠️ [EventsConfig] Failed to check for updates: \(error)")
        }
    }
}

// MARK: - Models

struct EventsConfig: Codable {
    let version: Int
    let movies: [MediaItem]
    let cycleDurationHours: Int
    let bufferBetweenMoviesSeconds: Int
    let epochTimestamp: Int
    let generatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case version
        case movies
        case cycleDurationHours = "cycle_duration_hours"
        case bufferBetweenMoviesSeconds = "buffer_between_movies_seconds"
        case epochTimestamp = "epoch_timestamp"
        case generatedAt = "generated_at"
    }
}

struct SupabaseEventsConfig: Codable {
    let id: UUID
    let configType: String
    let version: Int
    let data: EventsConfigData
    let createdAt: Date
    let updatedAt: Date
    let isActive: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case configType = "config_type"
        case version
        case data
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isActive = "is_active"
    }
}

struct EventsConfigData: Codable {
    let movies: [MediaItem]
    let cycle_duration_hours: Int
    let buffer_between_movies_seconds: Int
    let epoch_timestamp: Int
    let generated_at: String
}

// MARK: - Errors

enum EventsConfigError: Error {
    case noActiveConfig
    case invalidData
    case networkError(Error)
}
