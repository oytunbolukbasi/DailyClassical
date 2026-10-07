import SwiftUI
import WidgetKit

@main
struct DailyClassicalApp: App {
    @State private var language = LanguageSettings()
    @State private var appearance = AppearanceSettings()
    @State private var content = ContentStore()
    @State private var session = SessionStore()
    @State private var entitlements = EntitlementStore()
    @State private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(language)
                .environment(appearance)
                .environment(content)
                .environment(session)
                .environment(entitlements)
                .environment(router)
                // One switch drives every Text lookup, date/number format and the API locale.
                .environment(\.locale, language.locale)
                .preferredColorScheme(appearance.theme.colorScheme)
                .tint(Palette.accent)
                .task(id: language.code) { await content.reload(language: language.code) }
                .task {
                    // The widget fetches its own feed only when this build reads the API (debug builds
                    // default to bundled fixtures), so app and widget show the same plan.
                    UserDefaults(suiteName: "group.co.dailyclassical")?.set(ContentSource.isAPI, forKey: "contentFromAPI")
                    // Refresh widgets whenever the app (and its content) changes.
                    WidgetCenter.shared.reloadAllTimelines()
                    await session.refreshAccount()
                    await session.refreshFavourites()
                }
                // Account-level (comp) Premium unlocks the same things as a purchase.
                .onChange(of: session.accountPremium, initial: true) { entitlements.accountPremium = session.accountPremium }
        }
    }
}
