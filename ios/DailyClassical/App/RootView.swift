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
        // Search lives on the TabView itself: selecting the search tab morphs the tab bar into the
        // bottom search field (Apple's iOS 26 pattern). Attached to the tab's content instead, iOS
        // may place the field at the top of the screen (it did on iPhone 16 Pro Max, iOS 27.0.1).
        .searchable(text: $router.searchQuery, prompt: Text("search.placeholder"))
        .tabViewSearchActivation(.searchTabSelection)
        .sheet(item: Binding(get: { router.sheet == .paywall ? nil : router.sheet }, set: { router.sheet = $0 })) { sheet in
            AppSheetView(sheet: sheet)
        }
        // The paywall is a full-height page with the painting under the status bar (SPEC §4.10).
        .fullScreenCover(isPresented: Binding(get: { router.sheet == .paywall }, set: { if !$0 { router.sheet = nil } })) {
            PaywallScreen()
        }
        .toast($router.toast)
        .onGlossaryTap { router.present(.glossaryTerm($0)) }
        // Widget taps: dailyclassical://piece/<id> opens that piece on the Today tab.
        .onOpenURL { url in
            guard url.scheme == "dailyclassical", url.host() == "piece", let id = url.pathComponents.dropFirst().first else { return }
            router.sheet = nil
            router.tab = .today
            router.todayPath = NavigationPath([PieceRoute(id: id)])
        }
        // Step 1 is a card over the live Today screen, step 2 the reminder (Features/Onboarding).
        .onboarding(isComplete: $hasCompletedOnboarding)
        .updateCheck()
    }
}

/// Resolves a router sheet into its screen with the right detents.
private struct AppSheetView: View {
    let sheet: AppRouter.Sheet

    var body: some View {
        switch sheet {
        case .paywall:
            EmptyView()  // presented as a full-screen cover by RootView
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
