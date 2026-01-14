import SwiftUI
import AppKit

// MARK: - Version-Aware Scroll Wrapper

/// A helper view that conditionally wraps content with scroll event forwarding
/// based on macOS version. This fixes a macOS 15+ behavior change where
/// scroll events originating over a horizontal ScrollView are not forwarded to parent scroll views.
///
/// Usage: Wrap horizontal ScrollView content with this. It will:
/// - macOS 12-14: Pass through unchanged (original behavior works fine)
/// - macOS 15+: Apply scroll event forwarding fix
///
/// Reference: Landmine #47 - macOS 26 Nested ScrollView Compatibility
struct VerticalScrollForwarder<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        if #available(macOS 15, *) {
            // macOS 15+ needs the scroll event forwarder due to behavior change
            ScrollEventForwarderView(content: { content })
        } else {
            // macOS 12-14: Original behavior works fine, no wrapper needed
            content
        }
    }
}

// MARK: - macOS 15+ Scroll Forwarder (Internal)

/// NSViewRepresentable that forwards vertical scroll events to parent scroll view.
/// Only used on macOS 15+ where nested ScrollView behavior changed.
@available(macOS 15, *)
private struct ScrollEventForwarderView<Content: View>: NSViewRepresentable {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    func makeNSView(context: Context) -> ScrollForwardingContainerView<Content> {
        let containerView = ScrollForwardingContainerView<Content>()
        let hostingView = NSHostingView(rootView: content)
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(hostingView)
        containerView.hostingView = hostingView

        NSLayoutConstraint.activate([
            hostingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            hostingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            hostingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])

        return containerView
    }

    func updateNSView(_ nsView: ScrollForwardingContainerView<Content>, context: Context) {
        nsView.hostingView?.rootView = content
    }
}

/// Custom container view that intercepts scroll events and forwards vertical scrolls
/// to the parent scroll view while allowing horizontal scrolls to pass through normally.
@available(macOS 15, *)
private class ScrollForwardingContainerView<Content: View>: NSView {
    var hostingView: NSHostingView<Content>?

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Find the parent scroll view (the outer vertical ScrollView)
    private func findParentScrollView() -> NSScrollView? {
        var currentView: NSView? = self.superview
        var foundFirst = false

        while let view = currentView {
            if let scrollView = view as? NSScrollView {
                if foundFirst {
                    // This is the outer (parent) scroll view
                    return scrollView
                } else {
                    // This is the inner horizontal scroll view, skip it
                    foundFirst = true
                }
            }
            currentView = view.superview
        }
        return nil
    }

    override func scrollWheel(with event: NSEvent) {
        // Check if this is primarily a vertical scroll
        let isVerticalScroll = abs(event.scrollingDeltaY) > abs(event.scrollingDeltaX)

        if isVerticalScroll {
            // Forward vertical scroll events to the parent scroll view
            if let parentScrollView = findParentScrollView() {
                parentScrollView.scrollWheel(with: event)
                return
            }
        }

        // For horizontal scrolls or if no parent scroll view, use default behavior
        super.scrollWheel(with: event)
    }
}
