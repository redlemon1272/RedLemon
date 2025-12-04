//
//  SettingsView.swift
//  RedLemon
//
//  Settings view for API credentials and app preferences
//

import SwiftUI
import Foundation
import AppKit
import UniformTypeIdentifiers

struct SettingsView: View {

    @EnvironmentObject var updateManager: UpdateManager
    @EnvironmentObject var appState: AppState
    @StateObject private var licenseManager = LicenseManager.shared

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

    // Real-Debrid User Info
    @State private var rdUserInfo: RDUserInfo?
    @State private var rdInfoLoading = false

    // Username State
    @State private var currentUsername: String = ""

    // Reset State
    @State private var isResetting = false
    @State private var resetMessage: String?
    @State private var showingResetConfirmation = false

    // Recovery Phrase State
    // @State private var recoveryPhrase: String = ""
    // @State private var showRecoveryPhrase = false
    @State private var copyMessage: String?
    @State private var showRestoreAccount = false

    // Payment State
    @State private var showPaymentGate = false
    
    // Admin State
    @State private var showAdminDashboard = false

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

                licenseSection

                usernameSection

                recoveryPhraseSection

                resetSection

                adminSection

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

            // Load recovery phrase - REMOVED
            // await loadRecoveryPhrase()
        }
        .onChange(of: appState.currentUsername) { newUsername in
            // Sync when AppState changes
            currentUsername = newUsername
        }
        .alert("Reset User Data", isPresented: $showingResetConfirmation) {
            Button("Cancel", role: .cancel) { }
            Button("Reset Everything", role: .destructive) {
                Task {
                    await resetUserData()
                }
            }
        } message: {
            Text("This will erase your username '@\(currentUsername)' and all local data from this device. Make sure you have saved your recovery phrase if you want to restore your account later.")
        }
        .sheet(isPresented: $showRestoreAccount) {
            RestoreAccountView()
        }
        .sheet(isPresented: $showPaymentGate) {
            PaymentGateView()
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

                TextField("Paste your Real-Debrid token here", text: $realDebridToken)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(.title3, design: .monospaced))
                    .onChange(of: realDebridToken) { newValue in
                        if !newValue.isEmpty {
                            Task {
                                await loadRDUserInfo()
                            }
                        }
                    }

                // Premium days display - simplified for macOS 12 compatibility
                if let userInfo = rdUserInfo,
                   let premiumDays = userInfo.daysRemaining,
                   premiumDays >= 0 {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 8) {
                            Image(systemName: "calendar.badge.clock")
                                .foregroundColor(premiumDays > 30 ? .green : (premiumDays > 7 ? .orange : .red))
                            Text("\(premiumDays) days remaining")
                                .font(.body.weight(.semibold))
                                .foregroundColor(premiumDays > 30 ? .green : (premiumDays > 7 ? .orange : .red))
                        }

                        if premiumDays <= 7 {
                            Text("Your premium is expiring soon!")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Link("Renew Premium →", destination: URL(string: "https://real-debrid.com/premium")!)
                            .font(.caption)
                    }
                    .padding(12)
                    .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
                    .cornerRadius(8)
                }




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

                TextField("Paste your SubDL API key here", text: $subDLApiKey)
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

    private var licenseSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("License & Payments")
                .font(.system(size: 28, weight: .semibold))

            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "bitcoinsign.circle.fill")
                        .font(.title2)
                        .foregroundColor(.orange)
                    Text("Host License")
                        .font(.title3.weight(.semibold))

                    Spacer()

                    // Status indicator
                    HStack(spacing: 6) {
                        Circle()
                            .fill(licenseManager.canHost ? Color.green : Color.orange)
                            .frame(width: 10, height: 10)
                        Text(licenseManager.canHost ? "Active" : "Inactive")
                            .font(.body)
                            .foregroundColor(licenseManager.canHost ? .green : .orange)
                    }
                }

                Text("Host License allows you to create and host watch parties with friends")
                    .font(.body)
                    .foregroundColor(.secondary)

                // Payment method badge
                HStack(spacing: 8) {
                    Image(systemName: "bolt.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                    Text("Bitcoin Lightning Network")
                        .font(.caption.weight(.medium))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(8)

                // Purchase button (if license is inactive)
                if !licenseManager.canHost {
                    VStack(alignment: .leading, spacing: 12) {
                        Divider()
                            .padding(.vertical, 4)

                        Text("Unlock hosting capabilities with a one-time payment")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Button(action: {
                            showPaymentGate = true
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "lock.open.fill")
                                    .font(.body)
                                Text("Unlock Host License")
                                    .font(.body.weight(.medium))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                    }
                } else {
                    // License active message
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        Text("You can host unlimited watch parties!")
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                    .padding(.top, 4)
                }
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)
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

    private var recoveryPhraseSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Account Recovery")
                .font(.system(size: 28, weight: .semibold))

            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "key.viewfinder")
                        .font(.title2)
                        .foregroundColor(.purple)
                        .foregroundColor(.purple)
                    Text("Account Recovery")
                        .font(.title3.weight(.semibold))

                    Spacer()

                    // iCloud Status
                    HStack(spacing: 6) {
                        Image(systemName: "icloud.fill")
                            .foregroundColor(.blue)
                        Text("iCloud Sync Active")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }

                Text("Your account is automatically synced to iCloud. You can also create a manual backup file.")
                    .font(.body)
                    .foregroundColor(.secondary)

                // Backup Actions
                HStack(spacing: 12) {
                    Button(action: {
                        Task {
                            await exportAccount()
                        }
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.down.doc.fill")
                            Text("Backup to File")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                }


                // Copy confirmation message
                if let message = copyMessage {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        Text(message)
                            .font(.caption)
                            .foregroundColor(.green)
                    }
                    .padding(.top, 4)
                    .transition(.opacity)
                }

                // Divider
                Divider()
                    .padding(.vertical, 8)

                // Restore Account button
                VStack(alignment: .leading, spacing: 8) {
                    Text("Lost access to your account?")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.secondary)

                    Button(action: {
                        showRestoreAccount = true
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.clockwise")
                                .font(.body)
                            Text("Restore Account from Backup")
                                .font(.body.weight(.medium))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                }
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)
        }
    }

    private var resetSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Reset User Data")
                .font(.system(size: 28, weight: .semibold))

            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "trash.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                    Text("Erase Username & Start Fresh")
                        .font(.title3.weight(.semibold))

                    Spacer()
                }

                Text("Erase your current username '@\(currentUsername)' and all local app data from this device. You can restore your account later using your backup file.")
                    .font(.body)
                    .foregroundColor(.secondary)

                // Warning box
                HStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.title3)
                        .foregroundColor(.orange)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("This will erase all local data")
                            .font(.body.weight(.medium))
                            .foregroundColor(.orange)
                        Text("Your username and data will be removed from this device. Save your backup file to restore your account later.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                }
                .padding(16)
                .background(Color.orange.opacity(0.1))
                .cornerRadius(12)

                // Reset status message
                if let message = resetMessage {
                    HStack(spacing: 12) {
                        Image(systemName: isResetting ? "hourglass" : "checkmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(isResetting ? .orange : .green)
                        Text(message)
                            .font(.body)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(isResetting ? Color.orange.opacity(0.1) : Color.green.opacity(0.1))
                    .cornerRadius(12)
                    .transition(.move(edge: .top).combined(with: .opacity))
                }

                // Reset button
                HStack {
                    Spacer()

                    Button(action: {
                        showingResetConfirmation = true
                    }) {
                        HStack(spacing: 8) {
                            if isResetting {
                                ProgressView()
                                    .scaleEffect(0.9)
                                    .frame(width: 20, height: 20)
                            } else {
                                Image(systemName: "trash.fill")
                                    .font(.body)
                            }
                            Text(isResetting ? "Resetting..." : "Erase All Data")
                                .font(.body.weight(.medium))
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 16)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .disabled(isResetting || currentUsername.isEmpty)
                }
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)
        }
    }
    
    private var adminSection: some View {
        Group {
            if SupabaseClient.shared.auth.currentUser?.isAdmin == true {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Administration")
                        .font(.system(size: 28, weight: .semibold))
                    
                    Button(action: { showAdminDashboard = true }) {
                        HStack {
                            Image(systemName: "shield.checkerboard")
                                .font(.title2)
                                .foregroundColor(.purple)
                            Text("Admin Dashboard")
                                .font(.title3.weight(.semibold))
                                .foregroundColor(.primary)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                        .padding(24)
                        .background(Color(NSColor.controlBackgroundColor))
                        .cornerRadius(16)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .sheet(isPresented: $showAdminDashboard) {
                    AdminDashboardView(isPresented: $showAdminDashboard)
                        .frame(minWidth: 800, minHeight: 600)
                }
            }
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

        // Load RD user info if token exists
        if !realDebridToken.isEmpty {
            await loadRDUserInfo()
        }

        // HEAL: Ensure user_id is in Keychain (for export feature)
        let keychainUserId = await KeychainManager.shared.get(service: "user_id")
        if keychainUserId == nil, let currentUserId = appState.currentUserId {
            print("🩹 Healing missing user_id in Keychain...")
            try? await KeychainManager.shared.save(credential: currentUserId.uuidString, for: "user_id")
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

    private func loadRDUserInfo() async {
        guard !realDebridToken.isEmpty else {
            await MainActor.run {
                rdUserInfo = nil
            }
            return
        }

        await MainActor.run {
            rdInfoLoading = true
        }

        do {
            let userInfo = try await RealDebridClient.shared.getUserInfo(token: realDebridToken)
            await MainActor.run {
                rdUserInfo = userInfo
                rdInfoLoading = false
            }
        } catch {
            print("❌ Failed to load RD user info: \(error.localizedDescription)")
            await MainActor.run {
                rdUserInfo = nil
                rdInfoLoading = false
            }
        }
    }

    private func resetUserData() async {
        isResetting = true
        resetMessage = "Erasing user data..."

        do {
            try await UserResetManager.shared.resetAllUserData(deleteRemoteUser: false)
            await UserResetManager.shared.forceUsernameSetup()

            await MainActor.run {
                resetMessage = "✅ User data erased! The app will now show the username setup screen."
                currentUsername = ""
                appState.currentUsername = ""
                appState.currentUserId = nil

                // Clear message after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        resetMessage = nil
                    }
                }
            }

            // Stop resetting after a delay
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            await MainActor.run {
                isResetting = false
            }

        } catch {
            await MainActor.run {
                resetMessage = "❌ Failed to reset user data: \(error.localizedDescription)"
                isResetting = false

                // Clear error message after 5 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        resetMessage = nil
                    }
                }
            }
        }
    }

    // MARK: - Account Export

    private func exportAccount() async {
        do {
            let savePanel = NSSavePanel()
            savePanel.allowedContentTypes = [UTType(filenameExtension: "redlemon-key")!]
            savePanel.nameFieldStringValue = "redlemon-backup-\(Int(Date().timeIntervalSince1970))"
            savePanel.canCreateDirectories = true
            savePanel.title = "Save Account Backup"
            savePanel.message = "Choose a secure location to save your account backup file."

            let response = await savePanel.begin()

            if response == .OK, let url = savePanel.url {
                try await AccountExportManager.shared.saveExportFile(to: url)

                await MainActor.run {
                    copyMessage = "✅ Backup saved successfully!"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        copyMessage = nil
                    }
                }
            }
        } catch {
            await MainActor.run {
                copyMessage = "❌ Export failed: \(error.localizedDescription)"
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
