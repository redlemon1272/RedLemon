import SwiftUI
import Foundation

// MARK: - Testing Support

/// User profiles for testing multiple instances
enum UserProfile: String, CaseIterable {
    case host = "host"
    case guest = "guest"
    case debug = "debug"

    var displayName: String {
        switch self {
        case .host: return "TestHost"
        case .guest: return "TestGuest"
        case .debug: return "DebugUser"
        }
    }

    var userId: UUID {
        switch self {
        case .host: return UUID(uuidString: "11111111-1111-1111-1111-111111111111")!
        case .guest: return UUID(uuidString: "22222222-2222-2222-2222-222222222222")!
        case .debug: return UUID(uuidString: "33333333-3333-3333-3333-333333333333")!
        }
    }
}

// MARK: - Main App

@main
struct RedLemonApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var updateManager = UpdateManager.shared
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // Testing support for multiple instances
    private let userProfile: UserProfile

    init() {
        // Parse command line arguments for testing profiles
        let arguments = CommandLine.arguments
        if let profileIndex = arguments.firstIndex(of: "-user-profile"),
           profileIndex + 1 < arguments.count,
           let profile = UserProfile(rawValue: arguments[profileIndex + 1]) {
            self.userProfile = profile
            print("🧪 Running with user profile: \(profile.rawValue)")
        } else {
            // Default to debug profile for normal usage
            self.userProfile = .debug
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .environmentObject(updateManager)
                .task {
                    // Check if username setup should be forced (after user reset)
                    await checkForcedUsernameSetup()

                    // Reset state to prevent automatic playback of last watched content
                    await resetPlaybackState()

                    // ICP proxy removed - no longer needed (using Supabase backend)
                    await loadStoredUser()  // Load username from keychain on startup
                    await startServer()
                    await performStartupChecks()
                    await checkForUpdates()
                }
                .onOpenURL { url in
                    handleURL(url)
                }
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandGroup(replacing: .newItem) { }
        }
    }

    func handleURL(_ url: URL) {
        NSLog("🔗 Received URL: \(url.absoluteString)")

        // Handle redlemon://auth/callback?principal=xxx
        if url.scheme == "redlemon" && url.host == "auth" && url.path == "/callback" {
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
               let principal = components.queryItems?.first(where: { $0.name == "principal" })?.value {
                NSLog("✅ Received principal from II: \(principal)")

                // No-op: currentPrincipal is now managed by Internet Identity only
                // Principal is set via setInternetIdentityPrincipal() from InternetIdentityView
            }
        }
    }

    // ICP proxy removed - no longer needed (using Supabase backend)
    // Kept as comment for reference:
    // - Previously started Python proxy on port 3847
    // - Provided HTTP ↔ Candid translation for IC canister
    // - Replaced by direct Supabase PostgreSQL integration

    func loadStoredUser() async {
        NSLog("🔐 APP STARTUP: Loading stored user credentials...")
        NSLog("🧪 Testing Profile: \(userProfile.rawValue)")

        // For testing profiles, override normal user loading
        if userProfile != .debug {
            NSLog("🧪 Using test profile: \(userProfile.displayName)")
            await MainActor.run {
                appState.currentUsername = userProfile.displayName
                appState.currentUserId = userProfile.userId
            }
            NSLog("✅ TEST PROFILE: Set username=\(userProfile.displayName), userId=\(userProfile.userId)")
            return
        }

        // First try to get username from Keychain/UserDefaults
        if let username = await KeychainManager.shared.getUsername() {
            NSLog("✅ Keychain: Found stored username: \(username)")

            // Verify user exists in database
            do {
                NSLog("🔍 Supabase: Looking up user '\(username)' in database...")
                if let user = try await SupabaseClient.shared.getUserByUsername(username: username) {
                    await MainActor.run {
                        appState.currentUsername = username
                        appState.currentUserId = user.id
                    }
                    NSLog("✅ AUTH SUCCESS: User authenticated - \(username) (ID: \(user.id))")
                    NSLog("🎯 AppState: currentUsername=\(username), currentUserId=\(user.id)")
                } else {
                    NSLog("⚠️  DB LOOKUP FAILED: Username '\(username)' not found in database")
                    NSLog("   Clearing stored credentials so user can create a new one")
                    // Username exists locally but not in database - clear it so user can create a new one
                    try? await KeychainManager.shared.deleteUsername()
                }
            } catch {
                NSLog("❌ DB ERROR: Failed to verify user in database: \(error)")
                NSLog("   Error details: \(String(describing: error))")
                // Clear invalid username
                try? await KeychainManager.shared.deleteUsername()
                NSLog("   Cleared stored credentials - user will need to create new username")
            }
        } else {
            NSLog("ℹ️  KEYCHAIN: No stored username found")

            // FALLBACK: Check if we have a UUID in UserDefaults (manual override for debugging)
            if let uuidString = UserDefaults.standard.string(forKey: "currentUserId"),
               let uuid = UUID(uuidString: uuidString) {
                NSLog("🔄 FALLBACK: Found UUID in UserDefaults: \(uuid)")
                NSLog("   This allows debugging without Keychain username")
                await MainActor.run {
                    appState.currentUserId = uuid
                    appState.currentUsername = "debug_user"
                }
                NSLog("✅ FALLBACK SUCCESS: Set currentUserId=\(uuid), currentUsername=debug_user")
            } else {
                NSLog("❌ NO FALLBACK: No UUID found in UserDefaults either")
                NSLog("   User will need to create a new username")
            }
        }

        NSLog("🏁 AUTH COMPLETE: Final state - username=\(appState.currentUsername), userId=\(appState.currentUserId?.uuidString ?? "nil")")
    }

    func startServer() async {
        NSLog("🚀 RedLemon: Starting HTTP server...")
        NSLog("📋 RedLemon: Current directory: %@", FileManager.default.currentDirectoryPath)

        do {
            let server = try HTTPServer()
            NSLog("✅ RedLemon: HTTPServer instance created")

            // Start server in a background task that keeps running
            Task.detached(priority: .background) {
                do {
                    NSLog("📡 RedLemon: Server starting on port \(Config.serverPort)...")
                    try await server.start()
                    NSLog("🎉 RedLemon: Server successfully started on port \(Config.serverPort)!")
                } catch {
                    NSLog("❌ RedLemon: Server error: %@", error.localizedDescription)
                }
            }

            // Give server time to start
            try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds

            // Mark server as ready
            await MainActor.run {
                appState.isServerReady = true
                NSLog("✅ RedLemon: Server marked as ready")
            }

            NSLog("✅ RedLemon: Server should be running on \(Config.serverURL)")
        } catch {
            NSLog("❌ RedLemon: Failed to initialize server: %@", error.localizedDescription)
        }
    }

    func performStartupChecks() async {
        NSLog("🔍 Performing startup checks...")
        NSLog("✅ Username-based authentication ready")
    }

    func checkForUpdates() async {
        NSLog("🔄 Checking for app updates...")
        updateManager.checkForUpdates()
    }

    /// Reset playback state to prevent automatic selection of last played content
    func resetPlaybackState() async {
        NSLog("🔄 Resetting playback state to prevent auto-selection...")
        await MainActor.run {
            // Reset all playback-related state to ensure clean startup
            appState.currentView = .browse
            appState.selectedMediaItem = nil
            appState.selectedMetadata = nil
            appState.selectedStream = nil
            appState.showPlayer = false
            appState.showMediaDetail = false
            appState.showQualitySelection = false
            appState.isResolvingStream = false
            appState.streamError = nil
            appState.resumeFromTimestamp = nil
            appState.currentRoomId = nil
            appState.currentWatchPartyRoom = nil
            appState.selectedSeason = nil
            appState.selectedEpisode = nil
            appState.isWatchPartyHost = false
            appState.currentWatchMode = .solo
            appState.isLoadingRoom = false
        }
        NSLog("✅ Playback state reset complete - starting in browse view")
    }

    /// Check if username setup should be forced after user reset
    func checkForcedUsernameSetup() async {
        let shouldForce = await UserResetManager.shared.shouldForceUsernameSetup()
        if shouldForce {
            NSLog("🔄 Forced username setup detected, showing setup dialog")
            await MainActor.run {
                appState.showUsernameSetup = true
            }
            await UserResetManager.shared.clearForceUsernameSetupFlag()
        }
    }
}
