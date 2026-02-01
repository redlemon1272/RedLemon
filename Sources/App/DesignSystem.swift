import SwiftUI

/// The 'Stitch' Design System
/// A premium, glassmorphism-based design language for RedLemon.
struct DesignSystem {
    
    struct Colors {
        /// Deep, almost-black background for the main window
        static let background = Color(hex: "050510")
        
        /// Vibrant Accent Color (Safety Orange / Gold)
        static let accent = Color(hex: "FFAA00")
        
        /// Notification Badge Color (Red)
        static let notification = Color(hex: "FF3B30")
        
        /// Soft Glow Color (Red-Orange)
        static let glow = Color(hex: "FF5500")
        
        /// Semi-transparent surface for glassmorphism
        static let glassSurface = Color.white.opacity(0.08)
        
        /// Secondary text color
        static let textSecondary = Color.white.opacity(0.6)
        
        /// Border color for glass elements
        static let glassBorder = Color.white.opacity(0.15)
    }
    
    struct Gradients {
        static let backgroundMesh = LinearGradient(
            colors: [
                Color(hex: "050510"),
                Color(hex: "100A20"),
                Color(hex: "000000")
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let premiumGold = LinearGradient(
            colors: [
                Color(hex: "FFCC00"),
                Color(hex: "FFAA00")
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

// MARK: - View Modifiers

struct StitchGlass: ViewModifier {
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(DesignSystem.Colors.glassSurface)
                    .blur(radius: 0) // Blur handled by material in native macOS if needed, but here simulating
            )
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.black.opacity(0.4))
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 1)
            )
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct StitchGlow: ViewModifier {
    var color: Color
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(0.6), radius: radius, x: 0, y: 0)
    }
}

struct StitchCard: ViewModifier {
    var isHovered: Bool
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                ZStack {
                    // Base Glass
                    RoundedRectangle(cornerRadius: 16)
                        .fill(isSelected ? DesignSystem.Colors.accent.opacity(0.15) : DesignSystem.Colors.glassSurface)
                    
                    // Border
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(
                            isSelected ? DesignSystem.Colors.accent : DesignSystem.Colors.glassBorder,
                            lineWidth: isSelected ? 2 : 1
                        )
                }
            )
            // Glow effect on selection or hover
            .shadow(
                color: isSelected ? DesignSystem.Colors.glow.opacity(0.5) : (isHovered ? DesignSystem.Colors.glow.opacity(0.2) : .clear),
                radius: isSelected ? 15 : 10
            )
            .scaleEffect(isHovered && !isSelected ? 1.02 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isHovered)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}

// MARK: - Extensions

extension View {
    func stitchGlass(cornerRadius: CGFloat = 16) -> some View {
        self.modifier(StitchGlass(cornerRadius: cornerRadius))
    }
    
    func stitchGlow(color: Color = DesignSystem.Colors.glow, radius: CGFloat = 10) -> some View {
        self.modifier(StitchGlow(color: color, radius: radius))
    }
    
    func stitchCard(isHovered: Bool = false, isSelected: Bool = false) -> some View {
        self.modifier(StitchCard(isHovered: isHovered, isSelected: isSelected))
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
