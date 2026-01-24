//
//  ReportStreamView.swift
//  RedLemon
//
//  Modal for reporting bad streams.
//

import SwiftUI

struct ReportStreamView: View {
    let imdbId: String
    let season: Int      // For episode-specific decay (-1 for movies)
    let episode: Int     // For episode-specific decay (-1 for movies)
    let quality: String
    let streamHash: String
    let movieTitle: String? // Added to capture title for admin visibility
    let filename: String? // Captured from player
    let provider: String? // Captured from metadata
    let onDismiss: () -> Void

    // Optional: For "Try Another Stream" feature (solo playback only)
    var hasAlternativeStreams: Bool = false
    var isWatchParty: Bool = false // New: Enable specific UX for Watch Party hosts
    var onTryAnother: (() -> Void)? = nil

    @State private var selectedReason: String?
    @State private var isSubmitting = false
    @State private var showSuccess = false
    @State private var showTryAnotherConfirmation = false // New: Safety for global blocks

    let reasons = [
        "Different Movie/Show",
        "Poor Quality / CAM",
        "Playback Error / Corrupt"
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
                    Task { @MainActor in
                        try? await Task.sleep(nanoseconds: 1_500_000_000)
                        onDismiss()
                    }
                }
            } else if showTryAnotherConfirmation {
                    // Custom Internal Confirmation UX (Avoids native cursor issues)
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.orange)

                        Text("Try Another Stream?")
                            .font(.headline)

                        Text("This will block this stream for this session and return everyone to the lobby. Use this only if the stream is incorrect or broken.")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        HStack(spacing: 12) {
                            Button(action: {
                                showTryAnotherConfirmation = false
                            }) {
                                Text("Cancel")
                                    .font(.system(size: 13, weight: .medium))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color.white.opacity(0.1))
                                    .cornerRadius(8)
                            }
                            .buttonStyle(PlainButtonStyle())

                            Button(action: {
                                onTryAnother?()
                                onDismiss()
                            }) {
                                Text("Confirm & Block")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color.red.opacity(0.8))
                                    .cornerRadius(8)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.vertical, 10)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
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

                    HStack(spacing: 16) {
                        Button(action: {
                            onDismiss()
                        }) {
                            Text("Cancel")
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.white.opacity(0.1))
                                .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .keyboardShortcut(.cancelAction)

                        Button(action: {
                            submitReport()
                        }) {
                            Text(isSubmitting ? "Submitting..." : "Submit Report")
                                .font(.body.weight(.semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color.accentColor)
                                .cornerRadius(8)
                                .opacity((selectedReason == nil || isSubmitting) ? 0.5 : 1.0)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .disabled(selectedReason == nil || isSubmitting)
                    }
                    .padding(.top, 10)

                    // Try Another Stream button
                    if hasAlternativeStreams {
                        Button(action: {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                if isWatchParty {
                                    showTryAnotherConfirmation = true
                                } else {
                                    onTryAnother?()
                                    onDismiss()
                                }
                            }
                        }) {
                            HStack(spacing: 6) {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                Text("Try Another Stream")
                            }
                            .font(.body.weight(.medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 8)
                    }
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

        let finalReason = reason

        Task {
            await SupabaseClient.shared.reportStream(
                imdbId: imdbId,
                season: season,
                episode: episode,
                quality: quality,
                streamHash: streamHash,
                reason: finalReason,
                movieTitle: movieTitle,
                filename: filename,
                provider: provider
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
