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
    
    // Feedback State
    @State private var showFeedbackSheet = false

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

                providerStatusSection

                licenseSection
                
                // Show payment history for premium users
                if licenseManager.isPremium {
                    paymentHistorySection
                }

                usernameSection

                recoveryPhraseSection

                resetSection

                Group {
                    adminSection
                    
                    supportSection

                    aboutSection
                }

                // Color.clear.frame(height: 40)
            }
            .padding(60)
            .frame(maxWidth: 1200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .task {
            await loadCredentials()
            await licenseManager.checkHostingLimit()
            await syncLicenseStatus()
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
        .sheet(isPresented: $showPaymentGate, onDismiss: {
            Task {
                await syncLicenseStatus()
            }
        }) {
            PremiumPaymentView()
        }
        .sheet(isPresented: $showFeedbackSheet) {
            FeedbackView(isPresented: $showFeedbackSheet)
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
            
            // Provider Connectivity - Moved to separate section

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

    private var providerStatusSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Network Status")
                .font(.system(size: 28, weight: .semibold))
            
            ProviderHealthView()
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
                            .fill(licenseManager.isPremium ? Color.green : Color.orange)
                            .frame(width: 10, height: 10)
                        Text(licenseManager.isPremium ? "Active" : "Inactive")
                            .font(.body)
                            .foregroundColor(licenseManager.isPremium ? .green : .orange)
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
                    Text("Crypto (Ethereum, Base, Arbitrum, Optimism, Polygon, USDC, USDT)")
                        .font(.caption.weight(.medium))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.yellow.opacity(0.1))
                .cornerRadius(8)

                // Purchase button (if license is inactive)
                if !licenseManager.isPremium {
                    VStack(alignment: .leading, spacing: 12) {
                        Divider()
                            .padding(.vertical, 4)

                        // Free Tier Status
                        HStack(spacing: 8) {
                             if licenseManager.timeUntilNextFreeRoom > 0 {
                                 Image(systemName: "clock.arrow.circlepath")
                                     .font(.caption)
                                     .foregroundColor(.orange)
                                 Text("Next free host available in: \(licenseManager.formattedCooldownTime)")
                                     .font(.caption.weight(.medium))
                                     .foregroundColor(.orange)
                             } else {
                                 Image(systemName: "checkmark.seal.fill")
                                     .font(.caption)
                                     .foregroundColor(.green)
                                 Text("1 free watch party available now")
                                     .font(.caption.weight(.medium))
                                     .foregroundColor(.green)
                             }
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
                        .cornerRadius(8)

                        Text("Or unlock unlimited hosting with a one-time payment")
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
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                            Text("You can host unlimited watch parties!")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                        
                        // Show premium expiration
                        let expiryDate = Date(timeIntervalSince1970: licenseManager.subscriptionExpiresAt)
                        let daysLeft = Calendar.current.dateComponents([.day], from: Date(), to: expiryDate).day ?? 0
                        
                        // Show expiration if it's not unreasonably far in the future (> 10 years means likely lifetime/permanent)
                        if daysLeft < 3650 {
                             Text("License valid until: \(expiryDate.formatted(date: .long, time: .omitted)) (\(daysLeft) days left)")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .padding(.leading, 24)
                        }
                    }
                    .padding(.top, 4)
                }
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)
        }
    }
    
    // MARK: - Payment History Section (for premium users)
    @State private var myTransactions: [PaymentTransaction] = []
    @State private var isLoadingPayments = false
    
    private var paymentHistorySection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Payment History")
                .font(.system(size: 28, weight: .semibold))
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.title2)
                        .foregroundColor(.green)
                    Text("Your Transactions")
                        .font(.title3.weight(.semibold))
                    
                    Spacer()
                    
                    Button(action: loadMyPayments) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.secondary)
                    }
                    .buttonStyle(.plain)
                    .disabled(isLoadingPayments)
                }
                
                Text("All crypto payments made to your account")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                if isLoadingPayments {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .padding()
                } else if myTransactions.isEmpty {
                    HStack(spacing: 8) {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.blue)
                        Text("No transactions found. Premium may have been granted manually.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(12)
                    .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
                    .cornerRadius(8)
                } else {
                    VStack(spacing: 8) {
                        ForEach(myTransactions) { tx in
                            transactionRow(tx)
                        }
                    }
                }
            }
            .padding(24)
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(16)
        }
        .onAppear {
            loadMyPayments()
        }
    }
    
    @ViewBuilder
    private func transactionRow(_ tx: PaymentTransaction) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 8) {
                    // Chain badge
                    Text(tx.chain.uppercased())
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(tx.chain == "btc" ? Color.orange : Color.blue)
                        .cornerRadius(4)
                    
                    // Status Badge
                    Text("COMPLETED")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.green.opacity(0.5), lineWidth: 1)
                        )
                    
                    // Duration Badge
                    if let days = tx.durationDays {
                        Text("\(days) DAYS")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.cyan)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.cyan.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
                
                // Only show transaction link for real hashes (not detected_ payments)
                if !tx.txHash.hasPrefix("detected_"), let url = getExplorerUrl(chain: tx.chain, hash: tx.txHash) {
                    HStack(spacing: 6) {
                        Link(destination: url) {
                            Text(tx.txHash.prefix(12) + "..." + tx.txHash.suffix(4))
                                .font(.system(.caption2, design: .monospaced))
                                .foregroundColor(.blue)
                                .underline()
                        }
                        .help("View Transaction on Explorer")
                        
                        Button(action: {
                            NSPasteboard.general.clearContents()
                            NSPasteboard.general.setString(tx.txHash, forType: .string)
                        }) {
                            Image(systemName: "doc.on.doc")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .buttonStyle(.plain)
                        .help("Copy Transaction Hash")
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                Text(String(format: "%.6f %@", tx.amount, tx.currency))
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Text(tx.createdAt, style: .date)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(10)
        .background(Color(NSColor.controlBackgroundColor).opacity(0.5))
        .cornerRadius(8)
    }
    
    private func loadMyPayments() {
        isLoadingPayments = true
        Task {
            do {
                myTransactions = try await SupabaseClient.shared.getMyPaymentTransactions()
            } catch {
                print("Error loading payment history: \(error)")
            }
            isLoadingPayments = false
        }
    }

    private func getExplorerUrl(chain: String, hash: String) -> URL? {
        // Handle internal system detection IDs: "detected_ADDRESS_..."
        if hash.hasPrefix("detected_") {
            // Extract address segments (detected_0x123..._timestamp)
            let parts = hash.components(separatedBy: "_")
            if parts.count >= 2 {
                let address = parts[1]
                if chain == "btc" {
                    return URL(string: "https://mempool.space/address/\(address)")
                } else {
                    return URL(string: "https://basescan.org/address/\(address)")
                }
            }
            return nil
        }
        
        if chain == "btc" {
            return URL(string: "https://mempool.space/tx/\(hash)")
        } else if chain == "evm" || chain == "base" {
            // Ensure 0x prefix for EVM transactions
            let formattedHash = hash.hasPrefix("0x") ? hash : "0x" + hash
            return URL(string: "https://basescan.org/tx/\(formattedHash)")
        }
        return nil
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
    
    private var supportSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Support & Feedback")
                .font(.system(size: 28, weight: .semibold))
            
            VStack(alignment: .leading, spacing: 12) {
                // Send Feedback Button
                Button(action: { showFeedbackSheet = true }) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                        Text("Send Feedback")
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
        }
    }

    
    private func uploadSessionLog() async {
        isLoading = true
        let log = await SessionRecorder.shared.getSanitizedLog()
        await SupabaseClient.shared.uploadSessionLog(log: log)
        
        await MainActor.run {
            isLoading = false
            saveMessage = "Session log sent! Thank you." // Reuse message state or add new
            messageType = .success
            
            // Clear message after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if saveMessage == "Session log sent! Thank you." {
                    saveMessage = nil
                }
            }
        }
    }
    
    // MARK: - Feedback View
    struct FeedbackView: View {
        @Binding var isPresented: Bool
        @State private var category = "Bug"
        @State private var message = ""
        @State private var email = ""
        @State private var includeLog = false
        @State private var isSending = false
        
        let categories = ["Bug", "Stream Issue", "Feature Request", "Other"]
        
        var body: some View {
            VStack(spacing: 20) {
                Text("Send Feedback")
                    .font(.title2.bold())
                
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) { cat in
                        Text(cat)
                    }
                }
                
                TextField("Email (Optional)", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextEditor(text: $message)
                    .font(.body)
                    .frame(height: 150)
                    .padding(4)
                    .background(Color(NSColor.controlBackgroundColor))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
                
                Toggle("Attach anonymous session log", isOn: $includeLog)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                HStack {
                    Button("Cancel") { isPresented = false }
                        .keyboardShortcut(.cancelAction)
                    
                    Spacer()
                    
                    Button("Send") {
                        isSending = true
                        Task {
                            var logId: UUID? = nil
                            
                            if includeLog {
                                let log = await SessionRecorder.shared.getSanitizedLog()
                                await SupabaseClient.shared.uploadSessionLog(log: log)
                                logId = log.id
                            }
                            
                            await SupabaseClient.shared.sendFeedback(
                                type: category,
                                message: message,
                                email: email,
                                sessionLogId: logId
                            )
                            isPresented = false
                            isSending = false
                        }
                    }
                    .keyboardShortcut(.defaultAction)
                    .disabled(message.isEmpty || isSending)
                }
            }
            .padding(30)
            .frame(width: 500)
            .background(Color(NSColor.windowBackgroundColor))
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

    private func syncLicenseStatus() async {
        guard let userId = appState.currentUserId else { return }
        do {
            if let user = try await SupabaseClient.shared.getUser(id: userId) {
                // Update LicenseManager with authoritative data from Backend
                LicenseManager.shared.refreshLicense(
                    premium: user.isPremium ?? false,
                    expiresAt: user.subscriptionExpiresAt
                )
            }
        } catch {
            print("Failed to sync license status: \(error)")
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
