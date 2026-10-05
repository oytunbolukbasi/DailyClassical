import SwiftUI

/// Today (SPEC §4.1): the painting runs under the status bar, the date sits in its own
/// glass chip, and the clear-glass primary floats on the painting's lower edge.
/// Swiping right pages back through previously published days (never future ones); today is
/// the rightmost page.
struct TodayScreen: View {
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.todayPath) {
            Group {
                switch content.today {
                case .loaded(let piece): TodayPager(todayPiece: piece)
                case .failed: TodayOffline()
                case .idle, .loading: TodaySkeleton()
                }
            }
            .background(Palette.background)
            .toolbarVisibility(.hidden, for: .navigationBar)
            .navigationDestination(for: PieceRoute.self) { PieceScreen(id: $0.id) }
        }
    }
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
    @State private var failed = false

    var body: some View {
        Group {
            if let piece = loaded ?? content.cachedPiece(id: day.pieceId) {
                TodayContent(piece: piece, date: day.date, metrics: metrics, previous: previous, next: next)
            } else if failed {
                TodayDayOffline(date: day.date, previous: previous, next: next) { Task { await load() } }
                    .padding(.top, metrics.top)
            } else {
                PieceSkeleton()
            }
        }
        .task(id: "\(content.language)/\(day.pieceId)") { await load() }
    }

    private func load() async {
        if let cached = content.cachedPiece(id: day.pieceId) { loaded = cached; return }
        failed = false
        do {
            loaded = try await content.piece(id: day.pieceId)
        } catch {
            failed = true
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
    @State private var showArtwork = false
    @State private var textHeight: CGFloat = 0

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
                .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { textHeight = $0 }
                .padding(.top, textTopGap)
                .padding(.bottom, textBottomGap)
            }
        }
        .contentMargins(.bottom, metrics.bottom, for: .scrollContent)
        .scrollBounceBehavior(.basedOnSize)
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

/// An earlier day whose piece could not load (offline and not cached).
private struct TodayDayOffline: View {
    let date: Date
    let previous: (() -> Void)?
    let next: (() -> Void)?
    let retry: () -> Void

    var body: some View {
        VStack(spacing: 18) {
            DateChip(date: date).dayNavigation(previous: previous, next: next)
            EmptyStateView(icon: "offline", title: Text("state.offline.title"), message: Text("today.day.offline.body")) {
                Button("state.retry", action: retry).buttonStyle(SmallCapsuleButtonStyle())
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

/// Offline with nothing cached (SPEC §4.26).
private struct TodayOffline: View {
    @Environment(ContentStore.self) private var content
    @Environment(\.locale) private var locale

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            StripePlaceholder()
                .frame(height: 300)
                .overlay { Icon("offline", size: 32).foregroundStyle(Palette.ink3) }
            VStack(alignment: .leading, spacing: 12) {
                SectionLabel("state.offline.date \(Date.now.formatted(Date.VerbatimFormatStyle(format: "\(weekday: .wide), \(day: .defaultDigits) \(month: .wide)", locale: locale, timeZone: .current, calendar: .current)))", color: Palette.accent)
                Text("state.offline.title").font(Typography.titleM).lineHeight(1.2, literata: 24).foregroundStyle(Palette.ink)
                Text("state.offline.body").font(Typography.body15).lineHeight(1.5).foregroundStyle(Palette.ink2)
                Button("state.retry") { Task { await content.retry() } }
                    .buttonStyle(SmallCapsuleButtonStyle())
                    .padding(.top, 6)
            }
            .padding(.horizontal, 24).padding(.vertical, 30)
            Spacer()
        }
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
