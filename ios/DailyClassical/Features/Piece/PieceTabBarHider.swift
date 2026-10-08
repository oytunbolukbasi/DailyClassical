import SwiftUI
import UIKit

/// Hides the tab bar while a piece is on screen by animating UIKit's tab bar alongside the
/// navigation transition itself. SwiftUI's `.toolbarVisibility(.hidden, for: .tabBar)` defers the
/// tab bar's return until a pop has completely finished, so after a back swipe Today sat without
/// its tab bar for a moment. Animated alongside the transition coordinator, the tab bar follows the
/// finger during an interactive back swipe.
struct PieceTabBarHider: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Controller { Controller() }
    func updateUIViewController(_ controller: Controller, context: Context) {}

    final class Controller: UIViewController {
        /// Whether the piece is the settled top screen. When a transition ends, the tab bar is set
        /// from this, not from the transition's direction: a cancelled back swipe also sends the
        /// piece a fresh viewWillAppear, so per-transition guesses contradicted each other.
        private var pieceOnScreen = false

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
            pieceOnScreen = true
            settle()
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            animateTabBar(visible: true)
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            pieceOnScreen = false
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
            apply(visible: !pieceOnScreen)
            tabBar?.isHidden = pieceOnScreen
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
