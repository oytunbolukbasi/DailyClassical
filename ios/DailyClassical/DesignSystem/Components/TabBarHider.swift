import SwiftUI
import UIKit

extension View {
    /// Hides the tab bar while this pushed screen is on screen, moving it with the navigation
    /// transition (see TabBarHider). For screens that push nothing that also hides the tab bar.
    func hidesTabBar() -> some View {
        background { TabBarHider() }
    }
}

/// Hides the tab bar while a pushed screen (a piece, a Settings detail) is on screen by animating
/// UIKit's tab bar alongside the navigation transition itself. SwiftUI's
/// `.toolbarVisibility(.hidden, for: .tabBar)` defers the tab bar's return until a pop has
/// completely finished, so after a back swipe the root screen sat without its tab bar for a moment
/// and the tab bar then popped in. Animated alongside the transition coordinator, the tab bar
/// follows the finger during an interactive back swipe.
struct TabBarHider: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Controller { Controller() }
    func updateUIViewController(_ controller: Controller, context: Context) {}

    final class Controller: UIViewController {
        /// Whether this screen is the settled top screen. When a transition ends, the tab bar is
        /// set from this, not from the transition's direction: a cancelled back swipe also sends
        /// the screen a fresh viewWillAppear, so per-transition guesses contradicted each other.
        private var onScreen = false

        override func loadView() {
            view = UIView()
            view.isUserInteractionEnabled = false
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            animateTabBar(visible: false)
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            onScreen = true
            settle()
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            animateTabBar(visible: true)
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            onScreen = false
            settle()
        }

        private var tabBar: UITabBar? { tabBarController?.tabBar }

        private func apply(visible: Bool) {
            guard let tabBar else { return }
            tabBar.alpha = visible ? 1 : 0
            tabBar.transform = visible ? .identity : CGAffineTransform(translationX: 0, y: 24)
        }

        /// The settled state: the tab bar belongs to whatever is on screen once nothing is moving.
        private func settle() {
            apply(visible: !onScreen)
            tabBar?.isHidden = onScreen
        }

        private func animateTabBar(visible: Bool) {
            guard let tabBar else { return }
            if visible { tabBar.isHidden = false }
            // The coordinator belongs to the pushed hosting controller (this one is its child).
            let coordinator = transitionCoordinator ?? parent?.transitionCoordinator ?? navigationController?.transitionCoordinator
            guard let coordinator, coordinator.isAnimated else { return }  // settle() follows
            coordinator.animate(alongsideTransition: { _ in
                self.apply(visible: visible)
            }, completion: { _ in
                self.settle()
            })
        }
    }
}
