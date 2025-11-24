import Foundation
import CryptoKit

class RecoveryPhraseManager {
    static let shared = RecoveryPhraseManager()
    
    // Simplified BIP39-like word list (first 100 words for demo)
    private let wordList = [
        "abandon", "ability", "able", "about", "above", "absent", "absorb", "abstract",
        "absurd", "abuse", "access", "accident", "account", "accuse", "achieve", "acid",
        "acoustic", "acquire", "across", "act", "action", "actor", "actress", "actual",
        "adapt", "add", "addict", "address", "adjust", "admit", "adult", "advance",
        "advice", "aerobic", "affair", "afford", "afraid", "again", "age", "agent",
        "agree", "ahead", "aim", "air", "airport", "aisle", "alarm", "album",
        "alcohol", "alert", "alien", "all", "alley", "allow", "almost", "alone",
        "alpha", "already", "also", "alter", "always", "amateur", "amazing", "among",
        "amount", "amused", "analyst", "anchor", "ancient", "anger", "angle", "angry",
        "animal", "ankle", "announce", "annual", "another", "answer", "antenna", "antique",
        "anxiety", "any", "apart", "apology", "appear", "apple", "approve", "april",
        "arch", "arctic", "area", "arena", "argue", "arm", "armed", "armor",
        "army", "around", "arrange", "arrest", "arrive", "arrow"
    ]
    
    private init() {}
    
    /// Generate a 12-word recovery phrase
    func generatePhrase() -> String {
        var words: [String] = []
        for _ in 0..<12 {
            let randomIndex = Int.random(in: 0..<wordList.count)
            words.append(wordList[randomIndex])
        }
        return words.joined(separator: " ")
    }
    
    /// Hash a recovery phrase using SHA256
    func hashPhrase(_ phrase: String) -> String {
        let inputData = Data(phrase.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    /// Validate phrase format (12 words)
    func isValidPhrase(_ phrase: String) -> Bool {
        let words = phrase.split(separator: " ").map(String.init)
        return words.count == 12
    }
    
    /// Save recovery phrase to Keychain
    func savePhrase(_ phrase: String) async throws {
        try await KeychainManager.shared.save(credential: phrase, for: "recovery_phrase")
    }
    
    /// Retrieve recovery phrase from Keychain
    func getPhrase() async -> String? {
        return await KeychainManager.shared.get(service: "recovery_phrase")
    }
    
    /// Check if a recovery phrase exists
    func hasPhrase() async -> Bool {
        return await getPhrase() != nil
    }
    
    /// Generate and save a new recovery phrase
    func generateAndSavePhrase() async throws -> String {
        let phrase = generatePhrase()
        try await savePhrase(phrase)
        return phrase
    }
}
