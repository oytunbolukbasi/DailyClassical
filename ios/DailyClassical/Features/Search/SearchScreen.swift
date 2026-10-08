import SwiftUI

/// Search tab (SPEC §4.12). Premium: grouped results (Pieces / Composers / Glossary) with the
/// match in accent. Free users see the tab, and opening it presents the paywall.
struct SearchScreen: View {
    @Environment(EntitlementStore.self) private var entitlements

    var body: some View {
        NavigationStack {
            Group {
                if entitlements.isPremium {
                    PremiumSearchView()
                } else {
                    LockedSearchView()
                }
            }
            .background(Palette.background)
            .navigationTitle(Text("tab.search"))
            .navigationBarTitleDisplayMode(.inline)
            // The design draws no title on Search (SPEC §4.12); the bar keeps its height, so the
            // results still start 22 below it.
            .toolbar(removing: .title)
        }
    }
}

// MARK: - Free

private struct LockedSearchView: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        EmptyStateView(icon: "lock",
                       title: Text("search.locked.title"),
                       message: Text("search.locked.body")) {
            Button { router.present(.paywall) } label: {
                Text("search.locked.cta")
                    .font(Typography.body15.weight(.semibold))
                    .foregroundStyle(Palette.onTint)
                    .padding(.horizontal, 22)
                    .frame(minHeight: 44)
                    .background(Palette.tint, in: .capsule)
                    .contentShape(.capsule)
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Palette.background)
        // Brief: "Search tab: visible to free users, opens the paywall on tap".
        .onAppear {
            if router.tab == .search, router.sheet == nil { router.present(.paywall) }
        }
    }
}

// MARK: - Premium

private struct PremiumSearchView: View {
    @Environment(ContentStore.self) private var content
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(AppRouter.self) private var router

    @State private var recents = RecentSearches.load()

    /// The field is owned by the TabView (RootView); this screen reads and sets its text.
    private var query: String {
        get { router.searchQuery }
        nonmutating set { router.searchQuery = newValue }
    }

    var body: some View {
        let q = TextMatch.normalized(query)
        let results = SearchResults(query: q, content: content)
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                if q.isEmpty {
                    recentSection
                } else if !results.isEmpty {
                    if !results.pieces.isEmpty { pieceSection(results.pieces, q) }
                    if !results.composers.isEmpty { composerSection(results.composers, q) }
                    if !results.terms.isEmpty { glossarySection(results.terms, q) }
                }
            }
            // Full width even when empty: otherwise the scroll view hugs the 48 pt of padding and
            // paints a stray band of page colour across the white screen.
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, Spacing.pageGutter)
            .padding(.top, 22)  // SPEC §4.12: results 22 below the search row
            .padding(.bottom, 40)
        }
        .overlay {
            if !q.isEmpty && results.isEmpty {
                // SPEC §4.26 search-empty variant: no icon, Literata 20.
                EmptyStateView(title: Text("search.empty.title \(q)"),
                               message: Text("search.empty.body"),
                               titleFont: Typography.titleS)
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .background(Palette.background)
        // The search field itself is attached to the TabView (RootView).
        .autocorrectionDisabled()
        .onSubmit(of: .search) { remember(q) }
    }

    // MARK: Sections

    @ViewBuilder private var recentSection: some View {
        if recents.isEmpty {
            Text("search.idle.hint")
                .font(Typography.body15)
                .lineHeight(1.5)
                .foregroundStyle(Palette.ink3)
                .fixedSize(horizontal: false, vertical: true)
        } else {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .firstTextBaseline) {
                    SectionLabel("search.recent")
                    Spacer()
                    Button("search.recent.clear") {
                        withAnimation { recents = []; RecentSearches.save([]) }
                    }
                    .font(Typography.meta13)
                    .foregroundStyle(Palette.accent)
                    .buttonStyle(.plain)
                    .frame(minHeight: 44)
                }
                VStack(spacing: 0) {
                    ForEach(recents, id: \.self) { recent in
                        Button { query = recent } label: {
                            HStack(spacing: 12) {
                                Icon("search", size: 16).foregroundStyle(Palette.ink3)
                                Text(verbatim: recent)
                                    .font(Typography.body17)
                                    .foregroundStyle(Palette.ink)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.vertical, 12)
                            .contentShape(.rect)
                        }
                        .buttonStyle(.plain)
                        .hairlineTop()
                    }
                }
            }
        }
    }

    private func pieceSection(_ pieces: [PieceSummary], _ q: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionLabel("search.group.pieces")
            VStack(spacing: 0) {
                ForEach(pieces) { piece in
                    let locked = content.isLocked(piece.id, premium: entitlements.isPremium)
                    SearchPieceRow(piece: piece, query: q, locale: locale, isLocked: locked) {
                        remember(q)
                        if locked { router.present(.paywall) } else { router.openPiece(piece.id) }
                    }
                }
            }
        }
    }

    private func composerSection(_ composers: [ComposerRef], _ q: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionLabel("search.group.composers")
            VStack(spacing: 0) {
                ForEach(composers, id: \.id) { composer in
                    SearchComposerRow(composer: composer, details: content.composers[composer.id], query: q, locale: locale) {
                        remember(q)
                        router.present(.composer(ComposerRef(id: composer.id, name: composer.name, shortName: composer.shortName)))
                    }
                }
            }
        }
    }

    private func glossarySection(_ terms: [GlossaryTerm], _ q: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionLabel("search.group.glossary")
            VStack(spacing: 0) {
                ForEach(terms) { term in
                    SearchGlossaryRow(term: term, query: q, locale: locale) {
                        remember(q)
                        router.present(.glossaryTerm(term.id))
                    }
                }
            }
        }
    }

    private var locale: Locale { Locale(identifier: content.language) }

    private func remember(_ q: String) {
        guard !q.isEmpty else { return }
        recents = RecentSearches.adding(q, to: recents, locale: locale)
        RecentSearches.save(recents)
    }
}

// MARK: - Results

private struct SearchResults {
    var pieces: [PieceSummary] = []
    var composers: [ComposerRef] = []
    var terms: [GlossaryTerm] = []

    var isEmpty: Bool { pieces.isEmpty && composers.isEmpty && terms.isEmpty }

    init(query q: String, content: ContentStore) {
        guard !q.isEmpty else { return }
        let locale = Locale(identifier: content.language)
        func has(_ s: String?) -> Bool { s.map { TextMatch.matches($0, q, locale: locale) } ?? false }

        let library = content.library.value ?? []
        pieces = library.filter { p in
            has(p.title) || has(p.composer.name) || has(p.composer.shortName) || has(p.keyLabel) || has(p.catalogue)
        }
        // Today's piece first, as in the Library.
        if let todayID = content.todayID, let i = pieces.firstIndex(where: { $0.id == todayID }) {
            pieces.insert(pieces.remove(at: i), at: 0)
        }

        var refs: [String: ComposerRef] = [:]
        for p in library { refs[p.composer.id] = p.composer }
        for c in content.composers.values where refs[c.id] == nil {
            refs[c.id] = ComposerRef(id: c.id, name: c.name, shortName: c.shortName)
        }
        composers = refs.values
            .filter { has($0.name) || has($0.shortName) }
            .sorted { $0.shortName.compare($1.shortName, locale: locale) == .orderedAscending }

        let matchingTerms = content.sortedGlossary.filter { has($0.term) }
        let definitionOnly = content.sortedGlossary.filter { !has($0.term) && (has($0.summary) || has(RichText.plain($0.definition))) }
        terms = matchingTerms + definitionOnly
    }
}

// MARK: - Rows

/// SPEC §3.12 search result (piece): 40 pt thumb, Literata 15 title with accent match, lock 16 if locked.
private struct SearchPieceRow: View {
    let piece: PieceSummary
    let query: String
    let locale: Locale
    let isLocked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                PieceThumbnail(url: piece.painting?.imageUrl, size: 40, radius: Radius.thumbS)
                VStack(alignment: .leading, spacing: 3) {
                    Text(TextMatch.highlighted(piece.title, query, locale: locale, color: Palette.accent))
                        .font(Typography.rowTitleXS)
                        .foregroundStyle(Palette.ink)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("library.row.meta \(TextMatch.highlighted(piece.composer.shortName, query, locale: locale, color: Palette.accent)) \(piece.yearText)")
                        .font(Typography.meta13)
                        .foregroundStyle(Palette.ink2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                if isLocked {
                    Icon("lock", size: 16).foregroundStyle(Palette.ink3)
                }
            }
            .padding(.vertical, 10)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .hairlineTop()
        .accessibilityElement(children: .combine)
        .accessibilityValue(isLocked ? Text("common.locked.accessibilityLabel") : Text(verbatim: ""))
    }
}

private struct SearchComposerRow: View {
    let composer: ComposerRef
    let details: Composer?
    let query: String
    let locale: Locale
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(TextMatch.highlighted(composer.name, query, locale: locale, color: Palette.accent))
                        .font(Typography.rowTitleXS)
                        .foregroundStyle(Palette.ink)
                    if let born = details?.birthYear, let died = details?.deathYear {
                        Text("composer.lifespan \(String(born)) \(String(died))")
                            .font(Typography.meta13)
                            .foregroundStyle(Palette.ink2)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image("chevron-forward-small").renderingMode(.template).resizable().scaledToFit()
                    .frame(width: 8, height: 14)
                    .foregroundStyle(Palette.ink3)
                    .accessibilityHidden(true)
            }
            .padding(.vertical, 10)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .hairlineTop()
        .accessibilityElement(children: .combine)
        .accessibilityHint(Text("common.composerLink.accessibilityHint"))
    }
}

/// SPEC §3.12 search result (glossary): Literata 15 term, the one-line `short` (or the definition).
private struct SearchGlossaryRow: View {
    let term: GlossaryTerm
    let query: String
    let locale: Locale
    let action: () -> Void
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 3) {
                Text(TextMatch.highlighted(term.term, query, locale: locale, color: Palette.accent))
                    .font(Typography.rowTitleXS)
                    .foregroundStyle(Palette.ink)
                Text(TextMatch.highlighted(term.summary, query, locale: locale, color: Palette.accent))
                    .font(Typography.meta13)
                    .foregroundStyle(Palette.ink2)
                    .lineLimit(dynamicTypeSize.isAccessibilitySize ? 3 : 1)  // as in the Glossary list
                    .truncationMode(.tail)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .hairlineTop()
        .accessibilityElement(children: .combine)
        .accessibilityHint(Text("common.glossaryTerm.accessibilityHint"))
    }
}

// MARK: - Recent searches

/// The last five searches, newest first, kept on this device only.
enum RecentSearches {
    private static let key = "recentSearches"
    static let limit = 5

    static func load() -> [String] {
        UserDefaults.standard.stringArray(forKey: key) ?? []
    }

    static func save(_ list: [String]) {
        UserDefaults.standard.set(list, forKey: key)
    }

    static func adding(_ query: String, to list: [String], locale: Locale) -> [String] {
        let rest = list.filter { $0.compare(query, options: TextMatch.options, locale: locale) != .orderedSame }
        return Array(([query] + rest).prefix(limit))
    }
}

#Preview("Search · premium") {
    @Previewable @State var content = ContentStore(source: .bundled)
    PremiumSearchPreview()
        .environment(content)
        .environment(EntitlementStore())
        .environment(AppRouter())
        .task { await content.reload(language: "en") }
}

#Preview("Search · free") {
    @Previewable @State var content = ContentStore(source: .bundled)
    SearchScreen()
        .environment(content)
        .environment(EntitlementStore())
        .environment(AppRouter())
        .task { await content.reload(language: "en") }
}

/// Previews can't grant Premium through StoreKit, so this shows the premium view directly.
private struct PremiumSearchPreview: View {
    var body: some View {
        NavigationStack { PremiumSearchView().navigationTitle(Text("tab.search")).navigationBarTitleDisplayMode(.inline) }
    }
}
