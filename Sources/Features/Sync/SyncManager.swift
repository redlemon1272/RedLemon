import Foundation
import Combine

@MainActor
class SyncManager: ObservableObject {
    static let shared = SyncManager()

    @Published var isSyncing: Bool = false
    @Published var lastSyncTime: Date?

    private init() {}

    /// Performs a full smart sync of Library and Watch History
    func performFullSync() async {
        isSyncing = true
        LoggingManager.shared.debug(.general, message: "🔄 SyncManager: Starting full cloud sync...")

        // 1. Sync Library
        // LibraryManager already has "Remote adds to Local" logic.
        await LibraryManager.shared.syncWithServer()

        // 2. Sync Watch History
        await syncWatchHistory()

        lastSyncTime = Date()
        isSyncing = false
        LoggingManager.shared.debug(.general, message: "✅ SyncManager: Sync complete.")
    }

    /// Smart Sync for Watch History (Newest Timestamp Wins)
    private func syncWatchHistory() async {
        do {
            // A. Fetch Remote
            let remoteItems = try await SupabaseClient.shared.fetchRemoteWatchHistory()

            // B. Load Local
            var history: [WatchHistoryItem] = []
            if let data = UserDefaults.standard.data(forKey: "watchHistory"),
               let decoded = try? JSONDecoder().decode([WatchHistoryItem].self, from: data) {
                history = decoded
            }

            var localMap = Dictionary(uniqueKeysWithValues: history.map { ($0.id, $0) })
            var changes = false
            var pushQueue: [WatchHistoryItem] = []

            // C. Merge Remote -> Local
            for remote in remoteItems {
                if let local = localMap[remote.id] {
                    // Conflict: Remote wins if newer by >5s
                    // (Use 5s buffer to avoid floating point jitter matches)
                    if remote.lastWatched.timeIntervalSince(local.lastWatched) > 5.0 {
                        localMap[remote.id] = remote
                        changes = true
                        LoggingManager.shared.debug(.watchHistory, message: "Sync: Cloud version of \(remote.mediaItem.name) is newer. Updating local.")
                    } 
                    // Conflict: Local wins if newer by >5s
                    else if local.lastWatched.timeIntervalSince(remote.lastWatched) > 5.0 {
                        pushQueue.append(local)
                    }
                } else {
                    // New from Cloud
                    localMap[remote.id] = remote
                    changes = true
                }
            }

            // D. Identify Local -> Remote (Items missing from Cloud)
            let remoteIds = Set(remoteItems.map { $0.id })
            for local in history {
                if !remoteIds.contains(local.id) {
                    pushQueue.append(local)
                }
            }

            // E. Save Local Changes
            if changes {
                let sorted = localMap.values.sorted { $0.lastWatched > $1.lastWatched }
                if let encoded = try? JSONEncoder().encode(sorted) {
                    UserDefaults.standard.set(encoded, forKey: "watchHistory")
                    
                    // Force AppState refresh (Notification based approach would be cleaner, but we assume Singleton usage for now)
                    // We can't access AppState instance easily here independently. 
                    // Ideally AppState observes UserDefaults or we notify it.
                    NotificationCenter.default.post(name: NSNotification.Name("WatchHistoryDidUpdate"), object: nil)
                }
            }

            // F. Push Local Changes to Cloud
            if !pushQueue.isEmpty {
                LoggingManager.shared.debug(.watchHistory, message: "Sync: Pushing \(pushQueue.count) newer/missing items to cloud in parallel")
                
                await withTaskGroup(of: Void.self) { group in
                    for item in pushQueue {
                        group.addTask {
                            await SupabaseClient.shared.syncWatchHistoryItem(item)
                        }
                    }
                }
            }

        } catch {
            LoggingManager.shared.warn(.watchHistory, message: "SyncManager: History sync failed: \(error)")
        }
    }
}
