import Foundation

struct StremioMetaResponse: Codable {
    let metas: [StremioMeta]
}

struct StremioMeta: Codable {
    let name: String
    let popularities: StremioPopularities?
}

struct StremioPopularities: Codable {
    let moviedb: Double?
    let trakt: Double?
}

let url = URL(string: "https://7a82163c306e-stremio-netflix-catalog-addon.baby-beamup.club/bmZ4LGRucCxhbXAsYXRwLGhibSxwbXAscGNwLGhsdSxjcnUsZHBlLHN0eixzc3Q6OjoxNzYzMjQxMzc5ODky/catalog/movie/nfx.json")!

let task = URLSession.shared.dataTask(with: url) { data, _, _ in
    guard let data = data else { return }
    do {
        let response = try JSONDecoder().decode(StremioMetaResponse.self, from: data)
        for meta in response.metas.prefix(20) {
            print("\(meta.name): TMDB=\(meta.popularities?.moviedb ?? 0), Trakt=\(meta.popularities?.trakt ?? 0)")
        }
    } catch {
        print(error)
    }
    exit(0)
}
task.resume()
RunLoop.main.run()
