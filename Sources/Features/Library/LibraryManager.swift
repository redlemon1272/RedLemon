import Foundation
import Combine

struct LibraryItem: Codable, Identifiable, Hashable {
    let id: String // IMDB ID
    let type: String // "movie" or "series"
    let name: String
    let posterURL: String?
    let dateAdded: Date

    // Additional metadata that might be useful for offline/display without fetching
    let year: String?
}

class LibraryManager: ObservableObject {
    static let shared = LibraryManager()

    @Published var libraryItems: [LibraryItem] = []

    private let storageKey = "library_items"

    private init() {
        loadLibrary()
    }

    // MARK: - Persistence

    private func loadLibrary() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([LibraryItem].self, from: data) {
            self.libraryItems = decoded
        }
    }

    private func saveLibrary() {
        if let encoded = try? JSONEncoder().encode(libraryItems) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    // MARK: - Public API

    func addToLibrary(item: MediaItem, posterURL: String?, year: String?) {
        // Prevent duplicates
        guard !contains(item.id) else { return }

        let newItem = LibraryItem(
            id: item.id,
            type: item.type,
            name: item.name,
            posterURL: posterURL,
            dateAdded: Date(),
            year: year
        )

        // Add to beginning of list (newest first)
        libraryItems.insert(newItem, at: 0)
        saveLibrary()

        // Log consistency
        LoggingManager.shared.debug(.general, message: "Added to Library: \(item.name) (\(item.id))")
    }

    func removeFromLibrary(id: String) {
        if let index = libraryItems.firstIndex(where: { $0.id == id }) {
            let item = libraryItems[index]
            libraryItems.remove(at: index)
            saveLibrary()
            LoggingManager.shared.debug(.general, message: "Removed from Library: \(item.name) (\(item.id))")
        }
    }

    func contains(_ id: String) -> Bool {
        return libraryItems.contains(where: { $0.id == id })
    }

    // MARK: - Filtering

    func getMovies() -> [LibraryItem] {
        return libraryItems.filter { $0.type == "movie" }
    }

    func getShows() -> [LibraryItem] {
        return libraryItems.filter { $0.type == "series" }
    }

    // MARK: - Backup Support

    // Update local state from a backup import
    func restoreFromBackup(items: [LibraryItem]) {
        self.libraryItems = items
        saveLibrary()
        LoggingManager.shared.debug(.general, message: "Restored \(items.count) library items from backup")
    }
}
