import SwiftUI

/// Large-detent composer page opened from the composer link (SPEC §4.8): portrait flush to the
/// sheet's top edge, caption, name and meta, facts card, three-paragraph bio and the composer's
/// pieces. Every block after the name is optional; a composer without a portrait gets the plain
/// sheet chrome (system grabber, ink close circle) instead of the over-photo variants.
struct ComposerSheet: View {
    let composer: ComposerRef
    @Environment(ContentStore.self) private var content
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(AppRouter.self) private var router
    @Environment(\.dismiss) private var dismiss
    @Environment(\.locale) private var locale
    @State private var glossaryTerm: GlossaryLink?

    private var details: Composer? { content.composers[composer.id] }
    private var portrait: Composer.Portrait? { details?.portrait.flatMap { $0.imageUrl == nil ? nil : $0 } }
    private var pieces: [PieceSummary] { content.library.value?.filter { $0.composer.id == composer.id } ?? [] }

    private static let portraitHeight: CGFloat = 300
    private static let factKeys: Set<String> = ["born", "died", "symphonies", "bestKnownFor"]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if let portrait {
                    ComposerPortraitImage(portrait: portrait)
                        .frame(height: Self.portraitHeight)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .accessibilityElement()
                        .accessibilityLabel(Text("composer.portrait.accessibilityLabel \(name)"))
                        .accessibilityAddTraits(.isImage)
                    ComposerPortraitCaption(portrait: portrait)
                        .padding(.top, 8)
                        .padding(.horizontal, Spacing.pageGutter)
                }

                VStack(alignment: .leading, spacing: 0) {
                    nameBlock
                        .padding(.top, portrait == nil ? 24 : 22)
                        // Clear the close button when it sits over the page instead of the photo.
                        .padding(.trailing, portrait == nil ? 44 : 0)

                    if !facts.isEmpty {
                        factsCard.padding(.top, 22)
                    }

                    if !paragraphs.isEmpty {
                        VStack(alignment: .leading, spacing: 14) {
                            ForEach(Array(paragraphs.enumerated()), id: \.offset) { _, paragraph in
                                RichTextView(source: paragraph)
                            }
                        }
                        .padding(.top, 24)
                        .onGlossaryTap { glossaryTerm = GlossaryLink(id: $0) }
                    }

                    inDailyClassical
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .hairlineTop()
                        .padding(.top, 28)
                }
                .padding(.horizontal, Spacing.pageGutter)
                .padding(.bottom, 48)
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea(edges: portrait == nil ? [] : .top)
        .overlay(alignment: .top) {
            if portrait != nil {
                Capsule()
                    .fill(Color.white.opacity(0.7))
                    .frame(width: 36, height: 5)
                    .padding(.top, 10)
                    .accessibilityHidden(true)
                    .allowsHitTesting(false)
            }
        }
        .overlay(alignment: .topTrailing) {
            Group {
                if portrait != nil {
                    DarkGlassCloseButton { dismiss() }
                } else {
                    SheetCloseButton { dismiss() }
                }
            }
            .padding(.top, 18)
            .padding(.trailing, 16)
        }
        .sheet(item: $glossaryTerm) { GlossaryTermSheet(termID: $0.id) }
        .presentationDetents([.large])
        .presentationDragIndicator(portrait == nil ? .visible : .hidden)
        .presentationBackground(Palette.background)
    }

    // MARK: Name block

    private var name: String { details?.name ?? composer.name }

    private var nameBlock: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(verbatim: name)
                .font(Typography.titleXL)
                .tracking(-0.3)
                .lineHeight(1.15, literata: 30)
                .foregroundStyle(Palette.ink)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityAddTraits(.isHeader)
            if let meta {
                Text(verbatim: meta)
                    .font(Typography.body15)
                    .foregroundStyle(Palette.ink2)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    /// "1840 – 1893 · Russian · Late Romantic era"
    private var meta: String? {
        var parts: [String] = []
        if let b = details?.birthYear, let d = details?.deathYear { parts.append("\(String(b)) – \(String(d))") }
        if let nationality = details?.nationality, !nationality.isEmpty { parts.append(nationality) }
        if let era = details?.era ?? pieces.first?.era {
            parts.append(L10n.string(String.LocalizationValue("era." + era.rawValue), code: locale.language.languageCode?.identifier ?? "en"))
        }
        return parts.isEmpty ? nil : parts.joined(separator: " · ")
    }

    // MARK: Facts card

    private var facts: [Composer.Fact] {
        (details?.facts ?? []).filter { Self.factKeys.contains($0.label) && !$0.value.isEmpty }
    }

    /// Two-column grid, 12 v × 20 h, inside a `surface` card (padding 16 × 18).
    private var factsCard: some View {
        let rows = stride(from: 0, to: facts.count, by: 2).map { Array(facts[$0..<min($0 + 2, facts.count)]) }
        return VStack(alignment: .leading, spacing: 12) {
            ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                HStack(alignment: .top, spacing: 20) {
                    ForEach(row, id: \.label) { factCell($0) }
                    if row.count == 1 { Color.clear.frame(maxWidth: .infinity, maxHeight: 0) }
                }
            }
        }
        .padding(.vertical, Spacing.cardPaddingV)
        .padding(.horizontal, Spacing.cardPaddingH)
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
    }

    private func factCell(_ fact: Composer.Fact) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(LocalizedStringKey("composer.fact." + fact.label))  // concatenated, not interpolated: interpolation makes a "%@" key
                .font(Typography.microRegular)
                .tracking(0.66)
                .textCase(.uppercase)
                .foregroundStyle(Palette.ink3)
            RichTextView(source: fact.value, font: Typography.meta13, lineHeight: 1.4, literataSize: nil, color: Palette.ink)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .accessibilityElement(children: .combine)
    }

    // MARK: Bio

    private var paragraphs: [String] {
        (details?.bio ?? "")
            .components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }

    // MARK: In DailyClassical

    private var inDailyClassical: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionLabel("composer.section.inApp")
            ForEach(pieces) { piece in
                Button { open(piece) } label: { row(piece) }.buttonStyle(.plain)
            }
            Text("composer.morePiecesNote")
                .font(Typography.meta13)
                .lineHeight(1.45)
                .foregroundStyle(Palette.ink3)
                .fixedSize(horizontal: false, vertical: true)
        }
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
                if piece.id == content.todayID {
                    Text("composer.piece.today").font(Typography.meta13).foregroundStyle(Palette.ink2)
                } else {
                    Text(verbatim: piece.yearText).font(Typography.meta13).foregroundStyle(Palette.ink2)
                }
            }
            Spacer(minLength: 0)
            if content.isLocked(piece.id, premium: entitlements.isPremium) {
                Icon("lock", size: 16)
                    .foregroundStyle(Palette.ink3)
                    .accessibilityLabel(Text("common.locked.accessibilityLabel"))
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

/// Identifiable wrapper so a glossary term can stack its sheet on top of the composer sheet.
/// The portrait as a CSS `object-fit: cover; object-position: 50% <focalY>` crop, over its average
/// colour: our optimized copy (bundled, or from the API's /images), never the Commons original.
private struct ComposerPortraitImage: View {
    let portrait: Composer.Portrait

    var body: some View {
        PaintingImage(url: portrait.imageUrl, focus: UnitPoint(x: 0.5, y: portrait.focalY ?? 0.5))
    }
}

/// "— Nikolai Kuznetsov, *Portrait of Tchaikovsky*, 1893. State Tretyakov Gallery, Moscow."
/// SF 12/1.4 `ink3` with the 14 × 1 pt dash (SPEC §3.10).
private struct ComposerPortraitCaption: View {
    let portrait: Composer.Portrait
    @Environment(\.locale) private var locale

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Rectangle()
                .fill(Palette.ink3)
                .frame(width: 14, height: 1)
                .alignmentGuide(.firstTextBaseline) { _ in -1 }
                .accessibilityHidden(true)
            Text(caption)
                .font(Typography.caption)
                .lineHeight(1.4)
                .foregroundStyle(Palette.ink3)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var caption: AttributedString {
        var title = AttributedString(portrait.title)
        title.inlinePresentationIntent = .emphasized
        var result = AttributedString("\(portrait.artist), ") + title
        if let year = portrait.year, !year.isEmpty { result += AttributedString(", \(year)") }
        result += AttributedString(".")
        if let collection = portrait.collection, !collection.isEmpty { result += AttributedString(" \(collection).") }
        // Freely licensed (non-PD) portraits carry the attribution their licence requires.
        if !(portrait.license ?? "").hasPrefix("Public domain"),
           let credit = ImagePipeline.shared.credit(for: portrait.imageUrl, language: locale.language.languageCode?.identifier ?? "en") {
            result += AttributedString(" \(credit).")
        }
        return result
    }
}

/// 34 pt dark-glass close circle over the portrait (G4): dark glass in both themes, icon `#F0EBE3`.
private struct DarkGlassCloseButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Icon("close", size: 16)
                .foregroundStyle(Palette.viewerInk)
                .frame(width: 34, height: 34)
                .contentShape(.circle)
        }
        .buttonStyle(.plain)
        .glassEffect(.regular.interactive(), in: .circle)
        .environment(\.colorScheme, .dark)
        .frame(width: 44, height: 44)
        .contentShape(.circle)
        .padding(-5)
        .accessibilityLabel(Text("common.close.accessibilityLabel"))
    }
}
