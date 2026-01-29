import SwiftUI

struct QualitySelectionView: View {
    @EnvironmentObject var appState: AppState

    let mediaItem: MediaItem

    @State private var selectedQuality: VideoQuality = .fullHD
    @State private var watchMode: WatchMode = .solo
    @State private var roomDescription: String = ""
    @State private var isPublicRoom: Bool = true
    @State private var showPremiumSheet: Bool = false
    @ObservedObject private var licenseManager = LicenseManager.shared

    @State private var metadata: MediaMetadata?
    @State private var isLoading = true

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                // Blurred background art
                // Blurred background art - Consolidated to avoid flashing during switch
                let backgroundPath = metadata?.backgroundURL ?? mediaItem.background
                if let path = backgroundPath, let url = URL(string: path) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .blur(radius: 40)
                                .overlay(Color.black.opacity(0.7))
                                .clipped()
                        default:
                            Color(NSColor.windowBackgroundColor)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    }
                } else {
                    Color(NSColor.windowBackgroundColor)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }

                VStack(spacing: 0) {
                    // Back button toolbar
                    HStack {
                        Button(action: {
                            appState.currentView = .mediaDetail
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "chevron.left")
                                .font(.system(size: 14, weight: .semibold))
                                Text("Back")
                                .font(.system(size: 15, weight: .semibold))
                            }
                            .foregroundColor(.white) // Use white for better contrast
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.white.opacity(0.1)) // More subtle background
                            .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding()

                        Spacer()
                    }
                    .background(Color.clear) // Transparent background for toolbar

                    // Content - Using ScrollView to prevent compression of logo art
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                        // Header
                        VStack(spacing: 8) {
                            // Try to use fetched metadata logo first, then fall back to passed mediaItem logo, then text
                            let logoPath = metadata?.logoURL ?? mediaItem.logo
                            if let logoString = logoPath, let url = URL(string: logoString) {
                                // Logo Art
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: min(geometry.size.width * 0.8, 850), maxHeight: 220)
                                            .shadow(color: .black.opacity(0.8), radius: 30, x: 0, y: 15)
                                    default:
                                        // While loading OR on failure, show title text to avoid empty space/flash
                                        Text(mediaItem.name)
                                            .font(.title2.weight(.bold))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.white)
                                    }
                                }
                            } else {
                                // Plain Text Fallback
                                Text(mediaItem.name)
                                    .font(.title2.weight(.bold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }


                        }
                        .padding(.top, 40) // Balanced padding for big logo

                        // Main content - Centered Watch Mode
                        VStack(alignment: .center, spacing: 24) {
                            // Watch Mode Selection
                            VStack(alignment: .center, spacing: 16) {


                                HStack(spacing: 40) {
                                    Button(action: {
                                        watchMode = .solo
                                    }) {
                                        WatchModeButton(
                                            title: "Watch Solo",
                                            icon: "person.fill",
                                            description: "Private cinematic experience",
                                            isSelected: watchMode == .solo
                                        )
                                    }
                                    .buttonStyle(.plain)
                                    .frame(width: 280, height: 320)

                                    Button(action: {
                                        watchMode = .watchParty
                                    }) {
                                        WatchModeButton(
                                            title: "Watch Party",
                                            icon: "person.3.fill",
                                            description: "Invite friends and sync playback",
                                            isSelected: watchMode == .watchParty
                                        )
                                    }
                                    .buttonStyle(.plain)
                                    .frame(width: 280, height: 320)
                                }

                                // Free user warning when Watch Party is selected
                                if watchMode == .watchParty && !licenseManager.isPremium {
                                    if licenseManager.timeUntilNextFreeRoom > 0 {
                                        // CASE 1: BLOCKED (Cooldown Active)
                                        HStack(spacing: 8) {
                                            Image(systemName: "clock.badge.exclamationmark.fill")
                                                .foregroundColor(.red)
                                            VStack(alignment: .leading, spacing: 2) {
                                                Text("Limit Reached")
                                                    .font(.subheadline.weight(.bold))
                                                    .foregroundColor(.red)

                                                Text("Next free party in: \(licenseManager.formattedCooldownTime)")
                                                    .font(.caption)
                                                    .foregroundColor(.white.opacity(0.7))
                                            }
                                            Spacer()
                                            Button("Upgrade") {
                                                showPremiumSheet = true
                                            }
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(Color.accentColor)
                                            .cornerRadius(6)
                                        }
                                        .padding(12)
                                        .background(Color.red.opacity(0.1))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.red.opacity(0.3), lineWidth: 1)
                                        )
                                        .frame(maxWidth: 400)
                                        .padding(.top, 8)
                                    } else {
                                        // CASE 2: ALLOWED (Warning about consumption)
                                        HStack(spacing: 8) {
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .foregroundColor(.orange)
                                            VStack(alignment: .leading, spacing: 2) {
                                                Text("Free users can host 1 room every 24 hours (1 day)")
                                                    .font(.caption)
                                                    .foregroundColor(.white.opacity(0.7))
                                                    .fixedSize(horizontal: false, vertical: true)
                                            }
                                            Spacer()
                                            Button("Upgrade") {
                                                showPremiumSheet = true
                                            }
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 6)
                                            .background(Color.accentColor)
                                            .cornerRadius(6)
                                        }
                                        .padding(12)
                                        .background(Color.orange.opacity(0.1))
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                                        )
                                        .frame(maxWidth: 400)
                                        .padding(.top, 8)
                                    }
                                }

                                // NEW: Room Settings (Only for Watch Party)
                                if watchMode == .watchParty {
                                    VStack(alignment: .center, spacing: 12) {
                                        Text("Room Settings")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.top, 4)

                                        TextField("Room Description (optional)", text: $roomDescription)
                                            .textFieldStyle(PlainTextFieldStyle())
                                            .multilineTextAlignment(.center)
                                            .padding(8)
                                            .background(Color.white.opacity(0.1))
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                            .frame(width: 300)

                                        Toggle("Public (Visible in Rooms)", isOn: $isPublicRoom)
                                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                                            .foregroundColor(.white)
                                    }
                                    .transition(.opacity)
                                    .padding(.top, 8)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                        .padding(.top, 40)
                        .padding(.bottom, 20)

                        // Action Buttons - Use white text and transparent backgrounds for harmony
                        VStack(spacing: 12) {
                            if appState.player.isResolvingStream || appState.isLoadingRoom {
                                ProgressView(appState.isLoadingRoom ? "Creating room..." : "Finding best stream...")
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .padding()
                                    .colorScheme(.dark)
                                    .id("loading-progress")
                            } else {
                                Button(action: startPlayback) {
                                    HStack {
                                        Image(systemName: watchMode == .watchParty ? "person.3.fill" : "play.fill")
                                        Text(watchMode == .watchParty ? "Create Room" : "Start Watching")
                                            .font(.body.weight(.semibold))
                                    }
                                    .frame(maxWidth: 600)
                                    .padding(.vertical, 20)
                                    .background(Color.accentColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(16)
                                    .shadow(color: .accentColor.opacity(0.4), radius: 20, x: 0, y: 10)
                                }
                                .buttonStyle(.plain)

                                if let error = appState.player.streamError {
                                    Text(error)
                                        .font(.caption)
                                        .foregroundColor(.red)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                        .padding(.bottom, 60)
                    }
                }
            }
        }
    }
    .sheet(isPresented: $showPremiumSheet) {
            PremiumPaymentView()
        }
        .alert("Hosting Limit Reached", isPresented: Binding(
            get: { appState.player.showPremiumLimitAlert },
            set: { appState.player.showPremiumLimitAlert = $0 }
        )) {
            Button("Upgrade to Premium") {
                showPremiumSheet = true
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            if let serverMessage = appState.player.premiumLimitMessage {
                Text(serverMessage)
            } else if licenseManager.timeUntilNextFreeRoom > 0 {
                Text("You have reached the free hosting limit (1 room / 24h). Next available slot: \(licenseManager.formattedCooldownTime). Upgrade to Premium for unlimited hosting!")
            } else {
                Text("Free users can only host one watch party every 24 hours. Upgrade now for unlimited hosting!")
            }
        }
        .onAppear {
            // Check status immediately
            Task {
                await licenseManager.checkHostingLimit()
            }

            // Load metadata to ensure we have the logo
            Task {
                await loadMetadata()
            }

            // Sync with global state (e.g. if coming from "Resume Watch Party")
            if appState.player.currentWatchMode == .watchParty {
                self.watchMode = .watchParty
            }
        }
    }

    @MainActor
    private func loadMetadata() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let meta = try await LocalAPIClient.shared.fetchMetadata(type: mediaItem.type, id: mediaItem.id)
            self.metadata = meta
        } catch {
            print("Failed to load metadata in QualitySelection: \(error)")
        }
    }

    private func startPlayback() {
        if watchMode == .watchParty {
            // Create room and navigate to lobby
            Task {
                await appState.player.createWatchPartyAndNavigate(
                    mediaItem: mediaItem,
                    season: (mediaItem.type == "series" ? appState.selectedSeason : nil),
                    episode: (mediaItem.type == "series" ? appState.selectedEpisode : nil),
                    quality: selectedQuality,
                    isPublic: isPublicRoom,
                    description: roomDescription.isEmpty ? nil : roomDescription
                )
            }
        } else {
            // Start solo playback immediately
            Task {
                await appState.player.playMedia(mediaItem, quality: selectedQuality, watchMode: watchMode)
            }
        }
    }
}



struct WatchModeButton: View {
    let title: String
    let icon: String
    let description: String
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 64))
                .foregroundColor(isSelected ? .accentColor : .white.opacity(0.4))
                .shadow(color: isSelected ? .accentColor.opacity(0.5) : .clear, radius: 10)

            VStack(spacing: 8) {
                Text(title)
                    .font(.title2.weight(.bold))
                    .foregroundColor(.white)

                Text(description)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.6))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
            }
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            ZStack {
                if isSelected {
                    Color.accentColor.opacity(0.15)
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.accentColor, lineWidth: 4)
                        .shadow(color: .accentColor.opacity(0.3), radius: 15)
                } else {
                    Color.white.opacity(0.05)
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.white.opacity(0.1), lineWidth: 2)
                }
            }
        )
        .cornerRadius(24)
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
        .contentShape(Rectangle()) // Hit testing for entire area
    }
}
