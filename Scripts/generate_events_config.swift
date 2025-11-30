#!/usr/bin/env swift

//
//  generate_events_config.swift
//  RedLemon
//
//  Generates curated movie list using deterministic filtering and uploads to Supabase
//  This ensures all RedLemon instances show identical movie events
//

import Foundation

// MARK: - Configuration

let supabaseURL = "https://nhvsojszwfvcinkyvzmf.supabase.co"
let supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5odnNvanN6d2Z2Y2lua3l2em1mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI1NjE5MTYsImV4cCI6MjA3ODEzNzkxNn0.1u8C04lu1r_Jsy7m8bdGD-dT33Ml1EautcPNib93bWw"
let configVersion = 1 // Increment this when you want to update the config

// MARK: - Models

struct MediaItem: Codable {
    let id: String
    let type: String
    let name: String
    let poster: String?
    let background: String?
    let logo: String?
    let description: String?
    let releaseInfo: String?
    let year: String?
    let imdbRating: String?
    let genres: [String]?
    let runtime: String?
}

struct StremioMeta: Codable {
    let id: String
    let type: String
    let name: String
    let poster: String?
    let background: String?
    let logo: String?
    let releaseInfo: String?
    let imdbRating: String?
    let genre: [String]?
}

struct StremioMetaResponse: Codable {
    let metas: [StremioMeta]
}

struct EventsConfig: Codable {
    let movies: [MediaItem]
    let cycle_duration_hours: Int
    let buffer_between_movies_seconds: Int
    let epoch_timestamp: Int
    let generated_at: String
}

struct SupabaseConfigPayload: Codable {
    let config_type: String
    let version: Int
    let data: EventsConfig
    let is_active: Bool
}

// MARK: - Seeded Random Generator

struct SeededGenerator: RandomNumberGenerator {
    private var state: UInt64
    
    init(seed: Int) {
        self.state = UInt64(seed)
    }
    
    mutating func next() -> UInt64 {
        state = 6364136223846793005 &* state &+ 1442695040888963407
        return state
    }
}

// MARK: - Main Script

print("🎬 RedLemon Events Config Generator")
print(String(repeating: "=", count: 50))

// Step 1: Fetch movies from streaming catalogs
print("\n📡 Step 1: Fetching movies from streaming catalogs...")

let addonBaseURL = "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky"

let catalogs = [
    "nfx", // Netflix
    "dnp", // Disney+
    "hlu", // Hulu
    "amp", // Prime Video
    "stz", // Starz
    "hbm", // HBO Max
    "pcp", // Peacock
    "sst", // Showtime
    "atp", // Apple TV+
    "pmp"  // Paramount+
]

var allMetas: [StremioMeta] = []

for catalog in catalogs {
    let catalogURL = URL(string: "\(addonBaseURL)/catalog/movie/\(catalog).json")!
    
    do {
        let (data, _) = try await URLSession.shared.data(from: catalogURL)
        let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)
        allMetas.append(contentsOf: response.metas)
        print("   ✅ Fetched \(response.metas.count) items from \(catalog)")
    } catch {
        print("   ⚠️  Failed to fetch \(catalog): \(error)")
    }
}

print("📊 Total fetched: \(allMetas.count) movies")

// Step 2: Deduplicate and sort
print("\n🔄 Step 2: Deduplicating and sorting...")

var seenIds = Set<String>()
let uniqueMetas = allMetas.filter { meta in
    if seenIds.contains(meta.id) {
        return false
    }
    seenIds.insert(meta.id)
    return true
}

let sortedMetas = uniqueMetas.sorted { $0.id < $1.id }
print("📊 Unique movies: \(sortedMetas.count)")

// Step 3: Deterministic shuffle with fixed seed
print("\n🎲 Step 3: Applying deterministic shuffle...")

let epoch = Date(timeIntervalSince1970: 1704067200) // 2024-01-01 00:00:00 UTC
let timeSinceEpoch = Date().timeIntervalSince(epoch)
let conservativeMovieDuration: TimeInterval = 9000  // 2.5 hours
let cycleDuration = conservativeMovieDuration * 80  // ~200 hours
let cycleNumber = Int(timeSinceEpoch / cycleDuration)
let baseSeed = 20250126
let seed = baseSeed + cycleNumber

print("   Seed: \(seed) (Cycle #\(cycleNumber))")

var generator = SeededGenerator(seed: seed)
let shuffledMetas = sortedMetas.shuffled(using: &generator)

// Step 4: Apply filters (same as LocalAPIClient)
print("\n🔍 Step 4: Applying quality filters...")

let blacklistedTitles = [
    "Selena y Los Dinos: A Family's Legacy",
    "Star Trek Beyond", "Star Trek Into Darkness", "Star Trek",
    "In Waves and War", "God Bless America", "Tracing the Divide",
    "The Teacher", "Sunshine", "Lilith Fair: Building a Mystery",
    "Three Billboards Outside Ebbing, Missouri", "Star Wars",
    "The White House Effect", "Animal Kingdom", "The Ugly Stepsister",
    "ONE SHOT with Ed Sheeran", "Dark City", "Free Guy",
    "Arlington Road", "Margin Call", "Glass Onion",
    "L.A. Confidential", "Master and Commander"
]

let validMetas = shuffledMetas.filter { meta in
    // Must have logo and background
    guard let logo = meta.logo, !logo.isEmpty,
          let _ = meta.background else {
        return false
    }
    
    // Blacklist check
    if blacklistedTitles.contains(where: { meta.name.contains($0) }) {
        return false
    }
    
    // Release year filter (1990 or newer)
    if let releaseInfo = meta.releaseInfo {
        let yearStr = String(releaseInfo.prefix(4))
        if let year = Int(yearStr), year < 1990 {
            return false
        }
    }
    
    // Rating filter (>= 7.0)
    guard let ratingStr = meta.imdbRating,
          let rating = Double(ratingStr),
          rating >= 7.0 else {
        return false
    }
    
    // Genre filters
    if let genres = meta.genre {
        let unwantedGenres = ["Documentary", "Short", "News", "Talk-Show", "Reality-TV", "Animation", "Family", "Musical", "Biography"]
        if genres.contains(where: { unwantedGenres.contains($0) }) {
            return false
        }
        
        let excitingGenres = ["Thriller", "Horror", "Action", "Sci-Fi", "Crime"]
        let hasExcitingGenre = genres.contains(where: { excitingGenres.contains($0) })
        
        if !hasExcitingGenre {
            return false
        }
    }
    
    return true
}

print("📊 Filtered to \(validMetas.count) high-quality movies")

// Step 5: Convert to MediaItems
print("\n📦 Step 5: Converting to MediaItem format...")

let mediaItems: [MediaItem] = validMetas.prefix(200).map { meta in
    let backgroundURL = meta.background ?? "https://images.metahub.space/background/medium/\(meta.id)/img"
    let logoURL = meta.logo ?? "https://images.metahub.space/logo/medium/\(meta.id)/img"
    
    return MediaItem(
        id: meta.id,
        type: meta.type,
        name: meta.name,
        poster: meta.poster,
        background: backgroundURL,
        logo: logoURL,
        description: nil,
        releaseInfo: meta.releaseInfo,
        year: nil,
        imdbRating: meta.imdbRating,
        genres: meta.genre,
        runtime: nil // Will be fetched on-demand
    )
}

print("✅ Generated \(mediaItems.count) movies for events")

// Step 6: Create config object
print("\n📋 Step 6: Creating events config...")

let config = EventsConfig(
    movies: mediaItems,
    cycle_duration_hours: 200,
    buffer_between_movies_seconds: 600,
    epoch_timestamp: 1704067200,
    generated_at: ISO8601DateFormatter().string(from: Date())
)

// Step 7: Upload to Supabase
print("\n☁️  Step 7: Uploading to Supabase...")

// Create payload with just the data field (for PATCH)
struct UpdatePayload: Codable {
    let data: EventsConfig
    let is_active: Bool
}

let updatePayload = UpdatePayload(
    data: config,
    is_active: true
)

// Use PATCH to update the existing row instead of POST to insert
let uploadURL = URL(string: "\(supabaseURL)/rest/v1/events_config?config_type=eq.movie_events&version=eq.\(configVersion)")!
var request = URLRequest(url: uploadURL)
request.httpMethod = "PATCH"
request.setValue(supabaseAnonKey, forHTTPHeaderField: "apikey")
request.setValue("Bearer \(supabaseAnonKey)", forHTTPHeaderField: "Authorization")
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.setValue("return=representation", forHTTPHeaderField: "Prefer")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
request.httpBody = try encoder.encode(updatePayload)

do {
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse else {
        print("❌ Invalid response")
        exit(1)
    }
    
    if (200...299).contains(httpResponse.statusCode) {
        print("✅ Successfully updated config version \(configVersion)")
        print("   Movies: \(mediaItems.count)")
        print("   Cycle duration: 200 hours")
        
        // Print first 10 movies
        print("\n📽️  First 10 movies:")
        for (index, movie) in mediaItems.prefix(10).enumerated() {
            print("   \(index + 1). \(movie.name) (\(movie.imdbRating ?? "N/A"))")
        }
    } else {
        let errorString = String(data: data, encoding: .utf8) ?? "Unknown error"
        print("❌ Upload failed (\(httpResponse.statusCode)): \(errorString)")
        exit(1)
    }
} catch {
    print("❌ Upload error: \(error)")
    exit(1)
}

print("\n✅ Done! All RedLemon instances will now use this config.")
print(String(repeating: "=", count: 50))
