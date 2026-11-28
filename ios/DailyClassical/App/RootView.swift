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
                TodayScreen().tint(Palette.accent)
            }
            Tab("tab.library", image: "tab-library", value: AppTab.library) {
                LibraryScreen().tint(Palette.accent)
            }
            Tab("tab.settings", image: "tab-settings", value: AppTab.settings) {
                SettingsScreen().tint(Palette.accent)
            }
            Tab("tab.search", image: "search", value: AppTab.search, role: .search) {
                SearchScreen().tint(Palette.accent)
            }
        }
        // The selected tab is glass-ink, never umber (SPEC §3.15: icons are always glass-ink). The
        // tint is scoped to the tab bar: each tab's content above restores the app's accent.
        .tint(Palette.glassInk)
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
        // dailyclassical:// links from the widget, pushes, in-app messages and test invites.
        .onOpenURL { open($0) }
        .onChange(of: DeepLinks.shared.pending, initial: true) {
            guard let url = DeepLinks.shared.pending else { return }
            DeepLinks.shared.pending = nil
            open(url)
        }
        .inAppMessages()
        // Step 1 is a card over the live Today screen, step 2 the reminder (Features/Onboarding).
        .onboarding(isComplete: $hasCompletedOnboarding)
        .updateCheck()
        .ratePrompt()
        .widgetTip()
        #if DEBUG
        .task { await ScreenshotScene.apply(to: router) }
        #endif
    }

    @Environment(\.openURL) private var openURL

    /// dailyclassical://piece/<id> (widget, pushes), ://premium, ://today, ://discover, ://composers,
    /// ://eras, ://forms (Keşfet), ://test-device/<invite>;
    /// https links from pushes and in-app messages open in Safari.
    private func open(_ url: URL) {
        if url.scheme == "https" { openURL(url); return }
        guard url.scheme == "dailyclassical" else { return }
        let arg = url.pathComponents.dropFirst().first
        switch url.host() {
        case "piece":
            guard let arg else { return }
            router.sheet = nil
            router.tab = .today
            router.todayPath = NavigationPath([PieceRoute(id: arg)])
        case "premium":
            router.sheet = .paywall
        // Keşfet (1.5): the Search tab at its root, or one of its pages.
        case "discover", "composers", "eras", "forms":
            router.sheet = nil
            router.searchQuery = ""
            var path = NavigationPath()
            switch url.host() {
            case "composers": path.append(BrowseRoute.composers)
            case "eras": path.append(BrowseRoute.eras)
            case "forms": path.append(BrowseRoute.forms)
            default: break
            }
            router.searchPath = path
            router.tab = .search
        case "today":
            router.sheet = nil
            router.tab = .today
            router.todayPath = NavigationPath()
        case "test-device":
            guard let arg else { return }
            Task {
                let ok = await PushNotifications.shared.verifyTestDevice(invite: arg)
                router.toast = ok ? "testDevice.verified" : "testDevice.failed"
            }
        default:
            break
        }
    }
}

/// Resolves a router sheet into its screen with the right detents.
private struct AppSheetView: View {
    let sheet: AppRouter.Sheet
    @Environment(AppRouter.self) private var router

    var body: some View {
        content
            // A term link inside a router sheet swaps the sheet for that term (sheets that show
            // definitions handle their own links first: GlossaryTermSheet, ComposerSheet).
            .onGlossaryTap { router.present(.glossaryTerm($0)) }
    }

    @ViewBuilder private var content: some View {
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
        case .birthday(let ids):
            if ids.count > 1 { BirthdayChooserSheet(composerIDs: ids) } else { BirthdaySheet(composerID: ids.first ?? "") }
        }
    }
}
