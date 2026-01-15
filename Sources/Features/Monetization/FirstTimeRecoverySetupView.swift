import SwiftUI

struct FirstTimeRecoverySetupView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("recoveryPhrase") private var recoveryPhrase: String = ""
    @AppStorage("hasSeenRecoverySetup") private var hasSeenRecoverySetup: Bool = false
    
    @State private var generatedPhrase: String = ""
    @State private var showCopiedAlert = false
    @State private var isSaving = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "shield.checkered")
                        .font(.system(size: 60))
                        .foregroundColor(.yellow)
                    
                    Text("Secure Your Account")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Your recovery phrase allows you to restore your account and Host License on any device. Save these 12 words securely.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Words Grid
                if !generatedPhrase.isEmpty {
                    let words = generatedPhrase.split(separator: " ").map(String.init)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(Array(words.enumerated()), id: \.offset) { index, word in
                            HStack {
                                Text("\(index + 1).")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .foregroundColor(.gray)
                                Text(word)
                                    .font(.system(size: 16, weight: .medium, design: .monospaced))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Copy Button
                if !generatedPhrase.isEmpty {
                    Button(action: {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(generatedPhrase, forType: .string)
                        showCopiedAlert = true
                        Task { @MainActor in
                            try? await Task.sleep(nanoseconds: 2_000_000_000)
                            showCopiedAlert = false
                        }
                    }) {
                        HStack {
                            Image(systemName: "doc.on.doc")
                            Text("Copy to Clipboard")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    if showCopiedAlert {
                        Text("✅ Copied!")
                            .foregroundColor(.green)
                            .font(.caption)
                    }
                }
                
                Spacer()
                
                // Continue Button
                Button(action: saveAndContinue) {
                    HStack {
                        if isSaving {
                            ProgressView()
                                .scaleEffect(0.8)
                        }
                        Text(isSaving ? "Saving..." : "I've Saved My Recovery Phrase")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(generatedPhrase.isEmpty ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(generatedPhrase.isEmpty || isSaving)
                .padding(.horizontal)
            }
            .padding(40)
        }
        .frame(width: 550, height: 700)
        .onAppear {
            generatePhrase()
        }
    }
    
    private func generatePhrase() {
        generatedPhrase = RecoveryPhraseManager.shared.generatePhrase()
    }
    
    private func saveAndContinue() {
        isSaving = true
        
        Task {
            do {
                // Save phrase locally
                recoveryPhrase = generatedPhrase
                
                // Hash and save to database
                let hash = RecoveryPhraseManager.shared.hashPhrase(generatedPhrase)
                
                // Update user's recovery_hash in Supabase
                guard let userId = SupabaseClient.shared.auth.currentUser?.id else {
                    throw NSError(domain: "Auth", code: 401, userInfo: [NSLocalizedDescriptionKey: "Not authenticated"])
                }
                
                _ = try await SupabaseClient.shared
                    .from("users")
                    .update(["recovery_hash": hash])
                    .eq("id", value: userId.uuidString)
                    .execute()
                
                await MainActor.run {
                    hasSeenRecoverySetup = true
                    isSaving = false
                    dismiss()
                }
            } catch {
                print("❌ Failed to save recovery phrase: \(error)")
                isSaving = false
            }
        }
    }
}
