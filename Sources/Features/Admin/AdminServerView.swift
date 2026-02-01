
import SwiftUI
struct AdminServerView: View {
    var body: some View {
        VStack {
            Image(systemName: "lock.shield.fill")
                .font(.system(size: 64))
                .foregroundColor(.orange)
            Text("Admin Panel Restricted")
                .font(.title)
            Text("Server management logic is omitted from the public repository.")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

