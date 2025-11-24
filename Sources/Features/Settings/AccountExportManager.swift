import Foundation
import AppKit
import UniformTypeIdentifiers

struct AccountExportData: Codable {
    let userId: String
    let username: String
    let timestamp: Date
    var version: String = "1.0"
}

class AccountExportManager {
    static let shared = AccountExportManager()
    
    private init() {}
    
    /// Generate export data for the current user
    func generateExportData() async throws -> AccountExportData {
        guard let userId = await KeychainManager.shared.get(service: "user_id"),
              let username = await KeychainManager.shared.getUsername() else {
            throw NSError(domain: "AccountExport", code: 1, userInfo: [NSLocalizedDescriptionKey: "No active account found"])
        }
        
        return AccountExportData(
            userId: userId,
            username: username,
            timestamp: Date()
        )
    }
    
    /// Generate JSON string for export
    func generateJSON() async throws -> String {
        let data = try await generateExportData()
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let jsonData = try encoder.encode(data)
        return String(data: jsonData, encoding: .utf8) ?? ""
    }
    
    /// Save export file to disk
    func saveExportFile(to url: URL) async throws {
        let json = try await generateJSON()
        try json.write(to: url, atomically: true, encoding: .utf8)
    }
    
    /// Import account from JSON data
    func importAccount(from jsonString: String) async throws -> AccountExportData {
        guard let data = jsonString.data(using: .utf8) else {
            throw NSError(domain: "AccountImport", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid data format"])
        }
        
        let decoder = JSONDecoder()
        let exportData = try decoder.decode(AccountExportData.self, from: data)
        
        // Validate
        guard !exportData.userId.isEmpty, !exportData.username.isEmpty else {
            throw NSError(domain: "AccountImport", code: 3, userInfo: [NSLocalizedDescriptionKey: "Invalid account data"])
        }
        
        // Restore credentials
        try await KeychainManager.shared.save(credential: exportData.userId, for: "user_id")
        try await KeychainManager.shared.saveUsername(exportData.username)
        
        return exportData
    }
}
