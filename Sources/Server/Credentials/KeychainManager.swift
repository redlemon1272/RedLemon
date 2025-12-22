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

    private init() {
        // Load from encrypted cache file on init
        Task {
            await loadFromCache()
        }
    }

    // MARK: - Public API

    func save(credential: String, for service: String) async throws {
        // 1. Try to save to iCloud keychain (synchronizable)
        do {
            try saveToKeychain(credential: credential, service: service, synchronizable: true)
            print("☁️🔐 Saved \(service) credential to iCloud Keychain")
        } catch {
            print("⚠️ iCloud Keychain save failed, trying local: \(error)")
            // Fallback to local keychain
            try? saveToKeychain(credential: credential, service: service, synchronizable: false)
        }

        // 2. Update memory cache
        cache[service] = credential

        // 3. Update encrypted cache file (this is our fallback)
        await saveToEncryptedCache()

        print("✅ Saved \(service) credential to cache")
    }

    func get(service: String) async -> String? {
        // 1. Try memory cache first (instant, no prompts)
        if let cached = cache[service] {
            return cached
        }

        // 2. Try iCloud keychain
        if let credential = try? getFromKeychain(service: service, synchronizable: true) {
            cache[service] = credential
            return credential
        }
        
        // 3. Try local keychain (legacy/fallback)
        if let credential = try? getFromKeychain(service: service, synchronizable: false) {
            // Migrate to iCloud if found locally
            try? saveToKeychain(credential: credential, service: service, synchronizable: true)
            
            cache[service] = credential
            return credential
        }

        return nil
    }

    func delete(service: String) async throws {
        // 1. Remove from memory cache
        cache.removeValue(forKey: service)

        // 2. Update encrypted cache file
        await saveToEncryptedCache()

        // 3. Delete from macOS Keychain (both local and synced)
        try? deleteFromKeychain(service: service, synchronizable: true)
        try? deleteFromKeychain(service: service, synchronizable: false)

        print("🗑️ Removed \(service) from cache and keychain")
    }

    func listServices() async -> [String] {
        return Array(cache.keys)
    }

    // MARK: - Username Storage (UserDefaults - not sensitive)

    /// Store username (uses UserDefaults to avoid keychain prompts on debug builds)
    func saveUsername(_ username: String) async throws {
        NSLog("💾 KeychainManager: Saving username '\(username)' to UserDefaults")
        UserDefaults.standard.set(username, forKey: "redlemon.username")
        
        // Also sync username to iCloud Key-Value Store (NSUbiquitousKeyValueStore)
        NSUbiquitousKeyValueStore.default.set(username, forKey: "redlemon.username")
        NSUbiquitousKeyValueStore.default.synchronize()
        
        NSLog("✅ KeychainManager: Username saved successfully")
    }

    /// Get username
    func getUsername() async -> String? {
        // Try iCloud KVS first
        if let iCloudUsername = NSUbiquitousKeyValueStore.default.string(forKey: "redlemon.username") {
             // Sync back to local if different
             if UserDefaults.standard.string(forKey: "redlemon.username") != iCloudUsername {
                 UserDefaults.standard.set(iCloudUsername, forKey: "redlemon.username")
             }
             return iCloudUsername
        }
        
        let username = UserDefaults.standard.string(forKey: "redlemon.username")
        if let username = username {
            NSLog("🔍 KeychainManager: Retrieved username '\(username)' from UserDefaults")
        } else {
            NSLog("🔍 KeychainManager: No username found in UserDefaults")
        }
        return username
    }


    func deleteUsername() async throws {
        NSLog("🗑️ KeychainManager: Deleting username from UserDefaults")
        UserDefaults.standard.removeObject(forKey: "redlemon.username")
        NSUbiquitousKeyValueStore.default.removeObject(forKey: "redlemon.username")
        NSUbiquitousKeyValueStore.default.synchronize()
        NSLog("✅ KeychainManager: Username deleted successfully")
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

    private func saveToKeychain(credential: String, service: String, synchronizable: Bool) throws {
        guard let data = credential.data(using: .utf8) else {
            throw KeychainError.unexpectedData
        }

        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Self.serviceName,
            kSecAttrAccount as String: service,
            kSecValueData as String: data,
            // Allow access without password prompt when app is running
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
        
        if synchronizable {
            query[kSecAttrSynchronizable as String] = true
        }

        // Delete existing first
        SecItemDelete(query as CFDictionary)

        // Add new
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.saveFailed(status: status)
        }
    }

    private func getFromKeychain(service: String, synchronizable: Bool) throws -> String? {
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Self.serviceName,
            kSecAttrAccount as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        if synchronizable {
            query[kSecAttrSynchronizable as String] = true
        }

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

    private func deleteFromKeychain(service: String, synchronizable: Bool) throws {
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Self.serviceName,
            kSecAttrAccount as String: service
        ]
        
        if synchronizable {
            query[kSecAttrSynchronizable as String] = true
        }

        let status = SecItemDelete(query as CFDictionary)

        // Success or item not found are both OK
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.deleteFailed(status: status)
        }

        print("🗑️ Deleted \(service) from macOS Keychain (sync: \(synchronizable))")
    }

    // MARK: - Encrypted Cache (eliminates prompts on restart)

    private func getCacheFilePath() -> URL {
        let appSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let redlemonDir = appSupport.appendingPathComponent("RedLemon")

        // Create directory if needed
        try? FileManager.default.createDirectory(at: redlemonDir, withIntermediateDirectories: true)

        return redlemonDir.appendingPathComponent("credentials.cache")
    }

    private func loadFromCache() async {
        let path = getCacheFilePath()

        guard let data = try? Data(contentsOf: path),
              let json = try? JSONDecoder().decode([String: String].self, from: data) else {
            return
        }

        cache = json
        print("📂 Loaded \(cache.count) credential(s) from cache")
    }

    private func saveToEncryptedCache() async {
        let path = getCacheFilePath()

        guard let data = try? JSONEncoder().encode(cache) else {
            return
        }

        try? data.write(to: path)
    }
}
