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
                .environmentObject(SocialService.shared)
                .frame(minWidth: 900, idealWidth: 1000, maxWidth: .infinity, minHeight: 600, idealHeight: 700, maxHeight: .infinity)
                .task {
                    // Wiring up PlayerViewModel callbacks
                    appState.setupPlayerBindings()

                    // 0. Reset state EARLY to prevent automatic playback of last watched content
                    // and ensure UI starts in a clean state before loading user data.
                    await resetPlaybackState()

                    // 1. Check for First Run Onboarding IMMEDIATELY
                    // This ensures the modal appears instantly without waiting for Keychain/DB checks
                    let hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding_v1")
                    if !hasCompletedOnboarding {
                        NSLog("✨ RedLemon: First run detected. Initiating onboarding tour.")
                        await MainActor.run {
                            appState.showOnboarding = true
                        }
                        // Loading user in background just in case, but onboarding takes precedence
                        await loadStoredUser()
                    } else {
                        // 2. Returning User: Load credentials normally
                        await loadStoredUser()

                        // 3. Perform Cloud Sync after identity is confirmed
                        await SyncManager.shared.performFullSync()

                        // 4. Username fallback if loading failed
                        if appState.currentUserId == nil { // OK
                            await MainActor.run {
                                appState.showOnboarding = true
                            }
                        }
                    }

                    // Check if username setup should be forced (after user reset)
                    await checkForcedUsernameSetup()

                    await startServer()
                    appState.checkProviderHealth() // Trigger initial check
                    await performStartupChecks()
                    await checkForUpdates()

                    // Sync clock with server for accurate event timing
                    await TimeService.shared.sync()
                }
                .onOpenURL { url in
                    handleURL(url)
                }
                .preferredColorScheme(.dark) // Enforce Night Mode permanently
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandGroup(replacing: .newItem) { }
        }
    }

    func handleURL(_ url: URL) {
        NSLog("🔗 Received URL: %@", url.absoluteString)

        // Handle redlemon://auth/callback?principal=xxx
        if url.scheme == "redlemon" && url.host == "auth" && url.path == "/callback" {
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
               let principal = components.queryItems?.first(where: { $0.name == "principal" })?.value {
                NSLog("✅ Received principal from II: %@", principal)

                // No-op: currentPrincipal is now managed by Internet Identity only
                // Principal is set via setInternetIdentityPrincipal() from InternetIdentityView
            }
        }
    }


    // Kept as comment for reference:
    // - Previously started Python proxy on port 3847
    // - Provided HTTP ↔ Candid translation for IC canister
    // - Replaced by direct Supabase PostgreSQL integration

    func loadStoredUser() async {
        NSLog("🔐 APP STARTUP: Loading stored user credentials...")
        NSLog("🧪 Testing Profile: %@", userProfile.rawValue)

        // For testing profiles, override normal user loading
        if userProfile != .debug {
            NSLog("🧪 Using test profile: %@", userProfile.displayName)
            await MainActor.run {
                appState.currentUsername = userProfile.displayName
                appState.currentUserId = userProfile.userId
            }
            // Connect Social Service for Test Profile
            await SocialService.shared.connect(
                userId: userProfile.userId.uuidString,
                username: userProfile.displayName
            )
            NSLog("✅ TEST PROFILE: Set username=%@, userId=%@", userProfile.displayName, userProfile.userId.uuidString)
            return
        }

        // First try to get username from Keychain/UserDefaults
        if let username = await KeychainManager.shared.getUsername() {
            NSLog("✅ Keychain: Found stored username: %@", username)

            // 🔐 CRITICAL SECURITY: Verify we have the Signing Keys for this user
            // Without keys, we cannot sign requests (heartbeat, etc), leading to "Zombie" sessions.
            if await KeychainManager.shared.getKeyPair() == nil {
                NSLog("⚠️ KEYCHAIN ERROR: Username '%@' found but Signing Keys are missing!", username)
                NSLog("   Regenerating keys to prevent infinite login loop (Legacy backup fix).")

                // Instead of deleting the user, regenerate keys.
                // This allows the user to at least into the app.
                // Note: Server-side signature checks may fail until they re-register or update their public key.
                let (priv, pub) = CryptoManager.shared.generateKeyPair()
                try? await KeychainManager.shared.saveKeyPair(privateKey: priv, publicKey: pub)
                NSLog("✅ REGENERATED: New keys created and saved for '%@'.", username)
            }

            // Verify user exists in database
            do {
                NSLog("🔍 Supabase: Looking up user '%@' in database...", username)
                if let user = try await SupabaseClient.shared.getUserByUsername(username: username) {
                    await MainActor.run {
                        appState.currentUsername = username
                        appState.currentUserId = user.id
                    }

                    // CRITICAL FIX: Update SupabaseClient auth context so LicenseManager can access it
                    SupabaseClient.shared.auth.currentUser = AuthUser(
                        id: user.id,
                        username: user.username,
                        isAdmin: user.isAdmin ?? false,
                        isPremium: user.isPremium ?? false
                    )

                    await MainActor.run {
                        appState.isAdmin = user.isAdmin ?? false
                    }

                    // If admin, start the report listener
                    if user.isAdmin == true {
                        Task {
                            await AdminRealtimeService.shared.start()
                        }
                    }

                    NSLog("✅ AUTH SUCCESS: User authenticated - %@ (ID: %@)", username, user.id.uuidString)
                    NSLog("🎯 AppState: currentUsername=%@, currentUserId=%@", username, user.id.uuidString)

                    // Connect Social Service (Realtime, Friends, Presence)
                    await SocialService.shared.connect(
                        userId: user.id.uuidString,
                        username: username
                    )
                } else {
                    NSLog("⚠️  DB LOOKUP FAILED: Username '%@' not found in database", username)
                    NSLog("   Clearing stored credentials so user can create a new one")
                    // Username exists locally but not in database - clear it so user can create a new one
                    try? await KeychainManager.shared.deleteUsername()
                }
            } catch {
                NSLog("❌ DB ERROR: Failed to verify user in database: %@", String(describing: error))
                NSLog("   Error details: %@", String(describing: error))
                // Clear invalid username
                try? await KeychainManager.shared.deleteUsername()
                NSLog("   Cleared stored credentials - user will need to create new username")
            }
        } else {
            NSLog("ℹ️  KEYCHAIN: No stored username found")

            // FALLBACK: Check if we have a UUID in UserDefaults (manual override for debugging)
            if let uuidString = UserDefaults.standard.string(forKey: "currentUserId"),
               let uuid = UUID(uuidString: uuidString) {
                NSLog("🔄 FALLBACK: Found UUID in UserDefaults: %@", uuid.uuidString)
                NSLog("   This allows debugging without Keychain username")
                await MainActor.run {
                    appState.currentUserId = uuid
                    appState.currentUsername = "debug_user"
                }
                // Connect Social Service for Fallback
                await SocialService.shared.connect(
                    userId: uuid.uuidString,
                    username: "debug_user"
                )
                NSLog("✅ FALLBACK SUCCESS: Set currentUserId=%@, currentUsername=debug_user", uuid.uuidString)
            } else {
                NSLog("❌ NO FALLBACK: No UUID found in UserDefaults either")
                NSLog("   User will need to create a new username")
            }
        }

        NSLog("🏁 AUTH COMPLETE: Final state - username=%@, userId=%@", appState.currentUsername ?? "nil", appState.currentUserId?.uuidString ?? "nil")
    }

    func startServer() async {
        NSLog("🚀 RedLemon: Starting HTTP server...")
        NSLog("📋 RedLemon: Current directory: %@", FileManager.default.currentDirectoryPath)

        do {
            let server = try HTTPServer()
            NSLog("✅ RedLemon: HTTPServer instance created")

            // Start server in a background task that keeps running
            Task.detached(priority: .userInitiated) {
                do {
                    NSLog("📡 RedLemon: Server starting on port %d...", Config.serverPort)
                    try await server.start()
                    NSLog("🎉 RedLemon: Server successfully started on port %d!", Config.serverPort)
                } catch {
                    NSLog("❌ RedLemon: Server error: %@", error.localizedDescription)
                }
            }

            // OPTIMIZATION: Don't block MainActor with a hard sleep (Rule #52)
            // LocalAPIClient has built-in retry logic (3 attempts with backoff).
            // We enable isServerReady immediately so BrowseView can start its retry loop.
            // This prevents the UI from waiting 2 seconds unnecessarily and potentially deadlock.

            await MainActor.run {
                appState.isServerReady = true
                NSLog("✅ RedLemon: Server marked as ready (Optimistic)")
            }

            NSLog("✅ RedLemon: Server should be running on %@", Config.serverURL)
        } catch {
            NSLog("❌ RedLemon: Failed to initialize server: %@", error.localizedDescription)
        }
    }

    func performStartupChecks() async {
        NSLog("🔍 Performing startup checks...")
        NSLog("✅ Username-based authentication ready")

        // Check for crypto payments in background
        await LicenseManager.shared.refreshSubscription()
    }

    func checkForUpdates() async {
        NSLog("🔄 Checking for app updates...")
        updateManager.checkForUpdatesInBackground()
    }

    /// Reset playback state to prevent automatic selection of last played content
    func resetPlaybackState() async {
        NSLog("🔄 Resetting playback state to prevent auto-selection...")
        await MainActor.run {
            // Reset all playback-related state to ensure clean startup
            appState.currentView = .events
            appState.player.selectedMediaItem = nil
            appState.player.selectedMetadata = nil
            appState.player.selectedStream = nil
            appState.player.showPlayer = false
            appState.player.showMediaDetail = false
            appState.player.showQualitySelection = false
            appState.player.isResolvingStream = false
            appState.player.streamError = nil
            appState.player.resumeFromTimestamp = nil
            appState.player.currentRoomId = nil
            appState.player.currentWatchPartyRoom = nil
            appState.selectedSeason = nil
            appState.selectedEpisode = nil
            appState.player.isWatchPartyHost = false
            appState.player.currentWatchMode = .solo
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
                appState.showOnboarding = true
            }
            await UserResetManager.shared.clearForceUsernameSetupFlag()
        }
    }
}
