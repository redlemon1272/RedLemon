//
//  SettingsView.swift
//  RedLemon
//
//  Settings view for API credentials and app preferences
//

import SwiftUI

struct SettingsView: View {

    @EnvironmentObject var updateManager: UpdateManager
    @EnvironmentObject var appState: AppState

    // MARK: - App Version
    private var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
           let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return "\(version) (build \(build))"
        }
        return "Unknown"
    }
    @State private var realDebridToken: String = ""
    @State private var subDLApiKey: String = ""
    @State private var isLoading = false
    @State private var saveMessage: String?
    @State private var messageType: MessageType = .success

    // Username State
    @State private var currentUsername: String = ""

    enum MessageType {
        case success
        case error
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Update notification banner (if update available)
                if updateManager.updateAvailable {
                    updateBanner
                }

                header

                credentialsSection

                usernameSection

                aboutSection

                Spacer(minLength: 40)
            }
            .padding(60)
            .frame(maxWidth: 1200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(NSColor.windowBackgroundColor))
        .task {
            await loadCredentials()
            // Load username from UserDefaults and sync with AppState
            if let username = UserDefaults.standard.string(forKey: "redlemon.username") {
                currentUsername = username
            } else if !appState.currentUsername.isEmpty {
                currentUsername = appState.currentUsername
            }
        }
        .onChange(of: appState.currentUsername) { newUsername in
            // Sync when AppState changes
            currentUsername = newUsername
        }
    }

    // MARK: - Sections

    private var header: some View {
        VStack(spacing: 12) {
            Image(systemName: "gearshape.fill")
                .font(.system(size: 64))
                .foregroundColor(.blue)

            Text("Settings")
                .font(.system(size: 42, weight: .bold))

            Text("Configure your API credentials")
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .padding(.bottom, 30)
    }

    private var credentialsSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("API Credentials")
                .font(.system(size: 28, weight: .semibold))

            // Real-Debrid Token
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "key.fill")
                        .font(.title2)
                        .foregroundColor(.orange)
                    Text("Real-Debrid API Token")
                        .font(.title3.weight(.semibold))

                    Spacer()

                    // Status indicator
                    HStack(spacing: 6) {
                        Circle()
                            .fill(realDebridToken.isEmpty ? Color.red : Color.green)
                            .frame(width: 10, height: 10)
                        Text(realDebridToken.isEmpty ? "Not Set" : "Active")
                            .font(.body)
                            .foregroundColor(realDebridToken.isEmpty ? .red : .green)
                    }
                }

                Text("Premium debrid service for cached torrents")
                    .font(.body)
                    .foregroundColor(.secondary)

                SecureField("Paste your Real-Debrid token here", text: $realDebridToken)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(.title3, design: .monospaced))

                Link("Get your token →", destination: URL(string: "https://real-debrid.com/apitoken")!)
                    .font(.body)
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)

            // SubDL API Key
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "text.bubble.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                    Text("SubDL API Key")
                        .font(.title3.weight(.semibold))

                    Spacer()

                    // Status indicator
                    HStack(spacing: 6) {
                        Circle()
                            .fill(subDLApiKey.isEmpty ? Color.red : Color.green)
                            .frame(width: 10, height: 10)
                        Text(subDLApiKey.isEmpty ? "Not Set" : "Active")
                            .font(.body)
                            .foregroundColor(subDLApiKey.isEmpty ? .red : .green)
                    }
                }

                Text("Subtitle service for automatic subtitle fetching")
                    .font(.body)
                    .foregroundColor(.secondary)

                SecureField("Paste your SubDL API key here", text: $subDLApiKey)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(.title3, design: .monospaced))

                Link("Get your API key →", destination: URL(string: "https://subdl.com/panel/api")!)
                    .font(.body)
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)

            // Save Button
            HStack {
                Spacer()

                Button(action: saveCredentials) {
                    HStack(spacing: 8) {
                        if isLoading {
                            ProgressView()
                                .scaleEffect(0.9)
                                .frame(width: 20, height: 20)
                        } else {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title3)
                        }
                        Text("Save Credentials")
                            .font(.title3)
                    }
                    .padding(.vertical, 14)
                }
                .buttonStyle(.borderedProminent)
                .frame(minWidth: 220)
                .disabled(isLoading)
            }

            // Save Message
            if let message = saveMessage {
                HStack(spacing: 12) {
                    Image(systemName: messageType == .success ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                        .font(.title3)
                        .foregroundColor(messageType == .success ? .green : .red)
                    Text(message)
                        .font(.body)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(messageType == .success ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                .cornerRadius(12)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
    }


    private var usernameSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Username")
                .font(.system(size: 28, weight: .semibold))

            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                    Text("Your Username")
                        .font(.title3.weight(.semibold))

                    Spacer()

                    // Status indicator
                    HStack(spacing: 6) {
                        Circle()
                            .fill(currentUsername.isEmpty ? Color.orange : Color.green)
                            .frame(width: 10, height: 10)
                        Text(currentUsername.isEmpty ? "Not Set" : "Active")
                            .font(.body)
                            .foregroundColor(currentUsername.isEmpty ? .orange : .green)
                    }
                }

                Text("Your unique username for watch parties and friend discovery")
                    .font(.body)
                    .foregroundColor(.secondary)

                // Show username if set
                if !currentUsername.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        // Username
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Username:")
                                .font(.caption.weight(.semibold))
                                .foregroundColor(.secondary)

                            HStack {
                                Text("@\(currentUsername)")
                                    .font(.system(.title3, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)

                                Spacer()
                            }
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(8)
                        }

                        // User ID (if available)
                        if let userId = appState.currentUserId {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("User ID:")
                                    .font(.caption.weight(.semibold))
                                    .foregroundColor(.secondary)

                                Text(userId.uuidString)
                                    .font(.system(.caption, design: .monospaced))
                                    .foregroundColor(.secondary)
                                    .padding(8)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
                                    .cornerRadius(6)
                            }
                        }

                        // Info text
                        HStack(spacing: 6) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.blue)
                            Text("Username is permanent and cannot be changed")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 4)
                    }
                }

                // Set username button (only if not set)
                if currentUsername.isEmpty {
                    Button(action: {
                        appState.showUsernameSetup = true
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "person.badge.plus")
                                .font(.body)
                            Text("Set Username")
                                .font(.body.weight(.medium))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)
        }
    }

    private var updateBanner: some View {
        Button(action: {
            updateManager.checkForUpdates()
        }) {
            HStack(spacing: 16) {
                Image(systemName: "arrow.down.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.white)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Update Available")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    Text("A new version of RedLemon is ready to install")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.9))
                }

                Spacer()

                Text("Install Now")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(8)
            }
            .padding(20)
            .background(
                LinearGradient(
                    colors: [Color.blue, Color.blue.opacity(0.8)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
    }

    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("About")
                .font(.system(size: 28, weight: .semibold))

            VStack(alignment: .leading, spacing: 12) {
                InfoRow(label: "App", value: "RedLemon Native")
                InfoRow(label: "Version", value: appVersion)
                InfoRow(label: "Server", value: Config.serverURL)
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)
        }
    }

    // MARK: - Actions

    private func loadCredentials() async {
        // Load from KeychainManager
        if let rdToken = await KeychainManager.shared.get(service: "realdebrid") {
            realDebridToken = rdToken
        }

        if let subdlKey = await KeychainManager.shared.get(service: "subdl") {
            subDLApiKey = subdlKey
        }
    }

    private func saveCredentials() {
        isLoading = true
        saveMessage = nil

        Task {
            do {
                // Save Real-Debrid token
                if !realDebridToken.isEmpty {
                    try await KeychainManager.shared.save(
                        credential: realDebridToken.trimmingCharacters(in: .whitespacesAndNewlines),
                        for: "realdebrid"
                    )
                }

                // Save SubDL API key
                if !subDLApiKey.isEmpty {
                    try await KeychainManager.shared.save(
                        credential: subDLApiKey.trimmingCharacters(in: .whitespacesAndNewlines),
                        for: "subdl"
                    )
                }

                await MainActor.run {
                    messageType = .success
                    saveMessage = "✅ Credentials saved successfully!"
                    isLoading = false
                }

                // Clear message after 3 seconds
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                await MainActor.run {
                    withAnimation {
                        saveMessage = nil
                    }
                }

            } catch {
                await MainActor.run {
                    messageType = .error
                    saveMessage = "❌ Failed to save credentials: \(error.localizedDescription)"
                    isLoading = false
                }
            }
        }
    }
}


// MARK: - Info Row Component

struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.body)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .font(.system(.body, design: .monospaced))
        }
    }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .frame(width: 800, height: 600)
    }
}
