//
//  TransparentTextEditor.swift
//  RedLemon
//
//  A transparent, multiline text editor for macOS 12 compatibility
//

import SwiftUI
import AppKit

struct TransparentTextEditor: NSViewRepresentable {
    @Binding var text: String
    var onCommit: () -> Void
    var isFocused: Bool = false

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeNSView(context: Context) -> NSScrollView {
        let scrollView = NSScrollView()
        scrollView.drawsBackground = false
        scrollView.borderType = .noBorder
        scrollView.hasVerticalScroller = false // Auto-grow preferred
        scrollView.documentView = context.coordinator.textView
        return scrollView
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        if context.coordinator.textView.string != text {
            // Use AttributedString to ensure font/color/emoji support is robust
            let attributes: [NSAttributedString.Key: Any] = [
                .font: NSFont.systemFont(ofSize: 13),
                .foregroundColor: NSColor.white
            ]
            let attributedString = NSAttributedString(string: text, attributes: attributes)
            context.coordinator.textView.textStorage?.setAttributedString(attributedString)
            context.coordinator.textView.needsDisplay = true
        }
        
        if isFocused {
             DispatchQueue.main.async {
                 if let window = nsView.window, window.firstResponder != context.coordinator.textView {
                     window.makeFirstResponder(context.coordinator.textView)
                 }
             }
        }
    }

    class Coordinator: NSObject, NSTextViewDelegate {
        var parent: TransparentTextEditor
        lazy var textView: NSTextView = {
            let tv = NSTextView()
            tv.drawsBackground = false
            tv.isRichText = true // Allow emojis/rich content
            tv.importsGraphics = true
            tv.isEditable = true
            tv.isSelectable = true
            tv.font = .systemFont(ofSize: 13) // Match existing style
            tv.textColor = .white
            tv.delegate = self
            
            // Allow growing
            tv.isVerticallyResizable = true
            tv.isHorizontallyResizable = false
            tv.autoresizingMask = [.width]
            tv.textContainer?.widthTracksTextView = true
            tv.textContainer?.containerSize = NSSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
            
            return tv
        }()

        init(_ parent: TransparentTextEditor) {
            self.parent = parent
        }

        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            self.parent.text = textView.string
        }

        func textView(_ textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
            // Handle Enter key to send
            if commandSelector == #selector(NSResponder.insertNewline(_:)) {
                // If Shift is pressed, insert newline. Otherwise, commit.
                if let event = NSApp.currentEvent, event.modifierFlags.contains(.shift) {
                    return false // Let default implementation insert newline
                } else {
                    parent.onCommit()
                    return true // Consume event
                }
            }
            return false
        }
    }
}
