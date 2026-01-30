
import SwiftUI
struct PremiumPaymentView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 20) {
            Text("Premium Hosting License")
                .font(.title)
            Text("This feature is available in the official binary.")
                .foregroundColor(.secondary)
            Button("Close") { dismiss() }
                .buttonStyle(.borderedProminent)
        }
        .frame(width: 400, height: 300)
    }
}

