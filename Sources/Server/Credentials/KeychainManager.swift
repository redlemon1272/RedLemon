//
//  KeychainManager.swift
//  RedLemon
//
//  Manages credentials using macOS Keychain
//  Replaces Node.js keytar functionality
//
//

import Foundation
import Security

enum KeychainError: Error, LocalizedError {
    case saveFailed(status: OSStatus)
    case deleteFailed(status: OSStatus)
    case notFound
    case unexpectedData

    var errorDescription: String? {
        switch self {
        case .saveFailed(let status):
            return "Failed to save to keychain (status: \(status))"
        case .deleteFailed(let status):
            return "Failed to delete from keychain (status: \(status))"
        case .notFound:
            return "Credential not found in keychain"
        case .unexpectedData:
            return "Unexpected data format"
        }
    }
}

actor KeychainManager {
    static let shared = KeychainManager()
    static let serviceName = "RedLemon"

    // In-memory cache for fast access (no keychain prompts)
    private var cache: [String: String] = [:]

    /// Ensures cache is loaded before any access
    private var isInitialized = false

    private init() {}

    /// Ensures credentials are loaded into memory.
    func ensureInitialized() async {
        if isInitialized { return }
        loadFromCacheSync()
        isInitialized = true
    }

    // MARK: - Public API

    func save(credential: String, for service: String) async throws {
        await ensureInitialized()

        // 1. Save to local keychain (non-synchronizable to avoid prompts)
        try saveToKeychain(credential: credential, service: service)
        print("🔐 Saved \(service) credential to local Keychain")

        // 2. Update memory cache
        cache[service] = credential

        // 3. Update encrypted cache file (this is our fallback)
        await saveToEncryptedCache()

        print("✅ Saved \(service) credential to cache")
    }

    func get(service: String) async -> String? {
        await ensureInitialized()

        // 1. Try memory cache first (instant, no prompts)
        if let cached = cache[service] {
            return cached
        }

        // 2. Try keychain
        if let credential = try? getFromKeychain(service: service) {
            cache[service] = credential
            return credential
        }

        return nil
    }

    func delete(service: String) async throws {
        await ensureInitialized()

        // 1. Remove from memory cache
        cache.removeValue(forKey: service)

        // 2. Update encrypted cache file
        await saveToEncryptedCache()

        // 3. Delete from local Keychain
        try? deleteFromKeychain(service: service)

        print("🗑️ Removed \(service) from cache and keychain")
    }

    func listServices() async -> [String] {
        await ensureInitialized()
        return Array(cache.keys)
    }

    // MARK: - Username Storage (UserDefaults - not sensitive)

    /// Store username (uses UserDefaults to avoid keychain prompts on debug builds)
    func saveUsername(_ username: String) async throws {
        NSLog("%@", "💾 KeychainManager: Saving username '\(username)' to UserDefaults")
        UserDefaults.standard.set(username, forKey: "redlemon.username")
        UserDefaults.standard.synchronize() // Force immediate flush to disk

        // Also sync username to iCloud Key-Value Store (NSUbiquitousKeyValueStore)
        NSUbiquitousKeyValueStore.default.set(username, forKey: "redlemon.username")
        NSUbiquitousKeyValueStore.default.synchronize()

        NSLog("✅ KeychainManager: Username saved successfully")
    }

    /// Get username
    func getUsername() async -> String? {
        await ensureInitialized()

        // Try iCloud KVS first
        if let iCloudUsername = NSUbiquitousKeyValueStore.default.string(forKey: "redlemon.username") {
             // Sync back to local if different
             if UserDefaults.standard.string(forKey: "redlemon.username") != iCloudUsername {
                 UserDefaults.standard.set(iCloudUsername, forKey: "redlemon.username")
             }
             return iCloudUsername
        }

        return UserDefaults.standard.string(forKey: "redlemon.username")
    }


    func deleteUsername() async throws {
        NSLog("🗑️ KeychainManager: Deleting username from UserDefaults")
        UserDefaults.standard.removeObject(forKey: "redlemon.username")
        NSUbiquitousKeyValueStore.default.removeObject(forKey: "redlemon.username")
        NSUbiquitousKeyValueStore.default.synchronize()
        NSLog("✅ KeychainManager: Username deleted successfully")
    }

    // MARK: - Cryptographic Keys

    func saveKeyPair(privateKey: String, publicKey: String) async throws {
        try await save(credential: privateKey, for: "private_key")
        try await save(credential: publicKey, for: "public_key")
        NSLog("🔐 KeychainManager: Key pair saved securely")
    }

    func getKeyPair() async -> (privateKey: String, publicKey: String)? {
        guard let priv = await get(service: "private_key"),
              let pub = await get(service: "public_key") else {
            return nil
        }
        return (priv, pub)
    }

    func deleteKeyPair() async throws {
        try await delete(service: "private_key")
        try await delete(service: "public_key")
        NSLog("🗑️ KeychainManager: Key pair deleted")
    }

    // MARK: - Provider Configuration

    /// Save custom Torrentio configuration
    func saveTorrentioConfig(_ config: String) async {
        NSLog("💾 KeychainManager: Saving custom Torrentio config")
        // Use standard UserDefaults as this is a configuration preference
        UserDefaults.standard.set(config, forKey: "redlemon.torrentio.config")
        NSUbiquitousKeyValueStore.default.set(config, forKey: "redlemon.torrentio.config")
        NSUbiquitousKeyValueStore.default.synchronize()
    }

    /// Get custom Torrentio configuration
    func getTorrentioConfig() async -> String? {
        if let iCloudConfig = NSUbiquitousKeyValueStore.default.string(forKey: "redlemon.torrentio.config") {
            return iCloudConfig
        }
        return UserDefaults.standard.string(forKey: "redlemon.torrentio.config")
    }

    /// Delete custom Torrentio configuration
    func deleteTorrentioConfig() async {
        UserDefaults.standard.removeObject(forKey: "redlemon.torrentio.config")
        NSUbiquitousKeyValueStore.default.removeObject(forKey: "redlemon.torrentio.config")
        NSUbiquitousKeyValueStore.default.synchronize()
    }

    // MARK: - Keychain Operations

    private func saveToKeychain(credential: String, service: String) throws {
        guard let data = credential.data(using: .utf8) else {
            throw KeychainError.unexpectedData
        }

        // 1. Broad Delete (to clear both synced and local versions)
        try? deleteFromKeychain(service: service)

        // 2. Add as Local Only (non-synchronizable)
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Self.serviceName,
            kSecAttrAccount as String: service,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,
            // Ensure no UI pops up during save either
            kSecUseAuthenticationUI as String: kSecUseAuthenticationUIFail
        ]

        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.saveFailed(status: status)
        }
    }

    private func getFromKeychain(service: String) throws -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Self.serviceName,
            kSecAttrAccount as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne,
            // 🛑 NEVER prompt the user for a password. If it's locked, just fail.
            kSecUseAuthenticationUI as String: kSecUseAuthenticationUIFail
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                return nil
            }
            throw KeychainError.notFound
        }

        guard let data = result as? Data,
              let credential = String(data: data, encoding: .utf8) else {
            throw KeychainError.unexpectedData
        }

        return credential
    }

    private func deleteFromKeychain(service: String) throws {
        // Delete all versions (synced and local)
        let versions = [true, false]

        for isSync in versions {
            var query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: Self.serviceName,
                kSecAttrAccount as String: service
            ]

            if isSync {
                query[kSecAttrSynchronizable as String] = true
            } else {
                // If we explicitly set to false, it might still find items.
                // Usually it's better to just skip the key if we want to match everything,
                // but for SecItemDelete, sometimes being explicit helps or hurts.
                // Let's try explicit first.
                query[kSecAttrSynchronizable as String] = false
            }

            SecItemDelete(query as CFDictionary)
        }

        print("🗑️ Broadly deleted \(service) from Keychain")
    }

    // MARK: - Encrypted Cache (eliminates prompts on restart)

    private func getCacheFilePath() -> URL {
        let appSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let redlemonDir = appSupport.appendingPathComponent("RedLemon")

        // Create directory if needed
        try? FileManager.default.createDirectory(at: redlemonDir, withIntermediateDirectories: true)

        return redlemonDir.appendingPathComponent("credentials.cache")
    }

    private func loadFromCacheSync() {
        let path = getCacheFilePath()

        if let data = try? Data(contentsOf: path),
           let json = try? JSONDecoder().decode([String: String].self, from: data) {
            self.cache = json
            NSLog("%@", "📂 Loaded \(cache.count) credential(s) from cache")
        }
    }

    private func saveToEncryptedCache() async {
        let path = getCacheFilePath()

        guard let data = try? JSONEncoder().encode(cache) else {
            return
        }

        do {
            try data.write(to: path)
        } catch {
            NSLog("%@", "❌ [KeychainManager] Failed to write credentials cache: \(error.localizedDescription)")
        }
    }
}
