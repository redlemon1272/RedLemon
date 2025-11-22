import SwiftUI
import CoreImage.CIFilterBuiltins

struct PaymentGateView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var lnbits = LNBitsClient.shared
    @StateObject private var licenseManager = LicenseManager.shared
    
    @State private var invoice: LNBitsInvoice?
    @State private var isLoading = true
    @State private var errorMessage: String?
    @State private var isCheckingPayment = false
    @State private var paymentTimer: Timer?
    
    // Configuration
    let priceInSats = 1000
    let memo = "RedLemon Host License"
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Text("Become a Host")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Unlock the ability to host watch parties forever.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Main Content
                if isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding(50)
                } else if let error = errorMessage {
                    VStack(spacing: 20) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 50))
                            .foregroundColor(.red)
                        Text(error)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Button("Try Again") {
                            generateInvoice()
                        }
                        .buttonStyle(.bordered)
                    }
                } else if let invoice = invoice {
                    // QR Code Section
                    VStack(spacing: 20) {
                        Text("\(priceInSats) Sats")
                            .font(.system(size: 40, weight: .heavy, design: .monospaced))
                            .foregroundColor(.yellow)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 280, height: 280)
                            
                            Image(nsImage: generateQRCode(from: invoice.paymentRequest))
                                .interpolation(.none)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                        }
                        
                        // Copy Button
                        Button(action: {
                            NSPasteboard.general.clearContents()
                            NSPasteboard.general.setString(invoice.paymentRequest, forType: .string)
                        }) {
                            HStack {
                                Image(systemName: "doc.on.doc")
                                Text("Copy Invoice")
                            }
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                        }
                        .buttonStyle(.plain)
                        
                        // Status
                        HStack {
                            ProgressView()
                                .scaleEffect(0.5)
                            Text("Waiting for payment...")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Spacer()
                
                Button("Cancel") {
                    stopPolling()
                    dismiss()
                }
                .foregroundColor(.gray)
            }
            .padding(40)
        }
        .frame(width: 500, height: 650)
        .onAppear {
            generateInvoice()
        }
        .onDisappear {
            stopPolling()
        }
    }
    
    // MARK: - Logic
    
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
    
    private func generateInvoice() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let newInvoice = try await lnbits.createInvoice(amount: priceInSats, memo: memo)
                await MainActor.run {
                    self.invoice = newInvoice
                    self.isLoading = false
                    self.startPolling()
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = "Failed to generate invoice: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
    
    private func startPolling() {
        stopPolling()
        
        // Poll every 2 seconds
        paymentTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            checkPayment()
        }
    }
    
    private func stopPolling() {
        paymentTimer?.invalidate()
        paymentTimer = nil
    }
    
    private func checkPayment() {
        guard let paymentHash = invoice?.paymentHash, !isCheckingPayment else { return }
        
        isCheckingPayment = true
        
        Task {
            do {
                // Query the invoices table in Supabase using custom query builder
                let result = try await SupabaseClient.shared
                    .from("invoices")
                    .select()
                    .eq("payment_hash", value: paymentHash)
                    .execute()
                
                // Parse the result
                if let jsonArray = try? result.value as? [[String: Any]],
                   let firstInvoice = jsonArray.first,
                   let status = firstInvoice["status"] as? String,
                   status == "paid" {
                    await MainActor.run {
                        print("✅ Payment confirmed!")
                        licenseManager.activateLicense()
                        stopPolling()
                        dismiss()
                    }
                }
            } catch {
                print("⚠️ Payment check failed: \(error)")
            }
            isCheckingPayment = false
        }
    }
}

// Helper struct for decoding invoice from Supabase
struct Invoice: Codable {
    let paymentHash: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case paymentHash = "payment_hash"
        case status
    }
}
