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
            self.objectWillChange.send() // Force UI update
            
            if let date = expiresAt {
                self.subscriptionExpiresAt = date.timeIntervalSince1970
                print("🎉 Subscription updated! Expires: \(date)")
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
                print("🚫 Subscription revoked or inactive.")
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
    
    /// Trigger a background check for crypto payments (Run on app start)
    func refreshSubscription() async {
        do {
            print("💰 LicenseManager: Checking for background crypto payments...")
            let (isPremium, newExpiry) = try await SupabaseClient.shared.checkPaymentStatus()
            refreshLicense(premium: isPremium, expiresAt: newExpiry)
        } catch {
            print("⚠️ LicenseManager: Background payment check failed: \(error)")
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
    
    // MARK: - Hosting Limit
    @Published var timeUntilNextFreeRoom: TimeInterval = 0
    
    func checkHostingLimit() async {
        // Premium users have no limit
        if isPremium {
            await MainActor.run { self.timeUntilNextFreeRoom = 0 }
            return
        }
        
        do {
            // Use unified check from SupabaseClient (queries room_creation_history)
            let remaining = try await SupabaseClient.shared.checkFreeTierLimit()
            
            await MainActor.run {
                self.timeUntilNextFreeRoom = remaining
            }
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
