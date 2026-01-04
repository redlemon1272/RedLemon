import Foundation
import CryptoKit

class CryptoManager {
    static let shared = CryptoManager()
    
    private init() {}
    
    /// Generate a new random Curve25519 (Ed25519) Key Pair
    /// Returns: (privateKey_Base64, publicKey_Base64)
    func generateKeyPair() -> (privateKey: String, publicKey: String) {
        let privateKey = Curve25519.Signing.PrivateKey()
        let publicKey = privateKey.publicKey
        
        let privateKeyString = privateKey.rawRepresentation.base64EncodedString()
        let publicKeyString = publicKey.rawRepresentation.base64EncodedString()
        
        return (privateKeyString, publicKeyString)
    }
    
    /// Sign a message using a Base64 Private Key
    func sign(message: String, privateKeyBase64: String) throws -> String {
        guard let privateKeyData = Data(base64Encoded: privateKeyBase64) else {
            throw NSError(domain: "CryptoManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid private key format"])
        }
        
        let privateKey = try Curve25519.Signing.PrivateKey(rawRepresentation: privateKeyData)
        
        guard let messageData = message.data(using: .utf8) else {
            throw NSError(domain: "CryptoManager", code: 2, userInfo: [NSLocalizedDescriptionKey: "Message encoding failed"])
        }
        
        let signature = try privateKey.signature(for: messageData)
        return signature.base64EncodedString()
    }
    
    /// Verify a signature (Utility/Testing)
    func verify(signatureBase64: String, message: String, publicKeyBase64: String) -> Bool {
        guard let publicKeyData = Data(base64Encoded: publicKeyBase64),
              let signatureData = Data(base64Encoded: signatureBase64),
              let messageData = message.data(using: .utf8) else {
            return false
        }
        
        do {
            let publicKey = try Curve25519.Signing.PublicKey(rawRepresentation: publicKeyData)
            return publicKey.isValidSignature(signatureData, for: messageData)
        } catch {
            return false
        }
    }
}
