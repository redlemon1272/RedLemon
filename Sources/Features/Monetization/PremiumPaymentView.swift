
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
    @State private var selectedPlan: String = "$4"
    @State private var exchangeRates: (btc: Double, eth: Double)?
    @State private var freeLimitSeconds: TimeInterval?

    enum Chain: String, CaseIterable, Identifiable {
        case evm = "evm"

        var id: String { rawValue }

        var displayName: String {
            switch self {
            case .evm: return "Ethereum & L2s (Base, Arb, Op, Poly)"
            }
        }

        var icon: String {
            switch self {
            case .evm: return "diamond.circle.fill" // SF Symbol approximation
            }
        }

        var color: Color {
            switch self {
            case .evm: return .blue
            }
        }
    }

    var body: some View {
        ZStack {
            Color(NSColor.windowBackgroundColor).edgesIgnoringSafeArea(.all)

            if showSuccess {
                SuccessView(dismiss: { dismiss() })
            } else {
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 20) {
                        Text("Host License")
                            .font(.system(size: 28, weight: .bold))



                        Text("Unlock premium to host unlimited watch parties. Choose a plan that suits you.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)

                        // Pricing Tiers
                        HStack(spacing: 16) {
                            PricingBadge(
                                price: "$4",
                                duration: "30 Days",
                                isSelected: selectedPlan == "$4",
                                cryptoAmount: calculateCryptoAmount(usd: 4),
                                action: { selectedPlan = "$4" }
                            )
                            PricingBadge(
                                price: "$7",
                                duration: "60 Days",
                                isSelected: selectedPlan == "$7",
                                cryptoAmount: calculateCryptoAmount(usd: 7),
                                action: { selectedPlan = "$7" }
                            )
                            PricingBadge(
                                price: "$10",
                                duration: "90 Days",
                                isSelected: selectedPlan == "$10",
                                cryptoAmount: calculateCryptoAmount(usd: 10),
                                action: { selectedPlan = "$10" }
                            )
                        }
                        .padding(.top, 4)


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

                    // 1. Select Chain (Custom Segmented Control)
                    HStack(spacing: 12) {
                        ForEach(Chain.allCases) { chain in
                            Button(action: {
                                LogManager.shared.info("🔘 User switched chain to: \(chain.rawValue)")
                                selectedChain = chain
                                Task { await loadAddress() }
                            }) {
                                HStack {
                                    Image(systemName: chain.icon)
                                        .foregroundColor(selectedChain == chain ? .white : chain.color)
                                    Text(chain.displayName)
                                        .fontWeight(selectedChain == chain ? .medium : .regular)
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 16)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(selectedChain == chain ? Color.blue : Color.white.opacity(0.1))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedChain == chain ? Color.blue : Color.white.opacity(0.2), lineWidth: 1)
                                )
                                .foregroundColor(selectedChain == chain ? .white : .primary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)

                    // EVM Clarity Note
                    if selectedChain == .evm {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("✅ Single Address Support")
                                .font(.caption.bold())
                                .foregroundColor(.green)

                            Text("You can send **ETH**, **USDC**, or **USDT** on any of these networks to this single address:")
                                .font(.caption)
                                .foregroundColor(.secondary)

                            Text("• Ethereum Mainnet\n• Base\n• Arbitrum One\n• Optimism\n• Polygon PoS")
                                .font(.caption)
                                .foregroundColor(.primary)
                                .fontWeight(.medium)
                        }
                        .padding(12)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }

                    // 2. Address & QR
                    VStack(spacing: 20) {
                        if isLoadingAddress {
                            ProgressView("Fetching unique address...")
                                .padding(40)
                        } else if let address = assignedAddress {
                            // QR Code
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white)
                                    .frame(width: 180, height: 180)
                                    .shadow(radius: 4)


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
                                    .frame(width: 160, height: 160)
                            }

                            // Address Text & Copy
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
                                    VStack(spacing: 4) {
                                        Text("Send exactly **\(cryptoAmount)**")
                                            .font(.headline)
                                        Text("OR **$\(String(format: "%.2f", usdVal))** USDC/USDT")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    .multilineTextAlignment(.center)
                                } else {
                                    Text("Send exactly $\(String(format: "%.2f", usdVal)) USD equivalent")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                }

                                HStack {
                                    Text(address)
                                        .font(.system(.body, design: .monospaced))
                                        .lineLimit(1)
                                        .truncationMode(.middle)
                                        .frame(maxWidth: 250)

                                    Button(action: {
                                        NSPasteboard.general.clearContents()
                                        NSPasteboard.general.setString(address, forType: .string)
                                    }) {
                                        Image(systemName: "doc.on.doc.fill")
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(12)
                                .background(Color(NSColor.controlBackgroundColor))
                                .cornerRadius(8)
                            }
                        }
                    }

                    if assignedAddress != nil {
                         HStack(spacing: 8) {
                            if isCheckingPayment {
                                ProgressView()
                                    .scaleEffect(0.6)
                            }
                            Text("Automatic check every 10s...")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding(30)
            }

            // Footer (Pinned)
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Button("Cancel") {
                        stopPolling()
                        dismiss()
                    }
                    .keyboardShortcut(.cancelAction)

                    Spacer()

                    Button("I Have Paid") {
                        Task {
                            await checkPayment(manual: true)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(assignedAddress == nil || isLoadingAddress)
                }
                .padding(20)
                .background(Color(NSColor.windowBackgroundColor))
            }
        }
    }
        }
        .frame(width: 480, height: 580)
        .overlay(
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                .font(.system(size: 24))
                .foregroundColor(.secondary.opacity(0.8))
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
                await checkLimit()
            }
        }
        .onDisappear {
            stopPolling()
        }
    }

    // MARK: - Logic

    private func loadAddress() async {
        isLoadingAddress = true
        errorMessage = nil
        stopPolling()

        do {
            let address = try await SupabaseClient.shared.assignPaymentAddress(chain: selectedChain.rawValue)
            LogManager.shared.info("✅ Address assigned for \(selectedChain.rawValue): \(address)")
            assignedAddress = address
            startPolling()
        } catch {
            LogManager.shared.error("❌ Failed to get address for \(selectedChain.rawValue)", error: error)
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
                LogManager.shared.info("✅ Payment Confirmed! Expires: \(String(describing: newExpiry))")
                stopPolling()
                licenseManager.refreshLicense(premium: true, expiresAt: newExpiry)
                withAnimation {
                    showSuccess = true
                }
            } else if manual {
                 // Creating a simple alert via state or just log
                 LogManager.shared.warning("⚠️ Manual payment check: Not confirmed yet")
            }
        } catch {
            LogManager.shared.error("❌ Check payment failed", error: error)
        }

        isCheckingPayment = false
    }

    private func fetchRates() async {
        do {
            exchangeRates = try await SupabaseClient.shared.fetchCryptoRates()
        } catch {
            LogManager.shared.error("❌ Failed to fetch crypto rates", error: error)
        }
    }

    private func checkLimit() async {
        do {
            let seconds = try await SupabaseClient.shared.checkFreeTierLimit()
            if seconds > 0 {
                withAnimation {
                    freeLimitSeconds = seconds
                }
            }
        } catch {
            LogManager.shared.error("❌ Failed to check limit", error: error)
        }
    }

    private func formatDuration(_ interval: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        return formatter.string(from: interval) ?? ""
    }

    private func calculateCryptoAmount(usd: Double) -> String? {
        guard let rates = exchangeRates else { return nil }

        // EVM (ETH) Only
        let amount = usd / rates.eth
        return String(format: "%.4f ETH", amount)
    }

    private func generateQRCode(for address: String, amountUSD: Double) -> NSImage {
        let uri = formatPaymentURI(address: address, amountUSD: amountUSD)
        LogManager.shared.debug("📱 Generating QR for URI: \(uri)")

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

        // EIP-681: ethereum:<address>?value=<WEI>
        // standard ETH decimal is 18
        let amountETH = amountUSD / rates.eth
        let wei = amountETH * 1_000_000_000_000_000_000

        // Compatibility: Some wallets look for "amount" (decimal) instead of "value" (wei)
        // We provide BOTH to maximize success rate.
        // value = integer string of wei (%.0f)
        // amount = decimal string of eth (%.8f)
        return String(format: "ethereum:%@?value=%.0f&amount=%.8f", address, wei, amountETH)
    }
}

struct SuccessView: View {
    let dismiss: () -> Void

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
                .padding()

            Text("Premium Unlocked!")
                .font(.largeTitle)
                .bold()

            Text("Thank you for supporting RedLemon.\nYou can now host unlimited watch parties.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Button("Done") {
                dismiss()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, 20)
            .buttonStyle(.plain) // Remove system styles completely
        }
        .padding()
        .transition(.scale)
    }
}

struct PricingBadge: View {
    let price: String
    let duration: String
    let isSelected: Bool
    var cryptoAmount: String? = nil
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(price)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(isSelected ? .white : .secondary)

                if let crypto = cryptoAmount {
                    Text(crypto)
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .foregroundColor(isSelected ? .white.opacity(0.8) : .secondary.opacity(0.6))
                }

                Text(duration)
                    .font(.caption)
                    .foregroundColor(isSelected ? .white.opacity(0.9) : .secondary.opacity(0.7))
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(isSelected ? Color.blue.opacity(0.3) : Color.white.opacity(0.05))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color.blue : Color.white.opacity(0.1), lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
    }
}
