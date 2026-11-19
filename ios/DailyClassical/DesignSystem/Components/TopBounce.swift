import SwiftUI
import UIKit

extension View {
    /// Stops the rubber band at the top of the enclosing List or ScrollView, keeping the one at the
    /// bottom. Library and Settings draw their large title inside the list (the navigation bar is
    /// hidden), so pulling past the top opened an empty band above the title that sprang back, which
    /// read like a pull-to-refresh that never came.
    func topBounceDisabled() -> some View {
        background(TopBounceClamp().frame(width: 0, height: 0).allowsHitTesting(false))
    }
}

/// Finds the UIScrollView that SwiftUI uses for the List (a UICollectionView) and holds its content
/// offset at the top inset whenever a pull would go above it.
private struct TopBounceClamp: UIViewRepresentable {
    func makeUIView(context: Context) -> ClampView { ClampView() }
    func updateUIView(_ uiView: ClampView, context: Context) { uiView.attachSoon() }

    final class ClampView: UIView {
        private var observation: NSKeyValueObservation?
        private weak var scrollView: UIScrollView?

        override func didMoveToWindow() {
            super.didMoveToWindow()
            attachSoon()
        }

        func attachSoon() {
            guard window != nil, scrollView == nil else { return }
            // The list's scroll view is in place after this layout pass.
            DispatchQueue.main.async { [weak self] in self?.attach() }
        }

        private func attach() {
            guard scrollView == nil, let found = Self.scrollView(near: self) else { return }
            scrollView = found
            observation = found.observe(\.contentOffset, options: [.new]) { scrollView, _ in
                let top = -scrollView.adjustedContentInset.top
                if scrollView.contentOffset.y < top {
                    scrollView.contentOffset.y = top
                }
            }
        }

        /// The nearest scroll view: an ancestor, or the first one among the ancestors' subviews
        /// (a background view sits next to the List's collection view, not inside it).
        private static func scrollView(near view: UIView) -> UIScrollView? {
            var current: UIView? = view.superview
            while let v = current {
                if let s = v as? UIScrollView { return s }
                if let s = firstScrollView(in: v, skipping: view) { return s }
                current = v.superview
            }
            return nil
        }

        private static func firstScrollView(in root: UIView, skipping: UIView) -> UIScrollView? {
            for sub in root.subviews where sub !== skipping {
                if let s = sub as? UIScrollView { return s }
                if let s = firstScrollView(in: sub, skipping: skipping) { return s }
            }
            return nil
        }
    }
}
