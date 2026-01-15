import SwiftUI
import AppKit
import QuartzCore

/// A wrapper that chooses the correct horizontal scroll implementation based on macOS version.
/// - macOS 15+: Uses HorizontalNSScrollView to fix nested scroll event issues.
/// - macOS 12-14: Uses standard SwiftUI ScrollView.
struct VersionAwareHorizontalScrollView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        if #available(macOS 15, *) {
            // macOS 15+ requires custom NSScrollView to handle nested scrolling correctly
            HorizontalNSScrollView {
                content
            }
            // Explicitly set height to prevent collapsing, though fittingSize should handle it
            // The content usually has its own frame/padding
        } else {
            // macOS 12-14 works perfectly with native SwiftUI
            ScrollView(.horizontal, showsIndicators: false) {
                content
            }
        }
    }
}

/// A custom horizontal scroll view backed by AppKit's NSScrollView.
/// Used to resolve nested scroll behavior issues on macOS 15+ where
/// SwiftUI's native ScrollView consumes vertical scroll events.
private struct HorizontalNSScrollView<Content: View>: NSViewRepresentable {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    func makeNSView(context: Context) -> NSScrollView {
        let scrollView = CustomNSScrollView()
        scrollView.hasVerticalScroller = false
        scrollView.hasHorizontalScroller = false // Hide scrollbars to match SwiftUI style
        scrollView.drawsBackground = false
        scrollView.backgroundColor = .clear

        // Setup content view
        let hostingView = NSHostingView(rootView: content)
        hostingView.translatesAutoresizingMaskIntoConstraints = false

        // Create a document view to hold the hosting view
        // Using a flipped view ensures coordinates start from top-left
        let documentView = FlippedView()
        documentView.translatesAutoresizingMaskIntoConstraints = false
        documentView.addSubview(hostingView)

        scrollView.documentView = documentView

        // Constrain hosting view to document view edges
        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: documentView.topAnchor),
            hostingView.bottomAnchor.constraint(equalTo: documentView.bottomAnchor),
            hostingView.leadingAnchor.constraint(equalTo: documentView.leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: documentView.trailingAnchor)
        ])

        return scrollView
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        if let documentView = nsView.documentView,
           let hostingView = documentView.subviews.first as? NSHostingView<Content> {
            hostingView.rootView = content

            // Allow the hosting view to update its size based on content
            hostingView.layoutSubtreeIfNeeded()

            // Critical: Update document view frame to match content size
            let size = hostingView.fittingSize
            if documentView.frame.size != size {
                documentView.setFrameSize(size)
            }
        }
    }
}

/// Custom NSScrollView subclass that handles scroll wheel events correctly for nested scenarios
private class CustomNSScrollView: NSScrollView {
    // Throttle scroll logging to prevent spam (log max once per second)
    private var lastScrollLogTime: CFTimeInterval = 0
    private let scrollLogInterval: CFTimeInterval = 1.0

    override func scrollWheel(with event: NSEvent) {
        // Determine the dominant axis of scrolling
        let isVertical = abs(event.scrollingDeltaY) > abs(event.scrollingDeltaX)

        // Diagnostic logging (throttled to prevent spam)
        let currentTime = CACurrentMediaTime()
        if currentTime - lastScrollLogTime > scrollLogInterval {
            lastScrollLogTime = currentTime
            let direction = isVertical ? "VERTICAL" : "HORIZONTAL"
            LoggingManager.shared.scrollEvent(direction, forwarded: isVertical, location: "HorizontalNSScrollView")
        }

        if isVertical {
            // Forward vertical scrolling to the next responder (likely the parent vertical NSScrollView)
            self.nextResponder?.scrollWheel(with: event)
        } else {
            // Handle horizontal scrolling normally
            super.scrollWheel(with: event)
        }
    }
}

/// A view that uses flipped coordinates (origin at top-left)
private class FlippedView: NSView {
    override var isFlipped: Bool { true }
}
