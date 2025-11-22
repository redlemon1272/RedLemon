import Foundation


struct LNBitsInvoice: Codable {
    let paymentHash: String
    let paymentRequest: String
    let checkingId: String?
    
    enum CodingKeys: String, CodingKey {
        case paymentHash = "payment_hash"
        case paymentRequest = "payment_request"
        case checkingId = "checking_id"
    }
}

class LNBitsClient: ObservableObject {
    static let shared = LNBitsClient()
    
    private init() {}
    
    /// Create a Lightning Invoice via Supabase Edge Function
    /// - Parameters:
    ///   - amount: Amount in Satoshis (default: 1000)
    ///   - memo: Description (optional)
    /// - Returns: LNBitsInvoice object containing payment request and hash
    func createInvoice(amount: Int = 1000, memo: String? = nil) async throws -> LNBitsInvoice {
        // Get current user ID
        guard let userId = SupabaseClient.shared.auth.currentUser?.id else {
            throw NSError(domain: "LNBits", code: 401, userInfo: [NSLocalizedDescriptionKey: "Not authenticated"])
        }
        
        // Build request body
        var body: [String: Any] = [
            "user_id": userId.uuidString,
            "amount": amount
        ]
        
        if let memo = memo {
            body["memo"] = memo
        }
        
        // Invoke the 'create-invoice' Edge Function
        let response = try await SupabaseClient.shared.functions
            .invoke("create-invoice", options: FunctionInvokeOptions(body: body))
        
        let invoice = try JSONDecoder().decode(LNBitsInvoice.self, from: response)
        return invoice
    }
}
