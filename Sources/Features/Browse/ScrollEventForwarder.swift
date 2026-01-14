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
    private static var logThrottleDate: Date = .distantPast

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        NSLog("%@", "🔧 [SCROLL-DEBUG] ScrollForwardingContainerView initialized")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Find the parent scroll view (the outer vertical ScrollView)
    private func findParentScrollView() -> NSScrollView? {
        var currentView: NSView? = self.superview
        var foundFirst = false
        var depth = 0

        while let view = currentView {
            depth += 1
            if let scrollView = view as? NSScrollView {
                if foundFirst {
                    // This is the outer (parent) scroll view
                    NSLog("%@", "🔧 [SCROLL-DEBUG] Found PARENT scroll view at depth \(depth): \(type(of: scrollView))")
                    return scrollView
                } else {
                    // This is the inner horizontal scroll view, skip it
                    NSLog("%@", "🔧 [SCROLL-DEBUG] Found INNER scroll view at depth \(depth): \(type(of: scrollView)) - skipping")
                    foundFirst = true
                }
            }
            currentView = view.superview
        }
        NSLog("%@", "🔧 [SCROLL-DEBUG] ⚠️ NO parent scroll view found after \(depth) levels. foundFirst=\(foundFirst)")
        return nil
    }

    /// Debug: Print view hierarchy
    private func debugPrintHierarchy() {
        var hierarchy: [String] = []
        var currentView: NSView? = self
        while let view = currentView {
            let name = String(describing: type(of: view))
            let isScroll = view is NSScrollView ? " [NSScrollView]" : ""
            hierarchy.append("\(name)\(isScroll)")
            currentView = view.superview
        }
        NSLog("%@", "🔧 [SCROLL-DEBUG] View hierarchy (self → root):\n  \(hierarchy.joined(separator: "\n  → "))")
    }

    override func scrollWheel(with event: NSEvent) {
        let deltaY = event.scrollingDeltaY
        let deltaX = event.scrollingDeltaX
        let isVerticalScroll = abs(deltaY) > abs(deltaX)

        // Throttle logging to avoid spam (max once per second)
        let now = Date()
        if now.timeIntervalSince(Self.logThrottleDate) > 1.0 {
            Self.logThrottleDate = now
            NSLog("%@", "🔧 [SCROLL-DEBUG] scrollWheel called: deltaY=\(String(format: "%.2f", deltaY)) deltaX=\(String(format: "%.2f", deltaX)) isVertical=\(isVerticalScroll)")
            debugPrintHierarchy()
        }

        if isVerticalScroll {
            // Forward vertical scroll events to the parent scroll view
            if let parentScrollView = findParentScrollView() {
                NSLog("%@", "🔧 [SCROLL-DEBUG] ✅ Forwarding to parent scroll view")
                parentScrollView.scrollWheel(with: event)
                return
            } else {
                NSLog("%@", "🔧 [SCROLL-DEBUG] ❌ No parent found, calling super")
            }
        }

        // For horizontal scrolls or if no parent scroll view, use default behavior
        super.scrollWheel(with: event)
    }
}

