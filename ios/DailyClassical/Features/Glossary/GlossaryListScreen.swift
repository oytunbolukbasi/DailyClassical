import SwiftUI

/// Library › Glossary (SPEC §4.9): every term A–Z with a letter column, a search field
/// and an index rail of the letters that have terms. Tapping a term opens the glossary sheet.
struct GlossaryListScreen: View {
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router

    @State private var query = ""
    @State private var titleScrolledAway = false
    @FocusState private var searchFocused: Bool

    var body: some View {
        let sections = self.sections
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    header
                    if content.glossary.isEmpty {
                        loadingOrOffline
                    } else if sections.isEmpty {
                        EmptyStateView(title: Text("search.empty.title \(TextMatch.normalized(query))"),
                                       message: Text("glossary.search.empty.body"),
                                       titleFont: Typography.titleS)
                            .padding(.top, 48)
                    } else {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ForEach(sections, id: \.letter) { section in
                                ForEach(Array(section.terms.enumerated()), id: \.element.id) { index, term in
                                    GlossaryListRow(letter: index == 0 ? section.letter : nil, term: term) {
                                        searchFocused = false
                                        router.present(.glossaryTerm(term.id))
                                    }
                                    .id(index == 0 ? Self.anchorID(section.letter) : term.id)
                                }
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 40)
                    }
                }
                .padding(.horizontal, Spacing.pageGutter)
            }
            .scrollDismissesKeyboard(.immediately)
            .overlay(alignment: .bottom) { BottomFade(solidFrom: 0.7).ignoresSafeArea(edges: .bottom) }  // SPEC §4.9
            .onScrollGeometryChange(for: Bool.self) { $0.contentOffset.y + $0.contentInsets.top > 48 } action: { _, away in
                withAnimation(.easeOut(duration: 0.2)) { titleScrolledAway = away }
            }
            .overlay(alignment: .topTrailing) {
                // Fixed beside the search field (SPEC §4.9: right 6, top 230 on the 390 × 844 frame).
                if sections.count > 1 {
                    IndexRail(letters: sections.map(\.letter)) { letter in
                        proxy.scrollTo(Self.anchorID(letter), anchor: .top)
                    }
                    .padding(.trailing, 2)
                    .padding(.top, 128)
                }
            }
        }
        .background(Palette.background)
        .onAppear { router.glossaryListVisible = true }  // "See all terms" then just closes the sheet
        .onDisappear { router.glossaryListVisible = false }
        .navigationTitle(Text("glossary.title"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // The Literata title lives in the content; the inline title appears once it scrolls away.
            ToolbarItem(placement: .principal) {
                Text("glossary.title")
                    .font(Typography.navPill)
                    .foregroundStyle(Palette.ink)
                    .opacity(titleScrolledAway ? 1 : 0)
                    .accessibilityHidden(!titleScrolledAway)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("glossary.title")
                .font(Typography.display)
                .tracking(-0.34)
                .foregroundStyle(Palette.ink)
                .accessibilityAddTraits(.isHeader)
            Text("glossary.intro")
                .font(Typography.body15)
                .lineHeight(1.5)
                .foregroundStyle(Palette.ink2)
                .fixedSize(horizontal: false, vertical: true)
            GlassSearchField(text: $query, prompt: Text("glossary.searchPlaceholder"), focused: $searchFocused)
        }
        .padding(.top, 8)
        .padding(.trailing, 0)
    }

    @ViewBuilder private var loadingOrOffline: some View {
        if let error = content.glossaryError {
            LibraryOfflineView(error: error) { Task { await content.retry() } }
        } else {
            VStack(spacing: 0) {
                ForEach(0..<8, id: \.self) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        SkeletonBar(width: 140, height: 16)
                        SkeletonBar(height: 12)
                    }
                    .padding(.leading, 38)
                    .padding(.vertical, 13)
                    .hairlineTop()
                }
            }
            .padding(.top, 10)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("state.loading.accessibilityLabel"))
        }
    }

    // MARK: Data

    struct LetterSection { let letter: String; let terms: [GlossaryTerm] }

    private var sections: [LetterSection] {
        let locale = Locale(identifier: content.language)
        let q = TextMatch.normalized(query)
        let terms = content.sortedGlossary.filter { term in
            q.isEmpty || TextMatch.matches(term.term, q, locale: locale) || TextMatch.matches(term.summary, q, locale: locale)
                || TextMatch.matches(RichText.plain(term.definition), q, locale: locale)
        }
        var result: [LetterSection] = []
        for term in terms {
            let letter = GlossaryIndex.letter(for: term.term, locale: locale)
            if let last = result.last, last.letter == letter {
                result[result.count - 1] = LetterSection(letter: letter, terms: last.terms + [term])
            } else if let i = result.firstIndex(where: { $0.letter == letter }) {
                // Collation put a term out of its letter run (rare); keep letters unique.
                result[i] = LetterSection(letter: letter, terms: result[i].terms + [term])
            } else {
                result.append(LetterSection(letter: letter, terms: [term]))
            }
        }
        return result
    }

    private static func anchorID(_ letter: String) -> String { "letter-\(letter)" }
}

/// Index letters follow the content language's alphabet: Turkish keeps Ç, Ğ, İ, Ö, Ş, Ü as
/// letters of their own; other accents fold onto the base letter (Idée → I, Ländler → L).
nonisolated enum GlossaryIndex {
    private static let turkish: Set<String> = Set("ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZQWX".map(String.init))
    private static let latin: Set<String> = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ".map(String.init))

    static func letter(for term: String, locale: Locale) -> String {
        guard let first = term.first else { return "#" }
        let alphabet = locale.language.languageCode?.identifier == "tr" ? turkish : latin
        let upper = String(first).uppercased(with: locale)
        if alphabet.contains(upper) { return upper }
        let folded = String(first).folding(options: [.diacriticInsensitive, .caseInsensitive], locale: locale).uppercased(with: locale)
        if alphabet.contains(folded) { return folded }
        return "#"
    }
}

/// SPEC §3.12 glossary list row: 28 pt letter column (first term of a letter only),
/// Literata term, the one-line `short` (SF 13/1.4; the definition for older content), chevron.
/// At accessibility text sizes the line may wrap rather than cut off after a word or two.
private struct GlossaryListRow: View {
    let letter: String?
    let term: GlossaryTerm
    let action: () -> Void
    @ScaledMetric(relativeTo: .subheadline) private var letterColumn: CGFloat = 28
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 10) {
                Text(verbatim: letter ?? "")
                    .font(Typography.rowTitleXS)
                    .foregroundStyle(Palette.accent)
                    .frame(width: letterColumn, alignment: .leading)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 2)
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 2) {
                    Text(verbatim: term.term)
                        .font(Typography.rowTitle)
                        .lineHeight(1.3)
                        .foregroundStyle(Palette.ink)
                    Text(verbatim: term.summary)
                        .font(Typography.meta13)
                        .lineHeight(1.4)
                        .foregroundStyle(Palette.ink2)
                        .lineLimit(dynamicTypeSize.isAccessibilitySize ? 3 : 1)
                        .truncationMode(.tail)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image("chevron-forward-small").renderingMode(.template).resizable().scaledToFit()
                    .frame(width: 8, height: 14)
                    .foregroundStyle(Palette.ink3)
                    .accessibilityHidden(true)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(.vertical, 13)
            .padding(.trailing, 14) // keeps the chevron clear of the index rail
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .hairlineTop()
        .accessibilityElement(children: .combine)
        .accessibilityHint(Text("common.glossaryTerm.accessibilityHint"))
    }
}

/// A–Z rail: tap a letter or drag along the rail to jump.
private struct IndexRail: View {
    let letters: [String]
    let jump: (String) -> Void
    @ScaledMetric(relativeTo: .caption2) private var letterHeight: CGFloat = 15
    @State private var lastJumped: String?

    var body: some View {
        VStack(spacing: 0) {
            ForEach(letters, id: \.self) { letter in
                Button { jump(letter) } label: {
                    Text(verbatim: letter)
                        .font(Typography.system(10, .semibold, relativeTo: .caption2))  // scales like its row height
                        .foregroundStyle(Palette.accent)
                        .frame(width: 22, height: letterHeight)
                        .contentShape(.rect)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(Text(verbatim: letter))
            }
        }
        .padding(.vertical, 6)
        .contentShape(.rect)
        .simultaneousGesture(
            DragGesture(minimumDistance: 2)
                .onChanged { value in
                    let index = Int((value.location.y - 6) / letterHeight)
                    guard letters.indices.contains(index), letters[index] != lastJumped else { return }
                    lastJumped = letters[index]
                    jump(letters[index])
                    UISelectionFeedbackGenerator().selectionChanged()
                }
                .onEnded { _ in lastJumped = nil }
        )
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("glossary.index.accessibilityLabel"))
    }
}

/// G1 glass search capsule (SPEC §3.17): search icon at 60 %, SF 17, accent caret.
struct GlassSearchField: View {
    @Binding var text: String
    let prompt: Text
    var focused: FocusState<Bool>.Binding

    var body: some View {
        HStack(spacing: 10) {
            Icon("search", size: 18).opacity(0.6)
            TextField(text: $text, prompt: prompt.foregroundStyle(Palette.glassInk.opacity(0.5))) { prompt }
                .font(Typography.body17)
                .foregroundStyle(Palette.glassInk)
                .tint(Palette.accent)
                .focused(focused)
                .submitLabel(.search)
                .autocorrectionDisabled()
            if !text.isEmpty {
                Button { text = "" } label: {
                    Icon("close", size: 14)
                        .frame(width: 44, height: 44)
                        .contentShape(.rect)
                }
                .buttonStyle(.plain)
                .padding(.trailing, -12)
                .accessibilityLabel(Text("search.clear.accessibilityLabel"))
            }
        }
        .foregroundStyle(Palette.glassInk)
        .padding(.horizontal, 16)
        .frame(minHeight: 44)
        .glassEffect(.regular.interactive(), in: .capsule)
        .contentShape(.capsule)
        .onTapGesture { focused.wrappedValue = true }
    }
}

#Preview("Glossary") {
    @Previewable @State var content = ContentStore(source: .bundled)
    NavigationStack { GlossaryListScreen() }
        .environment(content)
        .environment(AppRouter())
        .task { await content.reload(language: "en") }
}

#Preview("Glossary · TR") {
    @Previewable @State var content = ContentStore(source: .bundled)
    NavigationStack { GlossaryListScreen() }
        .environment(content)
        .environment(AppRouter())
        .environment(\.locale, Locale(identifier: "tr"))
        .task { await content.reload(language: "tr") }
}
