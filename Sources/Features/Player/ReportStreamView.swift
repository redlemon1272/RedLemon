//
//  ReportStreamView.swift
//  RedLemon
//
//  Modal for reporting bad streams.
//

import SwiftUI

struct ReportStreamView: View {
    let imdbId: String
    let quality: String
    let streamHash: String
    let onDismiss: () -> Void
    
    @State private var selectedReason: String?
    @State private var otherReasonText: String = ""
    @State private var isSubmitting = false
    @State private var showSuccess = false
    
    let reasons = [
        "Different Movie/Show",
        "Poor Quality / CAM",
        "Playback Error / Corrupt",
        "Other"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            if showSuccess {
                VStack(spacing: 16) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.green)
                    Text("Report Sent")
                        .font(.headline)
                    Text("Thanks for helping improve the library!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .transition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        onDismiss()
                    }
                }
            } else {
                Text("Report Stream")
                    .font(.title2.bold())
                
                Text("What's wrong with this stream?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                VStack(spacing: 12) {
                    ForEach(reasons, id: \.self) { reason in
                        Button(action: {
                            selectedReason = reason
                        }) {
                            HStack {
                                Text(reason)
                                Spacer()
                                if selectedReason == reason {
                                    Image(systemName: "checkmark")
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(selectedReason == reason ? 0.2 : 0.05))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(selectedReason == reason ? Color.accentColor : Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                if selectedReason == "Other" {
                    TextField("Please describe the issue...", text: $otherReasonText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: .infinity)
                }
                
                HStack(spacing: 16) {
                    Button("Cancel") {
                        onDismiss()
                    }
                    .keyboardShortcut(.cancelAction)
                    
                    Button("Submit Report") {
                        submitReport()
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                    .disabled(selectedReason == nil || (selectedReason == "Other" && otherReasonText.isEmpty) || isSubmitting)
                }
                .padding(.top, 10)
            }
        }
        .padding(30)
        .background(VisualEffectView(material: .hudWindow, blendingMode: .behindWindow))
        .cornerRadius(20)
        .frame(width: 400)
        .preferredColorScheme(.dark)
    }
    
    func submitReport() {
        guard let reason = selectedReason else { return }
        isSubmitting = true
        
        let finalReason = reason == "Other" ? otherReasonText : reason
        
        Task {
            await SupabaseClient.shared.reportStream(
                imdbId: imdbId,
                quality: quality,
                streamHash: streamHash,
                reason: finalReason
            )
            withAnimation {
                showSuccess = true
            }
        }
    }
}

// MARK: - Visual Effect Helper

struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode

    func makeNSView(context: Context) -> NSVisualEffectView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
        visualEffectView.state = .active
        return visualEffectView
    }

    func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
        visualEffectView.material = material
        visualEffectView.blendingMode = blendingMode
    }
}
