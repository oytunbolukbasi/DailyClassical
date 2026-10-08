import SwiftUI

/// Today (SPEC §4.1): the painting runs under the status bar, the date sits in its own
/// glass chip, and the clear-glass primary floats on the painting's lower edge.
/// Swiping right pages back through previously published days (never future ones); today is
/// the rightmost page.
struct TodayScreen: View {
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router
    /// The painting zooms into the piece page (Start listening, or pulling the page up).
    @Namespace private var zoom
    /// The piece page hides the tab bar. Shown again the moment Today starts to reappear (the
    /// start of a back swipe, not its end), hidden the moment a piece is pushed.
    @State private var tabBarVisible = true

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.todayPath) {
            Group {
                switch content.today {
                case .loaded(let piece): TodayPager(todayPiece: piece)
                case .failed(let error): TodayOffline(error: error)
                case .idle, .loading: TodaySkeleton()
                }
            }
            .background(Palette.background)
            .toolbarVisibility(.hidden, for: .navigationBar)
            // Driven by Today's own appearance rather than the stack's depth: the path only empties
            // once a back swipe has finished, which brought the tab bar in a beat too late.
            .toolbarVisibility(tabBarVisible ? .visible : .hidden, for: .tabBar)
            .onAppear { setTabBar(true) }  // also fires as a back swipe begins
            .onDisappear { if !router.todayPath.isEmpty { setTabBar(false) } }  // a cancelled swipe
            .onChange(of: router.todayPath.count) { old, new in
                if new > old { setTabBar(false) } else if new == 0 { setTabBar(true) }
            }
            .navigationDestination(for: PieceRoute.self) { route in
                PieceScreen(id: route.id).navigationTransition(.zoom(sourceID: route.id, in: zoom))
            }
        }
        .environment(\.todayZoomNamespace, zoom)
    }

    private func setTabBar(_ visible: Bool) {
        guard tabBarVisible != visible else { return }
        withAnimation(.easeOut(duration: 0.25)) { tabBarVisible = visible }
    }
}

extension EnvironmentValues {
    @Entry var todayZoomNamespace: Namespace.ID? = nil
}

/// The screen's safe-area frame, measured once by the pager: pages ignore the safe area so the
/// painting runs under the status bar and the text can scroll under the floating tab bar.
private struct TodayMetrics: Equatable {
    var height: CGFloat = 0  // full screen height
    var top: CGFloat = 0     // status bar
    var bottom: CGFloat = 0  // up to the top of the floating tab bar
}

/// Horizontal pages, one per published day, oldest first; opens on today (the last page).
private struct TodayPager: View {
    let todayPiece: Piece
    @Environment(ContentStore.self) private var content
    @State private var position: String?

    var body: some View {
        let days = content.days.isEmpty ? [ScheduledDay(day: content.todayDay, pieceId: todayPiece.id)] : content.days
        GeometryReader { geo in
            let metrics = TodayMetrics(height: geo.size.height + geo.safeAreaInsets.top + geo.safeAreaInsets.bottom,
                                       top: geo.safeAreaInsets.top, bottom: geo.safeAreaInsets.bottom)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(Array(days.enumerated()), id: \.element.day) { index, day in
                        TodayDayPage(
                            day: day,
                            metrics: metrics,
                            previous: index > 0 ? { scroll(to: days[index - 1].day) } : nil,
                            next: index < days.count - 1 ? { scroll(to: days[index + 1].day) } : nil
                        )
                        .containerRelativeFrame(.horizontal)
                        .frame(height: metrics.height)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $position)
            .defaultScrollAnchor(.trailing)
            .scrollIndicators(.hidden)
            .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
            .scrollEdgeEffectHidden(true, for: .top)  // see TodayContent: no band over the painting
            .ignoresSafeArea(edges: .vertical)
        }
        .onAppear { if position == nil { position = days.last?.day } }
    }

    private func scroll(to day: String) {
        withAnimation(.easeInOut(duration: 0.3)) { position = day }
    }
}

/// One day: today's piece is already loaded; earlier days load their piece when the page is
/// built (LazyHStack builds the visible page and its neighbours).
private struct TodayDayPage: View {
    let day: ScheduledDay
    let metrics: TodayMetrics
    let previous: (() -> Void)?
    let next: (() -> Void)?

    @Environment(ContentStore.self) private var content
    @State private var loaded: Piece?
    @State private var failure: APIError?

    var body: some View {
        Group {
            if let piece = loaded ?? content.cachedPiece(id: day.pieceId) {
                TodayContent(piece: piece, date: day.date, metrics: metrics, previous: previous, next: next)
            } else if let failure {
                TodayDayOffline(date: day.date, error: failure, previous: previous, next: next) { Task { await load() } }
                    .padding(.top, metrics.top)
            } else {
                PieceSkeleton()
            }
        }
        .task(id: "\(content.language)/\(day.pieceId)") { await load() }
    }

    private func load() async {
        if let cached = content.cachedPiece(id: day.pieceId) { loaded = cached; return }
        failure = nil
        do {
            loaded = try await content.piece(id: day.pieceId)
        } catch {
            failure = error as? APIError ?? .offline
        }
    }
}

/// "Alternative A": the text block sits on the bottom (its last line 30 pt above the tab bar),
/// the painting fills everything above it, 44 pt above the caption. On short phones the painting
/// keeps a 300 pt minimum and the page scrolls instead.
private struct TodayContent: View {
    let piece: Piece
    let date: Date
    let metrics: TodayMetrics
    let previous: (() -> Void)?
    let next: (() -> Void)?

    @Environment(ContentStore.self) private var content
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(AppRouter.self) private var router
    @Environment(\.todayZoomNamespace) private var zoom
    @State private var showArtwork = false
    /// Starts from the last measurement for this piece and width: the page is rebuilt when it comes
    /// back from the piece, and a first frame laid out without the text height drew the painting
    /// taller, then it settled (the "painting drops into place" at the end of a back swipe).
    @State private var textHeight: CGFloat

    /// Last measured text block height per piece, language and width (main actor only).
    private static var measuredTextHeights: [String: CGFloat] = [:]
    private var measureKey: String { "\(piece.id)/\(piece.contentLocale)/\(Int(metrics.height))" }

    init(piece: Piece, date: Date, metrics: TodayMetrics, previous: (() -> Void)?, next: (() -> Void)?) {
        self.piece = piece
        self.date = date
        self.metrics = metrics
        self.previous = previous
        self.next = next
        _textHeight = State(initialValue: Self.measuredTextHeights["\(piece.id)/\(piece.contentLocale)/\(Int(metrics.height))"] ?? 0)
    }
    /// Pulling the page up from its top opens the piece when the finger lifts (far enough, or a
    /// flick). Nothing happens mid-drag, so the page follows the finger and the zoom starts clean.
    @State private var scrollOffset: CGFloat = 0
    @State private var dragStartOffset: CGFloat = 0
    @State private var pullingFromTop = false
    @State private var pull: CGFloat = 0

    private let pullThreshold: CGFloat = 48   // a slow drag past this opens on release
    private let flickVelocity: CGFloat = 0.3  // or a flick upwards; UIKit's unit, points per ms
    private var pullReady: Bool { pull > pullThreshold }

    private let textTopGap: CGFloat = 44     // painting's lower edge → caption
    private let textBottomGap: CGFloat = 30  // meta line → top of the tab bar
    private let minPaintingHeight: CGFloat = 300

    private var paintingHeight: CGFloat {
        guard textHeight > 0 else { return 420 }  // first pass, before the text is measured
        return max(minPaintingHeight, metrics.height - metrics.bottom - textBottomGap - textHeight - textTopGap)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                PaintingImage(url: piece.painting?.imageUrl)
                    .frame(height: paintingHeight)
                    .frame(maxWidth: .infinity)
                    // The zoom's anchor is an invisible frame over the painting, below the status
                    // bar: the system clips a source to the safe area and hides it while zooming,
                    // so anchoring on the painting itself left a pale band around it at the end of
                    // a back swipe, then the painting jumped into place. This way the painting
                    // stays put and the page shrinks onto it.
                    .overlay(alignment: .bottom) {
                        // Not .clear: an empty view gave the zoom no frame to land on.
                        Rectangle().fill(Color.black.opacity(0.001))
                            .frame(height: max(0, paintingHeight - metrics.top))
                            .modifier(ZoomSource(id: piece.id, namespace: zoom))
                            .allowsHitTesting(false)
                    }
                    .contentShape(.rect)
                    .onTapGesture { if piece.painting != nil { showArtwork = true } }
                    .accessibilityLabel(paintingLabel)
                    .accessibilityAddTraits(.isButton)
                    .overlay(alignment: .top) {
                        DateChip(date: date)
                            .dayNavigation(previous: previous, next: next)
                            .padding(.top, metrics.top + 11)
                    }
                    .overlay(alignment: .bottom) {
                        PrimaryGlassButton(title: "today.startListening") { startListening() }
                            // Grows a little as the page is pulled: releasing opens the piece.
                            .scaleEffect(1 + 0.06 * min(pull / pullThreshold, 1))
                            .animation(.spring(duration: 0.25), value: pullReady)
                            .offset(y: 27)
                    }
                    .zIndex(1)

                VStack(alignment: .leading, spacing: 8) {
                    if let painting = piece.painting {
                        PaintingCaption(painting: painting, withDash: true).padding(.bottom, 6)
                    }
                    ComposerLink(name: piece.composer.name, font: Typography.composerLinkToday) {
                        router.present(.composer(piece.composer))
                    }
                    Text(verbatim: piece.headerTitle)
                        .font(Typography.titleXL).lineHeight(1.15, literata: 30).tracking(-0.3)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                        .dayNavigation(previous: previous, next: next)
                    Text(verbatim: piece.hook)
                        .font(Typography.hookM).lineHeight(1.45, literata: 17).foregroundStyle(Palette.ink2)
                    Text("today.meta \(piece.yearText) \(piece.durationMin) \(piece.movementCount)")
                        .font(Typography.meta13).foregroundStyle(Palette.ink2).padding(.top, 2)
                }
                .padding(.horizontal, Spacing.pageGutter)
                .fixedSize(horizontal: false, vertical: true)
                .onGeometryChange(for: CGFloat.self) { $0.size.height } action: {
                    textHeight = $0
                    Self.measuredTextHeights[measureKey] = $0
                }
                .padding(.top, textTopGap)
                .padding(.bottom, textBottomGap)
            }
        }
        .contentMargins(.bottom, metrics.bottom, for: .scrollContent)
        // The painting runs under the status bar (SPEC §4.1, in the Reduce Transparency frame too);
        // with Reduce Transparency on, the system's top edge effect would become an opaque band.
        .scrollEdgeEffectHidden(true, for: .top)
        // Always rubber-bands vertically (even when the page fits) so pulling up can open the piece.
        .scrollBounceBehavior(.always, axes: .vertical)
        .onScrollGeometryChange(for: CGFloat.self) { geo in
            // Distance scrolled from the resting (top) position.
            geo.contentOffset.y + geo.contentInsets.top
        } action: { _, offset in
            scrollOffset = offset
            if pullingFromTop { pull = max(0, offset - dragStartOffset) }
        }
        .onScrollPhaseChange { old, new, context in
            if new == .interacting {
                dragStartOffset = scrollOffset
                pullingFromTop = scrollOffset < 12
                pull = 0
            } else if old == .interacting {
                // The Today page is a cover: pulling it up reads as "show me more".
                let upward = context.velocity.map { $0.dy } ?? 0
                if pullingFromTop, pullReady || upward > flickVelocity {
                    startListening()
                }
                pullingFromTop = false
                pull = 0
            }
        }
        .sensoryFeedback(.impact(weight: .light), trigger: pullReady) { _, ready in ready }
        .fullScreenCover(isPresented: $showArtwork) {
            if let painting = piece.painting { ArtworkViewer(painting: painting) }
        }
    }

    private func startListening() {
        if content.isLocked(piece.id, premium: entitlements.isPremium) {
            router.present(.paywall)
        } else {
            router.todayPath.append(PieceRoute(id: piece.id))
        }
    }

    private var paintingLabel: Text {
        guard let p = piece.painting else { return Text(verbatim: "") }
        return Text("today.painting.accessibilityLabel \(p.title) \(p.artist)")
    }
}

/// An earlier day whose piece could not load (offline and not cached, or another error).
private struct TodayDayOffline: View {
    let date: Date
    let error: APIError
    let previous: (() -> Void)?
    let next: (() -> Void)?
    let retry: () -> Void

    var body: some View {
        VStack(spacing: 18) {
            DateChip(date: date).dayNavigation(previous: previous, next: next)
            EmptyStateView(icon: error.isOffline ? "offline" : nil,
                           title: error.isOffline ? Text("state.offline.title") : Text("state.error.generic"),
                           message: error.isOffline ? Text("today.day.offline.body") : Text("state.error.body")) {
                Button("state.retry", action: retry).buttonStyle(.retry)
            }
        }
        .padding(.top, 11)
        .padding(.bottom, 120)
        .frame(maxWidth: .infinity)
    }
}

private extension View {
    /// Swipes aren't discoverable with VoiceOver: the date and the title offer
    /// "Previous day" / "Next day" actions.
    func dayNavigation(previous: (() -> Void)?, next: (() -> Void)?) -> some View {
        accessibilityActions {
            if let previous { Button("today.previousDay", action: previous) }
            if let next { Button("today.nextDay", action: next) }
        }
    }
}

private extension ScheduledDay {
    /// Noon on that calendar day, in the reader's time zone.
    var date: Date {
        let parts = day.split(separator: "-").compactMap { Int($0) }
        guard parts.count == 3,
              let date = Calendar.current.date(from: DateComponents(year: parts[0], month: parts[1], day: parts[2], hour: 12))
        else { return .now }
        return date
    }
}

/// "4 | SATURDAY / OCTOBER 2026" in a neutral glass capsule.
struct DateChip: View {
    let date: Date
    @Environment(\.locale) private var locale

    var body: some View {
        HStack(spacing: 10) {
            Text(date.formatted(.dateTime.day().locale(locale)))
                .font(Typography.dateNumeral).tracking(-0.48)
            VStack(alignment: .leading, spacing: 1) {
                Text(date.formatted(.dateTime.weekday(.wide).locale(locale))).fontWeight(.semibold)
                Text(date.formatted(.dateTime.month(.wide).year().locale(locale))).fontWeight(.medium).opacity(0.7)
            }
            .font(Typography.microRegular)
            .tracking(0.44)
            .textCase(.uppercase)
        }
        .foregroundStyle(Palette.glassInk)
        .padding(.leading, 16).padding(.trailing, 18)
        .frame(height: 44)
        .glassEffect(.regular, in: .capsule)
        .accessibilityElement(children: .combine)
    }
}

private struct TodaySkeleton: View {
    var body: some View {
        PieceSkeleton()
    }
}

/// Offline with nothing cached (SPEC §4.26). Any other failure (a server error, an unreadable
/// response) shows the same block with the generic message and no cloud-off icon.
private struct TodayOffline: View {
    let error: APIError
    @Environment(ContentStore.self) private var content
    @Environment(\.locale) private var locale

    var body: some View {
        // Scrolls at the largest text sizes; at the default size it fits and stays put.
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                StripePlaceholder()
                    .frame(height: 300)
                    .overlay { if error.isOffline { Icon("offline", size: 32).foregroundStyle(Palette.ink3) } }
                VStack(alignment: .leading, spacing: 12) {
                    SectionLabel("state.offline.date \(Date.now.formatted(Date.VerbatimFormatStyle(format: "\(weekday: .wide), \(day: .defaultDigits) \(month: .wide)", locale: locale, timeZone: .current, calendar: .current)))", color: Palette.accent)
                    (error.isOffline ? Text("state.offline.title") : Text("state.error.generic"))
                        .font(Typography.titleM).lineHeight(1.2, literata: 24).foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    (error.isOffline ? Text("state.offline.body") : Text("state.error.body"))
                        .font(Typography.body15).lineHeight(1.5).foregroundStyle(Palette.ink2)
                    Button("state.retry") { Task { await content.retry() } }
                        .buttonStyle(.retry)
                        .padding(.top, 6)
                }
                .padding(.horizontal, 24).padding(.vertical, 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .scrollBounceBehavior(.basedOnSize)
        .scrollEdgeEffectHidden(true, for: .top)  // the stripes run under the status bar, as the painting does
        .ignoresSafeArea(edges: .top)
    }
}

#Preview("Today") {
    @Previewable @State var content = ContentStore(source: .bundled)
    TodayScreen()
        .environment(content)
        .environment(AppRouter())
        .environment(SessionStore())
        .environment(EntitlementStore())
        .environment(LanguageSettings())
        .task { await content.reload(language: "en") }
}

/// Marks the Today painting as the zoom transition's source (when a namespace is available).
private struct ZoomSource: ViewModifier {
    let id: String
    let namespace: Namespace.ID?

    func body(content: Content) -> some View {
        if let namespace {
            content.matchedTransitionSource(id: id, in: namespace)
        } else {
            content
        }
    }
}
