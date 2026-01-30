import Foundation
import AppKit
import UniformTypeIdentifiers

struct AccountExportData: Codable {
    let userId: String
    let username: String
    let realDebridToken: String?
    let subdlApiKey: String?
    let playbackHistory: [WatchHistoryItem]?
    let timestamp: Date
    var version: String = "2.0" // Bump version for keys

    // Secure Auth
    let privateKey: String?
    let publicKey: String?

    // Library (v2.1)
    let libraryItems: [LibraryItem]?
}

class AccountExportManager {
    static let shared = AccountExportManager()

    private init() {}

    /// Generate export data for the current user
    func generateExportData() async throws -> AccountExportData {
        guard let userId = await KeychainManager.shared.get(service: "user_id"),
              let username = await KeychainManager.shared.getUsername() else {
            throw NSError(domain: "AccountExport", code: 1, userInfo: [NSLocalizedDescriptionKey: "No active account found"])
        }

        // Fetch API tokens (optional)
        let rdToken = await KeychainManager.shared.get(service: "realdebrid")
        let subdlKey = await KeychainManager.shared.get(service: "subdl")

        // Fetch Keys
        var privKey: String? = nil
        var pubKey: String? = nil
        if let keys = await KeychainManager.shared.getKeyPair() {
            privKey = keys.privateKey
            pubKey = keys.publicKey
        }

        // Fetch Watch History
        var history: [WatchHistoryItem]? = nil
        if let data = UserDefaults.standard.data(forKey: "watchHistory"),
           let decoded = try? JSONDecoder().decode([WatchHistoryItem].self, from: data) {
            history = decoded
        }

        // Fetch Library
        let library = LibraryManager.shared.libraryItems

        return AccountExportData(
            userId: userId,
            username: username,
            realDebridToken: rdToken,
            subdlApiKey: subdlKey,
            playbackHistory: history,
            timestamp: Date(),
            privateKey: privKey,
            publicKey: pubKey,
            libraryItems: library
        )
    }

    /// Generate JSON string for export
    func generateJSON() async throws -> String {
        let data = try await generateExportData()
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let jsonData = try encoder.encode(data)
        return String(data: jsonData, encoding: .utf8) ?? ""
    }

    /// Save export file to disk
    func saveExportFile(to url: URL) async throws {
        // Security check: ensure this is a local file URL
        guard url.isFileURL else {
            throw NSError(domain: "AccountExport", code: 4, userInfo: [NSLocalizedDescriptionKey: "Invalid file location"])
        }
        let json = try await generateJSON()
        try json.write(to: url, atomically: true, encoding: .utf8)
    }

    /// Import account from JSON data
    func importAccount(from jsonString: String) async throws -> AccountExportData {
        guard let data = jsonString.data(using: .utf8) else {
            throw NSError(domain: "AccountImport", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])
        }

        let decoder = JSONDecoder()
        let exportData = try decoder.decode(AccountExportData.self, from: data)

        // Validate
        guard !exportData.userId.isEmpty, !exportData.username.isEmpty else {
            throw NSError(domain: "AccountImport", code: 3, userInfo: [NSLocalizedDescriptionKey: "Invalid account data"])
        }

        // Restore credentials
        try await KeychainManager.shared.save(credential: exportData.userId, for: "user_id")
        try await KeychainManager.shared.saveUsername(exportData.username)

        // Restore Keys
        if let priv = exportData.privateKey, let pub = exportData.publicKey {
            try await KeychainManager.shared.saveKeyPair(privateKey: priv, publicKey: pub)
        } else {
            // 🔄 LACKING KEYS: Generate new ones for legacy backups
            NSLog("🔄 Restoration: Keys missing from backup. Generating new keys for '%@'.", exportData.username)
            let (priv, pub) = CryptoManager.shared.generateKeyPair()
            try await KeychainManager.shared.saveKeyPair(privateKey: priv, publicKey: pub)
        }

        // Restore API Tokens
        if let rdToken = exportData.realDebridToken, !rdToken.isEmpty {
            try await KeychainManager.shared.save(credential: rdToken, for: "realdebrid")
        }

        if let subdlKey = exportData.subdlApiKey, !subdlKey.isEmpty {
            try await KeychainManager.shared.save(credential: subdlKey, for: "subdl")
        }

        // Security Check #88: Proactively set auth context to prevent heartbeat failures
        // We do this BEFORE sync to ensure signed requests use the restored identity
        if let userId = UUID(uuidString: exportData.userId) {
            SupabaseClient.shared.auth.currentUser = AuthUser(
                id: userId,
                username: exportData.username,
                isAdmin: false,  // Will be refreshed on next DB lookup
                isPremium: false
            )
            NSLog("✅ AccountImport: Set auth.currentUser for '%@'", exportData.username)
        }

        // Restore Watch History
        if let history = exportData.playbackHistory, !history.isEmpty {
             if let encoded = try? JSONEncoder().encode(history) {
                UserDefaults.standard.set(encoded, forKey: "watchHistory")
            }
            // Trigger smart sync (Merges backup data with server logic)
            // This is now safe because the auth context has been updated
            await SyncManager.shared.performFullSync()
        }

        if let library = exportData.libraryItems, !library.isEmpty {
            await LibraryManager.shared.restoreFromBackup(items: library)
        }

        return exportData
    }
}
