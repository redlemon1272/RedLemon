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
let configVersion = 3 // Increment this when you want to update the config

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
    "L.A. Confidential", "Master and Commander",
    // User requested removals (2025-11-30)
    "Spider-Man: No Way Home", "Sidney", "Dungeons & Dragons",
    "Left-Handed Girl", "Back to the Future", "Bono: Stories of Surrender",
    "Downey Wrote That", "Sangre Del Toro", "September 5",
    "Come See Me in the Good Light", "My Cousin Vinny", "American Made",
    "Blue Ruin", "Knives Out", "Bodyguard of Lies",
    "A Knight's Tale", "Brimstone", "The Gentlemen",
    "The Hunt for Red October", "Deaf President Now!", "Stiller & Meara"
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

// Step 5: Fetch exact runtimes from Cinemeta
print("\n📦 Step 5: Fetching exact runtimes from Cinemeta...")

var mediaItemsWithRuntimes: [MediaItem] = []
let cinemataBaseURL = "https://v3-cinemeta.strem.io"

for (index, meta) in validMetas.prefix(200).enumerated() {
    let backgroundURL = meta.background ?? "https://images.metahub.space/background/medium/\(meta.id)/img"
    let logoURL = meta.logo ?? "https://images.metahub.space/logo/medium/\(meta.id)/img"
    
    // Fetch runtime from Cinemeta
    var runtime: String? = nil
    do {
        let metaURL = URL(string: "\(cinemataBaseURL)/meta/movie/\(meta.id).json")!
        let (data, _) = try await URLSession.shared.data(from: metaURL)
        
        struct CinemetaMetaResponse: Codable {
            let meta: CinemetaMetaDetail
        }
        
        struct CinemetaMetaDetail: Codable {
            let runtime: String?
        }
        
        let response = try JSONDecoder().decode(CinemetaMetaResponse.self, from: data)
        runtime = response.meta.runtime
        
        if let rt = runtime {
            print("   ✅ [\(index + 1)/200] \(meta.name): \(rt)")
        } else {
            print("   ⚠️  [\(index + 1)/200] \(meta.name): No runtime, using default 120 min")
            runtime = "120 min"
        }
    } catch {
        print("   ⚠️  [\(index + 1)/200] \(meta.name): Failed to fetch runtime, using default 120 min")
        runtime = "120 min"
    }
    
    mediaItemsWithRuntimes.append(MediaItem(
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
        runtime: runtime
    ))
    
    // Small delay to avoid rate limiting
    if index % 10 == 9 {
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5 second pause every 10 requests
    }
}

print("✅ Generated \(mediaItemsWithRuntimes.count) movies with exact runtimes")

// Step 6: Calculate precise cycle duration based on actual runtimes
print("\n📋 Step 6: Calculating precise cycle duration...")

var totalCycleDuration: TimeInterval = 0
let bufferBetweenMovies: TimeInterval = 600 // 10 minutes

for movie in mediaItemsWithRuntimes {
    let runtimeMinutes = Int(movie.runtime?.components(separatedBy: " ").first ?? "120") ?? 120
    let movieDuration = TimeInterval(runtimeMinutes * 60) + bufferBetweenMovies
    totalCycleDuration += movieDuration
}

let cycleDurationHours = Int(ceil(totalCycleDuration / 3600))

print("   Total cycle duration: \(Int(totalCycleDuration / 3600)) hours (\(Int(totalCycleDuration / 60)) minutes)")
print("   Average movie slot: \(Int(totalCycleDuration / TimeInterval(mediaItemsWithRuntimes.count) / 60)) minutes")

let config = EventsConfig(
    movies: mediaItemsWithRuntimes,
    cycle_duration_hours: cycleDurationHours,
    buffer_between_movies_seconds: 600,
    epoch_timestamp: 1704067200,
    generated_at: ISO8601DateFormatter().string(from: Date())
)

// Step 7: Upload to Supabase
print("\n☁️  Step 7: Uploading to Supabase...")

// First, delete any existing config for this type (we'll replace it)
print("   🗑️  Deleting old config...")
let deleteURL = URL(string: "\(supabaseURL)/rest/v1/events_config?config_type=eq.movie_events")!
var deleteRequest = URLRequest(url: deleteURL)
deleteRequest.httpMethod = "DELETE"
deleteRequest.setValue(supabaseAnonKey, forHTTPHeaderField: "apikey")
deleteRequest.setValue("Bearer \(supabaseAnonKey)", forHTTPHeaderField: "Authorization")

do {
    let (_, deleteResponse) = try await URLSession.shared.data(for: deleteRequest)
    if let httpResponse = deleteResponse as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
        print("   ✅ Deleted old config")
    }
} catch {
    print("   ⚠️  Delete failed (might not exist): \(error)")
}

// Now insert the new config
struct InsertPayload: Codable {
    let config_type: String
    let version: Int
    let data: EventsConfig
    let is_active: Bool
}

let insertPayload = InsertPayload(
    config_type: "movie_events",
    version: configVersion,
    data: config,
    is_active: true
)

let uploadURL = URL(string: "\(supabaseURL)/rest/v1/events_config")!
var request = URLRequest(url: uploadURL)
request.httpMethod = "POST"
request.setValue(supabaseAnonKey, forHTTPHeaderField: "apikey")
request.setValue("Bearer \(supabaseAnonKey)", forHTTPHeaderField: "Authorization")
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.setValue("return=representation", forHTTPHeaderField: "Prefer")

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
request.httpBody = try encoder.encode(insertPayload)

do {
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse else {
        print("❌ Invalid response")
        exit(1)
    }
    
    if (200...299).contains(httpResponse.statusCode) {
        print("✅ Successfully updated config version \(configVersion)")
        print("   Movies: \(mediaItemsWithRuntimes.count)")
        print("   Cycle duration: \(cycleDurationHours) hours (calculated from exact runtimes)")
        
        // Print first 10 movies with runtimes
        print("\n📽️  First 10 movies:")
        for (index, movie) in mediaItemsWithRuntimes.prefix(10).enumerated() {
            print("   \(index + 1). \(movie.name) - \(movie.runtime ?? "N/A") (\(movie.imdbRating ?? "N/A"))")
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
