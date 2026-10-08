import SwiftUI

/// Settings › Daily reminder: on/off plus the same 5-minute wheel as onboarding step 2.
/// Changes are applied as soon as the wheel settles.
struct ReminderSettingsScreen: View {
    @Environment(LanguageSettings.self) private var language
    @Environment(\.openURL) private var openURL

    @State private var enabled: Bool
    @State private var hour: Int
    @State private var minute: Int
    @State private var denied = false
    @State private var didLoad = false

    init() {
        let saved = ReminderScheduler.savedTime
        _enabled = State(initialValue: saved != nil)
        _hour = State(initialValue: saved?.hour ?? DailyReminder.defaultHour)
        _minute = State(initialValue: DailyReminder.snap(saved?.minute ?? 0))
    }

    var body: some View {
        List {
            Section {
                Toggle(isOn: $enabled) {
                    Text("settings.dailyReminder").foregroundStyle(Palette.ink)
                }
                .tint(Palette.accent)
                .settingsRow()

                if enabled {
                    TimeWheel(hour: $hour, minute: $minute)
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .settingsRow()
                }
            } footer: {
                if denied {
                    VStack(alignment: .leading, spacing: 8) {
                        SettingsFooter("settings.reminder.denied")
                        Button("settings.reminder.openSettings") {
                            if let url = URL(string: UIApplication.openSettingsURLString) { openURL(url) }
                        }
                        .font(Typography.meta13.weight(.semibold))
                        .foregroundStyle(Palette.accent)
                    }
                } else {
                    SettingsFooter("settings.reminder.footer")
                }
            }
        }
        .settingsList()
        .navigationTitle(Text("settings.dailyReminder"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbarVisibility(.hidden, for: .tabBar)  // every pushed Settings detail, as Account (SPEC §7.15)
        .animation(.easeOut(duration: 0.2), value: enabled)
        .task(id: [enabled ? 1 : 0, hour, minute]) {
            // Skip the first pass so simply opening the screen never prompts or reschedules.
            guard didLoad else { didLoad = true; return }
            try? await Task.sleep(for: .milliseconds(400))   // let the wheel settle
            guard !Task.isCancelled else { return }
            if enabled {
                let granted = await DailyReminder.schedule(hour: hour, minute: minute, languageCode: language.code)
                denied = !granted
                if !granted { enabled = false }
            } else {
                ReminderScheduler.cancel()
            }
        }
    }
}

#Preview {
    NavigationStack { ReminderSettingsScreen() }
        .environment(LanguageSettings())
}
