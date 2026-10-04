import SwiftUI

/// Library tab (SPEC §4.11, §4.23–4.25): Literata large title, All pieces / Favourites,
/// Composer / Era / Glossary chips, solid rows. Free users see every past piece with a
/// small lock; tapping one opens the paywall.
struct LibraryScreen: View {
    enum Segment: Hashable { case all, favourites }

    @Environment(ContentStore.self) private var content
    @Environment(SessionStore.self) private var session
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(AppRouter.self) private var router

    @State private var segment: Segment = .all
    @State private var composerFilter: String?
    @State private var eraFilter: Era?

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.libraryPath) {
            List {
                header
                    .listRowInsets(EdgeInsets(top: 12, leading: Spacing.pageGutter, bottom: 18, trailing: 0))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Palette.background)
                switch segment {
                case .all: allPieces
                case .favourites: favourites
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Palette.background)
            .overlay(alignment: .bottom) { BottomFade().ignoresSafeArea(edges: .bottom) }  // SPEC §4.11 item 3
            .environment(\.defaultMinListRowHeight, 0)
            .animation(.default, value: session.favourites.count)
            // The title is drawn in Literata in the content; it stays set so pushed
            // screens show "‹ Library" in their back button.
            .navigationTitle(Text("library.title"))
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: PieceRoute.self) { PieceScreen(id: $0.id) }
            .navigationDestination(for: GlossaryListRoute.self) { _ in GlossaryListScreen() }
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("library.title")
                .font(Typography.display)
                .tracking(-0.34)
                .foregroundStyle(Palette.ink)
                .accessibilityAddTraits(.isHeader)
                .padding(.trailing, Spacing.pageGutter)
            GlassSegmented(
                segments: [
                    .init(value: Segment.all, label: Text("library.segment.all"), accessibilityLabel: nil),
                    .init(value: Segment.favourites, label: Text("library.segment.favourites"), accessibilityLabel: nil),
                ],
                selection: $segment.animation(.easeOut(duration: 0.2))
            )
            if segment == .all {
                filterChips
            }
        }
    }

    private var filterChips: some View {
        ScrollView(.horizontal) {
            GlassEffectContainer(spacing: 0) {  // 0: separate chips never merge into one shape
                HStack(spacing: 8) {
                    composerMenu
                    eraMenu
                    NavigationLink(value: GlossaryListRoute()) {
                        GlassChip(title: Text("library.filter.glossary"), leadingIcon: "glossary-book")
                    }
                    .buttonStyle(.plain)
                }
                .padding(.trailing, Spacing.pageGutter)
                .padding(.vertical, 2)
            }
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
    }

    private var composerMenu: some View {
        Menu {
            Picker(selection: $composerFilter) {
                Text("library.filter.allComposers").tag(String?.none)
                ForEach(availableComposers, id: \.id) { composer in
                    Text(verbatim: composer.name).tag(String?.some(composer.id))
                }
            } label: { EmptyView() }
                .pickerStyle(.inline)
        } label: {
            GlassChip(title: composerChipTitle, showsDisclosure: true)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text("library.filter.composer"))
        .accessibilityValue(composerChipTitle)
    }

    private var eraMenu: some View {
        Menu {
            Picker(selection: $eraFilter) {
                Text("library.filter.allEras").tag(Era?.none)
                ForEach(availableEras, id: \.self) { era in
                    Text(era.titleKey).tag(Era?.some(era))
                }
            } label: { EmptyView() }
                .pickerStyle(.inline)
        } label: {
            GlassChip(title: eraChipTitle, showsDisclosure: true)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text("library.filter.era"))
        .accessibilityValue(eraChipTitle)
    }

    private var composerChipTitle: Text {
        if let id = composerFilter, let name = availableComposers.first(where: { $0.id == id })?.shortName {
            Text(verbatim: name)
        } else {
            Text("library.filter.composer")
        }
    }

    private var eraChipTitle: Text {
        if let eraFilter { Text(eraFilter.titleKey) } else { Text("library.filter.era") }
    }

    // MARK: All pieces

    @ViewBuilder private var allPieces: some View {
        switch content.library {
        case .idle, .loading:
            skeleton
        case .failed:
            LibraryOfflineView { Task { await content.retry() } }
                .libraryRowChrome()
        case .loaded:
            let pieces = filteredPieces
            if pieces.isEmpty {
                EmptyStateView(title: Text("library.filtered.empty.title"),
                               message: Text("library.filtered.empty.body"),
                               titleFont: Typography.titleS) {
                    Button("library.filter.clear") {
                        withAnimation { composerFilter = nil; eraFilter = nil }
                    }
                    .buttonStyle(SmallCapsuleButtonStyle())
                }
                .padding(.top, 48)
                .libraryRowChrome()
            } else {
                ForEach(pieces) { piece in
                    let locked = content.isLocked(piece.id, premium: entitlements.isPremium)
                    LibraryRow(piece: piece, isToday: piece.id == content.todayID, isLocked: locked) {
                        open(piece, locked: locked)
                    }
                    .libraryRowChrome()
                }
            }
        }
    }

    private var skeleton: some View {
        ForEach(0..<6, id: \.self) { _ in
            LibrarySkeletonRow().libraryRowChrome()
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("state.loading.accessibilityLabel"))
    }

    // MARK: Favourites

    @ViewBuilder private var favourites: some View {
        if !session.isSignedIn {
            EmptyStateView(icon: "heart",
                           title: Text("favourites.empty.title"),
                           message: Text("favourites.empty.body.guest"),
                           titleFont: Typography.titleM) {
                Button { router.present(.signInPrompt) } label: {
                    Text("favourites.empty.guestCta")
                        .font(Typography.body15.weight(.semibold))
                        .foregroundStyle(Palette.onTint)
                        .padding(.horizontal, 22)
                        .frame(minHeight: 44)
                        .background(Palette.tint, in: .capsule)
                        .contentShape(.capsule)
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 72)
            .libraryRowChrome()
        } else if session.favourites.isEmpty {
            EmptyStateView(icon: "heart",
                           title: Text("favourites.empty.title"),
                           message: Text("favourites.empty.body"),
                           titleFont: Typography.titleM)
                .padding(.top, 72)
                .libraryRowChrome()
        } else {
            switch content.library {
            case .idle, .loading:
                skeleton
            case .failed where favouritePieces.isEmpty:
                LibraryOfflineView { Task { await content.retry() } }
                    .libraryRowChrome()
            default:
                ForEach(favouritePieces, id: \.piece.id) { item in
                    let locked = content.isLocked(item.piece.id, premium: entitlements.isPremium)
                    FavouriteRow(piece: item.piece, isToday: item.piece.id == content.todayID, savedAt: item.savedAt) {
                        open(item.piece, locked: locked)
                    } unfavourite: {
                        remove(item.piece.id)
                    }
                    .libraryRowChrome()
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) { remove(item.piece.id) } label: {
                            Label { Text("favourites.remove") } icon: { Image("heart").renderingMode(.template) }
                        }
                    }
                }
                Text("favourites.footer")
                    .font(Typography.meta13)
                    .lineHeight(1.5)
                    .foregroundStyle(Palette.ink3)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 18)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .hairlineTop()
                    .libraryRowChrome()
            }
        }
    }

    // MARK: Data

    /// Today's piece first, then the rest in the API's order (newest first).
    private var orderedPieces: [PieceSummary] {
        let all = content.library.value ?? []
        guard let todayID = content.todayID, let today = all.first(where: { $0.id == todayID }) else { return all }
        return [today] + all.filter { $0.id != todayID }
    }

    private var filteredPieces: [PieceSummary] {
        orderedPieces.filter { piece in
            (composerFilter == nil || piece.composer.id == composerFilter) && (eraFilter == nil || piece.era == eraFilter)
        }
    }

    private var availableComposers: [ComposerRef] {
        var seen = Set<String>()
        let refs = (content.library.value ?? []).map(\.composer).filter { seen.insert($0.id).inserted }
        let locale = Locale(identifier: content.language)
        return refs.sorted { $0.shortName.compare($1.shortName, locale: locale) == .orderedAscending }
    }

    private var availableEras: [Era] {
        let present = Set((content.library.value ?? []).map(\.era))
        return Era.allCases.filter(present.contains)
    }

    private var favouritePieces: [(piece: PieceSummary, savedAt: Date)] {
        let byID = Dictionary((content.library.value ?? []).map { ($0.id, $0) }, uniquingKeysWith: { a, _ in a })
        return session.favourites
            .compactMap { id, date in byID[id].map { (piece: $0, savedAt: date) } }
            .sorted { $0.savedAt > $1.savedAt }
    }

    // MARK: Actions

    private func open(_ piece: PieceSummary, locked: Bool) {
        if locked {
            router.present(.paywall)
        } else {
            router.libraryPath.append(PieceRoute(id: piece.id))
        }
    }

    private func remove(_ id: String) {
        Task { await session.setFavourite(id, false) }
        router.toast = LocalizedStringResource("favourites.toast.removed")
    }
}

extension Era {
    /// "Romantic era", "20th century" (keys in common.json).
    var titleKey: LocalizedStringKey { LocalizedStringKey("era." + rawValue) }  // not interpolated: that would look up "era.%@"
}

private extension View {
    /// Solid page-coloured list row with the page gutter and no system separator.
    func libraryRowChrome() -> some View {
        listRowInsets(EdgeInsets(top: 0, leading: Spacing.pageGutter, bottom: 0, trailing: Spacing.pageGutter))
            .listRowSeparator(.hidden)
            .listRowBackground(Palette.background)
    }
}

#Preview("Library") {
    @Previewable @State var content = ContentStore(source: .bundled)
    LibraryScreen()
        .environment(content)
        .environment(SessionStore())
        .environment(EntitlementStore())
        .environment(AppRouter())
        .environment(LanguageSettings())
        .environment(AppearanceSettings())
        .task { await content.reload(language: "en") }
}

#Preview("Library · TR") {
    @Previewable @State var content = ContentStore(source: .bundled)
    LibraryScreen()
        .environment(content)
        .environment(SessionStore())
        .environment(EntitlementStore())
        .environment(AppRouter())
        .environment(LanguageSettings())
        .environment(AppearanceSettings())
        .environment(\.locale, Locale(identifier: "tr"))
        .task { await content.reload(language: "tr") }
}
