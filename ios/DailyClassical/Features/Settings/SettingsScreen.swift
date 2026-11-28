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
    @Environment(ContentStore.self) private var content

    // ReminderScheduler persists the time under these keys; AppStorage keeps the row live.
    @AppStorage("reminderHour") private var reminderHour: Int?
    @AppStorage("reminderMinute") private var reminderMinute: Int?

    // Test builds only (TestBuild): replay the welcome flow, preview the free trial.
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @AppStorage("debugTrialDays") private var debugTrialDays = 0
    @AppStorage("debugShowAllPieces") private var debugShowAllPieces = false

    @State private var restoring = false
    @State private var redeemingCode = false
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

                    Button { router.widgetTip = .settings } label: {
                        Text("settings.widget").foregroundStyle(Palette.ink)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(.rect)
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
                    // App Store offer codes (e.g. a discounted lifetime for a campaign).
                    Button { redeemingCode = true } label: {
                        Text("settings.redeemCode").foregroundStyle(Palette.accent)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(.rect)
                    }
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

                if TestBuild.isActive { testSection }
            }
            .settingsList()
            // A grouped List adds a top margin while the navigation bar shows. Coming back from a
            // detail, SwiftUI hides the bar only after the pop has finished, so the list arrived
            // 35 pt low and then jumped up. Pinned to zero, it arrives where it rests.
            .contentMargins(.top, 0, for: .scrollContent)
            .offerCodeRedemption(isPresented: $redeemingCode) { result in
                guard case .success = result else { return }
                Task {
                    await entitlements.refreshAfterRedemption()
                    if entitlements.isPremium { router.toast = "settings.redeemCode.done" }
                }
            }
            // The Literata title lives in the list; the bar title only feeds the back button.
            .navigationTitle(Text("settings.title"))
            .toolbar(.hidden, for: .navigationBar)
            .topBounceDisabled()  // DesignSystem/Components/TopBounce.swift
            .manageSubscriptionsSheet(isPresented: $showManageSubscription)
            .onChange(of: language.code) { _, code in
                // Keep the scheduled notification in the language the app now speaks.
                guard let hour = reminderHour, let minute = reminderMinute else { return }
                Task { await DailyReminder.schedule(hour: hour, minute: minute, languageCode: code) }
            }
        }
    }

    // MARK: Rows

    /// Never in App Store or TestFlight builds, so not localized.
    private var testSection: some View {
        Section {
            NavigationLink { TestNotificationsScreen() } label: {
                Text(verbatim: "Bildirim ve doğum günü testi").foregroundStyle(Palette.ink)
            }
            .settingsRow()
            Button { hasCompletedOnboarding = false } label: {
                Text(verbatim: "Karşılamayı yeniden göster").foregroundStyle(Palette.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .settingsRow()
            Toggle(isOn: Binding(
                get: { debugTrialDays > 0 },
                set: { on in
                    debugTrialDays = on ? 3 : 0
                    Task { await entitlements.reloadPreviewTrial() }
                }
            )) {
                Text(verbatim: "3 gün deneme teklifini göster").foregroundStyle(Palette.ink)
            }
            .tint(Palette.accent)
            .settingsRow()
            Toggle(isOn: Binding(
                get: { debugShowAllPieces },
                set: { on in
                    debugShowAllPieces = on
                    Task { await content.reload(language: language.code) }
                }
            )) {
                Text(verbatim: "Tüm katalogu göster (takvimde olmayanlar da)").foregroundStyle(Palette.ink)
            }
            .tint(Palette.accent)
            .settingsRow()
            Button { router.showRatePrompt = true } label: {
                Text(verbatim: "Değerlendirme istemini göster").foregroundStyle(Palette.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .settingsRow()
            Button { router.widgetTip = .automatic } label: {
                Text(verbatim: "Widget tanıtımını göster").foregroundStyle(Palette.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .settingsRow()
            #if DEBUG
            Button { Diagnostics.shared.sendSample() } label: {
                Text(verbatim: "Örnek çökme raporu gönder").foregroundStyle(Palette.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .settingsRow()
            // Lets Meta Events Manager see the trial and purchase events, so they can be added to the
            // SKAdNetwork schema before a campaign runs (a later schema change pauses live ads for 72 h).
            Button {
                AdAttribution.purchased(isTrial: true, price: nil, currency: nil)
                AdAttribution.purchased(isTrial: false, price: 129.99, currency: "TRY")
            } label: {
                Text(verbatim: "Meta'ya deneme ve satın alma test olayı gönder").foregroundStyle(Palette.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .settingsRow()
            #endif
        } header: {
            Text(verbatim: "Test")
                .font(Typography.meta13)
                .tracking(0.26)
                .textCase(.uppercase)
                .foregroundStyle(Palette.ink2)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 3, trailing: 16))
        } footer: {
            Text(verbatim: "Yalnızca test build'lerinde görünür (TestFlight'ta Hakkında › Sürüm satırına 7 kez dokununca açılır). Deneme önizlemesi gerçek bir ürün yokken satın alma yapmaz.")
                .font(Typography.meta13)
                .foregroundStyle(Palette.ink3)
        }
    }

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
        #if DEBUG
        case nil where EntitlementStore.debugUnlock && !entitlements.accountPremium:
            // Debug builds unlock everything for content review; say so, so it isn't mistaken
            // for the account's or a purchase's Premium. Not localized: debug builds only.
            SettingsValueRow("settings.premium.row", value: Text(verbatim: "Debug build"))
                .settingsRow()
        #endif
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
