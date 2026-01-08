import SwiftUI

struct QualitySelectionView: View {
    @EnvironmentObject var appState: AppState

    let mediaItem: MediaItem

    @State private var selectedQuality: VideoQuality = .fullHD
    @State private var watchMode: WatchMode = .solo
    @State private var roomDescription: String = ""
    @State private var isPublicRoom: Bool = true
    @State private var showPremiumSheet: Bool = false
    @StateObject private var licenseManager = LicenseManager.shared

    var body: some View {
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
                    .foregroundColor(.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
                .padding()

                Spacer()
            }
            .background(Color(NSColor.windowBackgroundColor))

            // Content - No ScrollView, everything fits
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 8) {
                    Text(mediaItem.name)
                        .font(.title2)
                        .fontWeight(.bold)

                    if let year = mediaItem.year {
                        Text(year)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 20)

                Spacer()

                // Main content - Centered Watch Mode
                VStack(alignment: .center, spacing: 24) {
                    // Watch Mode Selection
                    VStack(alignment: .center, spacing: 16) {
                        Text("Watch Mode")
                            .font(.headline)
                            .foregroundColor(.primary)

                        HStack(spacing: 24) {
                            Button(action: {
                                watchMode = .solo
                            }) {
                                WatchModeButton(
                                    title: "Watch Solo",
                                    icon: "person.fill",
                                    description: "Private room",
                                    isSelected: watchMode == .solo
                                )
                            }
                            .buttonStyle(.plain)
                            .frame(width: 180, height: 120)

                            Button(action: {
                                watchMode = .watchParty
                            }) {
                                WatchModeButton(
                                    title: "Watch Party",
                                    icon: "person.3.fill",
                                    description: "Invite friends",
                                    isSelected: watchMode == .watchParty
                                )
                            }
                            .buttonStyle(.plain)
                            .frame(width: 180, height: 120)
                        }

                        // NEW: Room Settings (Only for Watch Party)
                        if watchMode == .watchParty {
                            VStack(alignment: .center, spacing: 12) {
                                Text("Room Settings")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding(.top, 4)
                                
                                TextField("Room Description (optional)", text: $roomDescription)
                                    .textFieldStyle(PlainTextFieldStyle())
                                    .multilineTextAlignment(.center)
                                    .padding(8)
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(8)
                                    .frame(width: 300)
                                
                                Toggle("Public Room (Visible in Browse)", isOn: $isPublicRoom)
                                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                            }
                            .transition(.opacity)
                            .padding(.top, 8)
                        }
                    }
                }
                .padding(.horizontal, 40)

                Spacer()

                // Action Buttons
                VStack(spacing: 12) {
                    if appState.player.isResolvingStream || appState.isLoadingRoom {
                        ProgressView(appState.isLoadingRoom ? "Creating room..." : "Finding best stream...")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .padding()
                            .id("loading-progress") // Force stable identity
                    } else {
                        Button(action: startPlayback) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Start Watching")
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
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

                    Button("Cancel") {
                        appState.currentView = .mediaDetail
                    }
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
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
                Text("You have reached the free hosting limit (1 room / 72h). Next available slot: \(licenseManager.formattedCooldownTime). Upgrade to Premium for unlimited hosting!")
            } else {
                Text("Free users can only host one watch party every 72 hours. Upgrade now for unlimited hosting!")
            }
        }
        .onAppear {
            // Sync with global state (e.g. if coming from "Resume Watch Party")
            if appState.player.currentWatchMode == .watchParty {
                self.watchMode = .watchParty
            }
        }
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
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 32))
                .foregroundColor(isSelected ? .accentColor : .secondary)

            Text(title)
                .font(.headline)

            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(isSelected ? Color.accentColor.opacity(0.1) : Color.clear)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.accentColor : Color.secondary.opacity(0.3), lineWidth: 2)
        )
    }
}
