
import SwiftUI
import CoreImage.CIFilterBuiltins

struct PremiumPaymentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var licenseManager = LicenseManager.shared

    // State
    @State private var selectedChain: Chain = .evm
    @State private var assignedAddress: String?
    @State private var isLoadingAddress = false
    @State private var errorMessage: String?
    @State private var isCheckingPayment = false
    @State private var paymentTimer: Timer?
    @State private var showSuccess = false
    @State private var selectedPlan: String = "$10" // Default to best value
    @State private var exchangeRates: (btc: Double, eth: Double)?

    enum Chain: String, CaseIterable, Identifiable {
        case evm = "evm"

        var id: String { rawValue }

        var displayName: String {
            switch self {
            case .evm: return "Ethereum & L2s"
            }
        }

        var icon: String {
            switch self {
            case .evm: return "diamond.circle.fill" 
            }
        }
    }

    var body: some View {
        ZStack {
            // Global Stitch Background
            DesignSystem.Gradients.backgroundMesh
                .ignoresSafeArea()
            
            if showSuccess {
                SuccessView(dismiss: { dismiss() })
            } else {
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 30) {
                            
                            // Header
                            VStack(spacing: 8) {
                                Text("Host License")
                                    .font(.system(size: 32, weight: .bold))
                                    .foregroundColor(.white)
                                    .stitchGlow(color: .white.opacity(0.3), radius: 10)

                                Text("Host unlimited watch parties.")
                                    .font(.body)
                                    .foregroundColor(DesignSystem.Colors.textSecondary)
                                    .multilineTextAlignment(.center)
                                
                                // Brand Logo or Icon could go here
                                Image(systemName: "crown.fill")
                                    .font(.title)
                                    .foregroundColor(DesignSystem.Colors.accent)
                                    .padding(.top, 5)
                                    .stitchGlow()
                            }
                            .padding(.top, 20)

                            // Pricing Cards (HStack of Vertical Cards)
                            HStack(spacing: 20) {
                                StitchPricingCard(
                                    price: "$4",
                                    duration: "30 Days",
                                    subtext: "Basic Access",
                                    isSelected: selectedPlan == "$4",
                                    isBestValue: false
                                ) { selectedPlan = "$4" }
                                
                                StitchPricingCard(
                                    price: "$7",
                                    duration: "60 Days",
                                    subtext: "Standard Plan",
                                    isSelected: selectedPlan == "$7",
                                    isBestValue: false
                                ) { selectedPlan = "$7" }
                                
                                StitchPricingCard(
                                    price: "$10",
                                    duration: "90 Days",
                                    subtext: "Premium Unlocked",
                                    isSelected: selectedPlan == "$10",
                                    isBestValue: true
                                ) { selectedPlan = "$10" }
                            }
                            .padding(.horizontal)

                            // Chain Failure Message
                            if let error = errorMessage {
                                HStack {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                    Text(error)
                                }
                                .padding()
                                .background(Color.red.opacity(0.1))
                                .foregroundColor(.red)
                                .cornerRadius(8)
                            }

                            // Chain Selection
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Select Network")
                                    .font(.caption.bold())
                                    .foregroundColor(DesignSystem.Colors.textSecondary)
                                    .padding(.leading, 4)
                                
                                HStack(spacing: 12) {
                                    ForEach(Chain.allCases) { chain in
                                        Button(action: {
                                            selectedChain = chain
                                            Task { await loadAddress() }
                                        }) {
                                            HStack {
                                                Image(systemName: chain.icon)
                                                    .foregroundColor(selectedChain == chain ? .white : DesignSystem.Colors.accent)
                                                Text(chain.displayName)
                                                    .fontWeight(selectedChain == chain ? .medium : .regular)
                                            }
                                            .padding(.vertical, 12)
                                            .padding(.horizontal, 16)
                                            .frame(maxWidth: .infinity)
                                            .background(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .fill(selectedChain == chain ? DesignSystem.Colors.accent : Color.white.opacity(0.05))
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .strokeBorder(selectedChain == chain ? DesignSystem.Colors.accent : Color.white.opacity(0.1), lineWidth: 1)
                                            )
                                            .foregroundColor(selectedChain == chain ? .black : .white)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                            }
                            .padding(.horizontal)

                            // Payment Details (Address & QR)
                            VStack(spacing: 20) {
                                if isLoadingAddress {
                                    ProgressView("Connecting to blockchain...")
                                        .tint(DesignSystem.Colors.accent)
                                        .padding(40)
                                } else if let address = assignedAddress {
                                    // QR Code Container
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white)
                                            .frame(width: 200, height: 200)
                                            .shadow(color: DesignSystem.Colors.accent.opacity(0.3), radius: 20)

                                        let usdAmount: Double = {
                                            switch selectedPlan {
                                            case "$4": return 4.0
                                            case "$7": return 7.0
                                            case "$10": return 10.0
                                            default: return 4.0
                                            }
                                        }()

                                        Image(nsImage: generateQRCode(for: address, amountUSD: usdAmount))
                                            .interpolation(.none)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 180, height: 180)
                                    }

                                    // Address & Amount Info
                                    VStack(spacing: 8) {
                                        let usdVal: Double = {
                                            switch selectedPlan {
                                            case "$4": return 4.0
                                            case "$7": return 7.0
                                            case "$10": return 10.0
                                            default: return 4.0
                                            }
                                        }()

                                        if let cryptoAmount = calculateCryptoAmount(usd: usdVal) {
                                            Text("Send exactly")
                                                .font(.caption)
                                                .foregroundColor(DesignSystem.Colors.textSecondary)
                                            
                                            Text(cryptoAmount)
                                                .font(.title2.bold())
                                                .foregroundColor(DesignSystem.Colors.accent)
                                                .stitchGlow(color: DesignSystem.Colors.accent, radius: 5)
                                            
                                            Text("($\(String(format: "%.2f", usdVal)) USDC/USDT)")
                                                .font(.caption)
                                                .foregroundColor(DesignSystem.Colors.textSecondary)
                                        }

                                        // Copy Address
                                        Button(action: {
                                            NSPasteboard.general.clearContents()
                                            NSPasteboard.general.setString(address, forType: .string)
                                        }) {
                                            HStack {
                                                Text(address.prefix(6) + "..." + address.suffix(4))
                                                    .font(.system(.body, design: .monospaced))
                                                Image(systemName: "doc.on.doc")
                                            }
                                            .padding(10)
                                            .background(DesignSystem.Colors.glassSurface)
                                            .cornerRadius(8)
                                            .overlay(
                                                 RoundedRectangle(cornerRadius: 8)
                                                     .strokeBorder(DesignSystem.Colors.glassBorder, lineWidth: 1)
                                            )
                                        }
                                        .buttonStyle(.plain)
                                        .padding(.top, 8)
                                    }
                                }
                            }
                            
                            // Auto-Check Status
                            if assignedAddress != nil {
                                 HStack(spacing: 8) {
                                    if isCheckingPayment {
                                        ProgressView()
                                            .scaleEffect(0.6)
                                            .tint(.white)
                                    }
                                    Text("Listening for transaction...")
                                        .font(.caption)
                                        .foregroundColor(DesignSystem.Colors.textSecondary)
                                        .onAppear {
                                            // Animate dots or something if needed
                                        }
                                }
                            }
                        }
                        .padding(30)
                    }
                    
                    // Fixed Footer
                    VStack(spacing: 0) {
                        Divider().background(DesignSystem.Colors.glassBorder)
                        HStack {
                            Button("Cancel") {
                                stopPolling()
                                dismiss()
                            }
                            .foregroundColor(DesignSystem.Colors.textSecondary)
                            .keyboardShortcut(.cancelAction)

                            Spacer()

                            Button(action: {
                                Task { await checkPayment(manual: true) }
                            }) {
                                Text("I Have Paid")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 24)
                                    .background(
                                        Capsule()
                                            .fill(assignedAddress == nil ? Color.gray : DesignSystem.Colors.accent)
                                    )
                                    .shadow(color: DesignSystem.Colors.accent.opacity(0.4), radius: 10)
                            }
                            .buttonStyle(.plain)
                            .disabled(assignedAddress == nil || isLoadingAddress)
                        }
                        .padding(20)
                        .background(Color.black.opacity(0.8))
                    }
                }
            }
        }
        .frame(width: 600, height: 750) // Taller/Wider for the new design
        .overlay(
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                .font(.system(size: 24))
                .foregroundColor(.white.opacity(0.5))
            }
            .buttonStyle(.plain)
            .padding(16)
            .keyboardShortcut(.cancelAction)
            , alignment: .topTrailing
        )
        .onAppear {
            Task {
                await loadAddress()
                await fetchRates()
            }
        }
        .onDisappear {
            stopPolling()
        }
    }

    // MARK: - Logic (Unchanged)

    private func loadAddress() async {
        isLoadingAddress = true
        errorMessage = nil
        stopPolling()

        do {
            let address = try await SupabaseClient.shared.assignPaymentAddress(chain: selectedChain.rawValue)
            assignedAddress = address
            startPolling()
        } catch {
            errorMessage = "Failed to get address: \(error.localizedDescription)"
        }

        isLoadingAddress = false
    }

    private func startPolling() {
        stopPolling()
        paymentTimer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            Task { await checkPayment() }
        }
    }

    private func stopPolling() {
        paymentTimer?.invalidate()
        paymentTimer = nil
    }

    private func checkPayment(manual: Bool = false) async {
        if isCheckingPayment { return }
        isCheckingPayment = true

        do {
            let (isPremium, newExpiry) = try await SupabaseClient.shared.checkPaymentStatus()

            if isPremium {
                stopPolling()
                licenseManager.refreshLicense(premium: true, expiresAt: newExpiry)
                withAnimation {
                    showSuccess = true
                }
            }
        } catch {
            print("Check failed: \(error)")
        }

        isCheckingPayment = false
    }

    private func fetchRates() async {
        do {
            exchangeRates = try await SupabaseClient.shared.fetchCryptoRates()
        } catch {
            print("Failed to fetch rates")
        }
    }

    private func calculateCryptoAmount(usd: Double) -> String? {
        guard let rates = exchangeRates else { return nil }
        let amount = usd / rates.eth
        return String(format: "%.4f ETH", amount)
    }

    private func generateQRCode(for address: String, amountUSD: Double) -> NSImage {
        let uri = formatPaymentURI(address: address, amountUSD: amountUSD)
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(uri.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return NSImage(cgImage: cgimg, size: NSSize(width: cgimg.width, height: cgimg.height))
            }
        }
        return NSImage(systemSymbolName: "xmark.circle", accessibilityDescription: nil) ?? NSImage()
    }

    private func formatPaymentURI(address: String, amountUSD: Double) -> String {
        guard let rates = exchangeRates else { return address }
        let amountETH = amountUSD / rates.eth
        let wei = amountETH * 1_000_000_000_000_000_000
        return String(format: "ethereum:%@?value=%.0f&amount=%.8f", address, wei, amountETH)
    }
}

// MARK: - Stitch Components

struct StitchPricingCard: View {
    let price: String
    let duration: String
    let subtext: String
    let isSelected: Bool
    let isBestValue: Bool
    let action: () -> Void
    
    @State private var isHovered = false
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .top) {
                // Card Content
                VStack(spacing: 12) {
                    Text(price)
                        .font(.system(size: 36, weight: .heavy))
                        .foregroundColor(isSelected ? .white : DesignSystem.Colors.textSecondary)
                        .padding(.top, 20)
                    
                    Text(duration)
                        .font(.headline)
                        .foregroundColor(isSelected ? DesignSystem.Colors.accent : DesignSystem.Colors.textSecondary)
                    
                    Divider().background(Color.white.opacity(0.1))
                    
                    Text(subtext)
                        .font(.caption)
                        .foregroundColor(DesignSystem.Colors.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }
                .frame(width: 140)
                .stitchCard(isHovered: isHovered, isSelected: isSelected)
                
                // Best Value Badge
                if isBestValue {
                    Text("BEST VALUE")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(
                            Capsule()
                                .fill(DesignSystem.Gradients.premiumGold)
                        )
                        .offset(y: -12)
                        .shadow(color: DesignSystem.Colors.accent.opacity(0.5), radius: 5)
                }
            }
        }
        .buttonStyle(.plain)
        .onHover { isHovered = $0 }
    }
}

struct SuccessView: View {
    let dismiss: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 80))
                .foregroundColor(DesignSystem.Colors.accent)
                .stitchGlow(color: DesignSystem.Colors.accent, radius: 20)
                .padding()

            Text("Premium Unlocked!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            Text("Thank you for supporting RedLemon.\nYou can now host unlimited watch parties.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(DesignSystem.Colors.textSecondary)

            Button("Done") {
                dismiss()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 32)
            .background(DesignSystem.Colors.accent)
            .foregroundColor(.black)
            .cornerRadius(10)
            .padding(.top, 20)
            .buttonStyle(.plain)
            .shadow(color: DesignSystem.Colors.accent.opacity(0.5), radius: 10)
        }
        .padding()
        .transition(.scale)
    }
}
