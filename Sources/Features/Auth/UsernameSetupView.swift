//
//  UsernameSetupView.swift
//  RedLemon
//
//  Complete Onboarding Flow: Welcome -> Features -> API Keys -> Profile
//

import SwiftUI
import UniformTypeIdentifiers
import AppKit

struct UsernameSetupView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss
    
    // Onboarding State
    enum OnboardingStep: Int, CaseIterable {
        case welcome = 0
        case features = 1
        case keys = 2
        case profile = 3
    }
    
    @State private var currentStep: OnboardingStep = .welcome
    
    // Shared State
    @State private var realDebridToken: String = ""
    @State private var subDLApiKey: String = ""
    @State private var username: String = ""
    
    var body: some View {
        ZStack {
            // Static Background (No animations)
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color(red: 0.2, green: 0.1, blue: 0.3),
                    Color.black
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Progress Bar (No animations)
                OnboardingProgressBar(currentStep: currentStep.rawValue, totalSteps: OnboardingStep.allCases.count)
                    .padding(.top, 20)
                    .padding(.horizontal, 40)
                
                // Content Area
                ZStack {
                    switch currentStep {
                    case .welcome:
                        WelcomeStepView(onNext: nextStep)
                    case .features:
                        FeaturesStepView(onNext: nextStep, onSkip: { goToStep(.keys) })
                    case .keys:
                        ApiKeysStepView(
                            realDebridToken: $realDebridToken,
                            subDLApiKey: $subDLApiKey,
                            onNext: nextStep,
                            onSkip: { nextStep() }
                        )
                    case .profile:
                        ProfileCreationStepView(
                            username: $username,
                            appState: appState,
                            onFinish: {
                                // Trigger app state refresh and dismiss EVERYTHING
                                Task { @MainActor in
                                    try? await Task.sleep(nanoseconds: 1_200_000_000)
                                    dismiss()
                                }
                            }
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: 800, height: 600)
        .preferredColorScheme(.dark)
    }
    
    // MARK: - Navigation Logic
    
    private func nextStep() {
        if currentStep.rawValue < OnboardingStep.allCases.count - 1 {
            currentStep = OnboardingStep(rawValue: currentStep.rawValue + 1)!
        }
    }
    
    private func goToStep(_ step: OnboardingStep) {
        currentStep = step
    }
    
    private func finishOnboarding() {
        // Save API Keys if entered
        Task {
            if !realDebridToken.isEmpty {
                try? await KeychainManager.shared.save(credential: realDebridToken, for: "realdebrid")
            }
            if !subDLApiKey.isEmpty {
                try? await KeychainManager.shared.save(credential: subDLApiKey, for: "subdl")
            }
            
            // Refresh systems
            await LicenseManager.shared.refreshSubscription()
            
            await MainActor.run {
                dismiss()
            }
        }
    }
}

// MARK: - Step 1: Welcome

struct WelcomeStepView: View {
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            // Hero Icon
            Image(systemName: "tv.circle.fill")
                .font(.system(size: 100))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.red, .orange],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 16) {
                Text("Welcome to RedLemon")
                    .font(.system(size: 48, weight: .black))
                    .foregroundStyle(.white)
                
                Text("The ultimate social streaming experience.")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.7))
            }
            
            Spacer()
            
            Button(action: onNext) {
                Text("Start the Tour")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 200, height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
            }
            .buttonStyle(.plain)
            
            Text("RedLemon is a community social tool. We do not host, store, or distribute any media content. All playback is performed locally on your device by accessing third-party providers.")
                .font(.system(size: 10))
                .foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 400)
                .padding(.top, 10)
            
            Spacer().frame(height: 40)
        }
    }
}

// MARK: - Step 2: Features

struct FeaturesStepView: View {
    let onNext: () -> Void
    let onSkip: () -> Void
    
    let features = [
        ("calendar.badge.clock", "Live Events", "A cinematic 24/7 broadcast experience. Join a global audience to watch movies together, share reactions, and chat in real-time as the story unfolds."),
        ("person.3.fill", "Watch Parties", "Create your own social space. Host public rooms for the community or private parties for friends. Use shared controls and persistent playlists to run your own movie marathons."),
        ("sparkles", "Smart Stream Engine", "Our proprietary resolver filters thousands of sources to find the fastest, highest-quality stream. It intelligently prioritizes performance while blocking low-quality fakes."),
        ("lock.shield.fill", "Secure & Private", "Built on modern cryptography. Your identity is a local key pair stored in your macOS Keychain. No passwords, no tracking, and your keys never leave your machine.")
    ]
    
    var body: some View {
        VStack {
            Text("Why RedLemon?")
                .font(.largeTitle.bold())
                .padding(.top, 40)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(features, id: \.1) { icon, title, desc in
                    HStack(spacing: 20) {
                        Image(systemName: icon)
                            .font(.system(size: 32))
                            .frame(width: 60, height: 60)
                            .background(Color.white.opacity(0.1))
                            .clipShape(Circle())
                            .foregroundColor(.orange)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(title)
                                .font(.title3.bold())
                            Text(desc)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
            .padding(40)
            
            Spacer()
            
            HStack(spacing: 20) {
                Button("Skip") { onSkip() }
                    .buttonStyle(.plain)
                    .foregroundColor(.secondary)
                
                Button(action: onNext) {
                    Text("Next")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 140, height: 44)
                    .background(Color.white)
                    .cornerRadius(22)
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, 40)
        }
    }
}

// MARK: - Step 3: API Keys

struct ApiKeysStepView: View {
    @Binding var realDebridToken: String
    @Binding var subDLApiKey: String
    let onNext: () -> Void
    let onSkip: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Power Up Your Stream")
                    .font(.largeTitle.bold())
                Text("Connect your services for the best experience. You can do this later in Settings.")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 4) {
                    Image(systemName: "lock.shield.fill")
                    Text("Stored locally in your encrypted macOS Keychain.")
                }
                .font(.caption)
                .foregroundColor(.blue.opacity(0.8))
            }
            .padding(.top, 40)
            
            VStack(spacing: 20) {
                // Real-Debrid
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "key.fill").foregroundColor(.orange)
                        Text("Real-Debrid API Private Token").font(.headline)
                        Spacer()
                        Link("Get Token", destination: URL(string: "https://real-debrid.com/apitoken")!)
                            .font(.caption)
                    }
                    SecureField("Paste token here", text: $realDebridToken)
                        .textFieldStyle(.plain)
                        .padding(10)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                }
                
                // SubDL
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "text.bubble.fill").foregroundColor(.green)
                        Text("SubDL API Key (Optional)").font(.headline)
                        Spacer()
                        Link("Get Key", destination: URL(string: "https://subdl.com/panel/api")!)
                            .font(.caption)
                    }
                    SecureField("Paste key here", text: $subDLApiKey)
                        .textFieldStyle(.plain)
                        .padding(10)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 60)
            .padding(.top, 20)
            
            Spacer()
            
            HStack(spacing: 20) {
                Button("Skip for Now") { onSkip() }
                    .buttonStyle(.plain)
                    .foregroundColor(.secondary)
                
                Button(action: onNext) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 140, height: 44)
                        .background(Color.white)
                        .cornerRadius(22)
                }
                .buttonStyle(.plain)
            }
            .padding(.bottom, 40)
        }
    }
}

// MARK: - Step 4: Profile Creation

struct ProfileCreationStepView: View {
    @Binding var username: String
    @ObservedObject var appState: AppState
    let onFinish: () -> Void
    
    @State private var isCreating: Bool = false
    @State private var errorMessage: String?
    @State private var showRestoreSheet = false
    @State private var showSuccess: Bool = false
    
    var body: some View {
        if showSuccess {
            successView
        } else {
            createFormView
                .sheet(isPresented: $showRestoreSheet) {
                    RestoreAccountView(onDismiss: onFinish)
                        .environmentObject(appState)
                }
        }
    }
    
    // MARK: - Success View
    
    var successView: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            VStack(spacing: 8) {
                Text("Welcome, \(username)!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Your identity has been securely created.")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Button(action: backupIdentity) {
                    HStack {
                        Image(systemName: "arrow.down.doc.fill")
                        Text("Backup Identity")
                    }
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 220, height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
                }
                .buttonStyle(.plain)
                
                Button("Enter RedLemon") {
                    onFinish()
                }
                .font(.headline)
                .foregroundColor(.white.opacity(0.8))
                .buttonStyle(.plain)
                .padding(.top, 10)
            }
            .padding(.bottom, 40)
        }
    }
    
    // MARK: - Create Form View
    
    var createFormView: some View {
        VStack(spacing: 24) {
            VStack(spacing: 8) {
                Text("Create Your Identity")
                    .font(.largeTitle.bold())
                Text("Choose a unique username friends can use to invite you.")
                    .foregroundColor(.secondary)
            }
            .padding(.top, 40)
            
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 8) {
                TextField("username", text: $username)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.plain)
                    .padding(16)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)
                    .disabled(isCreating)
                    .onSubmit { createUser() }
                
                Text("Lowercase letters, numbers, and underscores only.")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 80)
            
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.callout)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                Button(action: createUser) {
                    HStack {
                        if isCreating { ProgressView().scaleEffect(0.8) }
                        Text(isCreating ? "Creating..." : "Finish Setup")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(25)
                }
                .buttonStyle(.plain)
                .disabled(username.isEmpty || isCreating)
                
                Button("Restore from Backup") { showRestoreSheet = true }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .buttonStyle(.plain)
            }
            .padding(.bottom, 40)
        }
    }
    
    // MARK: - Logic
    
    private func createUser() {
        guard !username.isEmpty else { return }
        let trimmed = username.trimmingCharacters(in: .whitespaces).lowercased()
        
        // Validation
        guard trimmed.count >= 3 && trimmed.count <= 20 else {
            errorMessage = "Username must be 3-20 characters"
            return
        }
        guard trimmed.range(of: "^[a-z0-9_]+$", options: .regularExpression) != nil else {
            errorMessage = "Only lowercase letters, numbers, and underscores."
            return
        }
        
        isCreating = true
        errorMessage = nil
        
        Task {
            do {
                let (privateKey, publicKey) = CryptoManager.shared.generateKeyPair()
                let user = try await SupabaseClient.shared.registerUserSecure(username: trimmed, publicKey: publicKey)
                
                try await KeychainManager.shared.saveKeyPair(privateKey: privateKey, publicKey: publicKey)
                try await KeychainManager.shared.saveUsername(trimmed)
                try await KeychainManager.shared.save(credential: user.id.uuidString, for: "user_id")
                
                // Add default friend
                if let lemontom = try? await SupabaseClient.shared.getUserByUsername(username: "lemontom") {
                     try? await SupabaseClient.shared.createFriendship(userId1: user.id, userId2: lemontom.id)
                }
                
                await MainActor.run {
                    appState.currentUsername = trimmed
                    appState.currentUserId = user.id
                    
                    // Update auth context for LicenseManager
                    SupabaseClient.shared.auth.currentUser = AuthUser(
                        id: user.id,
                        username: user.username,
                        isAdmin: user.isAdmin ?? false,
                        isPremium: user.isPremium ?? false
                    )
                    
                    isCreating = false
                    
                    // Transition to Success Step (No animation)
                    showSuccess = true
                    
                    // Connect Social Service
                    Task {
                         await SocialService.shared.connect(userId: user.id.uuidString, username: trimmed)
                    }
                }
                
            } catch {
                await MainActor.run {
                    let msg = error.localizedDescription
                    if msg.contains("taken") || msg.contains("duplicate") {
                        errorMessage = "Username already taken."
                    } else {
                        errorMessage = "Error: \(msg)"
                    }
                    isCreating = false
                }
            }
        }
    }
    
    private func backupIdentity() {
        let panel = NSSavePanel()
        panel.allowedContentTypes = [UTType(filenameExtension: "redlemon-key")!]
        panel.nameFieldStringValue = "\(username).redlemon-key"
        panel.canCreateDirectories = true
        panel.isExtensionHidden = false
        
        panel.begin { response in
            if response == .OK, let url = panel.url {
                Task {
                    do {
                        try await AccountExportManager.shared.saveExportFile(to: url)
                        print("✅ Identity backed up to \(url.path)")
                    } catch {
                        print("❌ Backup failed: \(error)")
                    }
                }
            }
        }
    }
}

// MARK: - Components

struct OnboardingProgressBar: View {
    let currentStep: Int
    let totalSteps: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalSteps, id: \.self) { step in
                Capsule()
                    .fill(step <= currentStep ? Color.white : Color.white.opacity(0.2))
                    .frame(height: 4)
                    .frame(maxWidth: step == currentStep ? 40 : 20)
            }
        }
    }
}
