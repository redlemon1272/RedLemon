import Foundation
import SwiftUI
import Supabase

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
    
    private var realtimeChannel: RealtimeChannel?
    
    private init() {
        // Start listening for license updates if we have a user
        setupRealtimeSubscription()
    }
    
    /// Listen for changes to 'is_host' in the users table
    func setupRealtimeSubscription() {
        guard let userId = SupabaseClient.shared.auth.currentUser?.id else { return }
        
        let channel = SupabaseClient.shared.realtime.channel("public:users:id=eq.\(userId)")
        
        channel.on("postgres_changes", filter: ChannelFilter(event: "UPDATE", schema: "public", table: "users", filter: "id=eq.\(userId)")) { message in
            // Check if is_host changed to true
            if let newRecord = message.payload["new"] as? [String: Any],
               let isHost = newRecord["is_host"] as? Bool,
               isHost == true {
                self.activateLicense()
            }
        }
        
        channel.subscribe()
        self.realtimeChannel = channel
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
