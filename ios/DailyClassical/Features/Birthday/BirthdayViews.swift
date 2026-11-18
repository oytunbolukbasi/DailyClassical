import SwiftUI

/// Words for birthdays in the app's language. Turkish suffixes on foreign names come from content
/// (composers.yaml `short_genitive`, `birthday_line`), never from code.
enum BirthdayCopy {
    static func code(_ locale: Locale) -> String { locale.language.languageCode?.identifier == "tr" ? "tr" : "en" }

    /// "Mozart’s" / "Mozart’ın".
    static func possessive(_ c: Composer, code: String) -> String {
        code == "tr" ? (c.shortGenitive ?? c.shortName) : "\(c.shortName)’s"
    }

    static func format(_ key: String, code: String, _ args: CVarArg...) -> String {
        String(format: L10n.string(String.LocalizationValue(key), code: code), locale: Locale(identifier: code), arguments: args)
    }

    /// Today's line: "Mozart’s birthday · 271 years", or both names when two composers share the day.
    static func todayLine(_ list: [Composer], code: String) -> String? {
        guard let first = list.first else { return nil }
        if list.count > 1 {
            return format("birthday.line.two %@ %@", code: code, first.shortName, list[1].shortName)
        }
        return format("birthday.line %@ %lld", code: code, possessive(first, code: code), Birthdays.years(first) ?? 0)
    }

    static func overline(_ c: Composer, code: String) -> String {
        let years = Birthdays.years(c) ?? 0
        return c.birthdayBasis == "baptism"
            ? format("birthday.overline.baptism %lld", code: code, years)
            : format("birthday.overline %lld", code: code, years)
    }
}

/// Today, under the date chip: a separate glass capsule with the birthday line (A1). Tapping it
/// opens the birthday sheet (or the chooser when two composers share the day).
struct BirthdayCapsule: View {
    let composers: [Composer]
    @Environment(AppRouter.self) private var router
    @Environment(\.locale) private var locale

    var body: some View {
        if let line = BirthdayCopy.todayLine(composers, code: BirthdayCopy.code(locale)) {
            Button { router.present(.birthday(composers.map(\.id))) } label: {
                HStack(spacing: 6) {
                    Text(verbatim: line)
                    Icon("chevron-forward-small", size: 12)
                }
                .font(Typography.chip)
                .foregroundStyle(Palette.glassInk)
                .padding(.horizontal, 16)
                .frame(height: 36)
                .contentShape(.capsule)
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: .capsule)
            .accessibilityHint(Text("birthday.two.footnote"))
        }
    }
}

/// The birthday sheet (A2): portrait, "Born on this day · 271 years ago", name, the birth line, a
/// short tribute, the gift line for free readers and the composer's pieces, marked "Open today".
struct BirthdaySheet: View {
    let composerID: String
    @Environment(ContentStore.self) private var content
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(AppRouter.self) private var router
    @Environment(\.dismiss) private var dismiss
    @Environment(\.locale) private var locale

    private var composer: Composer? { content.composers[composerID] }
    private var code: String { BirthdayCopy.code(locale) }
    private var portrait: Composer.Portrait? { composer?.portrait.flatMap { $0.imageUrl == nil ? nil : $0 } }
    private var pieces: [PieceSummary] { content.pieces(by: composerID) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if let portrait {
                    ComposerPortraitImage(portrait: portrait)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .backgroundExtensionEffect()
                        .accessibilityHidden(true)
                    ComposerPortraitCaption(portrait: portrait)
                        .padding(.top, 8)
                        .padding(.horizontal, Spacing.pageGutter)
                }
                if let composer {
                    VStack(alignment: .leading, spacing: 0) {
                        SectionLabel(verbatim: BirthdayCopy.overline(composer, code: code), color: Palette.accent)
                            .padding(.top, portrait == nil ? 24 : 22)
                        Text(verbatim: composer.name)
                            .font(Typography.titleXL)
                            .tracking(-0.3)
                            .lineHeight(1.15, literata: 30)
                            .foregroundStyle(Palette.ink)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 8)
                            .accessibilityAddTraits(.isHeader)
                        if let line = composer.birthdayLine {
                            Text(verbatim: line)
                                .font(Typography.body15)
                                .foregroundStyle(Palette.ink2)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.top, 6)
                        }
                        if let note = composer.birthdayNote {
                            // *Italics* for titles, as in the bio.
                            RichTextView(source: note)
                                .padding(.top, 20)
                        }
                        if !entitlements.isPremium, !pieces.isEmpty {
                            Text(verbatim: BirthdayCopy.format("birthday.gift %@", code: code, composer.shortName))
                                .font(Typography.body15.weight(.medium))
                                .foregroundStyle(Palette.accent)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.vertical, 14)
                                .padding(.horizontal, 16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Palette.accent.opacity(0.1), in: .rect(cornerRadius: Radius.card))
                                .padding(.top, 22)
                        }
                        if !pieces.isEmpty {
                            VStack(alignment: .leading, spacing: 10) {
                                SectionLabel(verbatim: BirthdayCopy.format("birthday.pieces %@ %@", code: code,
                                                                           composer.shortName, BirthdayCopy.possessive(composer, code: code)))
                                ForEach(pieces) { piece in
                                    Button { open(piece) } label: { row(piece) }.buttonStyle(.plain)
                                }
                            }
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .hairlineTop()
                            .padding(.top, 28)
                        }
                    }
                    .padding(.horizontal, Spacing.pageGutter)
                    .padding(.bottom, 48)
                }
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(edges: portrait == nil ? [] : .top)
        .overlay(alignment: .topTrailing) {
            Group {
                if portrait != nil { DarkGlassCloseButton { dismiss() } } else { SheetCloseButton { dismiss() } }
            }
            .padding(.top, 18)
            .padding(.trailing, 16)
        }
        .presentationDetents([.large])
        .presentationDragIndicator(portrait == nil ? .visible : .hidden)
        .presentationBackground(Palette.background)
    }

    private func row(_ piece: PieceSummary) -> some View {
        HStack(spacing: 12) {
            PaintingImage(url: piece.painting?.imageUrl, variant: .thumb)
                .frame(width: 44, height: 44)
                .clipShape(.rect(cornerRadius: Radius.thumbS))
            VStack(alignment: .leading, spacing: 2) {
                Text(verbatim: piece.title)
                    .font(Typography.rowTitleXS)
                    .foregroundStyle(Palette.ink)
                    .multilineTextAlignment(.leading)
                HStack(spacing: 0) {
                    Text(verbatim: piece.yearText + " · ")
                    if piece.id == content.todayID {
                        Text("birthday.today")
                    } else if !entitlements.isPremium && content.isBirthdayGift(piece.id) {
                        Text("birthday.openToday").foregroundStyle(Palette.accent)
                    }
                }
                .font(Typography.meta13)
                .foregroundStyle(Palette.ink2)
            }
            Spacer(minLength: 0)
            if content.isLocked(piece.id, premium: entitlements.isPremium) {
                Icon("lock", size: 16).foregroundStyle(Palette.ink3)
            } else {
                Icon("chevron-forward-small", size: 14).foregroundStyle(Palette.ink3)
            }
        }
        .padding(.vertical, 8)
        .contentShape(.rect)
    }

    private func open(_ piece: PieceSummary) {
        dismiss()
        if content.isLocked(piece.id, premium: entitlements.isPremium) {
            router.present(.paywall)
        } else {
            router.openPiece(piece.id)
        }
    }
}

/// Two composers share the day (A7): one row per composer, each opening that composer's sheet.
struct BirthdayChooserSheet: View {
    let composerIDs: [String]
    @Environment(ContentStore.self) private var content
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(\.locale) private var locale
    @State private var chosen: String?

    var body: some View {
        let list = composerIDs.compactMap { content.composers[$0] }
        let code = BirthdayCopy.code(locale)
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("birthday.two.title")
                    .font(Typography.titleM)
                    .foregroundStyle(Palette.ink)
                    .padding(.top, 28)
                ForEach(list) { c in
                    Button { chosen = c.id } label: {
                        HStack(spacing: 14) {
                            if let p = c.portrait, p.imageUrl != nil {
                                ComposerPortraitImage(portrait: p)
                                    .frame(width: 52, height: 52)
                                    .clipShape(.circle)
                            }
                            VStack(alignment: .leading, spacing: 3) {
                                Text(verbatim: c.name).font(Typography.rowTitle).foregroundStyle(Palette.ink)
                                Text(verbatim: BirthdayCopy.overline(c, code: code))
                                    .font(Typography.meta13).foregroundStyle(Palette.ink2)
                            }
                            Spacer(minLength: 0)
                            Icon("chevron-forward-small", size: 14).foregroundStyle(Palette.ink3)
                        }
                        .padding(.vertical, 12)
                        .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.top, 12)
                if !entitlements.isPremium, list.count > 1 {
                    Text(verbatim: BirthdayCopy.format("birthday.gift.two %@ %@", code: code, list[0].shortName, list[1].shortName))
                        .font(Typography.body15.weight(.medium))
                        .foregroundStyle(Palette.accent)
                        .padding(.top, 18)
                }
                Spacer()
            }
            .padding(.horizontal, Spacing.pageGutter)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Palette.background)
            .sheet(item: Binding(get: { chosen.map(ChosenComposer.init) }, set: { chosen = $0?.id })) {
                BirthdaySheet(composerID: $0.id)
            }
        }
        .presentationDetents([.medium, .large])
        .presentationBackground(Palette.background)
    }

    private struct ChosenComposer: Identifiable { let id: String }
}
