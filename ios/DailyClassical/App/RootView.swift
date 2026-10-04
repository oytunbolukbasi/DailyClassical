import SwiftUI

enum AppTab: Hashable { case today, library, settings, search }

struct RootView: View {
    @Environment(AppRouter.self) private var router
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    var body: some View {
        @Bindable var router = router
        // System TabView: Liquid Glass tab bar with Search as the separate trailing glass circle.
        TabView(selection: $router.tab) {
            Tab("tab.today", image: "tab-today", value: AppTab.today) {
                TodayScreen()
            }
            Tab("tab.library", image: "tab-library", value: AppTab.library) {
                LibraryScreen()
            }
            Tab("tab.settings", image: "tab-settings", value: AppTab.settings) {
                SettingsScreen()
            }
            Tab("tab.search", image: "search", value: AppTab.search, role: .search) {
                SearchScreen()
            }
        }
        .sheet(item: $router.sheet) { sheet in
            AppSheetView(sheet: sheet)
        }
        .toast($router.toast)
        .onGlossaryTap { router.present(.glossaryTerm($0)) }
        // Step 1 is a card over the live Today screen, step 2 the reminder (Features/Onboarding).
        .onboarding(isComplete: $hasCompletedOnboarding)
    }
}

/// Resolves a router sheet into its screen with the right detents.
private struct AppSheetView: View {
    let sheet: AppRouter.Sheet

    var body: some View {
        switch sheet {
        case .paywall:
            PaywallScreen()
        case .signInPrompt:
            SignInPromptSheet()
        case .auth(let flow):
            AuthSheet(initial: flow)
        case .composer(let composer):
            ComposerSheet(composer: composer)
        case .glossaryTerm(let id):
            GlossaryTermSheet(termID: id)
        }
    }
}
