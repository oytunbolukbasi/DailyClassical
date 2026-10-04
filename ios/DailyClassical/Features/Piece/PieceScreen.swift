import SwiftUI

/// The listening guide (SPEC §4.2–4.4). Loads the piece, then hands it to `PieceContent`.
struct PieceScreen: View {
    let id: String
    @Environment(ContentStore.self) private var content
    @Environment(LanguageSettings.self) private var language
    @State private var piece: Loadable<Piece> = .idle

    var body: some View {
        Group {
            switch piece {
            case .loaded(let p): PieceContent(piece: p)
            case .failed: offline
            case .idle, .loading: PieceSkeleton()
            }
        }
        .background(Palette.background)
        .toolbarVisibility(.hidden, for: .tabBar)
        .task(id: language.code) { await load() }
    }

    private func load() async {
        if piece.value == nil || piece.value?.contentLocale != language.code { piece = .loading }
        do { piece = .loaded(try await content.piece(id: id)) } catch { piece = .failed(error as? APIError ?? .offline) }
    }

    private var offline: some View {
        EmptyStateView(icon: "offline", title: Text("state.offline.title"), message: Text("state.offline.body")) {
            Button("state.retry") { Task { await load() } }.buttonStyle(SmallCapsuleButtonStyle())
        }
    }
}

struct PieceContent: View {
    let piece: Piece

    @Environment(AppRouter.self) private var router
    @Environment(SessionStore.self) private var session
    @Environment(\.openURL) private var openURL
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var centerBlock: PieceBlock?
    /// True once the "Movement I" header has scrolled under the nav bar (SPEC §3.8).
    @State private var docked = false
    @State private var showRecordings = false
    @State private var showArtwork = false
    @State private var showPieceGlossary = false

    private var blocks: [PieceBlock] { PieceBlock.blocks(for: piece.document) }
    private var movements: [Movement] { piece.document.movements }

    private var centerIndex: Int? { centerBlock.flatMap { blocks.firstIndex(of: $0) } }
    private var firstMovementIndex: Int { blocks.firstIndex(of: .movementHeader(1)) ?? blocks.count }
    private var inMovements: Bool { docked }
    private var currentMovement: Int { centerBlock?.movement ?? lastMovementBefore(centerIndex) }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(blocks) { block in
                        view(for: block, proxy: proxy).id(block)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $centerBlock, anchor: .center)
            .scrollEdgeEffectStyle(.soft, for: .top)
            .ignoresSafeArea(edges: .top)
            .toolbar { toolbar(proxy: proxy) }
        }
        .navigationBarTitleDisplayMode(.inline)
        .overlay(alignment: .bottom) { floatingSpotify }
        .onGlossaryTap { router.present(.glossaryTerm($0)) }
        .environment(\.activeGlossaryTerm, { if case .glossaryTerm(let id) = router.sheet { id } else { nil } }())
        .sheet(isPresented: $showRecordings) { RecordingsSheet(recordings: piece.recordings) }
        .sheet(isPresented: $showPieceGlossary) { PieceGlossarySheet(document: piece.document) }
        .fullScreenCover(isPresented: $showArtwork) {
            if let painting = piece.painting { ArtworkViewer(painting: painting) }
        }
        // The user reads along while the music plays: the screen must not dim or lock.
        .onAppear { UIApplication.shared.isIdleTimerDisabled = true }
        .onDisappear { UIApplication.shared.isIdleTimerDisabled = false }
        .animation(reduceMotion ? nil : .easeOut(duration: 0.2), value: centerBlock)
    }

    // MARK: Toolbar

    @ToolbarContentBuilder
    private func toolbar(proxy: ScrollViewProxy) -> some ToolbarContent {
        if inMovements {
            ToolbarItem(placement: .principal) {
                MovementSwitcher(movements: movements, current: currentMovement) { jump(to: $0, proxy: proxy) }
            }
            .sharedBackgroundVisibility(.hidden)  // the switcher is its own glass; never glass on glass
            ToolbarItem(placement: .topBarTrailing) {
                Button { showPieceGlossary = true } label: { Icon("glossary-book", size: 22) }
                    .accessibilityLabel(Text("piece.nav.glossary.accessibilityLabel"))
            }
        } else {
            // Favourite and artwork are separate functions, so each gets its own glass circle
            // (a shared group would merge them into one capsule).
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: toggleFavourite) {
                    Icon(isFavourite ? "heart-fill" : "heart", size: 26)
                        .foregroundStyle(isFavourite ? Palette.accent : Palette.glassInk)
                }
                .accessibilityLabel(Text(isFavourite ? "piece.nav.unfavourite.accessibilityLabel" : "piece.nav.favourite.accessibilityLabel"))
            }
            if piece.painting != nil {
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showArtwork = true } label: { Icon("expand", size: 22) }
                        .accessibilityLabel(Text("piece.nav.viewArtwork.accessibilityLabel"))
                }
            }
        }
    }

    private var isFavourite: Bool { session.isFavourite(piece.id) }

    private func toggleFavourite() {
        guard session.isSignedIn else {
            router.pendingFavourite = piece.id
            router.present(.signInPrompt)
            return
        }
        let on = !isFavourite
        Task { await session.setFavourite(piece.id, on) }
        router.toast = on ? "favourites.toast.saved" : "favourites.toast.removed"
    }

    private func jump(to movement: Int, proxy: ScrollViewProxy) {
        withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.35)) {
            proxy.scrollTo(PieceBlock.movementHeader(movement), anchor: .top)
        }
    }

    private func lastMovementBefore(_ index: Int?) -> Int {
        guard let index else { return 1 }
        return blocks[..<min(index, blocks.count)].last(where: { $0.movement != nil })?.movement ?? 1
    }

    // MARK: Floating primary

    @ViewBuilder private var floatingSpotify: some View {
        if !inMovements {
            ZStack(alignment: .bottom) {
                BottomFade()
                PrimaryGlassButton(title: "piece.openInSpotify") {
                    if let url = piece.referenceRecording?.spotifyUrl { openURL(url) } else { showRecordings = true }
                }
                .padding(.bottom, 40)
            }
            .ignoresSafeArea(edges: .bottom)
            .transition(.opacity)
        }
    }

    // MARK: Blocks

    @ViewBuilder
    private func view(for block: PieceBlock, proxy: ScrollViewProxy) -> some View {
        switch block {
        case .header: PieceHeader(piece: piece)
        case .bigPicture: bigPicture
        case .movementsTable: movementsTable(proxy: proxy)
        case .movementHeader(let m):
            movementHeader(movements[m - 1], proxy: proxy)
                .onGeometryChange(for: CGFloat.self) { $0.frame(in: .global).minY } action: { minY in
                    if m == 1 { docked = minY < 110 }
                }
        case .summary(let m):
            RichTextView(source: movements[m - 1].summary ?? "")
                .padding(.top, 18).gutter()
        case .mainIdeas(let m): mainIdeas(movements[m - 1])
        case .stopsHeader: stopsHeader
        case .stop(let m, let i):
            let stops = movements[m - 1].stops
            ListeningStopRow(stop: stops[i], focus: focus(for: block), isLast: i == stops.count - 1)
                .padding(.top, i == 0 ? 0 : 14).gutter()
        case .notice(let m): notice(movements[m - 1])
        case .notes(let m): notes(movements[m - 1])
        case .threads: threads
        case .recordings: recordingsCard
        case .sources: sources
        }
    }

    private func focus(for block: PieceBlock) -> ListeningStopRow.Focus {
        guard !reduceMotion, let center = centerBlock, case .stop = center,
              let c = blocks.firstIndex(of: center), let i = blocks.firstIndex(of: block) else { return .none }
        return i == c ? .current : (i < c ? .passed : .upcoming)
    }

    private var bigPicture: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionLabel("piece.section.bigPicture")
            ForEach(Array(piece.document.bigPicture.facts.enumerated()), id: \.offset) { _, fact in
                RichTextView(source: fact)
            }
            if let line = piece.document.bigPicture.inOneLine {
                RichTextView(source: line, font: Typography.readingItalic, color: Palette.ink2).padding(.top, 4)
            }
        }
        .padding(.top, 22)
        .hairlineTop()
        .padding(.top, 28)
        .gutter()
    }

    private func movementsTable(proxy: ScrollViewProxy) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionLabel("piece.section.movements")
            VStack(spacing: 0) {
                ForEach(movements) { m in
                    Button { jump(to: m.index, proxy: proxy) } label: {
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text(verbatim: m.numeral).font(Typography.rowTitleS).foregroundStyle(Palette.accent).frame(width: 28, alignment: .leading)
                            VStack(alignment: .leading, spacing: 3) {
                                Text(verbatim: m.displayHeading).font(Typography.rowTitleXS).foregroundStyle(Palette.ink)
                                Text(verbatim: m.metaLine(includeDuration: false)).font(Typography.meta13).foregroundStyle(Palette.ink2)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            if let d = m.durationSec {
                                Text(verbatim: Formatting.clock(d)).font(Typography.meta14).monospacedDigit().foregroundStyle(Palette.ink2)
                            }
                        }
                        .multilineTextAlignment(.leading)
                        .padding(.vertical, 13).padding(.horizontal, 16)
                        .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .overlay(alignment: .top) { if m.index > 1 { Rectangle().fill(Palette.rule).frame(height: 1) } }
                }
            }
            .card()
            if let reference = piece.referenceRecording {
                Text("piece.movements.footnote \(reference.citation(fullConductorName: true))")
                    .font(Typography.caption).lineHeight(1.45, size: 12).foregroundStyle(Palette.ink3)
            }
        }
        .padding(.top, 32)
        .gutter()
    }

    private func movementHeader(_ m: Movement, proxy: ScrollViewProxy) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                SectionLabel("piece.movement.label \(m.numeral)")
                Spacer()
                if m.index == 1 {
                    MovementSwitcher(movements: movements, current: inMovements ? currentMovement : 1, segmentWidth: 40) { jump(to: $0, proxy: proxy) }
                        .opacity(inMovements ? 0 : 1)
                }
            }
            .frame(minHeight: 44)
            Text(verbatim: m.displayHeading).font(Typography.titleM).lineHeight(1.25, size: 24).foregroundStyle(Palette.ink)
                .padding(.top, 12)
                .accessibilityAddTraits(.isHeader)
            Text(verbatim: m.metaLine(includeDuration: true)).font(Typography.meta13).foregroundStyle(Palette.ink2)
        }
        .padding(.top, m.index == 1 ? 0 : 28)
        .hairlineTop(m.index == 1 ? 0 : 1)
        .padding(.top, m.index == 1 ? 40 : 44)
        .gutter()
    }

    private func mainIdeas(_ m: Movement) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionLabel("piece.section.mainIdeas")
            ForEach(Array(m.mainIdeas.enumerated()), id: \.offset) { i, idea in
                VStack(alignment: .leading, spacing: 4) {
                    if let name = idea.name { Text(verbatim: name).font(Typography.readingMedium).foregroundStyle(Palette.ink) }
                    RichTextView(source: idea.description.capitalizedFirst(locale: piece.contentLocale), font: Typography.body15, lineHeight: 1.5, size: 15, color: Palette.ink2)
                }
                .padding(.top, i == 0 ? 0 : 8)
                .hairlineTop(i == 0 ? 0 : 1)
            }
        }
        .padding(.top, 30)
        .gutter()
    }

    private var stopsHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionLabel("piece.section.listeningStops")
            if let reference = piece.referenceRecording {
                Text("piece.listeningStops.note \(reference.citation())")
                    .font(Typography.meta13).lineHeight(1.45, size: 13).foregroundStyle(Palette.ink2)
            }
        }
        .padding(.top, 34)
        .padding(.bottom, 14)
        .gutter()
    }

    private func notice(_ m: Movement) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionLabel("piece.section.thingsToNotice")
            ForEach(Array(m.notice.enumerated()), id: \.offset) { i, tip in
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(verbatim: "\(i + 1)").font(Typography.reading).foregroundStyle(Palette.accent).frame(width: 24, alignment: .leading)
                    RichTextView(source: tip)
                }
            }
        }
        .padding(.top, 34)
        .gutter()
    }

    private func notes(_ m: Movement) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            ForEach(Array(m.notes.enumerated()), id: \.offset) { _, note in
                VStack(alignment: .leading, spacing: 12) {
                    SectionLabel(verbatim: note.title)
                    RichTextView(source: note.body)
                }
            }
        }
        .padding(.top, 34)
        .gutter()
    }

    private var threads: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionLabel("piece.section.threads")
            ForEach(Array(piece.document.threads.enumerated()), id: \.offset) { _, thread in
                if let title = thread.title {
                    LeadInParagraph(title: title, text: thread.body)
                } else {
                    RichTextView(source: thread.body)
                }
            }
        }
        .padding(.top, 28)
        .hairlineTop()
        .padding(.top, 44)
        .gutter()
    }

    @ViewBuilder private var recordingsCard: some View {
        if let reference = piece.referenceRecording {
            VStack(alignment: .leading, spacing: 12) {
                SectionLabel("piece.section.recordings")
                Button { showRecordings = true } label: {
                    HStack(spacing: 12) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(verbatim: reference.performers).font(Typography.readingMedium).foregroundStyle(Palette.ink)
                            Text("piece.recordings.referenceSuffix \([reference.label, reference.displayYear].compactMap { $0 }.joined(separator: ", "))")
                                .font(Typography.meta13).foregroundStyle(Palette.ink2)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Icon("chevron-forward", size: 20).foregroundStyle(Palette.ink3)
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, Spacing.cardPaddingV).padding(.horizontal, Spacing.cardPaddingH)
                    .card()
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 40)
            .gutter()
        }
    }

    private var sources: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionLabel("piece.section.sources").padding(.bottom, 4)
            if let p = piece.painting {
                Text("piece.sources.painting") + Text(verbatim: ": \(p.artist), ") + Text(verbatim: p.title).italic()
                    + Text(verbatim: ", \(p.yearLabel). \(p.collection). ")
                    + (p.rightsStatus == "public_domain" ? Text("piece.sources.publicDomain") : Text(verbatim: ""))
            }
            if let reference = piece.referenceRecording {
                Text("piece.sources.recording \([reference.label, reference.displayYear].compactMap { $0 }.joined(separator: ", "))")
            }
        }
        .font(Typography.caption).lineHeight(1.5, size: 12).foregroundStyle(Palette.ink3)
        .padding(.top, 24)
        .padding(.bottom, Spacing.floatingButtonClearance)
        .hairlineTop()
        .padding(.top, 40)
        .gutter()
    }
}

/// Thread paragraph with a medium-weight lead-in ("**The falling line.** Almost every…").
private struct LeadInParagraph: View {
    let title: String
    let text: String

    var body: some View {
        var lead = AttributedString("\(title). ")
        lead.font = Typography.readingMedium
        var rest = RichText.attributed(text)
        for run in rest.runs where run.link != nil {
            rest[run.range].foregroundColor = Palette.accent
            rest[run.range].underlineStyle = Text.LineStyle(pattern: .dot, color: Palette.accent)
        }
        return Text(lead + rest)
            .font(Typography.reading).lineHeight(1.6).foregroundStyle(Palette.ink)
            .fixedSize(horizontal: false, vertical: true)
    }
}

/// Painting (under the status bar), caption and the title block.
struct PieceHeader: View {
    let piece: Piece
    @Environment(AppRouter.self) private var router

    private var paintingLabel: Text {
        guard let p = piece.painting else { return Text(verbatim: "") }
        return Text("today.painting.accessibilityLabel \(p.title) \(p.artist)")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PaintingImage(url: piece.painting?.imageUrl)
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .accessibilityLabel(paintingLabel)
            if let painting = piece.painting {
                PaintingCaption(painting: painting).padding(.top, 14).gutter()
            }
            VStack(alignment: .leading, spacing: 10) {
                ComposerLink(name: piece.composer.name) { router.present(.composer(piece.composer)) }
                Text(verbatim: piece.headerTitle).font(Typography.titleXL).lineHeight(1.15, size: 30).tracking(-0.3)
                    .foregroundStyle(Palette.ink).accessibilityAddTraits(.isHeader)
                Text("piece.meta \(piece.yearText) \(piece.durationMin)").font(Typography.meta14).foregroundStyle(Palette.ink2)
                Text(verbatim: piece.hook).font(Typography.hookL).lineHeight(1.45, size: 19).foregroundStyle(Palette.ink).padding(.top, 6)
            }
            .padding(.top, 26)
            .gutter()
        }
    }
}

struct PieceSkeleton: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Rectangle().fill(Palette.skeleton).frame(height: 300)
            VStack(alignment: .leading, spacing: 14) {
                SkeletonBar(width: 120, height: 12)
                SkeletonBar(width: 200, height: 14)
                SkeletonBar(height: 26)
                SkeletonBar(height: 26).padding(.trailing, 90)
                SkeletonBar(height: 16).padding(.trailing, 50).padding(.top, 6)
            }
            .padding(.horizontal, 24).padding(.top, 16)
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .accessibilityElement()
        .accessibilityLabel(Text("state.loading.accessibilityLabel"))
    }
}

extension View {
    func gutter() -> some View { padding(.horizontal, Spacing.pageGutter).frame(maxWidth: .infinity, alignment: .leading) }
}

private extension String {
    /// Main-idea descriptions follow a colon in the source ("Theme 1, unrest: a short…").
    func capitalizedFirst(locale: String) -> String { prefix(1).uppercased(with: Locale(identifier: locale)) + dropFirst() }
}
