import SwiftUI
import Combine

struct ReactionParticleModel: Identifiable {
    let id = UUID()
    let content: String
    let isText: Bool
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
            addParticle(emoji, isText: false)
        }
        .onReceive(eventChatService.reactionTriggers) { emoji in
            addParticle(emoji, isText: false)
        }
        .onReceive(viewModel.announcementTriggers) { text in
            addParticle(text, isText: true)
        }
    }
    
    private func addParticle(_ content: String, isText: Bool) {
        // Respect global toggle (maybe allow announcements even if reactions off? User said 'also appears on video screen', implies it's a specific 'Host Message' feature. Let's respect toggle for consistency for now, or maybe announcements override?)
        // Let's assume Announcements override 'Hide Reactions' because they are important, OR just respect the toggle.
        // User asked for "floating up the screen" so it's technically a reaction-style overlay.
        // If the user turned off reactions, they probably don't want floating stuff. 
        // BUT Announcements are "important". 
        // Let's respect the toggle for now to be safe.
        guard viewModel.areReactionsEnabled else { return }
        
        // print("✨ ReactionOverlay: Adding particle for \(content)")
        
        let newParticle = ReactionParticleModel(
            content: content,
            isText: isText,
            startX: isText ? 0.5 : CGFloat.random(in: 0.85...0.95) // Center text, random emojis
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
        Group {
            if model.isText {
                // Text Bubble Style
                Text(model.content)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 2)
            } else {
                // Emoji Style
                Text(model.content)
                    .font(.system(size: 40))
            }
        }
        .scaleEffect(scale)
        .opacity(opacity)
        // Use drawingGroup to rasterize via Metal, improving frame rate over video
        .drawingGroup()
        .position(
            x: model.isText ? containerSize.width * 0.5 : (containerSize.width * model.startX + xOffset), // Force text to center, emojis drift
            y: containerSize.height * 0.85 + yOffset
        )
        .onAppear {
            // Animation logic based on type
            let floatDuration = model.isText ? 5.0 : 3.0 // Text floats slower
            
            // 1. Pop In
            withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                scale = 1.0
                opacity = 1.0
            }
            
            // 2. Float Up & Fade Out
            withAnimation(.easeOut(duration: floatDuration)) {
                yOffset = -containerSize.height * (model.isText ? 0.4 : 0.5) // Text floats up less distance (stay in view)
                opacity = 0.0
            }
            
            // 3. Horizontal Drift (Only for emojis)
            if !model.isText {
                withAnimation(.easeInOut(duration: floatDuration)) {
                    xOffset = CGFloat.random(in: -30...30)
                }
            }
            
            // 4. Cleanup
            DispatchQueue.main.asyncAfter(deadline: .now() + floatDuration) {
                onComplete(model.id)
            }
        }
    }
}
