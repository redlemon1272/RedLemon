import Foundation
import SwiftUI


class LicenseManager: ObservableObject {
    static let shared = LicenseManager()
    
    // MARK: - Feature Flag
    // ⚠️ MASTER SWITCH: Set to true to enable the payment wall
    #if DEBUG
    @Published var isMonetizationEnabled: Bool = false
    #else
    @Published var isMonetizationEnabled: Bool = false // Keep false for Beta launch
    #endif
    
    // MARK: - License State
    @AppStorage("isHostLicenseActive") var isHostLicenseActive: Bool = false
    @AppStorage("recoveryPhraseHash") var recoveryPhraseHash: String = ""
    
    private init() {
        // Realtime subscription for license updates would go here
        // For now, license activation is triggered manually after payment
        // or via the recoverAccount method
    }
    
    /// Setup realtime subscription for license updates
    /// Note: Currently stubbed - activation happens via payment confirmation or recovery
    func setupRealtimeSubscription() {
        // TODO: Implement realtime subscription when needed
        // For now, license activation is handled via:
        // 1. Payment confirmation in PaymentGateView
        // 2. Account recovery in RestoreAccountView
    }
    
    /// Activate the license (called after successful payment or recovery)
    func activateLicense() {
        DispatchQueue.main.async {
            self.isHostLicenseActive = true
            print("🎉 Host License Activated!")
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
            let is_host: Bool
        }
        
        let data = try JSONDecoder().decode(RecoveryResponse.self, from: response)
        
        await MainActor.run {
            if data.is_host {
                self.activateLicense()
            }
            // TODO: Update current user ID in AppState if needed
        }
        
        return true
    }
    
    /// Check if user can host a watch party
    var canHost: Bool {
        if !isMonetizationEnabled {
            return true // Free for everyone if monetization is disabled
        }
        return isHostLicenseActive
    }
}
