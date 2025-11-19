//
//  UserResetManager.swift
//  RedLemon
//
//  Handles complete user data reset for fresh username creation
//

import Foundation

/// Manages complete user data reset for starting fresh with a new username
actor UserResetManager {
    static let shared = UserResetManager()

    private init() {}

    /// Completely resets all user data locally and optionally from remote database
    /// - Parameter deleteRemoteUser: Whether to also delete the user record from Supabase
    func resetAllUserData(deleteRemoteUser: Bool = false) async throws {
        NSLog("🔄 UserResetManager: Starting complete user data reset")

        // Phase 1: Clear local storage
        await clearLocalUserData()

        // Phase 2: Optional remote cleanup
        if deleteRemoteUser {
            try await clearRemoteUserData()
        }

        NSLog("✅ UserResetManager: User data reset completed")
    }

    /// Clears all locally stored user data
    private func clearLocalUserData() async {
        NSLog("🗑️ UserResetManager: Clearing local user data")

        // Clear UserDefaults username
        UserDefaults.standard.removeObject(forKey: "redlemon.username")
        NSLog("   - Removed username from UserDefaults")

        // Clear watch history
        UserDefaults.standard.removeObject(forKey: "watchHistory")
        NSLog("   - Removed watch history from UserDefaults")

        // Clear any other user-related UserDefaults
        let userDefaultsKeys = [
            "redlemon.username",
            "watchHistory",
            "lastSearchQuery",
            "selectedQuality"
        ]

        for key in userDefaultsKeys {
            UserDefaults.standard.removeObject(forKey: key)
        }
        UserDefaults.standard.synchronize()
        NSLog("   - Cleared all user-related UserDefaults")

        // Clear keychain data
        do {
            try await KeychainManager.shared.deleteUsername()
            NSLog("   - Removed username from KeychainManager")
        } catch {
            NSLog("   ⚠️ Failed to clear keychain username: \(error)")
        }

        // Clear any cached credentials
        let services = await KeychainManager.shared.listServices()
        for service in services {
            do {
                try await KeychainManager.shared.delete(service: service)
                NSLog("   - Removed keychain service: \(service)")
            } catch {
                NSLog("   ⚠️ Failed to clear keychain service \(service): \(error)")
            }
        }

        NSLog("✅ UserResetManager: Local user data cleared")
    }

    /// Clears user data from remote Supabase database
    private func clearRemoteUserData() async throws {
        NSLog("🌐 UserResetManager: Clearing remote user data from Supabase")

        // Get current user info before we clear it locally
        guard let username = UserDefaults.standard.string(forKey: "redlemon.username"),
              !username.isEmpty else {
            NSLog("   ⚠️ No username found, skipping remote cleanup")
            return
        }

        NSLog("   - Looking up user record for username: \(username)")

        do {
            // Get user by username
            guard let user = try await SupabaseClient.shared.getUserByUsername(username: username) else {
                NSLog("   ⚠️ User not found in database, skipping remote cleanup")
                return
            }

            NSLog("   - Found user record: \(user.id)")

            // Delete user's room participations
            // Note: This would require additional API endpoints in SupabaseClient
            // For now, we'll focus on local cleanup

            // Delete user's friendships
            // Note: This would require additional API endpoints in SupabaseClient
            // For now, we'll focus on local cleanup

            // Delete user's chat messages
            // Note: This would require additional API endpoints in SupabaseClient
            // For now, we'll focus on local cleanup

            // The actual user deletion would require admin privileges or custom functions
            // For now, we'll just log what would be deleted
            NSLog("   - Remote user deletion requires admin privileges")
            NSLog("   - Skipping actual remote deletion for safety")

        } catch {
            NSLog("   ❌ Failed to clear remote user data: \(error)")
            // Don't throw error here - local cleanup is more important
        }

        NSLog("✅ UserResetManager: Remote user data cleanup attempted")
    }

    /// Forces the app to show username setup on next launch
    func forceUsernameSetup() async {
        NSLog("🔄 UserResetManager: Forcing username setup on next launch")

        // Clear the username flag that prevents setup screen
        UserDefaults.standard.removeObject(forKey: "redlemon.username")

        // Set a flag to force setup
        UserDefaults.standard.set(true, forKey: "forceUsernameSetup")
        UserDefaults.standard.synchronize()

        NSLog("✅ UserResetManager: Username setup will be forced on next launch")
    }

    /// Checks if username setup should be forced
    func shouldForceUsernameSetup() -> Bool {
        let shouldForce = UserDefaults.standard.bool(forKey: "forceUsernameSetup")
        if shouldForce {
            NSLog("🔍 UserResetManager: Username setup flag is set")
        }
        return shouldForce
    }

    /// Clears the force username setup flag
    func clearForceUsernameSetupFlag() {
        UserDefaults.standard.removeObject(forKey: "forceUsernameSetup")
        UserDefaults.standard.synchronize()
        NSLog("🧹 UserResetManager: Cleared force username setup flag")
    }
}
