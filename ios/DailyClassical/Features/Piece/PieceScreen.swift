import SwiftUI

/// The listening guide (SPEC §4.2–4.4). Loads the piece, then hands it to `PieceContent`.
struct PieceScreen: View {
    let id: String
    @Environment(ContentStore.self) private var content
    @Environment(LanguageSettings.self) private var language
    @State private var piece: Loadable<Piece> = .idle

    var body: some View {
        Group {
            // A cached piece (Today's, or one already opened) renders on the first frame, so
            // the zoom transition never swaps a skeleton for the page halfway through.
            if let p = piece.value ?? content.cachedPiece(id: id) {
                PieceContent(piece: p)
            } else if case .failed(let error) = piece {
                failed(error)
            } else {
                PieceSkeleton()
            }
        }
        .background(Palette.background)
        // Not `.toolbarVisibility(.hidden, for: .tabBar)`: see PieceTabBarHider.
        .background { PieceTabBarHider() }
        .task(id: language.code) { await load() }
    }

    private func load() async {
        if piece.value == nil || piece.value?.contentLocale != language.code { piece = .loading }
        do { piece = .loaded(try await content.piece(id: id)) } catch { piece = .failed(error as? APIError ?? .offline) }
    }

    /// "You're offline" only for a real connection failure; anything else gets the generic message.
    private func failed(_ error: APIError) -> some View {
        EmptyStateView(icon: error.isOffline ? "offline" : nil,
                       title: error.isOffline ? Text("state.offline.title") : Text("state.error.generic"),
                       message: error.isOffline ? Text("state.offline.body") : Text("state.error.body")) {
            Button("state.retry") { Task { await load() } }.buttonStyle(.retry)
        }
    }
}

struct PieceContent: View {
    let piece: Piece

    @Environment(AppRouter.self) private var router
    @Environment(SessionStore.self) private var session
    @Environment(\.openURL) private var openURL
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    /// Single source of truth for programmatic scrolling (movement jumps).
    @State private var position = ScrollPosition(edge: .top)
    @State private var tracker = PieceScrollTracker()
    /// The movement under the reading line (SPEC §3.8).
    @State private var trackedMovement = 1
    /// The movement just tapped in the switcher or the movements table. Shown as selected
    /// at once and held through the jump, until the user scrolls again.
    @State private var jumpTarget: Int?
    @State private var jumpID = 0
    /// The listening stop nearest the reading line (centre of the area below the nav bar),
    /// or nil while the reading line is outside a movement's stop list (SPEC §3.6).
    @State private var currentStop: PieceBlock?
    /// True once the "Movement I" header has scrolled under the nav bar (SPEC §3.8).
    @State private var docked = false
    @State private var showRecordings = false
    @State private var showArtwork = false
    @State private var showPieceGlossary = false

    private static let contentSpace = "pieceContent"

    private var blocks: [PieceBlock] { PieceBlock.blocks(for: piece.document) }
    private var movements: [Movement] { piece.document.movements }

    private var inMovements: Bool { docked }
    private var currentMovement: Int { jumpTarget ?? trackedMovement }

    var body: some View {
        ScrollView {
            // Not lazy: a lazy stack only estimates the height of blocks it hasn't built, so
            // a jump to a far movement landed on a guessed offset and the content height
            // then collapsed under it (to the top of the page, or somewhere else). A piece
            // is at most ~70 blocks of text, which lays out once; every frame is then exact.
            VStack(alignment: .leading, spacing: 0) {
                ForEach(blocks) { block in
                    view(for: block)
                        .onGeometryChange(for: CGRect.self) { $0.frame(in: .named(Self.contentSpace)) } action: { frame in
                            tracker.blockFrames[block] = frame
                            syncTracking()
                        }
                }
            }
            .coordinateSpace(.named(Self.contentSpace))
        }
        .scrollPosition($position)
        .onChange(of: blocks) { _, blocks in tracker.keep(Set(blocks)) }  // a reload in another language
        .onScrollGeometryChange(for: ScrollMetrics.self) { ScrollMetrics($0) } action: { _, metrics in
            tracker.offset = metrics.offset
            tracker.minOffset = metrics.minOffset
            tracker.maxOffset = metrics.maxOffset
            tracker.viewportHeight = metrics.viewportHeight
            syncTracking()
        }
        .onScrollPhaseChange { _, phase in
            tracker.phase = phase
            if phase == .interacting {
                // The user took over: drop the jump and follow the reading position again.
                tracker.isProgrammaticScroll = false
                jumpTarget = nil
                syncTracking()
            } else if phase == .idle {
                finishJump(jumpID)
            }
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .ignoresSafeArea(edges: .top)
        .background {
            // The scroll view runs under the status bar, so the safe-area top it covers is
            // the bottom of the nav bar.
            Color.clear.onGeometryChange(for: CGFloat.self) { $0.safeAreaInsets.top } action: { top in
                guard top > 0 else { return }
                tracker.navBottom = top
                syncTracking()
            }
        }
        .toolbar { toolbar }
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
        .animation(reduceMotion ? nil : .easeOut(duration: 0.2), value: currentStop)
    }

    // MARK: Toolbar

    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        if inMovements {
            ToolbarItem(placement: .principal) {
                MovementSwitcher(movements: movements, current: currentMovement) { jump(to: $0) }
            }
            .sharedBackgroundVisibility(.hidden)  // the switcher is its own glass; never glass on glass
            ToolbarItem(placement: .topBarTrailing) {
                Button { showPieceGlossary = true } label: { Icon("glossary-book", size: 22).foregroundStyle(Palette.glassInk) }
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
                    Button { showArtwork = true } label: { Icon("expand", size: 22).foregroundStyle(Palette.glassInk) }
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

    // MARK: Scroll tracking and jumps

    /// Copies the tracker's derived values into state, only when they change.
    private func syncTracking() {
        let isDocked = tracker.isDocked
        if isDocked != docked { docked = isDocked }
        guard !tracker.isProgrammaticScroll else { return }
        let movement = tracker.movementAtReadingLine
        if movement != trackedMovement { trackedMovement = movement }
        if jumpTarget == movement { jumpTarget = nil }
        let stop = tracker.stopNearestReadingLine()
        if stop != currentStop { currentStop = stop }
    }

    /// Scrolls `movement`'s header to just below the nav bar. The tapped numeral is selected
    /// at once; tracking is suppressed until the scroll settles.
    private func jump(to movement: Int) {
        jumpID += 1
        jumpTarget = movement
        tracker.isProgrammaticScroll = true
        tracker.jumpAttempts = 0
        scroll(toMovement: movement, jump: jumpID)
    }

    private func scroll(toMovement movement: Int, jump id: Int) {
        guard let y = tracker.offset(forMovement: movement) else { return finishJump(id, force: true) }
        tracker.jumpAttempts += 1
        if reduceMotion || abs(y - tracker.offset) < 40 {
            position.scrollTo(y: y)
        } else {
            withAnimation(.easeInOut(duration: 0.45)) { position.scrollTo(y: y) }
        }
        // The scroll phase reports the end of an animated scroll (`.animating` → `.idle`);
        // this check covers a scroll that never started (a non-animated one, or a write the
        // scroll view dropped).
        Task {
            try? await Task.sleep(for: .milliseconds(350))
            finishJump(id)
        }
    }

    /// Ends a jump once the scroll has settled on the header. If it hasn't, scrolls again
    /// (a write can be lost while the scroll view is still settling the previous one).
    private func finishJump(_ id: Int, force: Bool = false) {
        guard id == jumpID, tracker.isProgrammaticScroll else { return }
        if !force, tracker.phase != .idle { return }  // still moving; the phase change calls back
        if !force, let movement = jumpTarget, let y = tracker.offset(forMovement: movement),
           abs(y - tracker.offset) > 1, tracker.jumpAttempts < 4 {
            return scroll(toMovement: movement, jump: id)
        }
        tracker.isProgrammaticScroll = false
        syncTracking()
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
    private func view(for block: PieceBlock) -> some View {
        switch block {
        case .header: PieceHeader(piece: piece)
        case .bigPicture: bigPicture
        case .movementsTable: movementsTable
        case .movementHeader(let m): movementHeader(movements[m - 1])
        case .summary(let m):
            RichTextView(source: movements[m - 1].summary ?? "", color: readingColor(block, Palette.ink))
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

    /// Reading focus: the stop nearest the reading line is current; the movement's other
    /// stops and reading blocks before and after it fade (SPEC §3.6, §4.3).
    private func focus(for block: PieceBlock) -> ListeningStopRow.Focus {
        guard !reduceMotion, let current = currentStop, current.movement == block.movement,
              let c = blocks.firstIndex(of: current), let i = blocks.firstIndex(of: block) else { return .none }
        return i == c ? .current : (i < c ? .passed : .upcoming)
    }

    /// Prose colour for a reading block under the focus fade; glossary terms stay accent.
    private func readingColor(_ block: PieceBlock, _ normal: Color) -> Color {
        focus(for: block) == .none ? normal : Palette.ink3
    }

    private var bigPicture: some View {
        VStack(alignment: .leading, spacing: 14) {
            SectionLabel("piece.section.bigPicture")
            ForEach(Array(piece.document.bigPicture.facts.enumerated()), id: \.offset) { _, fact in
                RichTextView(source: fact)
            }
            if let line = piece.document.bigPicture.inOneLine {
                RichTextView(source: L10n.string("piece.bigPicture.inOneLine", code: piece.contentLocale) + " " + line, font: Typography.readingItalic, color: Palette.ink2).padding(.top, 4)
            }
        }
        .padding(.top, 22)
        .frame(maxWidth: .infinity, alignment: .leading)  // hairline spans the column
        .hairlineTop()
        .padding(.top, 28)
        .gutter()
    }

    private var movementsTable: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionLabel("piece.section.movements")
            VStack(spacing: 0) {
                ForEach(movements) { m in
                    Button { jump(to: m.index) } label: {
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
                Text("piece.movements.footnote \(reference.citation(fullNames: true))")
                    .font(Typography.caption).lineHeight(1.45).foregroundStyle(Palette.ink3)
            }
        }
        .padding(.top, 32)
        .gutter()
    }

    private func movementHeader(_ m: Movement) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                SectionLabel("piece.movement.label \(m.numeral)")
                Spacer()
                if m.index == 1 {
                    MovementSwitcher(movements: movements, current: jumpTarget ?? (inMovements ? trackedMovement : 1), segmentWidth: 40) { jump(to: $0) }
                        .opacity(inMovements ? 0 : 1)
                }
            }
            .frame(minHeight: 44)
            Text(verbatim: m.displayHeading).font(Typography.titleM).lineHeight(1.25, literata: 24).foregroundStyle(Palette.ink)
                .padding(.top, 12)
                .accessibilityAddTraits(.isHeader)
            Text(verbatim: m.metaLine(includeDuration: true)).font(Typography.meta13).foregroundStyle(Palette.ink2)
        }
        .padding(.top, m.index == 1 ? 0 : 28)
        .frame(maxWidth: .infinity, alignment: .leading)
        .hairlineTop(m.index == 1 ? 0 : 1)
        .onGeometryChange(for: CGFloat.self) { $0.frame(in: .named(Self.contentSpace)).minY } action: { top in
            tracker.headerTops[m.index] = top  // jumps align this edge under the nav bar
        }
        .padding(.top, m.index == 1 ? 40 : 44)
        .gutter()
    }

    private func mainIdeas(_ m: Movement) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionLabel("piece.section.mainIdeas")
            ForEach(Array(m.mainIdeas.enumerated()), id: \.offset) { i, idea in
                VStack(alignment: .leading, spacing: 4) {
                    if let name = idea.name { Text(verbatim: name).font(Typography.readingMedium).foregroundStyle(readingColor(.mainIdeas(m.index), Palette.ink)) }
                    RichTextView(source: idea.description.capitalizedFirst(locale: piece.contentLocale), font: Typography.body15, lineHeight: 1.5, literataSize: nil,
                                 color: readingColor(.mainIdeas(m.index), Palette.ink2))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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
                    .font(Typography.meta13).lineHeight(1.45).foregroundStyle(Palette.ink2)
            }
        }
        .padding(.top, 34)
        .padding(.bottom, 14)
        .gutter()
    }

    private func notice(_ m: Movement) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionLabel("piece.section.thingsToNotice")
            // 12 below the label, 10 between items (SPEC §4.4 row 11).
            VStack(alignment: .leading, spacing: 10) {
                ForEach(Array(m.notice.enumerated()), id: \.offset) { i, tip in
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(verbatim: "\(i + 1)").font(Typography.reading).foregroundStyle(Palette.accent).frame(width: 24, alignment: .leading)
                        RichTextView(source: tip, color: readingColor(.notice(m.index), Palette.ink))
                    }
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
                    RichTextView(source: note.body, color: readingColor(.notes(m.index), Palette.ink))
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
        .frame(maxWidth: .infinity, alignment: .leading)
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
                if p.rightsStatus == "public_domain" {
                    Text("piece.sources.painting.publicDomain \(p.credit)")
                } else {
                    Text("piece.sources.painting \(p.credit)")
                }
            }
            if let reference = piece.referenceRecording {
                Text("piece.sources.recording \([reference.label, reference.displayYear].compactMap { $0 }.joined(separator: ", "))")
            }
        }
        .font(Typography.caption).lineHeight(1.5).foregroundStyle(Palette.ink3)
        .padding(.top, 24)
        .padding(.bottom, Spacing.floatingButtonClearance)
        .frame(maxWidth: .infinity, alignment: .leading)
        .hairlineTop()
        .padding(.top, 40)
        .gutter()
    }
}

/// Thread paragraph with a medium-weight lead-in ("**The falling line.** Almost every…").
private struct LeadInParagraph: View {
    let title: String
    let text: String
    @Environment(\.activeGlossaryTerm) private var activeTerm

    var body: some View {
        var lead = AttributedString("\(title). ")
        lead.font = Typography.readingMedium
        var rest = RichText.attributed(text)
        for run in rest.runs where run.link != nil {
            rest[run.range].foregroundColor = Palette.accent
            rest[run.range].underlineStyle = Text.LineStyle(pattern: .dot, color: Palette.accent)
            if let activeTerm, run.link.flatMap(RichText.glossaryID) == activeTerm {
                rest[run.range].backgroundColor = Palette.accent.opacity(0.14)  // its sheet is open
            }
        }
        return Text(lead + rest)
            .font(Typography.reading).lineHeight(1.6, literata: 17).foregroundStyle(Palette.ink)
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
                Text(verbatim: piece.headerTitle).font(Typography.titleXL).lineHeight(1.15, literata: 30).tracking(-0.3)
                    .foregroundStyle(Palette.ink).accessibilityAddTraits(.isHeader)
                Text("piece.meta \(piece.yearText) \(piece.durationMin)").font(Typography.meta14).foregroundStyle(Palette.ink2)
                Text(verbatim: piece.hook).font(Typography.hookL).lineHeight(1.45, literata: 19).foregroundStyle(Palette.ink).padding(.top, 6)
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

/// The scroll values the page tracks, read from `ScrollGeometry`. A plain value
/// (`nonisolated`), so reading it never depends on which thread SwiftUI runs the transform on.
nonisolated private struct ScrollMetrics: Equatable {
    var offset: CGFloat
    var minOffset: CGFloat
    var maxOffset: CGFloat
    var viewportHeight: CGFloat

    init(_ geometry: ScrollGeometry) {
        offset = geometry.contentOffset.y
        minOffset = -geometry.contentInsets.top
        maxOffset = geometry.contentSize.height + geometry.contentInsets.bottom - geometry.containerSize.height
        viewportHeight = geometry.containerSize.height
    }
}
