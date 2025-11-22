import SwiftUI

struct RestoreAccountView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var licenseManager = LicenseManager.shared
    
    @State private var phraseInput: String = ""
    @State private var isRestoring = false
    @State private var errorMessage: String?
    @State private var successMessage: String?
    
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
                    
                    Text("Enter your 12-word recovery phrase to restore your account and Host License.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Input Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Recovery Phrase")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextEditor(text: $phraseInput)
                        .font(.system(size: 14, design: .monospaced))
                        .frame(height: 100)
                        .padding(8)
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                // Error/Success Messages
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                if let success = successMessage {
                    Text(success)
                        .foregroundColor(.green)
                        .font(.caption)
                }
                
                // Restore Button
                Button(action: restoreAccount) {
                    HStack {
                        if isRestoring {
                            ProgressView()
                                .scaleEffect(0.8)
                        }
                        Text(isRestoring ? "Restoring..." : "Restore Account")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(phraseInput.isEmpty ? Color.gray : Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(phraseInput.isEmpty || isRestoring)
                .padding(.horizontal)
                
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
    
    private func restoreAccount() {
        errorMessage = nil
        successMessage = nil
        
        let phrase = phraseInput.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        guard RecoveryPhraseManager.shared.isValidPhrase(phrase) else {
            errorMessage = "Invalid phrase. Must be exactly 12 words."
            return
        }
        
        isRestoring = true
        
        Task {
            do {
                let success = try await licenseManager.recoverAccount(phrase: phrase)
                await MainActor.run {
                    if success {
                        successMessage = "✅ Account restored successfully!"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            dismiss()
                        }
                    }
                }
            } catch {
                await MainActor.run {
                    errorMessage = "Recovery failed: \(error.localizedDescription)"
                }
            }
            isRestoring = false
        }
    }
}
