import SwiftUI
import Testing
@testable import DailyClassical

/// "See all terms in Library" from the glossary sheet (AUDIT P2-13).
@MainActor
struct AppRouterTests {
    @Test func fromAPieceInLibraryTheListIsPushedOnTop() {
        let router = AppRouter()
        router.tab = .library
        router.libraryPath.append(PieceRoute(id: "beethoven-symphony-5"))
        router.openGlossaryList()
        #expect(router.tab == .library)
        #expect(router.libraryPath.count == 2)  // Back returns to the piece
    }

    @Test func fromAnotherTabLibraryStartsOverAtTheList() {
        let router = AppRouter()
        router.libraryPath.append(PieceRoute(id: "beethoven-symphony-5"))
        router.openGlossaryList()  // from Today
        #expect(router.tab == .library)
        #expect(router.libraryPath.count == 1)
    }

    @Test func fromTheListItselfNothingIsPushed() {
        let router = AppRouter()
        router.tab = .library
        router.libraryPath.append(GlossaryListRoute())
        router.glossaryListVisible = true
        router.openGlossaryList()
        #expect(router.libraryPath.count == 1)
    }
}
