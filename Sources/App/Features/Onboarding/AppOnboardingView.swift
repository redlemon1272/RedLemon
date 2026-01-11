import SwiftUI

/// Onboarding view for first-time users explaining the app's core concepts
struct AppOnboardingView: View {
    @EnvironmentObject var appState: AppState
    @Binding var isPresented: Bool
    
    // Page state
    @State private var currentPage = 0
    
    // Onboarding Data
    struct OnboardingPage {
        let title: String
        let subtitle: String
        let description: String
        let icon: String // SF Symbol
        let color: Color
    }
    
    let pages: [OnboardingPage] = [
        OnboardingPage(
            title: "Welcome to RedLemon",
            subtitle: "The ultimate shared streaming experience",
            description: "Browse movies, TV shows, and watch together with friends in perfect sync.",
            icon: "popcorn.fill", // Fallback SF Symbol
            color: .yellow
        ),
        OnboardingPage(
            title: "Live Events (Cinema)",
            subtitle: "Global Synchronized Screenings",
            description: "Just like a real movie theater. Everyone watches the same movie at the exact same time worldwide. You can't pause, you can't rewind. It's an event!",
            icon: "calendar.badge.clock",
            color: .red
        ),
        OnboardingPage(
            title: "Private Rooms (Watch Party)",
            subtitle: "You Control The Show",
            description: "Create a private room for you and your friends. You pick the movie. You control playback (pause, seek) for everyone in the room.",
            icon: "person.3.fill",
            color: .blue
        ),
        OnboardingPage(
            title: "Ready?",
            subtitle: "Let's get started",
            description: "Create your unique username in the next step to start your journey.",
            icon: "checkmark.circle.fill",
            color: .green
        )
    ]
    
    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()
            
            // Subtle gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    pages[currentPage].color.opacity(0.1), 
                    Color.black
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Header Indicator
                HStack(spacing: 8) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Capsule()
                            .fill(currentPage == index ? pages[index].color : Color.white.opacity(0.2))
                            .frame(width: currentPage == index ? 24 : 8, height: 8)
                            .animation(.spring(), value: currentPage)
                    }
                }
                .padding(.top, 40)
                
                // Content Area
                VStack(spacing: 24) {
                    // Icon
                    Image(systemName: pages[currentPage].icon)
                        .font(.system(size: 80))
                        .foregroundStyle(pages[currentPage].color)
                        .symbolEffect(.bounce, value: currentPage) // iOS 17/macOS 14 effect, falls back gracefully
                        .shadow(color: pages[currentPage].color.opacity(0.5), radius: 20, x: 0, y: 0)
                        
                    // Title & Subtitle
                    VStack(spacing: 8) {
                        Text(pages[currentPage].title)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(pages[currentPage].subtitle)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(pages[currentPage].color)
                    }
                    
                    // Description
                    Text(pages[currentPage].description)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: 500)
                .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .move(edge: .leading).combined(with: .opacity)))
                .id(currentPage) // Force transition
                
                Spacer()
                
                // Navigation Buttons
                HStack {
                    // Back Button (hidden on first page)
                    if currentPage > 0 {
                        Button(action: {
                            withAnimation {
                                currentPage -= 1
                            }
                        }) {
                            Text("Back")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Spacer()
                    
                    // Next/Finish Button
                    Button(action: {
                        withAnimation {
                            if currentPage < pages.count - 1 {
                                currentPage += 1
                            } else {
                                closeOnboarding()
                            }
                        }
                    }) {
                        HStack {
                            Text(currentPage == pages.count - 1 ? "Get Started" : "Next")
                            if currentPage < pages.count - 1 {
                                Image(systemName: "arrow.right")
                            }
                        }
                        .font(.headline.weight(.semibold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(pages[currentPage].color)
                        .cornerRadius(12)
                        .shadow(color: pages[currentPage].color.opacity(0.4), radius: 10, x: 0, y: 5)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 60)
                .padding(.bottom, 60)
                .frame(maxWidth: 600)
            }
        }
        .frame(minWidth: 800, minHeight: 600)
    }
    
    private func closeOnboarding() {
        // Mark onboarding as complete in UserDefaults
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding_v1")
        
        withAnimation {
            isPresented = false
            
            // Trigger username setup if needed (AppState handles this normally, but we ensure flow continues)
            if appState.currentUserId == nil {
                appState.showUsernameSetup = true
            }
        }
    }
}
