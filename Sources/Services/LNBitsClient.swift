import Foundation
import Supabase

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
    ///   - amount: Amount in Satoshis (optional, handled by server)
    ///   - memo: Description (optional, handled by server)
    /// - Returns: LNBitsInvoice object containing payment request and hash
    func createInvoice(amount: Int = 1000, memo: String = "Host License") async throws -> LNBitsInvoice {
        // Invoke the 'create-invoice' Edge Function
        let response = try await SupabaseClient.shared.functions
            .invoke("create-invoice", options: FunctionInvokeOptions(
                body: ["amount": amount, "memo": memo]
            ))
        
        let data = try JSONDecoder().decode(LNBitsInvoice.self, from: response)
        return data
    }
}
