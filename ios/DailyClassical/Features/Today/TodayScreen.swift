import SwiftUI

/// Today (SPEC §4.1): the painting runs under the status bar, the date sits in its own
/// glass chip, and the clear-glass primary floats on the painting's lower edge.
struct TodayScreen: View {
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.todayPath) {
            Group {
                switch content.today {
                case .loaded(let piece): TodayContent(piece: piece)
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

private struct TodayContent: View {
    let piece: Piece
    @Environment(AppRouter.self) private var router
    @State private var showArtwork = false

    private let paintingHeight: CGFloat = 420

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
                        DateChip(date: .now).padding(.top, 58)
                    }
                    .overlay(alignment: .bottom) {
                        PrimaryGlassButton(title: "today.startListening") { router.todayPath.append(PieceRoute(id: piece.id)) }
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
                        .font(Typography.titleToday).lineHeight(1.2, literata: 27).tracking(-0.27)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Text(verbatim: piece.hook)
                        .font(Typography.hookM).lineHeight(1.45, literata: 17).foregroundStyle(Palette.ink2)
                    Text("today.meta \(piece.yearText) \(piece.durationMin) \(piece.movementCount)")
                        .font(Typography.meta13).foregroundStyle(Palette.ink2).padding(.top, 2)
                }
                .padding(.top, 44)
                .padding(.horizontal, Spacing.pageGutter)
                .padding(.bottom, 120)
            }
        }
        .ignoresSafeArea(edges: .top)
        .scrollBounceBehavior(.basedOnSize)
        .fullScreenCover(isPresented: $showArtwork) {
            if let painting = piece.painting { ArtworkViewer(painting: painting) }
        }
    }

    private var paintingLabel: Text {
        guard let p = piece.painting else { return Text(verbatim: "") }
        return Text("today.painting.accessibilityLabel \(p.title) \(p.artist)")
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
    TodayScreen()
        .environment(ContentStore(source: .bundled))
        .environment(AppRouter())
        .environment(SessionStore())
        .environment(LanguageSettings())
        .task { }
}
