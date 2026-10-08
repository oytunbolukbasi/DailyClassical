import SwiftUI

/// Public web pages linked from the paywall, auth legal line and About. Terms and Privacy are served
/// by the API (backend/src/routes/legal.ts) in the app's language until the website exists.
enum AppLinks {
    static let website = URL(string: "https://dailyclassical.co")!
    private static let pagesHost = "api.dailyclassical.co"

    static func terms(_ locale: Locale) -> URL { page("terms", locale) }
    static func privacy(_ locale: Locale) -> URL { page("privacy", locale) }

    private static func page(_ name: String, _ locale: Locale) -> URL {
        let language = locale.language.languageCode?.identifier == "tr" ? "tr" : "en"
        return URL(string: "https://\(pagesHost)/\(name)?locale=\(language)")!
    }

    /// Terms and Privacy, opened in the in-app browser (opensOwnPagesInApp).
    static func isOwnPage(_ url: URL) -> Bool {
        url.host() == pagesHost && ["/terms", "/privacy"].contains(url.path())
    }
}

// MARK: - Grouped list styling (SPEC §3.12 Settings row, §3.27 footer)

extension View {
    /// System inset-grouped list on paper with solid surface rows (never glass).
    func settingsList() -> some View {
        listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(Palette.background)
            .listSectionSpacing(22)
            .environment(\.defaultMinListRowHeight, 50)
    }

    /// Settings row: SF 17 −0.2 on `surface`, full-width 0.5 pt `rule` separators.
    func settingsRow() -> some View {
        font(Typography.body17)
            .tracking(-0.2)
            .listRowBackground(Palette.surface)
            .listRowSeparatorTint(Palette.rule)
            // Separators start at the card edge (SPEC §3.12: no leading inset).
            .alignmentGuide(.listRowSeparatorLeading) { _ in -16 }
    }

    /// A row that holds a large title above the groups: no card, aligned to the 24 pt page gutter.
    func listLargeTitleRow() -> some View {
        listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 11, leading: 8, bottom: 0, trailing: 8))
    }
}

/// "Settings" / "Account": Literata 34 display title with an optional SF 15 subtitle.
struct ListLargeTitle: View {
    let title: Text
    var subtitle: Text? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            title
                .font(Typography.display)
                .tracking(-0.34)
                // No 1.1 line height here: a List row clips the descenders of a tightened line.
                .foregroundStyle(Palette.ink)
                .accessibilityAddTraits(.isHeader)
            subtitle?
                .font(Typography.body15)
                .foregroundStyle(Palette.ink2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/// Section header: SF 13 ink2, uppercase, +0.02em.
struct SettingsHeader: View {
    let key: LocalizedStringKey
    init(_ key: LocalizedStringKey) { self.key = key }

    var body: some View {
        Text(key)
            .font(Typography.meta13)
            .tracking(0.26)
            .textCase(.uppercase)
            .foregroundStyle(Palette.ink2)
            // Tightest the system list allows: ≈9 pt above the card (SPEC §3.12: 7).
            .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 3, trailing: 16))
    }
}

/// Footer note under a group: SF 13/1.45 ink3.
struct SettingsFooter: View {
    let text: Text
    init(_ key: LocalizedStringKey) { text = Text(key) }
    init(_ text: Text) { self.text = text }

    var body: some View {
        text
            .font(Typography.meta13)
            .lineHeight(1.45)
            .foregroundStyle(Palette.ink3)
    }
}

/// Title on the left, value in ink2 on the right; optional chevron for button rows
/// (NavigationLink rows get the system chevron).
struct SettingsValueRow: View {
    let title: Text
    var value: Text? = nil
    var showsChevron = false

    init(_ key: LocalizedStringKey, value: Text? = nil, showsChevron: Bool = false) {
        title = Text(key)
        self.value = value
        self.showsChevron = showsChevron
    }

    var body: some View {
        HStack(spacing: 12) {
            title.foregroundStyle(Palette.ink)
            Spacer(minLength: 8)
            value?.foregroundStyle(Palette.ink2).multilineTextAlignment(.trailing)
            if showsChevron {
                Image(systemName: "chevron.forward")
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(Palette.ink3)
                    .accessibilityHidden(true)
            }
        }
        .contentShape(.rect)
        .accessibilityElement(children: .combine)
    }
}

/// A pushed single-choice list (Theme, Language) with an accent checkmark.
struct OptionPickerScreen<Value: Hashable>: View {
    struct Option: Identifiable {
        let value: Value
        let label: Text
        var id: Value { value }
    }

    let title: Text
    let options: [Option]
    @Binding var selection: Value
    var footer: Text? = nil

    var body: some View {
        List {
            Section {
                ForEach(options) { option in
                    let selected = option.value == selection
                    Button { selection = option.value } label: {
                        HStack(spacing: 12) {
                            option.label.foregroundStyle(Palette.ink)
                            Spacer(minLength: 8)
                            if selected {
                                Icon("checkmark", size: 18).foregroundStyle(Palette.accent)
                            }
                        }
                        .contentShape(.rect)
                    }
                    .accessibilityAddTraits(selected ? .isSelected : [])
                    .settingsRow()
                }
            } footer: {
                if let footer { SettingsFooter(footer) }
            }
        }
        .settingsList()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarVisibility(.hidden, for: .tabBar)  // every pushed Settings detail, as Account (SPEC §7.15)
    }
}
