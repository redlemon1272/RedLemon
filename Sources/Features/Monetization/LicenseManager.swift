import Foundation
import SwiftUI


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
        // TODO: Implement realtime subscription when needed
    }
    
    /// Refresh license status from server
    func refreshLicense(premium: Bool, expiresAt: Date?) {
        DispatchQueue.main.async {
            if let date = expiresAt {
                self.subscriptionExpiresAt = date.timeIntervalSince1970
                print("🎉 Subscription updated! Expires: \(date)")
            } else if premium {
                 // Fallback if no date returned but premium is true (Legacy/Safety)
                 // Give 30 days if undefined? Or just set far future?
                 // Let's set 30 days to be safe/generous for now
                 self.subscriptionExpiresAt = Date().addingTimeInterval(30 * 24 * 3600).timeIntervalSince1970
            }
        }
    }
    
    /// Activate the license (Legacy support / Quick unlock)
    func activateLicense() {
        DispatchQueue.main.async {
            // Default to 30 days if activated blindly
             self.subscriptionExpiresAt = Date().addingTimeInterval(30 * 24 * 3600).timeIntervalSince1970
        }
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
        
        await MainActor.run {
            if let expiryString = data.subscription_expires_at,
               let date = SupabaseClient.isoFormatter.date(from: expiryString) {
                self.subscriptionExpiresAt = date.timeIntervalSince1970
            } else if data.is_host {
                self.activateLicense()
            }
        }
        
        return true
    }
    
    /// Check if user has premium status
    var isPremium: Bool {
        if !isMonetizationEnabled { return true }
        return Date().timeIntervalSince1970 < subscriptionExpiresAt
    }
    
    /// Check if user can host (Everyone can host now, but with limits. This checks NON-limited hosting)
    var canHostUnlimited: Bool {
        return isPremium
    }
}
