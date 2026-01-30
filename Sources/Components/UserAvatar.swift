//
//  UserAvatar.swift
//  RedLemon
//
//  A visually striking user avatar with deterministic gradients and geometric patterns
//

import SwiftUI

/// Generates a unique, visually appealing avatar for each user based on their username
struct UserAvatar: View {
    let username: String
    let size: CGFloat
    let isOnline: Bool
    let isHost: Bool
    let showOnlineIndicator: Bool

    init(
        username: String,
        size: CGFloat = 40,
        isOnline: Bool = false,
        isHost: Bool = false,
        showOnlineIndicator: Bool = true
    ) {
        self.username = username
        self.size = size
        self.isOnline = isOnline
        self.isHost = isHost
        self.showOnlineIndicator = showOnlineIndicator
    }

    // MARK: - Deterministic Color Generation

    /// Generate two gradient colors from username hash
    private var gradientColors: (Color, Color) {
        let hash = abs(username.lowercased().hashValue)

        // Rich, vibrant color palette organized as gradient pairs
        let palettes: [(Color, Color)] = [
            // Warm
            (Color(hue: 0.95, saturation: 0.7, brightness: 0.9), Color(hue: 0.05, saturation: 0.8, brightness: 0.85)),   // Rose → Coral
            (Color(hue: 0.08, saturation: 0.75, brightness: 0.95), Color(hue: 0.12, saturation: 0.85, brightness: 0.9)), // Orange → Amber

            // Cool
            (Color(hue: 0.55, saturation: 0.6, brightness: 0.9), Color(hue: 0.65, saturation: 0.7, brightness: 0.85)),   // Cyan → Blue
            (Color(hue: 0.7, saturation: 0.5, brightness: 0.9), Color(hue: 0.8, saturation: 0.6, brightness: 0.85)),     // Indigo → Purple

            // Fresh
            (Color(hue: 0.35, saturation: 0.6, brightness: 0.85), Color(hue: 0.45, saturation: 0.7, brightness: 0.8)),   // Lime → Teal
            (Color(hue: 0.4, saturation: 0.55, brightness: 0.9), Color(hue: 0.5, saturation: 0.65, brightness: 0.85)),   // Green → Cyan

            // Vibrant
            (Color(hue: 0.85, saturation: 0.6, brightness: 0.9), Color(hue: 0.75, saturation: 0.7, brightness: 0.85)),   // Pink → Violet
            (Color(hue: 0.6, saturation: 0.65, brightness: 0.95), Color(hue: 0.7, saturation: 0.55, brightness: 0.9)),   // Sky → Lavender

            // Deep
            (Color(hue: 0.58, saturation: 0.8, brightness: 0.7), Color(hue: 0.68, saturation: 0.7, brightness: 0.6)),    // Ocean → Deep Blue
            (Color(hue: 0.8, saturation: 0.7, brightness: 0.7), Color(hue: 0.9, saturation: 0.6, brightness: 0.65)),     // Plum → Magenta

            // Sunset
            (Color(hue: 0.05, saturation: 0.8, brightness: 0.95), Color(hue: 0.9, saturation: 0.7, brightness: 0.9)),    // Coral → Rose
            (Color(hue: 0.12, saturation: 0.9, brightness: 0.95), Color(hue: 0.02, saturation: 0.8, brightness: 0.85)),  // Gold → Red
        ]

        let index = hash % palettes.count
        return palettes[index]
    }

    /// Determine pattern seed from username
    private var patternSeed: Int {
        abs(username.hashValue)
    }

    /// Get the user's initials (1-2 characters)
    private var initials: String {
        let words = username.split(separator: " ")
        if words.count >= 2 {
            // Two words: use first letter of each
            return String(words[0].prefix(1) + words[1].prefix(1)).uppercased()
        } else if username.count >= 2 {
            // Single word with 2+ chars: use first letter only for cleaner look
            return String(username.prefix(1)).uppercased()
        } else {
            return String(username.prefix(1)).uppercased()
        }
    }

    var body: some View {
        ZStack {
            // Base gradient circle
            Circle()
                .fill(
                    LinearGradient(
                        colors: [gradientColors.0, gradientColors.1],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: size, height: size)

            // Geometric pattern overlay
            GeometricPattern(seed: patternSeed, size: size)
                .opacity(0.15)
                .clipShape(Circle())

            // Host glow ring
            if isHost {
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [DesignSystem.Colors.accent, DesignSystem.Colors.accent.opacity(0.5)],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: size * 0.06
                    )
                    .frame(width: size, height: size)
            }

            // Initials
            Text(initials)
                .font(.system(size: size * 0.4, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)

            // Online indicator
            if showOnlineIndicator && isOnline {
                Circle()
                    .fill(Color.green)
                    .frame(width: size * 0.28, height: size * 0.28)
                    .overlay(
                        Circle()
                            .stroke(Color(NSColor.windowBackgroundColor), lineWidth: size * 0.05)
                    )
                    .offset(x: size * 0.35, y: size * 0.35)
            }
        }
    }

    // MARK: - Static Color Helper (for chat names, etc.)

    /// Returns the primary gradient color for a username - use this for chat name colors
    static func primaryColor(for username: String) -> Color {
        let hash = abs(username.lowercased().hashValue)

        let palettes: [(Color, Color)] = [
            // Warm
            (Color(hue: 0.95, saturation: 0.7, brightness: 0.9), Color(hue: 0.05, saturation: 0.8, brightness: 0.85)),
            (Color(hue: 0.08, saturation: 0.75, brightness: 0.95), Color(hue: 0.12, saturation: 0.85, brightness: 0.9)),
            // Cool
            (Color(hue: 0.55, saturation: 0.6, brightness: 0.9), Color(hue: 0.65, saturation: 0.7, brightness: 0.85)),
            (Color(hue: 0.7, saturation: 0.5, brightness: 0.9), Color(hue: 0.8, saturation: 0.6, brightness: 0.85)),
            // Fresh
            (Color(hue: 0.35, saturation: 0.6, brightness: 0.85), Color(hue: 0.45, saturation: 0.7, brightness: 0.8)),
            (Color(hue: 0.4, saturation: 0.55, brightness: 0.9), Color(hue: 0.5, saturation: 0.65, brightness: 0.85)),
            // Vibrant
            (Color(hue: 0.85, saturation: 0.6, brightness: 0.9), Color(hue: 0.75, saturation: 0.7, brightness: 0.85)),
            (Color(hue: 0.6, saturation: 0.65, brightness: 0.95), Color(hue: 0.7, saturation: 0.55, brightness: 0.9)),
            // Deep
            (Color(hue: 0.58, saturation: 0.8, brightness: 0.7), Color(hue: 0.68, saturation: 0.7, brightness: 0.6)),
            (Color(hue: 0.8, saturation: 0.7, brightness: 0.7), Color(hue: 0.9, saturation: 0.6, brightness: 0.65)),
            // Sunset
            (Color(hue: 0.05, saturation: 0.8, brightness: 0.95), Color(hue: 0.9, saturation: 0.7, brightness: 0.9)),
            (Color(hue: 0.12, saturation: 0.9, brightness: 0.95), Color(hue: 0.02, saturation: 0.8, brightness: 0.85)),
        ]

        let index = hash % palettes.count
        return palettes[index].0 // Return the primary (first) color
    }
}

// MARK: - Geometric Pattern Overlay

/// Generates unique geometric shapes based on a seed
struct GeometricPattern: View {
    let seed: Int
    let size: CGFloat

    private var shapes: [PatternShape] {
        var result: [PatternShape] = []
        let shapeCount = 3 + (seed % 3) // 3-5 shapes

        for i in 0..<shapeCount {
            let shapeSeed = seed &+ i &* 7919 // Prime multiplier for variation
            let shapeType = shapeSeed % 4

            let x = CGFloat((shapeSeed >> 4) % 100) / 100.0
            let y = CGFloat((shapeSeed >> 8) % 100) / 100.0
            let shapeSize = 0.2 + CGFloat((shapeSeed >> 12) % 30) / 100.0
            let rotation = Double((shapeSeed >> 16) % 360)

            result.append(PatternShape(
                type: shapeType,
                x: x,
                y: y,
                size: shapeSize,
                rotation: rotation
            ))
        }
        return result
    }

    var body: some View {
        Canvas { context, canvasSize in
            for shape in shapes {
                let centerX = shape.x * canvasSize.width
                let centerY = shape.y * canvasSize.height
                let shapeSize = shape.size * min(canvasSize.width, canvasSize.height)

                var path = Path()

                switch shape.type {
                case 0: // Circle
                    path.addEllipse(in: CGRect(
                        x: centerX - shapeSize/2,
                        y: centerY - shapeSize/2,
                        width: shapeSize,
                        height: shapeSize
                    ))
                case 1: // Triangle
                    let points = trianglePoints(center: CGPoint(x: centerX, y: centerY), size: shapeSize, rotation: shape.rotation)
                    path.move(to: points[0])
                    path.addLine(to: points[1])
                    path.addLine(to: points[2])
                    path.closeSubpath()
                case 2: // Diamond
                    path.move(to: CGPoint(x: centerX, y: centerY - shapeSize/2))
                    path.addLine(to: CGPoint(x: centerX + shapeSize/2, y: centerY))
                    path.addLine(to: CGPoint(x: centerX, y: centerY + shapeSize/2))
                    path.addLine(to: CGPoint(x: centerX - shapeSize/2, y: centerY))
                    path.closeSubpath()
                default: // Square
                    let rect = CGRect(
                        x: centerX - shapeSize/2,
                        y: centerY - shapeSize/2,
                        width: shapeSize,
                        height: shapeSize
                    )
                    path.addRect(rect)
                }

                context.fill(path, with: .color(.white))
            }
        }
        .frame(width: size, height: size)
    }

    private func trianglePoints(center: CGPoint, size: CGFloat, rotation: Double) -> [CGPoint] {
        let angle = rotation * .pi / 180
        var points: [CGPoint] = []

        for i in 0..<3 {
            let pointAngle = angle + Double(i) * (2 * .pi / 3) - .pi / 2
            points.append(CGPoint(
                x: center.x + cos(pointAngle) * size / 2,
                y: center.y + sin(pointAngle) * size / 2
            ))
        }
        return points
    }
}

private struct PatternShape {
    let type: Int
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
    let rotation: Double
}

// MARK: - Preview

#if DEBUG
struct UserAvatar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            HStack(spacing: 16) {
                UserAvatar(username: "Alice", size: 60, isOnline: true)
                UserAvatar(username: "Bob", size: 60, isOnline: false)
                UserAvatar(username: "Charlie", size: 60, isOnline: true, isHost: true)
            }

            HStack(spacing: 16) {
                UserAvatar(username: "Daniel", size: 40)
                UserAvatar(username: "Emma", size: 40)
                UserAvatar(username: "Frank", size: 40)
                UserAvatar(username: "Grace", size: 40)
            }

            HStack(spacing: 8) {
                ForEach(["Zoe", "Max", "Ivy", "Leo", "Mia", "Kai"], id: \.self) { name in
                    UserAvatar(username: name, size: 32, showOnlineIndicator: false)
                }
            }
        }
        .padding()
        .background(Color.black)
    }
}
#endif
