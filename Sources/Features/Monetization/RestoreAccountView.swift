import SwiftUI
import AppKit
import UniformTypeIdentifiers

struct RestoreAccountView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var licenseManager = LicenseManager.shared
    
    @State private var isRestoring = false
    @State private var errorMessage: String?
    @State private var successMessage: String?
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    
                    Text("Restore Account")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Import your backup file (.redlemon-key) to restore your account.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Import Actions
                VStack(spacing: 16) {
                    Button(action: importFromFile) {
                        HStack {
                            Image(systemName: "arrow.up.doc.fill")
                            Text("Import Backup File")
                        }
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .disabled(isRestoring)
                }
                .padding(.horizontal, 40)
                
                // Error/Success Messages
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                if let success = successMessage {
                    Text(success)
                        .foregroundColor(.green)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                if isRestoring {
                    ProgressView("Restoring...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                
                Spacer()
                
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.gray)
            }
            .padding(40)
        }
        .frame(width: 500, height: 500)
    }
    
    private func importFromFile() {
        errorMessage = nil
        successMessage = nil
        
        let openPanel = NSOpenPanel()
        openPanel.allowedContentTypes = [UTType(filenameExtension: "redlemon-key")!]
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.title = "Select Account Backup File"
        
        openPanel.begin { response in
            if response == .OK, let url = openPanel.url {
                restoreAccount(from: url)
            }
        }
    }
    
    private func restoreAccount(from url: URL) {
        isRestoring = true
        
        Task {
            do {
                let data = try Data(contentsOf: url)
                guard let jsonString = String(data: data, encoding: .utf8) else {
                    throw NSError(domain: "Restore", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not read file"])
                }
                
                let account = try await AccountExportManager.shared.importAccount(from: jsonString)
                
                await MainActor.run {
                    successMessage = "✅ Restored account: \(account.username)"
                    
                    // Update AppState to trigger navigation changes (e.g. dismiss UsernameSetupView)
                    appState.currentUsername = account.username
                    if let uuid = UUID(uuidString: account.userId) {
                        appState.currentUserId = uuid
                        
                        // Also connect to social service
                        Task {
                            await SocialService.shared.connect(userId: account.userId, username: account.username)
                        }
                    }
                    
                    // Trigger app state refresh if needed
                    // For now, just dismiss after delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        dismiss()
                    }
                }
            } catch {
                await MainActor.run {
                    errorMessage = "Restore failed: \(error.localizedDescription)"
                }
            }
            
            await MainActor.run {
                isRestoring = false
            }
        }
    }
}
