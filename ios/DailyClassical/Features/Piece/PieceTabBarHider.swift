import SwiftUI
import UIKit

/// Hides the tab bar while a piece is on screen, driven by UIKit's appearance callbacks rather than
/// a SwiftUI toolbar preference. A preference on the piece page stays in force until a back swipe
/// has fully finished (and the zoom's settle animation with it), so on device the tab bar came back
/// a beat after Today was already showing. `viewWillDisappear` fires as the swipe *starts*; the tab
/// bar fades in alongside it, and a cancelled swipe hides it again.
struct PieceTabBarHider: UIViewControllerRepresentable {
    let router: AppRouter

    func makeUIViewController(context: Context) -> Controller { Controller(router: router) }
    func updateUIViewController(_ controller: Controller, context: Context) {}

    final class Controller: UIViewController {
        private let router: AppRouter
        /// The tab this piece was pushed on: switching tabs must not show that tab's bar.
        private var ownTab: AppTab?

        init(router: AppRouter) {
            self.router = router
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) { fatalError("not used") }

        override func loadView() {
            view = UIView()
            view.isUserInteractionEnabled = false
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let tab = ownTab ?? router.tab
            ownTab = tab
            set(hidden: true, on: tab)
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            guard let tab = ownTab, router.tab == tab else { return }  // leaving through a tab switch
            set(hidden: false, on: tab)
            transitionCoordinator?.notifyWhenInteractionChanges { [weak self] context in
                if context.isCancelled { self?.set(hidden: true, on: tab) }
            }
        }

        private func set(hidden: Bool, on tab: AppTab) {
            guard router.tabBarHidden.contains(tab) != hidden else { return }
            withAnimation(.easeOut(duration: 0.22)) {
                if hidden { router.tabBarHidden.insert(tab) } else { router.tabBarHidden.remove(tab) }
            }
        }
    }
}
