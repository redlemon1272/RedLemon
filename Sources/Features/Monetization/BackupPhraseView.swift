import SwiftUI

struct BackupPhraseView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("recoveryPhrase") private var recoveryPhrase: String = ""
    @State private var showCopiedAlert = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "key.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.yellow)
                    
                    Text("Your Recovery Phrase")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Save these 12 words to restore your account and Host License on any device.")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Words Grid
                let words = recoveryPhrase.split(separator: " ").map(String.init)
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
                
                // Copy Button
                Button(action: {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(recoveryPhrase, forType: .string)
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
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                if showCopiedAlert {
                    Text("✅ Copied!")
                        .foregroundColor(.green)
                        .font(.caption)
                }
                
                Spacer()
                
                Button("Done") {
                    dismiss()
                }
                .foregroundColor(.gray)
            }
            .padding(40)
        }
        .frame(width: 500, height: 600)
    }
}
