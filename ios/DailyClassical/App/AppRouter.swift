import Observation
import SwiftUI

/// App-wide presentations that any screen can trigger (paywall, sign-in, composer, glossary).
@Observable
final class AppRouter {
    enum Sheet: Identifiable, Equatable {
        case paywall
        case signInPrompt
        case auth(AuthFlow)
        case composer(ComposerRef)
        case glossaryTerm(String)

        var id: String {
            switch self {
            case .paywall: "paywall"
            case .signInPrompt: "signInPrompt"
            case .auth(let f): "auth-\(f)"
            case .composer(let c): "composer-\(c.id)"
            case .glossaryTerm(let id): "term-\(id)"
            }
        }
    }

    enum AuthFlow: String, Equatable { case createAccount, signIn }

    var tab: AppTab = .today
    /// The Search tab's query. The field is attached to the TabView (see RootView) so iOS 26+
    /// turns the search tab into the bottom search field on every device.
    var searchQuery = ""
    /// Navigation stacks of the Today and Library tabs, so any screen can push a piece.
    var todayPath = NavigationPath()
    var libraryPath = NavigationPath()
    var sheet: Sheet?
    var toast: LocalizedStringResource?
    /// Piece to save once the guest finishes signing in from the heart.
    var pendingFavourite: String?
    /// True while Library › Glossary is on screen (set by GlossaryListScreen).
    @ObservationIgnored var glossaryListVisible = false

    func present(_ sheet: Sheet) { self.sheet = sheet }

    /// Pushes a piece on the current tab (Today stays on Today; anything else goes to Library).
    func openPiece(_ id: String) {
        if tab == .today {
            todayPath.append(PieceRoute(id: id))
        } else {
            tab = .library
            libraryPath.append(PieceRoute(id: id))
        }
    }

    /// "See all terms in Library". From a piece opened in Library the list is pushed on top, so
    /// Back returns to the piece; from another tab the Library stack starts over at the list.
    func openGlossaryList() {
        if tab == .library {
            if !glossaryListVisible { libraryPath.append(GlossaryListRoute()) }
        } else {
            tab = .library
            libraryPath = NavigationPath([GlossaryListRoute()])
        }
    }
}

/// Pushed onto a tab's NavigationStack.
struct PieceRoute: Hashable { let id: String }
struct GlossaryListRoute: Hashable {}
