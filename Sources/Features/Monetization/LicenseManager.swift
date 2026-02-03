import Foundation
import SwiftUI


@MainActor
class LicenseManager: ObservableObject {
    static let shared = LicenseManager()

    // MARK: - Feature Flag
    // ⚠️ MASTER SWITCH: Set to true to enable the payment wall
    #if DEBUG
    @Published var isMonetizationEnabled: Bool = true
    #else
    @Published var isMonetizationEnabled: Bool = true // Enabled for Beta testing
    #endif

    // MARK: - License State
    // Storing as TimeInterval since 1970 for AppStorage support
    @AppStorage("subscriptionExpiresAt") var subscriptionExpiresAt: Double = 0
    @AppStorage("recoveryPhraseHash") var recoveryPhraseHash: String = ""

    private init() {
        // Realtime subscription for license updates would go here
    }

    /// Setup realtime subscription for license updates
    func setupRealtimeSubscription() {
        // Use ProfileRealtimeService to listen for live profile updates (Admin grants)
        ProfileRealtimeService.shared.onProfileUpdate = { [weak self] payload in
            guard let self = self else { return }

            print("📡 LicenseManager: Received Realtime profile update. Refreshing...")

            // We could parse the payload here for efficiency, but calling refreshSubscription
            // ensures we have the full, valid server state after any change.
            Task {
                await self.refreshSubscription()
            }
        }
    }

    /// Refresh license status from server
    func refreshLicense(premium: Bool, expiresAt: Date?) {
        let oldExpiresAt = self.subscriptionExpiresAt
        let now = Date().timeIntervalSince1970

        self.objectWillChange.send() // Force UI update

        if let date = expiresAt {
            let newExpiresAt = date.timeIntervalSince1970
            self.subscriptionExpiresAt = newExpiresAt
            print("🎉 License updated! Expires: \(date)")

            // 🛡️ DETECT HOSTING GRANT
            // Notification conditions:
            // 1. User was inactive (or empty) and is now active
            let wasInactive = oldExpiresAt < now
            let isNowActive = newExpiresAt > now

            if wasInactive && isNowActive {
                let delta = newExpiresAt - max(oldExpiresAt, now)
                let days = Int(round(delta / (24 * 3600)))

                print("📣 LicenseManager: Detected hosting grant (\(days) days). Posting notification.")
                NotificationCenter.default.post(
                    name: NSNotification.Name("HostingStatusGranted"),
                    object: nil,
                    userInfo: ["days": days]
                )
            }
        } else if premium {
             // Fallback if no date returned but premium is true (Legacy/Safety)
             // Give 30 days if undefined? Or just set far future?
             // Let's set 30 days to be safe/generous for now
             // Only update if current expiry is in the past, to avoid overwriting a longer valid sub
             if self.subscriptionExpiresAt < Date().timeIntervalSince1970 {
                 self.subscriptionExpiresAt = Date().addingTimeInterval(30 * 24 * 3600).timeIntervalSince1970
             }
        } else {
            // Premium is FALSE and no date provided -> Revoke/Expire
            // Set expiry to 0 (1970) to ensure isPremium returns false
            self.subscriptionExpiresAt = 0
            print("🚫 License revoked or inactive.")
        }
    }

    /// Activate the license (Legacy support / Quick unlock)
    func activateLicense() {
        // Default to 30 days if activated blindly
         self.subscriptionExpiresAt = Date().addingTimeInterval(30 * 24 * 3600).timeIntervalSince1970
    }

    func refreshSubscription() async {
        print("💰 LicenseManager: Starting hybrid license check...")

        // 1. Run the payment sweep (Edge Function) - Checks for NEW blockchain transactions
        // We use a separate do-catch or try? so a failure here doesn't block the profile check
        var sweepPremium = false
        var sweepExpiry: Date? = nil

        do {
            (sweepPremium, sweepExpiry, _) = try await SupabaseClient.shared.checkPaymentStatus()
        } catch {
             print("⚠️ LicenseManager: Payment sweep failed (non-fatal): \(error)")
        }

        // 2. Check the User Profile (Database) - Checks for Admin grants or existing valid subs
        var profileExpiry: Date? = nil
        do {
            if let userId = SupabaseClient.shared.auth.currentUser?.id,
               let user = try await SupabaseClient.shared.getUserById(userId: userId) {
                profileExpiry = user.subscriptionExpiresAt
                print("👤 LicenseManager: Profile expiry: \(String(describing: profileExpiry))")

                // Refresh Auth Context to update Hosting Streak in UI immediately
                SupabaseClient.shared.auth.currentUser = AuthUser(
                    id: user.id,
                    username: user.username,
                    isAdmin: user.isAdmin ?? false,
                    isPremium: user.isPremium ?? false
                )
            }
        } catch {
            print("⚠️ LicenseManager: Profile check failed (non-fatal): \(error)")
        }

        // 3. Determine the best expiry date (latest one wins)
        var finalExpiry: Date? = sweepExpiry
        if let pDate = profileExpiry {
            if let sDate = sweepExpiry {
                finalExpiry = (pDate > sDate) ? pDate : sDate
            } else {
                finalExpiry = pDate
            }
        }

        // 4. Update License
        // If either source says premium (and has a date), use it.
        let isPremium = sweepPremium || (finalExpiry != nil && finalExpiry! > Date())
        refreshLicense(premium: isPremium, expiresAt: finalExpiry)
    }

    /// Recover account using mnemonic phrase
    func recoverAccount(phrase: String) async throws -> Bool {
        let hash = RecoveryPhraseManager.shared.hashPhrase(phrase)

        let response = try await SupabaseClient.shared.functions
            .invoke("recover-account", options: FunctionInvokeOptions(
                body: ["recovery_hash": hash]
            ))

        struct RecoveryResponse: Decodable {
            let user_id: UUID
            let is_host: Bool // Legacy boolean from old function
            let subscription_expires_at: String? // New field
        }

        let data = try JSONDecoder().decode(RecoveryResponse.self, from: response)

        if let expiryString = data.subscription_expires_at,
           let date = SupabaseClient.isoFormatter.date(from: expiryString) {
            self.subscriptionExpiresAt = date.timeIntervalSince1970
        } else if data.is_host {
            self.activateLicense()
        }

        return true
    }

    /// Check if user has premium status
    var isPremium: Bool {
        if !isMonetizationEnabled { return true }

        // DEBUG CHEAT REMOVED as per user request

        let now = Date().timeIntervalSince1970
        let isActive = now < subscriptionExpiresAt
        if !isActive && subscriptionExpiresAt > 0 {
             print("🔒 LicenseManager: Premium check failed. Expires: \(subscriptionExpiresAt) < Now: \(now)")
        }
        return isActive
    }

    // MARK: - Hosting Limit
    @Published var timeUntilNextFreeRoom: TimeInterval = 0

    private var lastLimitCheck: Date = .distantPast
    private var isCheckingLimit: Bool = false

    func checkHostingLimit() async {
        // Prevent concurrent or too-frequent checks
        if isCheckingLimit { return }

        let now = Date()
        let timeSinceLastCheck = now.timeIntervalSince(lastLimitCheck)

        // Debounce: don't check more than once per minute unless we think we're ready
        if timeSinceLastCheck < 60 && timeUntilNextFreeRoom > 0 {
            return
        }

        isCheckingLimit = true
        lastLimitCheck = now
        defer { isCheckingLimit = false }

        // Premium users have no limit
        if isPremium {
            self.timeUntilNextFreeRoom = 0
            return
        }

        do {
            // Use unified check from SupabaseClient (queries room_creation_history)
            let remaining = try await SupabaseClient.shared.checkFreeTierLimit()
            self.timeUntilNextFreeRoom = remaining
        } catch {
            print("Error checking hosting limit: \(error)")
        }
    }

    var formattedCooldownTime: String {
        if timeUntilNextFreeRoom <= 0 { return "Ready" }

        let hours = Int(timeUntilNextFreeRoom) / 3600
        let minutes = Int(timeUntilNextFreeRoom) / 60 % 60

        if hours > 24 {
             let days = hours / 24
             let remHours = hours % 24
             return "\(days)d \(remHours)h"
        }

        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes)m"
        }
    }

    /// Check if user can host (Everyone can host now, but with limits. This checks NON-limited hosting)
    var canHostUnlimited: Bool {
        return isPremium
    }
}
