import Foundation

// MARK: - Models

struct StremioMetaResponse: Codable {
    let metas: [StremioMeta]
}

struct StremioMeta: Codable {
    let id: String
    let name: String
    let type: String
    let poster: String?
    let background: String?
    let logo: String?
    let releaseInfo: String?
    let imdbRating: String?
    let genre: [String]?
    let runtime: String?
}

// MARK: - Seeded Generator

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

// MARK: - Main Logic

func fetchTopMoviesForEvents() async {
    let addonBaseURL = "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky"

    let catalogs = [
        "nfx", // Netflix
        "dnp", // Disney+
        "hlu", // Hulu
        "amp"  // Prime Video
    ]

    var allMetas: [StremioMeta] = []

    print("🚀 Fetching from \(catalogs.count) streaming catalogs...")

    for catalog in catalogs {
        do {
            let catalogURL = URL(string: "\(addonBaseURL)/catalog/movie/\(catalog).json")!
            let (data, _) = try await URLSession.shared.data(from: catalogURL)
            let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)
            allMetas.append(contentsOf: response.metas)
            print("   ✅ Fetched \(response.metas.count) items from \(catalog)")
        } catch {
            print("   ⚠️ Failed to fetch \(catalog): \(error)")
        }
    }

    // Deduplicate by ID
    var seenIds = Set<String>()
    let uniqueMetas = allMetas.filter { meta in
        if seenIds.contains(meta.id) {
            return false
        }
        seenIds.insert(meta.id)
        return true
    }

    // DETERMINISTIC SHUFFLE WITH FIXED SEED
    let sortedMetas = uniqueMetas.sorted { $0.id < $1.id }

    // Calculate cycle
    let epoch = Date(timeIntervalSince1970: 1704067200) // 2024-01-01 00:00:00 UTC
    let timeSinceEpoch = Date().timeIntervalSince(epoch)
    let conservativeMovieDuration: TimeInterval = 9000  // 2.5 hours
    let cycleDuration = conservativeMovieDuration * 80  // ~200 hours
    let cycleNumber = Int(timeSinceEpoch / cycleDuration)

    let baseSeed = 20250126
    let seed = baseSeed + cycleNumber

    print("🎲 Shuffling with cycle-based seed: \(seed) (Cycle #\(cycleNumber))")

    var generator = SeededGenerator(seed: seed)
    let shuffledMetas = sortedMetas.shuffled(using: &generator)

    // Filter
    let validMetas = shuffledMetas.filter { meta in
        guard let logo = meta.logo, !logo.isEmpty,
              let _ = meta.background else {
            return false
        }

        let blacklistedTitles = [
            "Selena y Los Dinos: A Family's Legacy",
            "Star Trek Beyond",
            "Star Trek Into Darkness",
            "Star Trek",
            "In Waves and War",
            "God Bless America",
            "Tracing the Divide",
            "The Teacher",
            "Sunshine",
            "Lilith Fair: Building a Mystery",
            "Three Billboards Outside Ebbing, Missouri",
            "Star Wars",
            "The White House Effect",
            "Animal Kingdom",
            "The Ugly Stepsister",
            "ONE SHOT with Ed Sheeran"
        ]
        if blacklistedTitles.contains(where: { meta.name.contains($0) }) {
            return false
        }

        if let releaseInfo = meta.releaseInfo {
            let yearStr = String(releaseInfo.prefix(4))
            if let year = Int(yearStr), year < 1990 {
                return false
            }
        }

        if let ratingStr = meta.imdbRating,
           let rating = Double(ratingStr),
           rating >= 7.0 {

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
        return false
    }

    print("📊 Filtered to \(validMetas.count) valid movies")

    let selectedMetas = Array(validMetas.prefix(80))

    print("\n🎬 MOVIE LIST FOR CURRENT CYCLE (#\(cycleNumber)):")
    print("==========================================")
    for (index, meta) in selectedMetas.enumerated() {
        print("\(index + 1). \(meta.name) (\(meta.releaseInfo ?? "N/A")) - \(meta.imdbRating ?? "N/A") ⭐️")
    }
    print("==========================================")
}

// Run the task
let semaphore = DispatchSemaphore(value: 0)
Task {
    await fetchTopMoviesForEvents()
    semaphore.signal()
}
semaphore.wait()
