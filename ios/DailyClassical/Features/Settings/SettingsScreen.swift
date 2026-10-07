import StoreKit
import SwiftUI

/// Settings tab (SPEC §4.13): Account · Reading · Premium · About, as a system grouped list
/// on paper with a Literata large title.
struct SettingsScreen: View {
    @Environment(LanguageSettings.self) private var language
    @Environment(AppearanceSettings.self) private var appearance
    @Environment(SessionStore.self) private var session
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(AppRouter.self) private var router

    // ReminderScheduler persists the time under these keys; AppStorage keeps the row live.
    @AppStorage("reminderHour") private var reminderHour: Int?
    @AppStorage("reminderMinute") private var reminderMinute: Int?

    @State private var restoring = false
    @State private var showManageSubscription = false

    var body: some View {
        @Bindable var language = language
        @Bindable var appearance = appearance
        NavigationStack {
            List {
                Section {
                    ListLargeTitle(title: Text("settings.title"))
                }
                .listLargeTitleRow()

                Section {
                    accountRow
                } header: {
                    SettingsHeader("settings.section.account")
                }

                Section {
                    NavigationLink { ReminderSettingsScreen() } label: {
                        SettingsValueRow("settings.dailyReminder", value: reminderValue)
                    }
                    .settingsRow()

                    NavigationLink {
                        OptionPickerScreen(title: Text("settings.theme"), options: themeOptions, selection: $appearance.theme)
                    } label: {
                        SettingsValueRow("settings.theme", value: themeName(appearance.theme))
                    }
                    .settingsRow()

                    NavigationLink {
                        OptionPickerScreen(
                            title: Text("settings.language"),
                            options: languageOptions,
                            selection: $language.language,
                            footer: Text("settings.language.footer")
                        )
                    } label: {
                        SettingsValueRow("settings.language", value: languageName(language.language))
                    }
                    .settingsRow()
                } header: {
                    SettingsHeader("settings.section.reading")
                }

                Section {
                    premiumRow
                    Button {
                        Task { await restore() }
                    } label: {
                        HStack {
                            Text("settings.restorePurchases").foregroundStyle(Palette.accent)
                            Spacer()
                            if restoring { ProgressView() }
                        }
                        .contentShape(.rect)
                    }
                    .disabled(restoring)
                    .settingsRow()
                } header: {
                    SettingsHeader("settings.section.premium")
                }

                Section {
                    NavigationLink { AboutScreen() } label: {
                        Text("settings.about.credits").foregroundStyle(Palette.ink)
                    }
                    .settingsRow()
                    NavigationLink { SourcesScreen() } label: {
                        Text("settings.about.sources").foregroundStyle(Palette.ink)
                    }
                    .settingsRow()
                } header: {
                    SettingsHeader("settings.section.about")
                }
            }
            .settingsList()
            // The Literata title lives in the list; the bar title only feeds the back button.
            .navigationTitle(Text("settings.title"))
            .toolbar(.hidden, for: .navigationBar)
            .manageSubscriptionsSheet(isPresented: $showManageSubscription)
            .onChange(of: language.code) { _, code in
                // Keep the scheduled notification in the language the app now speaks.
                guard let hour = reminderHour, let minute = reminderMinute else { return }
                Task { await DailyReminder.schedule(hour: hour, minute: minute, languageCode: code) }
            }
        }
    }

    // MARK: Rows

    @ViewBuilder private var accountRow: some View {
        if session.isSignedIn, let email = session.email {
            NavigationLink { AccountScreen() } label: {
                Text(verbatim: email).foregroundStyle(Palette.ink).lineLimit(1).truncationMode(.middle)
            }
            .settingsRow()
        } else {
            Button { router.present(.signInPrompt) } label: {
                Text("settings.account.signIn").foregroundStyle(Palette.accent).frame(maxWidth: .infinity, alignment: .leading)
            }
            .settingsRow()
        }
    }

    @ViewBuilder private var premiumRow: some View {
        switch entitlements.activePlan {
        case nil where entitlements.accountPremium:
            // Premium granted on the account (comp), not bought through the App Store.
            SettingsValueRow("settings.premium.row", value: Text("settings.premium.status.account"))
                .settingsRow()
        case nil:
            Button { router.present(.paywall) } label: {
                SettingsValueRow("settings.premium.row", value: Text("settings.premium.status.free"), showsChevron: true)
            }
            .settingsRow()
        case .monthly:
            Button { showManageSubscription = true } label: {
                SettingsValueRow("settings.premium.row", value: Text("settings.premium.status.monthly"), showsChevron: true)
            }
            .accessibilityHint(Text("settings.premium.manage.accessibilityHint"))
            .settingsRow()
        case .lifetime:
            SettingsValueRow("settings.premium.row", value: Text("settings.premium.status.lifetime"))
                .settingsRow()
        }
    }

    private var reminderValue: Text {
        if let hour = reminderHour, let minute = reminderMinute {
            Text(verbatim: DailyReminder.label(hour: hour, minute: minute))
        } else {
            Text("settings.dailyReminder.off")
        }
    }

    private var themeOptions: [OptionPickerScreen<AppearanceSettings.Theme>.Option] {
        AppearanceSettings.Theme.allCases.map { .init(value: $0, label: themeName($0)) }
    }

    private func themeName(_ theme: AppearanceSettings.Theme) -> Text {
        switch theme {
        case .system: Text("settings.theme.system")
        case .light: Text("settings.theme.light")
        case .dark: Text("settings.theme.dark")
        }
    }

    private var languageOptions: [OptionPickerScreen<AppLanguage>.Option] {
        AppLanguage.allCases.map { .init(value: $0, label: languageName($0)) }
    }

    /// Each language is named in itself so a user who picked the wrong one can find the way back.
    private func languageName(_ lang: AppLanguage) -> Text {
        if let name = lang.nativeName { Text(verbatim: name) } else { Text("settings.language.system") }
    }

    private func restore() async {
        restoring = true
        await entitlements.restore()
        restoring = false
        router.toast = entitlements.isPremium ? "settings.restore.restored" : "settings.restore.none"
    }
}

#Preview("Settings") {
    SettingsScreen()
        .environment(LanguageSettings())
        .environment(AppearanceSettings())
        .environment(SessionStore())
        .environment(EntitlementStore())
        .environment(AppRouter())
        .environment(ContentStore(source: .bundled))
}
