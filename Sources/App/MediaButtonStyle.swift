import SwiftUI

/// A premium, scalable button style for media items that provides
/// immediate visual feedback on click/press.
struct ScalableMediaButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .brightness(configuration.isPressed ? -0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == ScalableMediaButtonStyle {
    static var scalableMedia: ScalableMediaButtonStyle {
        ScalableMediaButtonStyle()
    }
}
