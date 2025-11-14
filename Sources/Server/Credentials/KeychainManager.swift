//
//  KeychainManager.swift
//  RedLemon
//
//  Manages credentials using macOS Keychain
//  Replaces Node.js keytar functionality
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
        // 1. Try to save to keychain (but don't fail if it doesn't work)
        do {
            try saveToKeychain(credential: credential, service: service)
            print("🔐 Saved \(service) credential to Keychain")
        } catch {
            print("⚠️ Keychain save failed, using cache-only mode: \(error)")
            // Continue anyway - we'll use cache-only mode
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

        // 2. Try keychain
        if let credential = try? getFromKeychain(service: service) {
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

        // 3. Delete from macOS Keychain
        try deleteFromKeychain(service: service)

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
        NSLog("✅ KeychainManager: Username saved successfully")
    }

    /// Get username
    func getUsername() async -> String? {
        let username = UserDefaults.standard.string(forKey: "redlemon.username")
        if let username = username {
            NSLog("🔍 KeychainManager: Retrieved username '\(username)' from UserDefaults")
        } else {
            NSLog("🔍 KeychainManager: No username found in UserDefaults")
        }
        return username
    }

    /// Delete username
    func deleteUsername() async throws {
        NSLog("🗑️ KeychainManager: Deleting username from UserDefaults")
        UserDefaults.standard.removeObject(forKey: "redlemon.username")
        NSLog("✅ KeychainManager: Username deleted successfully")
    }

    // MARK: - Keychain Operations

    private func saveToKeychain(credential: String, service: String) throws {
        guard let data = credential.data(using: .utf8) else {
            throw KeychainError.unexpectedData
        }

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Self.serviceName,
            kSecAttrAccount as String: service,
            kSecValueData as String: data,
            // Allow access without password prompt when app is running
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]

        // Delete existing first
        SecItemDelete(query as CFDictionary)

        // Add new
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
            kSecMatchLimit as String: kSecMatchLimitOne
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
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: Self.serviceName,
            kSecAttrAccount as String: service
        ]

        let status = SecItemDelete(query as CFDictionary)

        // Success or item not found are both OK
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.deleteFailed(status: status)
        }

        print("🗑️ Deleted \(service) from macOS Keychain")
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
