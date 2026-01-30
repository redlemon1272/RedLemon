
import SwiftUI
struct AdminDashboardView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Developer Dashboard")
                .font(.title)
            Text("Administrative tools are not included in the source distribution.")
                .foregroundColor(.secondary)
            Button("Close") { dismiss() }
        }
        .frame(width: 500, height: 400)
    }
}

