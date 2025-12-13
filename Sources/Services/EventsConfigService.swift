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
    

    
    /// Force refresh config from server (bypasses cache)
    func refreshConfig(type: String) async throws -> EventsConfig {
        print("🔄 [EventsConfig] Force refreshing \(type) config...")
        UserDefaults.standard.removeObject(forKey: "\(cacheKey)_\(type)")
        UserDefaults.standard.removeObject(forKey: "\(versionKey)_\(type)")
        return try await fetchConfig(type: type)
    }
    
    /// Upload a new configuration to Supabase (Admin only)
    func uploadNewConfig(type: String = "movie_events", movies: [MediaItem], excludedMovieIds: [String]? = nil) async throws -> Int {
        print("📤 [EventsConfig] Uploading new \(type) config with \(movies.count) movies...")
        
        // 1. Get current version to increment
        // 1. Get current version to increment
        var currentVersion = 0
        var currentConfig: EventsConfig?
        
        do {
            currentConfig = try await fetchFromSupabase(type: type)
            currentVersion = currentConfig?.version ?? 0
        } catch {
            print("⚠️ [EventsConfig] Could not fetch current version: \(error). Assuming version 0.")
        }
        
        let newVersion = currentVersion + 1
        
        // 2. Prepare data
        let configData = EventsConfigData(
            movies: movies,
            cycle_duration_hours: currentConfig?.cycleDurationHours ?? 24,
            buffer_between_movies_seconds: currentConfig?.bufferBetweenMoviesSeconds ?? 600,
            epoch_timestamp: Int(Date().timeIntervalSince1970),
            generated_at: ISO8601DateFormatter().string(from: Date()),
            excluded_movie_ids: excludedMovieIds ?? currentConfig?.excludedMovieIds
        )
        
        // 3. Deactivate old configs (optional, but good practice if we want only one active)
        // For now, we'll just insert the new one as active. Supabase RLS or triggers might handle cleanup.
        
        // 4. Insert new config
        // We need to use a dictionary for the body, so we need to convert configData to a dict
        // 4. Insert new config
        // We need to use a dictionary for the body, so we need to convert configData to a dict
        let jsonData: Data
        do {
            jsonData = try JSONEncoder().encode(configData)
        } catch {
             print("❌ [EventsConfig] Failed to encode config data: \(error)")
             throw EventsConfigError.invalidData
        }
        
        guard let jsonDict = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            print("❌ [EventsConfig] Failed to serialize config JSON")
            throw EventsConfigError.invalidData
        }
        
        let insertBody: [String: Any] = [
            "config_type": type,
            "version": newVersion,
            "data": jsonDict,
            "is_active": true
        ]
        
        _ = try await SupabaseClient.shared.makeRequest(
            path: "/events_config",
            method: "POST",
            body: insertBody
        )
        
        print("✅ [EventsConfig] Successfully uploaded version \(newVersion)")
        return newVersion
    }
    
    // MARK: - Private Methods
    
    private func fetchConfig(type: String) async throws -> EventsConfig {
        let cachedVersion = UserDefaults.standard.integer(forKey: "\(versionKey)_\(type)")
        
        // ALWAYS check server for latest version first
        print("📡 [EventsConfig] Checking server for \(type) config version...")
        
        do {
            let serverConfig = try await fetchFromSupabase(type: type)
            
            // If server version is newer than cache, use server version
            if serverConfig.version > cachedVersion {
                print("🆕 [EventsConfig] Server has newer version \(serverConfig.version) (cached: \(cachedVersion))")
                
                // Cache the new version
                // Cache the new version
                do {
                    let encoded = try JSONEncoder().encode(serverConfig)
                    UserDefaults.standard.set(encoded, forKey: "\(cacheKey)_\(type)")
                    UserDefaults.standard.set(serverConfig.version, forKey: "\(versionKey)_\(type)")
                    print("💾 [EventsConfig] Cached new version \(serverConfig.version)")
                } catch {
                    print("⚠️ [EventsConfig] Failed to cache new version: \(error)")
                }
                
                return serverConfig
            }
            
            // Server version matches cache, use cached data if available
            // Server version matches cache, use cached data if available
            if let cachedData = UserDefaults.standard.data(forKey: "\(cacheKey)_\(type)"), cachedVersion > 0 {
                do {
                    let cachedConfig = try JSONDecoder().decode(EventsConfig.self, from: cachedData)
                    print("✅ [EventsConfig] Using cached \(type) config (version \(cachedVersion), \(cachedConfig.movies.count) movies)")
                    return cachedConfig
                } catch {
                     print("⚠️ [EventsConfig] Failed to decode cached config: \(error)")
                }
            }
            
            // No valid cache, use server config
            print("💾 [EventsConfig] No valid cache, using server config")
            if let encoded = try? JSONEncoder().encode(serverConfig) {
                UserDefaults.standard.set(encoded, forKey: "\(cacheKey)_\(type)")
                UserDefaults.standard.set(serverConfig.version, forKey: "\(versionKey)_\(type)")
            }
            return serverConfig
            
        } catch {
            // Server fetch failed, try to use cache as fallback
            print("⚠️ [EventsConfig] Server fetch failed: \(error)")
            
            if let cachedData = UserDefaults.standard.data(forKey: "\(cacheKey)_\(type)"), cachedVersion > 0 {
                do {
                    let cachedConfig = try JSONDecoder().decode(EventsConfig.self, from: cachedData)
                     print("📦 [EventsConfig] Using cached \(type) config as fallback (version \(cachedVersion))")
                     return cachedConfig
                } catch {
                    print("❌ [EventsConfig] Cache fallback failed due to decode error: \(error)")
                }
            }
            
            // No cache available, throw error
            throw error
        }
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
            generatedAt: supabaseConfig.data.generated_at,
            excludedMovieIds: supabaseConfig.data.excluded_movie_ids
        )
    }
    
    private func checkForUpdates(type: String, currentVersion: Int) async {
        do {
            let latestConfig = try await fetchFromSupabase(type: type)
            
            if latestConfig.version > currentVersion {
                print("🆕 [EventsConfig] New version available: \(latestConfig.version) (current: \(currentVersion))")
                
                // Update cache
                do {
                    let encoded = try JSONEncoder().encode(latestConfig)
                    UserDefaults.standard.set(encoded, forKey: "\(cacheKey)_\(type)")
                    UserDefaults.standard.set(latestConfig.version, forKey: "\(versionKey)_\(type)")
                    print("✅ [EventsConfig] Auto-updated to version \(latestConfig.version)")
                } catch {
                    print("⚠️ [EventsConfig] Failed to cache auto-update: \(error)")
                }
            }
        } catch {
            print("⚠️ [EventsConfig] Failed to check for updates: \(error)")
        }
    }
    // MARK: - Schedule Logic
    
    /// Calculate the currently live event based on the deterministic schedule
    /// This ensures all clients agree on the EXACT start time, regardless of when the room was created
    func calculateLiveEvent(config: EventsConfig) -> (startTime: Date, mediaItem: MediaItem)? {
        guard !config.movies.isEmpty else { return nil }
        
        // 1. Calculate total duration of the cycle
        var totalCycleDuration: TimeInterval = 0
        var movieDurations: [TimeInterval] = []
        
        let buffer = Double(config.bufferBetweenMoviesSeconds)
        
        for movie in config.movies {
            let runtimeString = movie.runtime?.components(separatedBy: " ").first ?? "120"
            let runtimeMinutes = Int(runtimeString) ?? 120
            let duration = TimeInterval(runtimeMinutes * 60) + buffer
            movieDurations.append(duration)
            totalCycleDuration += duration
            
            // LOGGING for Drift Debugging
            NSLog("🗓 Schedule Calc: \(movie.name) | RuntimeStr: \(movie.runtime ?? "nil") -> \(runtimeMinutes)m | Duration: \(duration)s")
        }
        
        // 2. Determine where we are in the cycle relative to fixed epoch
        let now = TimeService.shared.now
        
        // CRITICAL: Use the SAME fixed epoch as EventsView.swift to ensure the schedule matches!
        // We use the shared constant to enforce this.
        let epoch = ScheduleConstants.Epoch
        
        let timeSinceEpoch = now.timeIntervalSince(epoch)
        let currentCycleTime = timeSinceEpoch.truncatingRemainder(dividingBy: totalCycleDuration)
        
        // 3. Find the currently playing movie
        var accumulatedTime: TimeInterval = 0
        
        for (index, duration) in movieDurations.enumerated() {
            if accumulatedTime + duration > currentCycleTime {
                // We found the current slot
                let timeIntoCurrentMovie = currentCycleTime - accumulatedTime
                
                // Calculate absolute start time for this slot
                // startTime = now - timeIntoSlot
                let startTime = now.addingTimeInterval(-timeIntoCurrentMovie)
                
                return (startTime, config.movies[index])
            }
            accumulatedTime += duration
        }
        
        return nil
    }
}

// MARK: - Models

/// Represents System-Hosted Movie Events (Events).
///
/// **Distinct from User Rooms**:
/// - An `EventsConfig` is a static schedule defined by the system/admin.
/// - Playback is "live broadcast" style (no user pause/seek).
/// - Global schedule shared by all users.
///
/// For user-hosted watch parties, see `SupabaseRoom` in `SupabaseClient`.
struct EventsConfig: Codable {
    let version: Int
    let movies: [MediaItem]
    let cycleDurationHours: Int
    let bufferBetweenMoviesSeconds: Int
    let epochTimestamp: Int
    let generatedAt: String
    let excludedMovieIds: [String]?
    
    enum CodingKeys: String, CodingKey {
        case version
        case movies
        case cycleDurationHours = "cycle_duration_hours"
        case bufferBetweenMoviesSeconds = "buffer_between_movies_seconds"
        case epochTimestamp = "epoch_timestamp"
        case generatedAt = "generated_at"
        case excludedMovieIds = "excluded_movie_ids"
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
    let excluded_movie_ids: [String]?
}

// MARK: - Errors

enum EventsConfigError: Error {
    case noActiveConfig
    case invalidData
    case networkError(Error)
}
