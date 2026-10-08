import SwiftUI

/// Small-detent definition sheet; the page behind stays put (SPEC §4.6).
struct GlossaryTermSheet: View {
    let termID: String
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router
    @Environment(\.dismiss) private var dismiss
    @State private var height: CGFloat = 265
    /// A term tapped inside the definition replaces this one in place, so a definition never
    /// stacks a second sheet (or a broken one) on top of itself.
    @State private var shownID: String?

    var body: some View {
        let id = shownID ?? termID
        let term = content.glossary[id]
        VStack(alignment: .leading, spacing: 14) {
            SheetHeader(title: Text(verbatim: term?.term ?? id), titleFont: Typography.titleM) { dismiss() }
            if let term {
                RichTextView(source: term.definition)
                    .onGlossaryTap { shownID = $0 }
            }
            Button {
                dismiss()
                router.openGlossaryList()
            } label: {
                Text("glossarySheet.seeAll")
                    .font(Typography.meta13)
                    .foregroundStyle(Palette.accent)
                    .padding(.vertical, 14)  // 44 pt hit target…
                    .contentShape(.rect)
            }
            .buttonStyle(.plain)
            .padding(.vertical, -14)  // …that doesn't move the layout
            .padding(.top, 4)
        }
        .padding(.horizontal, 24)
        .padding(.top, 26)
        .padding(.bottom, 32)
        .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { height = $0 }
        .presentationDetents([.height(height)])
        .presentationDragIndicator(.visible)
        // Background interaction stays off: a tap outside always dismisses the sheet. With it on,
        // an accidental tap on another term behind the sheet presented a second, broken sheet.
    }
}

/// Every glossary term used in this piece, in reading order (nav-bar glossary button).
struct PieceGlossarySheet: View {
    let document: PieceDocument
    @Environment(ContentStore.self) private var content
    @Environment(\.dismiss) private var dismiss
    /// A term tapped inside a definition opens over this sheet (as in the composer sheet).
    @State private var glossaryTerm: GlossaryLink?

    private var terms: [GlossaryTerm] {
        var seen = Set<String>()
        let texts = document.bigPicture.facts + document.movements.flatMap { m in
            [m.summary ?? ""] + m.mainIdeas.map(\.description) + m.stops.flatMap { [$0.hear, $0.happening] } + m.notice + m.notes.map(\.body)
        } + document.threads.map(\.body)
        return texts.flatMap { RichText.attributed($0).runs.compactMap { $0.link.flatMap(RichText.glossaryID) } }
            .filter { seen.insert($0).inserted }
            .compactMap { content.glossary[$0] }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                SheetHeader(title: Text("piece.nav.glossary.accessibilityLabel")) { dismiss() }
                    .padding(.bottom, 16)
                ForEach(terms) { term in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(verbatim: term.term).font(Typography.rowTitle).foregroundStyle(Palette.ink)
                        RichTextView(source: term.definition, font: Typography.body15, lineHeight: 1.5, literataSize: nil, color: Palette.ink2)
                            .onGlossaryTap { glossaryTerm = GlossaryLink(id: $0) }
                    }
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .hairlineTop()
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 26)
            .padding(.bottom, 32)
        }
        .sheet(item: $glossaryTerm) { GlossaryTermSheet(termID: $0.id) }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }
}

/// A glossary term opened from a sheet's own text, presented over that sheet.
struct GlossaryLink: Identifiable {
    let id: String
}
