//
//  ChatOverlayView.swift
//  RedLemon
//
//  Slide-in chat overlay for Prime Watch
//

import SwiftUI

struct ChatOverlayView: View {
    @ObservedObject var viewModel: MPVPlayerViewModel
    @FocusState private var isInputFocused: Bool
    @State private var inputText: String = ""
    @State private var showEmojiPicker: Bool = false

    // Common emojis for quick access
    private let emojis = ["😂", "😍", "🔥", "👍", "❤️", "😎", "🎉", "💯", "😭", "🤔", "👀", "✨", "🎬", "🍿", "😱", "🤣"]

    var body: some View {
        VStack(spacing: 0) {
            header
            messagesList
            inputArea
        }
        .frame(width: 350)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.3), radius: 20)
        .padding(.trailing, 20)
        .padding(.vertical, 60)
        .onAppear {
            print("👁️ ChatOverlayView appeared")
            // Auto-focus the input field when chat opens
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isInputFocused = true
            }
        }
        .onChange(of: viewModel.showChat) { newValue in
            // Auto-focus when chat is toggled open
            if newValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    isInputFocused = true
                }
            }
        }
    }

    private var header: some View {
        HStack {
            Text("💬 Chat")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            Button(action: { viewModel.toggleChat() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.7))
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color.black.opacity(0.3))
    }

    private var messagesList: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(message.username)
                                .font(.caption.weight(.semibold))
                                .foregroundColor(.blue)
                            Text(message.text)
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        .padding(12)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(8)
                        .id(message.id)
                    }
                }
                .padding()
            }
            .onChange(of: viewModel.messages.count) { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if let lastMessage = viewModel.messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
        }
    }

    private var inputArea: some View {
        VStack(spacing: 0) {
            // Emoji picker (appears above input when shown)
            if showEmojiPicker {
                emojiPicker
            }

            // Input row
            HStack(spacing: 12) {
                // Emoji button
                Button(action: {
                    showEmojiPicker.toggle()
                }) {
                    Image(systemName: showEmojiPicker ? "face.smiling.inverse" : "face.smiling")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)

                TextField("Type a message...", text: $inputText)
                    .textFieldStyle(.plain)
                    .padding(12)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .focused($isInputFocused)
                    .onSubmit { sendMessage() }

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .disabled(inputText.isEmpty)
            }
            .padding()
        }
    }

    private var emojiPicker: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
            ForEach(emojis, id: \.self) { emoji in
                Button(action: {
                    inputText += emoji
                    showEmojiPicker = false
                    isInputFocused = true
                }) {
                    Text(emoji)
                        .font(.system(size: 24))
                        .frame(width: 40, height: 40)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
        .background(Color.black.opacity(0.3))
    }

    private func sendMessage() {
        guard !inputText.isEmpty else { return }
        viewModel.sendMessage(inputText)
        inputText = ""
    }
}
