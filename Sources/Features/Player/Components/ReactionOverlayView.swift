import SwiftUI
import Combine

struct ReactionParticleModel: Identifiable {
    let id = UUID()
    let emoji: String
    let startX: CGFloat
}

struct ReactionOverlayView: View {
    @ObservedObject var viewModel: MPVPlayerViewModel
    @ObservedObject var eventChatService = EventChatService.shared
    
    @State private var particles: [ReactionParticleModel] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(particles) { particle in
                    ReactionParticleView(
                        model: particle,
                        containerSize: geometry.size
                    ) { id in
                        removeParticle(id: id)
                    }
                }
            }
        }
        .allowsHitTesting(false) // Let interactions pass through to video
        .onReceive(viewModel.reactionTriggers) { emoji in
            addParticle(emoji)
        }
        .onReceive(eventChatService.reactionTriggers) { emoji in
            addParticle(emoji)
        }
    }
    
    private func addParticle(_ emoji: String) {
        // Respect global toggle
        guard viewModel.areReactionsEnabled else { return }
        
        // print("✨ ReactionOverlay: Adding particle for \(emoji)") // Removed debug log
        
        let newParticle = ReactionParticleModel(
            emoji: emoji,
            startX: CGFloat.random(in: 0.85...0.95)
        )
        particles.append(newParticle)
        
        // Safety limit
        if particles.count > 50 {
            particles.removeFirst()
        }
    }
    
    private func removeParticle(id: UUID) {
        particles.removeAll { $0.id == id }
    }
}

struct ReactionParticleView: View {
    let model: ReactionParticleModel
    let containerSize: CGSize
    let onComplete: (UUID) -> Void
    
    @State private var yOffset: CGFloat = 0
    @State private var opacity: Double = 0.0
    @State private var scale: CGFloat = 0.1
    @State private var xOffset: CGFloat = 0
    
    var body: some View {
        Text(model.emoji)
            .font(.system(size: 40))
            // .shadow(...) removed for performance
            .scaleEffect(scale)
            .opacity(opacity)
            // Use drawingGroup to rasterize via Metal, improving frame rate over video
            .drawingGroup()
            .position(
                x: containerSize.width * model.startX + xOffset,
                y: containerSize.height * 0.85 + yOffset
            )
            .onAppear {
                // 1. Pop In
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                    scale = 1.0
                    opacity = 1.0
                }
                
                // 2. Float Up & Fade Out
                withAnimation(.easeOut(duration: 3.0)) {
                    yOffset = -containerSize.height * 0.5 // Float up 50% of screen height
                    opacity = 0.0
                }
                
                // 3. Horizontal Drift
                withAnimation(.easeInOut(duration: 3.0)) {
                    xOffset = CGFloat.random(in: -30...30)
                }
                
                // 4. Cleanup
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    onComplete(model.id)
                }
            }
    }
}
