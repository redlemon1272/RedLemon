import SwiftUI

struct Constants {
    static func avatarColor(for username: String) -> Color {
        let colors: [Color] = [.blue, .green, .orange, .pink, .purple, .red, .teal, .yellow]
        let hash = abs(username.hashValue)
        let index = hash % colors.count
        return colors[index].opacity(0.8)
    }
}
