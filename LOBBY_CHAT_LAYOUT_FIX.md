# Lobby Chat Layout Fix

## Issue
The chat section in `WatchPartyLobbyView.swift` renders inconsistently across different Mac screen sizes. Specifically observed on a desktop Mac where the chat appeared "broken" compared to MacBooks.

## Root Causes

### 1. **Flexible Layout with Spacer**
- Line 299 uses `Spacer()` to push chat to bottom
- On smaller windows or different aspect ratios, the Spacer collapses unpredictably
- The chat section has `maxHeight: .infinity` which competes with the Spacer

### 2. **Fixed Minimum Height**
- Line 66: `let chatMinHeight: CGFloat = 140`
- Line 342: `.frame(minHeight: chatMinHeight, maxHeight: .infinity)`
- 140px might be too large for smaller windows, causing overflow or compression

### 3. **Nested ScrollViews**
- Parent ScrollView (line 113) contains movie info and participants
- Chat has its own ScrollView (line 316)
- This nesting can cause layout conflicts on different screen sizes

### 4. **Window Height Not Used**
- Line 64: `lobbyContent(windowHeight: CGFloat)` receives window height
- This parameter is never actually used in the layout calculations
- Chat layout doesn't adapt to available vertical space

## Proposed Fixes

### Fix 1: Use GeometryReader for Adaptive Chat Height

**Location:** Lines 302-409 (Chat section)

**Change:**
```swift
// Replace the fixed chatMinHeight with dynamic calculation
GeometryReader { geometry in
    let availableHeight = geometry.size.height
    let chatHeight = max(140, min(availableHeight * 0.3, 300)) // 30% of available space, min 140px, max 300px

    VStack(alignment: .leading, spacing: 12) {
        // ... existing chat header ...

        VStack(spacing: 8) {
            ScrollViewReader { proxy in
                ScrollView {
                    // ... existing chat content ...
                }
                .frame(height: chatHeight) // Use calculated height instead of minHeight/maxHeight
                .background(Color.black.opacity(0.3))
                .cornerRadius(8)
                // ... existing onChange handlers ...
            }
            // ... existing emoji picker and input ...
        }
    }
}
```

**Benefits:**
- Chat height adapts to window size (30% of available space)
- Minimum 140px ensures usability on small windows
- Maximum 300px prevents chat from dominating on large screens
- Removes unpredictable `maxHeight: .infinity` behavior

### Fix 2: Remove Spacer, Use Fixed Layout

**Location:** Line 299

**Change:**
```swift
// Remove: Spacer()

// Instead, wrap the entire VStack in a GeometryReader and calculate fixed positions
GeometryReader { geometry in
    VStack(spacing: 0) {
        // Header (fixed at top)
        headerView()

        // Scrollable content (takes calculated space)
        ScrollView {
            movieInfoAndParticipants()
        }
        .frame(height: geometry.size.height * 0.5) // 50% for scrollable content

        // Chat (fixed height at bottom)
        chatSection()
            .frame(height: geometry.size.height * 0.3) // 30% for chat

        // Action buttons (fixed at bottom)
        actionButtons()
            .frame(height: geometry.size.height * 0.2) // 20% for buttons
    }
}
```

**Benefits:**
- Predictable layout on all screen sizes
- No competing Spacer/maxHeight conflicts
- Each section gets proportional space

### Fix 3: Separate Chat into Dedicated Component

**Location:** Create new file `LobbyChatView.swift`

**Implementation:**
```swift
struct LobbyChatView: View {
    @Binding var messages: [LobbyMessage]
    @Binding var chatMessages: [ChatMessage]
    @Binding var chatInput: String
    @Binding var showEmojiPicker: Bool

    let onSendMessage: () -> Void
    let availableHeight: CGFloat

    private let emojis = ["😂", "😍", "🔥", "👍", "❤️", "😎", "🎉", "💯", "😭", "🤔", "👀", "✨", "🎬", "🍿", "😱", "🤣"]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .foregroundColor(.white.opacity(0.7))
                Text("Chat")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
            }

            // Messages
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(messages) { message in
                            LobbyMessageRow(message: message)
                                .id(message.id)
                        }

                        ForEach(chatMessages) { chatMsg in
                            ChatMessageRow(message: chatMsg)
                                .id(chatMsg.id)
                        }
                    }
                    .padding()
                }
                .frame(height: calculateChatHeight(availableHeight))
                .background(Color.black.opacity(0.3))
                .cornerRadius(8)
                .onChange(of: messages.count) { _ in
                    scrollToBottom(proxy: proxy)
                }
                .onChange(of: chatMessages.count) { _ in
                    scrollToBottom(proxy: proxy)
                }
            }

            // Input section
            ChatInputView(
                chatInput: $chatInput,
                showEmojiPicker: $showEmojiPicker,
                emojis: emojis,
                onSend: onSendMessage
            )
        }
    }

    private func calculateChatHeight(_ available: CGFloat) -> CGFloat {
        // Adaptive: 25-35% of available height, with min/max bounds
        let percentage: CGFloat = 0.30
        let calculated = available * percentage
        return max(120, min(calculated, 280))
    }

    private func scrollToBottom(proxy: ScrollViewProxy) {
        if let lastMessage = messages.last {
            withAnimation {
                proxy.scrollTo(lastMessage.id, anchor: .bottom)
            }
        } else if let lastChat = chatMessages.last {
            withAnimation {
                proxy.scrollTo(lastChat.id, anchor: .bottom)
            }
        }
    }
}

struct ChatMessageRow: View {
    let message: ChatMessage

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(message.username)
                .font(.caption.weight(.semibold))
                .foregroundColor(.blue)
            Text(message.text)
                .font(.body)
                .foregroundColor(.white)
        }
        .padding(8)
        .background(Color.white.opacity(0.1))
        .cornerRadius(8)
    }
}

struct ChatInputView: View {
    @Binding var chatInput: String
    @Binding var showEmojiPicker: Bool
    let emojis: [String]
    let onSend: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            if showEmojiPicker {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))], spacing: 8) {
                    ForEach(emojis, id: \.self) { emoji in
                        Button(action: {
                            chatInput += emoji
                            showEmojiPicker = false
                        }) {
                            Text(emoji)
                                .font(.system(size: 24))
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(8)
                .background(Color.white.opacity(0.1))
                .cornerRadius(8)
            }

            HStack {
                Button(action: {
                    showEmojiPicker.toggle()
                }) {
                    Image(systemName: showEmojiPicker ? "face.smiling.inverse" : "face.smiling")
                        .foregroundColor(.white.opacity(0.7))
                }
                .buttonStyle(PlainButtonStyle())

                TextField("Send a message...", text: $chatInput)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(8)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onSubmit(onSend)

                Button(action: onSend) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(PlainButtonStyle())
                .disabled(chatInput.isEmpty)
            }
        }
    }
}
```

**Usage in WatchPartyLobbyView:**
```swift
// Replace lines 302-409 with:
GeometryReader { geometry in
    LobbyChatView(
        messages: $viewModel.messages,
        chatMessages: $viewModel.chatMessages,
        chatInput: $viewModel.chatInput,
        showEmojiPicker: $showEmojiPicker,
        onSendMessage: sendMessage,
        availableHeight: geometry.size.height
    )
}
.padding(.horizontal, 24)
.padding(.bottom, 16)
```

**Benefits:**
- Cleaner separation of concerns
- Easier to test chat layout independently
- Adaptive height calculation based on available space
- Reusable component for other views

## Recommended Approach

**Priority: Fix 1 (Quick Fix)**
- Minimal changes to existing code
- Solves the immediate layout issue
- Can be implemented in 10-15 minutes

**Long-term: Fix 3 (Refactor)**
- Better code organization
- More maintainable
- Easier to add features (e.g., chat reactions, mentions)
- Implement when doing a larger UI refactor

## Testing Checklist

After implementing the fix, test on:
- [ ] MacBook Air 13" (smallest common screen)
- [ ] MacBook Pro 16" (largest laptop screen)
- [ ] iMac 27" (desktop with large screen)
- [ ] Mac Mini with 1080p monitor
- [ ] Different window sizes (resized windows)
- [ ] Both portrait and landscape orientations (if applicable)

## Files to Modify

1. **WatchPartyLobbyView.swift** (lines 64-409)
   - Primary file containing the chat layout

2. **LobbyChatView.swift** (new file, if using Fix 3)
   - Dedicated chat component

## Related Issues

- Chat scroll performance with many messages (consider pagination)
- Emoji picker covering input on small screens
- Chat message timestamps not visible on narrow windows

## Notes

- The desktop Mac issue suggests the window was either smaller or had a different aspect ratio
- The `windowHeight` parameter is already available but unused - leverage it
- Consider adding a user preference for chat height (small/medium/large)
