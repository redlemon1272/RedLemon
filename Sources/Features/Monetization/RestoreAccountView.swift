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
    var onDismiss: (() -> Void)? = nil
    
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
                        HStack(spacing: 12) {
                            Image(systemName: "arrow.up.doc.fill")
                                .font(.system(size: 18, weight: .semibold))
                            Text("Import Backup File")
                                .font(.system(size: 16, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue)
                        )
                    }
                    .buttonStyle(.plain)
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
                    VStack(spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.green)
                        Text(success)
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
                
                if isRestoring {
                    ProgressView("Securing Connection...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                
                Spacer()
                
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.gray)
                .buttonStyle(.plain)
            }
            .padding(40)
        }
        .frame(width: 500, height: 500)
    }
    
    private func importFromFile() {
        errorMessage = nil
        successMessage = nil
        
        let openPanel = NSOpenPanel()
        openPanel.allowedContentTypes = [
            UTType(filenameExtension: "redlemon-key")!,
            UTType.json,
            UTType.plainText,
            UTType.data
        ]
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.title = "Select Account Backup File"
        openPanel.message = "Select your .redlemon-key backup file (renamed files also work)"
        
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
                    withAnimation(.spring()) {
                        successMessage = "✅ Restored: \(account.username)"
                    }
                    
                    // Update AppState
                    appState.currentUsername = account.username
                    if let uuid = UUID(uuidString: account.userId) {
                        appState.currentUserId = uuid
                        
                        // Also connect to social service
                        Task {
                            await SocialService.shared.connect(userId: account.userId, username: account.username)
                        }
                    }
                    
                    // Unified Dismissal after a short delay for feedback
                    Task { @MainActor in
                        try? await Task.sleep(nanoseconds: 1_200_000_000) // 1.2 seconds
                        self.onDismiss?()
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
