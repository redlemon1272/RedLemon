import Foundation
import Sparkle
import AppKit

/// Manages app auto-updates using Sparkle framework
class UpdateManager: NSObject, ObservableObject, SPUUpdaterDelegate {
    static let shared = UpdateManager()

    private var updaterController: SPUStandardUpdaterController?

    // Published properties for UI binding
    @Published var updateAvailable: Bool = false
    @Published var canCheckForUpdates: Bool = false
    @Published var lastCheckedDate: Date? {
        didSet {
            if let date = lastCheckedDate {
                UserDefaults.standard.set(date, forKey: "lastUpdateCheck")
            }
        }
    }

    private override init() {
        super.init()
        // Load persistency
        if let saved = UserDefaults.standard.object(forKey: "lastUpdateCheck") as? Date {
            self.lastCheckedDate = saved
        }
        setupSparkle()
    }

    private func setupSparkle() {
        // Initialize Sparkle updater with delegate (but don't start automatically)
        updaterController = SPUStandardUpdaterController(
            startingUpdater: true,  // Must be true to allow Sparkle to run
            updaterDelegate: self,
            userDriverDelegate: nil
        )

        // Set appcast URL (GitHub-hosted XML feed)
        if let updater = updaterController?.updater {
            canCheckForUpdates = updater.canCheckForUpdates

            // Enable automatic behaviors for seamless updates
            updater.automaticallyChecksForUpdates = true
            updater.automaticallyDownloadsUpdates = true

            print("✅ Sparkle configured (seamless mode)")
            print("   Appcast URL: https://redlemon.live.placeholder.nip.io/updates/appcast.xml")
            print("   Can check: \(canCheckForUpdates)")
        }
    }

    /// Check for updates manually
    @MainActor
    func checkForUpdates() {
        LoggingManager.shared.info(.general, message: "🔍 Manual update check requested...")
        // Update the timestamp immediately to show user something happened
        self.lastCheckedDate = Date()

        // Primary method via controller - Pass 'self' as sender (NSObject)
        // macOS 13+ stricter responder chain often ignores nil senders for IBActions
        if let controller = updaterController {
            controller.checkForUpdates(self)
        } else {
             LoggingManager.shared.warn(.general, message: "⚠️ Sparkle controller missing, attempting direct trigger")
        }

        // Fallback: Directly trigger updater if controller is stubborn
        if let updater = updaterController?.updater {
            if updater.canCheckForUpdates {
                LoggingManager.shared.info(.general, message: "🚀 Triggering Sparkle updater directly")
                updater.checkForUpdates()
            } else {
                LoggingManager.shared.warn(.general, message: "⚠️ Sparkle updater cannot check for updates at this time")
            }
        }

        // Also trigger our custom check to be sure
        Task {
            await checkForUpdatesQuietly()
        }
    }

    /// Check for updates silently (called on app launch)
    func checkForUpdatesInBackground() {
        print("🔍 Silent update check (custom implementation)...")
        Task {
            await checkForUpdatesQuietly()
        }
    }

    /// Custom silent update check that doesn't use Sparkle's UI
    private func checkForUpdatesQuietly() async {
        guard let feedURL = URL(string: "https://redlemon.live.placeholder.nip.io/updates/appcast.xml") else {
            print("❌ Invalid feed URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: feedURL)
            guard let xmlString = String(data: data, encoding: .utf8) else {
                print("❌ Failed to decode appcast XML")
                return
            }

            // Parse version from appcast (simple regex for <sparkle:version>)
            if let versionRange = xmlString.range(of: #"<sparkle:version>([^<]+)</sparkle:version>"#, options: .regularExpression),
               let latestVersionStr = String(xmlString[versionRange]).components(separatedBy: ">")[1].components(separatedBy: "<").first {

                let currentVersionStr = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
                let currentBuildStr = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"

                LoggingManager.shared.info(.general, message: "📦 Version Check - Local: \(currentVersionStr) (\(currentBuildStr)), Remote: \(latestVersionStr)")

                // Robust comparison logic:
                // 1. If build numbers are available and different, use them (Security Check #30 fallback)
                // 2. Otherwise use semantic version comparison

                let isNewer: Bool
                let latestBuild = Int(latestVersionStr) ?? 0
                let currentBuild = Int(currentBuildStr) ?? 0

                if latestBuild > 0 && currentBuild > 0 {
                    isNewer = latestBuild > currentBuild
                } else {
                    isNewer = isVersion(latestVersionStr, newerThan: currentVersionStr)
                }

                if isNewer {
                    LoggingManager.shared.info(.general, message: "✅ Update available: \(latestVersionStr)")
                    await MainActor.run {
                        self.updateAvailable = true
                        self.lastCheckedDate = Date()
                    }
                } else {
                    LoggingManager.shared.info(.general, message: "✅ App is up to date")
                    await MainActor.run {
                        // CRITICAL: Don't clear updateAvailable if it was already set by a previous check
                        // This prevents race conditions where a background check finds an update but
                        // a subsequent silent check (e.g. from Sparkle) clears it.
                        if !self.updateAvailable {
                            self.updateAvailable = false
                        }
                        self.lastCheckedDate = Date()
                    }
                }
            }
        } catch {
            LoggingManager.shared.error(.general, message: "❌ Failed to check for updates: \(error.localizedDescription)")
        }
    }

    /// Semantic version comparison helper
    private func isVersion(_ version1: String, newerThan version2: String) -> Bool {
        let components1 = version1.split(separator: ".").compactMap { Int($0) }
        let components2 = version2.split(separator: ".").compactMap { Int($0) }

        let maxLength = max(components1.count, components2.count)

        for i in 0..<maxLength {
            let v1 = i < components1.count ? components1[i] : 0
            let v2 = i < components2.count ? components2[i] : 0

            if v1 > v2 { return true }
            if v1 < v2 { return false }
        }

        return false
    }

    // MARK: - SPUUpdaterDelegate

    /// Provide the feed URL (can also be set in Info.plist as SUFeedURL)
    func feedURLString(for updater: SPUUpdater) -> String? {
        let feedURL = "https://redlemon.live.placeholder.nip.io/updates/appcast.xml"
        print("📡 Sparkle requesting feed URL: \(feedURL)")
        return feedURL
    }

    /// For development: explicitly allow insecure updates (no signature checking)
    /// This is required when SUPublicEDKey is not set or empty
    /// PRODUCTION: Generate Ed25519 keys and add SUPublicEDKey to Info.plist
    func updaterMayCheck(forUpdates updater: SPUUpdater) -> Bool {
        print("✅ Sparkle checking for updates...")
        return true
    }

    func updater(_ updater: SPUUpdater, mayPerform updateCheck: SPUUpdateCheck) throws {
        print("✅ Sparkle update check authorized")
    }

    /// Called when an update is found
    func updater(_ updater: SPUUpdater, didFindValidUpdate item: SUAppcastItem) {
        LoggingManager.shared.info(.general, message: "📦 Sparkle found update: \(item.displayVersionString) (\(item.versionString))")
        Task { @MainActor in
            self.updateAvailable = true
            self.lastCheckedDate = Date()
        }
    }

    /// Called when no update is found
    func updaterDidNotFindUpdate(_ updater: SPUUpdater) {
        LoggingManager.shared.info(.general, message: "✅ Sparkle: No updates available")
        Task { @MainActor in
            // CRITICAL PROTECTION (macOS 13+):
            // If our custom background check already found an update, don't let Sparkle clear it.
            // Sparkle might fail to find an update due to ad-hoc signing or restricted permissions on macOS 13+.
            if !self.updateAvailable {
                self.updateAvailable = false
            }
            self.lastCheckedDate = Date()
        }
    }
}
