import SwiftUI

/// Simplified update view - Sparkle handles the UI
struct UpdateAvailableView: View {
    @ObservedObject var updateManager: UpdateManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 24) {
            // Icon
            Image(systemName: "arrow.down.circle.fill")
                .font(.system(size: 64))
                .foregroundColor(.accentColor)

            // Title
            Text("Check for Updates")
                .font(.title.weight(.bold))
                

            Text("Sparkle will check for updates automatically")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Manual check button
            Button(action: {
                updateManager.checkForUpdates()
                dismiss()
            }) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Check Now")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .buttonStyle(.plain)
            .padding(.horizontal)

            Button("Cancel") {
                dismiss()
            }
            .buttonStyle(.plain)
            .foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 400, height: 300)
    }
}
