
import SwiftUI
import CoreImage.CIFilterBuiltins

struct PremiumPaymentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var licenseManager = LicenseManager.shared
    
    // State
    @State private var selectedChain: Chain = .btc
    @State private var assignedAddress: String?
    @State private var isLoadingAddress = false
    @State private var errorMessage: String?
    @State private var isCheckingPayment = false
    @State private var paymentTimer: Timer?
    @State private var showSuccess = false
    
    enum Chain: String, CaseIterable, Identifiable {
        case btc = "btc"
        case evm = "evm"
        case sol = "sol"
        
        var id: String { rawValue }
        
        var displayName: String {
            switch self {
            case .btc: return "Bitcoin (BTC)"
            case .evm: return "Ethereum / Base (ETH, USDC)"
            case .sol: return "Solana (SOL, USDC)"
            }
        }
        
        var icon: String {
            switch self {
            case .btc: return "bitcoinsign.circle.fill"
            case .evm: return "diamond.circle.fill" // SF Symbol approximation
            case .sol: return "s.circle.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .btc: return .orange
            case .evm: return .blue
            case .sol: return .purple
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color(NSColor.windowBackgroundColor).edgesIgnoringSafeArea(.all)
            
            if showSuccess {
                SuccessView(dismiss: { dismiss() })
            } else {
                VStack(spacing: 30) {
                    // Header
                    VStack(spacing: 12) {
                        Text("Unlock Premium Hosting")
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("Host unlimited watch parties forever with a one-time contribution.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
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

                    // 1. Select Chain
                    Picker("Select Cryptocurrency", selection: $selectedChain) {
                        ForEach(Chain.allCases) { chain in
                            HStack {
                                Image(systemName: chain.icon)
                                    .foregroundColor(chain.color)
                                Text(chain.displayName)
                            }
                            .tag(chain)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .onChange(of: selectedChain) { _ in
                        Task { await loadAddress() }
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
                                    .frame(width: 220, height: 220)
                                    .shadow(radius: 4)
                                
                                Image(nsImage: generateQRCode(from: address))
                                    .interpolation(.none)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            }
                            
                            // Address Text & Copy
                            VStack(spacing: 8) {
                                Text("Send any amount to:")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
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
                    
                    Spacer()
                    
                    // Footer Buttons
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
                }
                .padding(40)
            }
        }
        .frame(width: 500, height: 650)
        .onAppear {
            Task { await loadAddress() }
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
            let isPremium = try await SupabaseClient.shared.checkPaymentStatus()
            if isPremium {
                print("✅ Payment Confirmed!")
                stopPolling()
                licenseManager.activateLicense() // Local state update
                withAnimation {
                    showSuccess = true
                }
            } else if manual {
                 // Creating a simple alert via state or just log
                 print("⚠️ Not confirmed yet")
            }
        } catch {
            print("❌ Check payment failed: \(error)")
        }
        
        isCheckingPayment = false
    }
    
    private func generateQRCode(from string: String) -> NSImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return NSImage(cgImage: cgimg, size: NSSize(width: cgimg.width, height: cgimg.height))
            }
        }
        return NSImage(systemSymbolName: "xmark.circle", accessibilityDescription: nil) ?? NSImage()
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
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.top, 20)
        }
        .padding()
        .transition(.scale)
    }
}
