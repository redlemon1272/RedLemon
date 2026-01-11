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
            startingUpdater: false,  // Don't auto-start to prevent popups
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
            print("   Appcast URL: https://151.243.109.243.nip.io/updates/appcast.xml")
            print("   Can check: \(canCheckForUpdates)")
        }
    }

    /// Check for updates manually
    func checkForUpdates() {
        print("🔍 Manual update check requested...")
        // Update the timestamp immediately to show user something happened
        self.lastCheckedDate = Date()
        updaterController?.checkForUpdates(nil)
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
        guard let feedURL = URL(string: "https://151.243.109.243.nip.io/updates/appcast.xml") else {
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
               let latestVersion = String(xmlString[versionRange]).components(separatedBy: ">")[1].components(separatedBy: "<").first {

                let currentVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"

                print("📦 Current version: \(currentVersion), Latest: \(latestVersion)")

                if latestVersion != currentVersion && latestVersion > currentVersion {
                    print("✅ Update available: \(latestVersion)")
                    await MainActor.run {
                        self.updateAvailable = true
                        self.lastCheckedDate = Date()
                    }
                } else {
                    print("✅ App is up to date")
                    await MainActor.run {
                        self.updateAvailable = false
                        self.lastCheckedDate = Date()
                    }
                }
            }
        } catch {
            print("❌ Failed to check for updates: \(error.localizedDescription)")
        }
    }

    // MARK: - SPUUpdaterDelegate

    /// Provide the feed URL (can also be set in Info.plist as SUFeedURL)
    func feedURLString(for updater: SPUUpdater) -> String? {
        let feedURL = "https://151.243.109.243.nip.io/updates/appcast.xml"
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
        print("📦 Update found: \(item.displayVersionString)")
        DispatchQueue.main.async {
            self.updateAvailable = true
            self.lastCheckedDate = Date()
        }
    }

    /// Called when no update is found
    func updaterDidNotFindUpdate(_ updater: SPUUpdater) {
        print("✅ No updates available")
        DispatchQueue.main.async {
            self.updateAvailable = false
            self.lastCheckedDate = Date()
        }
    }
}
