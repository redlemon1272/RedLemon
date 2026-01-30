import Foundation
import Combine

public struct LibraryItem: Codable, Identifiable, Hashable {
    public let id: String // IMDB ID
    public let type: String // "movie" or "series"
    public let name: String
    public let posterURL: String?
    public let dateAdded: Date

    // Additional metadata that might be useful for offline/display without fetching
    public let year: String?
}

class LibraryManager: ObservableObject {
    static let shared = LibraryManager()

    @Published var libraryItems: [LibraryItem] = []

    private let storageKey = "library_items"

    private init() {
        loadLibrary()
        
        // Sync with server on startup
        Task { [weak self] in
            await self?.syncWithServer()
        }
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

        // Sync to Server
        Task {
            await SupabaseClient.shared.syncLibraryItem(newItem, mediaItem: item)
        }

        // Log consistency
        LoggingManager.shared.debug(.general, message: "Added to Library: \(item.name) (\(item.id))")
    }

    func removeFromLibrary(id: String) {
        if let index = libraryItems.firstIndex(where: { $0.id == id }) {
            let item = libraryItems[index]
            libraryItems.remove(at: index)
            saveLibrary()
            
            // Sync delete
            Task {
                await SupabaseClient.shared.deleteLibraryItem(id: id)
            }
            
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
    
    // MARK: - Cloud Sync
    
    func syncWithServer() async {
        do {
            let remoteItems = try await SupabaseClient.shared.fetchRemoteLibrary()
            
            await MainActor.run {
                var changes = false
                
                // 1. Merge Remote -> Local
                for remote in remoteItems {
                    if !self.contains(remote.id) {
                        self.libraryItems.append(remote)
                        changes = true
                    }
                }
                
                // 2. Identify Local items missing from Remote (Legacy items)
                // We create a set of remote IDs for fast lookup
                let remoteIds = Set(remoteItems.map { $0.id })
                let localOnly = self.libraryItems.filter { !remoteIds.contains($0.id) }
                
                if !localOnly.isEmpty {
                     LoggingManager.shared.debug(.general, message: "Sync: Found \(localOnly.count) local items to push to server")
                }
                
                if changes {
                    self.libraryItems.sort(by: { $0.dateAdded > $1.dateAdded })
                    self.saveLibrary()
                    LoggingManager.shared.debug(.general, message: "Sync: Merged \(remoteItems.count) items from server")
                }
                
                // 3. Push Local -> Remote (Parallel)
                // Do this *after* updating UI to be snappy
                Task {
                    await withTaskGroup(of: Void.self) { group in
                        for item in localOnly {
                            group.addTask {
                                // Construct minimal metadata from LibraryItem
                                let stubMedia = MediaItem(
                                    id: item.id,
                                    type: item.type,
                                    name: item.name,
                                    poster: item.posterURL,
                                    background: nil, logo: nil, description: nil, releaseInfo: nil, year: item.year, imdbRating: nil, genres: nil, runtime: nil
                                )
                                
                                await SupabaseClient.shared.syncLibraryItem(item, mediaItem: stubMedia)
                            }
                        }
                    }
                }
            }
        } catch {
             LoggingManager.shared.warn(.general, message: "Sync: Library fetch failed: \(error)")
        }
    }

    // MARK: - Backup Support

    /// Update local state from a backup import
    func restoreFromBackup(items: [LibraryItem]) async {
        self.libraryItems = items
        saveLibrary()
        LoggingManager.shared.debug(.general, message: "Restored \(items.count) library items from backup")
        
        // Trigger server sync immediately to populate cloud
        await syncWithServer()
    }
}
