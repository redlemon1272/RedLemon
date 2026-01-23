import SwiftUI
import UniformTypeIdentifiers
import AppKit

/// Onboarding view for first-time users explaining the app's core concepts
struct AppOnboardingView: View {
    @EnvironmentObject var appState: AppState
    @Binding var isPresented: Bool
    
    // Page state
    @State private var currentPage = 0
    
    // Username Input State
    @State private var username: String = ""
    @State private var isCheckingUsername: Bool = false
    @State private var usernameError: String? = nil
    
    // API Key State
    @State private var realDebridKey: String = ""
    @State private var subdlKey: String = ""
    
    // Restore State
    @State private var isRestored: Bool = false
    
    // Onboarding Data
    struct OnboardingPage {
        enum PageType {
            case standard
            case apiKeys
            case identity
        }
        let type: PageType
        let title: String
        let subtitle: String
        let features: [String]
        let icon: String // SF Symbol
        let color: Color
    }
    
    private let pages: [OnboardingPage] = [
        OnboardingPage(
            type: .standard,
            title: "Welcome to RedLemon",
            subtitle: "The ultimate shared streaming experience",
            features: [
                "The ultimate click-and-play experience",
                "Built-in ultra-fast stream resolver",
                "Seamless integration with Real-Debrid"
            ],
            icon: "popcorn.fill", 
            color: .yellow
        ),
        OnboardingPage(
            type: .standard,
            title: "Live Events",
            subtitle: "Global Synchronized Screenings",
            features: [
                "Join the global community theater",
                "Everyone watches at the exact same time",
                "Live chat and reactions"
            ],
            icon: "calendar.badge.clock",
            color: .red
        ),
        OnboardingPage(
            type: .standard,
            title: "Watch Parties",
            subtitle: "Watch With Anyone",
            features: [
                "Create private rooms for friends",
                "Open lobbies for public viewing",
                "Perfect sync: Pause/Seek for everyone"
            ],
            icon: "person.3.fill",
            color: .blue
        ),
        OnboardingPage(
            type: .apiKeys,
            title: "Unlock Power",
            subtitle: "Add Your Integrations",
            features: [],
            icon: "key.fill",
            color: .purple
        ),
         OnboardingPage(
            type: .identity,
            title: "Create Identity",
            subtitle: "Claim Your Spot",
            features: [],
            icon: "person.crop.circle.badge.plus",
            color: .green
        )
    ]
    
    // Crash prevention: Safe page access
    private var safePage: OnboardingPage {
        if pages.indices.contains(currentPage) {
            return pages[currentPage]
        }
        return pages[0]
    }
    
    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()
            
            // Subtle gradient background based on current page color
            LinearGradient(
                gradient: Gradient(colors: [
                    safePage.color.opacity(0.15), 
                    Color.black
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            .animation(.linear(duration: 0.5), value: currentPage)
            
            VStack(spacing: 0) {
                // Progress Header
                if !showSuccess {
                    HStack(spacing: 8) {
                        ForEach(0..<pages.count, id: \.self) { index in
                            Capsule()
                                .fill(currentPage == index ? pages[index].color : Color.white.opacity(0.2))
                                .frame(width: currentPage == index ? 32 : 8, height: 8)
                                .animation(.spring(), value: currentPage)
                        }
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                }
                
                // Content Area
                VStack(spacing: 20) {
                    if showSuccess {
                        successView
                            .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .move(edge: .leading).combined(with: .opacity)))
                    } else {
                        // Dynamic Content based on page type
                        switch safePage.type {
                        case .standard:
                            standardPageView(page: safePage)
                                .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .move(edge: .leading).combined(with: .opacity)))
                                
                        case .apiKeys:
                            apiKeyView()
                                .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .move(edge: .leading).combined(with: .opacity)))
                                
                        case .identity:
                            usernameCreationView()
                                .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .move(edge: .leading).combined(with: .opacity)))
                        }
                    }
                }
                .frame(maxWidth: 500)
                //.id(currentPage) // Force transition (handled within subviews now)
                
                Spacer()
                
                // Navigation Footer
                if !showSuccess {
                    HStack {
                        // Back Button
                        if currentPage > 0 {
                            Button(action: {
                                withAnimation {
                                    currentPage -= 1
                                }
                            }) {
                                Text("Back")
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                            }
                            .buttonStyle(.plain)
                        }
                        
                        Spacer()
                        
                        // Next Button (Only for first 3 pages)
                        if currentPage < pages.count - 1 {
                            Button(action: {
                                withAnimation {
                                    currentPage += 1
                                }
                            }) {
                                HStack {
                                    Text("Next")
                                    Image(systemName: "arrow.right")
                                }
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 32)
                                .padding(.vertical, 12)
                                .background(safePage.color)
                                .cornerRadius(12)
                                .shadow(color: safePage.color.opacity(0.4), radius: 10, x: 0, y: 5)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 30)
                    .frame(maxWidth: 600)
                }
            }
        }
        .frame(width: 700, height: 500)
        .sheet(isPresented: $showRestoreSheet) {
            RestoreAccountView(onDismiss: handleRestore)
                .environmentObject(appState)
        }
    }
    
    // MARK: - Subviews
    
    @ViewBuilder
    private func standardPageView(page: OnboardingPage) -> some View {
        VStack(spacing: 20) {
            // Hero Icon
            ZStack {
                if page.title == "Welcome to RedLemon" {
                    // App Icon for the first page
                    Image(nsImage: NSApplication.shared.applicationIconImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140, height: 140)
                        .shadow(color: page.color.opacity(0.5), radius: 20, x: 0, y: 0)
                } else {
                    Circle()
                        .fill(page.color.opacity(0.1))
                        .frame(width: 120, height: 120)
                        .blur(radius: 20)
                    
                    Image(systemName: page.icon)
                        .font(.system(size: 60))
                        .foregroundStyle(page.color)
                        .shadow(color: page.color.opacity(0.5), radius: 20, x: 0, y: 0)
                }
            }
            
            // Text Content
            VStack(spacing: 8) {
                Text(page.title)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                
                Text(page.subtitle)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(page.color)
            }
            
            // Feature List (More "Occupied" look)
            VStack(alignment: .leading, spacing: 12) {
                ForEach(page.features, id: \.self) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(page.color)
                            .font(.system(size: 16))
                        
                        Text(feature)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
            }
            .padding(.top, 10)
        }
    }
    
    @ViewBuilder
    private func apiKeyView() -> some View {
        VStack(spacing: 24) {
            // Header
            VStack(spacing: 8) {
                Text("Integrations")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Supercharge your experience with external services.")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            // Inputs
            VStack(spacing: 20) {
                // Real-Debrid
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.yellow)
                        Text("Real-Debrid API Private Token")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        Spacer()
                        
                        Link("Get Key", destination: URL(string: "https://real-debrid.com/apitoken")!)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    
                    SecureField("Paste your API Key", text: $realDebridKey)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                }
                
                // SubDL
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "captions.bubble.fill")
                            .foregroundColor(.orange)
                        Text("SubDL API Key")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        Spacer()
                        
                        Link("Get Key", destination: URL(string: "https://subdl.com/panel/api")!)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    
                    SecureField("Paste your API Key", text: $subdlKey)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 20)
            
            // Restore Button
            Button(action: { showRestoreSheet = true }) {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Restore from Backup")
                }
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.white.opacity(0.05))
                .cornerRadius(20)
            }
            .buttonStyle(.plain)
            .padding(.top, 10)
            
            Spacer()
        }
        .padding(.top, 20)
        .onChange(of: realDebridKey) { newValue in
            UserDefaults.standard.set(newValue, forKey: "realDebridApiKey")
        }
        .onChange(of: subdlKey) { newValue in
            UserDefaults.standard.set(newValue, forKey: "subdlApiKey")
        }
    }
    
    @State private var showRestoreSheet = false
    @State private var showSuccess = false
    
    // ...
    
    @ViewBuilder
    private func usernameCreationView() -> some View {
        createFormView
    }

    private var createFormView: some View {
        VStack(spacing: 24) {
            // Identity Icon
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.1))
                    .frame(width: 100, height: 100)
                    .blur(radius: 20)
                
                Image(systemName: "person.crop.circle.badge.plus")
                    .font(.system(size: 50))
                    .foregroundStyle(Color.green)
            }
            
            // Header
            VStack(spacing: 8) {
                Text("Pick Your Identity")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Choose a unique username friends can use to invite you.")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            // Input Field
            VStack(spacing: 16) {
                TextField("Username", text: $username)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 12)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(usernameError != nil ? Color.red : (username.isEmpty ? Color.clear : Color.green), lineWidth: 1)
                    )
                    .frame(width: 280)
                    .disabled(isCheckingUsername)
                
                if let error = usernameError {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.callout)
                }
                
                // Submit Button
                Button(action: registerUser) {
                    HStack {
                        if isCheckingUsername {
                            ProgressView()
                                .scaleEffect(0.8)
                                .tint(.black)
                        } else {
                            Text("Complete Setup")
                            Image(systemName: "checkmark")
                        }
                    }
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 180, height: 44)
                    .background(username.count >= 3 ? Color.green : Color.gray.opacity(0.3))
                    .cornerRadius(12)
                    .shadow(color: (username.count >= 3 ? Color.green : Color.clear).opacity(0.4), radius: 10, x: 0, y: 5)
                }
                .buttonStyle(.plain)
                .disabled(username.count < 3 || isCheckingUsername)
            }
        }
    }
    


    private func handleRestore() {
        // If restore was successful, appState.currentUsername will be set
        if !appState.currentUsername.isEmpty {
            self.username = appState.currentUsername
            self.isRestored = true
            
            withAnimation(.spring()) {
                showSuccess = true
            }
            
            // Auto-close onboarding after 2 seconds to confirm and enter the app
            Task { @MainActor in
                try? await Task.sleep(nanoseconds: 2_500_000_000) // 2.5 seconds
                if showSuccess {
                    completeOnboarding()
                }
            }
        }
    }
    
    private var successView: some View {
        VStack(spacing: 24) {
             Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
                .padding(.bottom, 10)
            
            VStack(spacing: 8) {
                Text("Welcome, \(username)!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Your identity has been securely created.")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            VStack(spacing: 16) {
                if !isRestored {
                    Button(action: backupIdentity) {
                        HStack {
                            Image(systemName: "arrow.down.doc.fill")
                            Text("Backup Identity")
                        }
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 200, height: 44)
                        .background(Color.white)
                        .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                }
                
                Button("Enter RedLemon") {
                    completeOnboarding()
                }
                .font(.headline)
                .foregroundColor(.white.opacity(0.8))
                .buttonStyle(.plain)
                .padding(.top, 4)
            }
            .padding(.top, 20)
        }
    }
    
    // MARK: - Actions
    
    private func registerUser() {
        guard username.count >= 3 else {
            usernameError = "Username must be at least 3 characters"
            return
        }
        
        let trimmed = username.trimmingCharacters(in: .whitespaces).lowercased()
        
        // Validation regex
        guard trimmed.range(of: "^[a-z0-9_]+$", options: .regularExpression) != nil else {
            usernameError = "Lowercase letters, numbers, and underscores only."
            return
        }
        
        isCheckingUsername = true
        usernameError = nil
        
        Task {
            do {
                // 1. Generate Keys & Create User Securely
                let (privateKey, publicKey) = CryptoManager.shared.generateKeyPair()
                let user = try await SupabaseClient.shared.registerUserSecure(username: trimmed, publicKey: publicKey)
                
                // 2. Save Everything Locally
                try await KeychainManager.shared.saveKeyPair(privateKey: privateKey, publicKey: publicKey)
                try await KeychainManager.shared.saveUsername(trimmed)
                try await KeychainManager.shared.save(credential: user.id.uuidString, for: "user_id")
                
                // Save API Keys if provided
                if !realDebridKey.isEmpty {
                    try await KeychainManager.shared.save(credential: realDebridKey, for: "realdebrid")
                }
                if !subdlKey.isEmpty {
                    try await KeychainManager.shared.save(credential: subdlKey, for: "subdl")
                }
                
                // 3. Auto-Add Admin Friend (lemontom)
                if let lemontom = try? await SupabaseClient.shared.getUserByUsername(username: "lemontom") {
                     try? await SupabaseClient.shared.createFriendship(userId1: user.id, userId2: lemontom.id)
                }
                
                await MainActor.run {
                    // 4. Update AppState
                    appState.currentUserId = user.id
                    appState.currentUsername = user.username
                    appState.isAdmin = user.isAdmin ?? false
                    
                    // Update auth context for LicenseManager
                    SupabaseClient.shared.auth.currentUser = AuthUser(
                        id: user.id,
                        username: user.username,
                        isAdmin: user.isAdmin ?? false,
                        isPremium: user.isPremium ?? false
                    )
                    
                    // If admin, start the report listener
                    if user.isAdmin == true {
                        Task {
                            await AdminRealtimeService.shared.start()
                        }
                    }
                    
                    isCheckingUsername = false
                    showSuccess = true
                }
                
                // 5. Connect Social
                Task {
                    await SocialService.shared.connect(userId: user.id.uuidString, username: trimmed)
                }
            } catch {
                await MainActor.run {
                    isCheckingUsername = false
                    let msg = error.localizedDescription
                    if msg.contains("taken") || msg.contains("duplicate") {
                        usernameError = "Username already taken."
                    } else {
                        usernameError = "Error: \(msg)"
                    }
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
    
    private func completeOnboarding() {
        // Mark onboarding as complete in UserDefaults
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding_v1")
        
        // Dismiss the modal first to show progress
        withAnimation {
            isPresented = false
        }
        
        // Conditional Relaunch: If any API keys were entered OR an account was restored, force a relaunch
        // to ensure the Vapor server and all resolvers pick up the new credentials immediately.
        if !realDebridKey.isEmpty || !subdlKey.isEmpty || isRestored {
            NSLog("🔄 [Onboarding] Credentials changed (Keys: %@, Restored: %@). Induced mandatory relaunch.", 
                  (!realDebridKey.isEmpty || !subdlKey.isEmpty) ? "YES" : "NO",
                  isRestored ? "YES" : "NO")
            // Give a tiny moment for dismissal animation to start
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                appState.relaunchApp()
            }
        }
    }
}
