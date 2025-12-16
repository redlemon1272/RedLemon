import SwiftUI

struct VerifiedStreamsView: View {
    @State private var streams: [SupabaseClient.VerifiedStream] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            HStack {
                Text("Verified Streams")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    Task { await loadStreams() }
                }) {
                    Image(systemName: "arrow.clockwise")
                }
                .disabled(isLoading)
            }
            .padding()

            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            } else if streams.isEmpty {
                Text("No verified streams found.")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(streams, id: \.streamHash) { stream in
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(stream.imdbId)
                                .font(.system(.headline, design: .monospaced))
                                .foregroundColor(.blue)
                            
                            Spacer()
                            
                            Text(stream.quality)
                                .font(.caption)
                                .padding(4)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(4)
                        }
                        
                        Text("Hash: \(stream.streamHash)")
                            .font(.system(.caption, design: .monospaced))
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                                .foregroundColor(.green)
                            Text("\(stream.voteCount) votes")
                            
                            Spacer()
                            
                            if let date = stream.lastVerifiedAt {
                                Text(date.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .font(.caption)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .task {
            await loadStreams()
        }
    }

    private func loadStreams() async {
        isLoading = true
        errorMessage = nil
        do {
            streams = try await SupabaseClient.shared.getAllVerifiedStreams()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
