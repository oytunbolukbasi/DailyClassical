import SwiftUI

/// Settings › About and credits.
struct AboutScreen: View {
    @Environment(\.locale) private var locale

    private var version: String {
        let info = Bundle.main.infoDictionary
        let short = info?["CFBundleShortVersionString"] as? String ?? "–"
        let build = info?["CFBundleVersion"] as? String ?? "–"
        return "\(short) (\(build))"
    }

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Text(verbatim: "DailyClassical")
                        .font(Typography.titleM)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Text("about.body")
                        .readingStyle()
                        .fixedSize(horizontal: false, vertical: true)
                }
                .listLargeTitleRow()
            }

            Section {
                creditRow("about.credit.paintings", detail: "about.credit.paintings.detail")
                creditRow("about.credit.recordings", detail: "about.credit.recordings.detail")
                creditRow("about.credit.typeface", detail: "about.credit.typeface.detail")
            } header: {
                SettingsHeader("about.section.credits")
            }

            Section {
                Link(destination: AppLinks.website) { linkLabel("about.website") }.settingsRow()
                Link(destination: AppLinks.terms(locale)) { linkLabel("about.terms") }.settingsRow()
                Link(destination: AppLinks.privacy(locale)) { linkLabel("about.privacy") }.settingsRow()
            }

            Section {
                SettingsValueRow("about.version", value: Text(verbatim: version)).settingsRow()
            }
        }
        .settingsList()
        .opensOwnPagesInApp()
        .navigationTitle(Text("settings.about.credits"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbarVisibility(.hidden, for: .tabBar)  // every pushed Settings detail, as Account (SPEC §7.15)
    }

    private func creditRow(_ title: LocalizedStringKey, detail: LocalizedStringKey) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title).foregroundStyle(Palette.ink)
            Text(detail)
                .font(Typography.meta13)
                .lineHeight(1.45)
                .foregroundStyle(Palette.ink2)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.vertical, 8)
        .accessibilityElement(children: .combine)
        .settingsRow()
    }

    private func linkLabel(_ key: LocalizedStringKey) -> some View {
        HStack {
            Text(key).foregroundStyle(Palette.ink)
            Spacer()
            Icon("open-external", size: 16).foregroundStyle(Palette.ink3)
        }
        .contentShape(.rect)
    }
}

#Preview {
    NavigationStack { AboutScreen() }
}
