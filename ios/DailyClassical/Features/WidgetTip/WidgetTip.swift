import SwiftUI
import WidgetKit

/// When to show the widget tip ("Today's piece on your Home Screen", design A:
/// https://claude.ai/artifact/7HKvqZjoyZEN7gg9jFb2dr). After the app has been opened on two
/// different days, on Today; never once "Got it" was tapped, at most twice (the second time a
/// week after "Later"), never on a day the rating card showed, and never while a DailyClassical
/// widget is already on the Home Screen. Settings › Home Screen widget opens it at any time.
enum WidgetTipPolicy {
    private static let defaults = UserDefaults.standard
    private static let daysKey = "widgetTip.activeDays"
    private static let shownKey = "widgetTip.shownDates"
    private static let doneKey = "widgetTip.done"
    static let requiredDays = 2
    static let maxShows = 2
    static let laterGap: TimeInterval = 7 * 24 * 3600

    /// The app came to the foreground today.
    static func recordActiveDay(_ date: Date = .now) {
        var days = Set(defaults.stringArray(forKey: daysKey) ?? [])
        guard days.count < requiredDays else { return }
        days.insert(date.formatted(Date.ISO8601FormatStyle(timeZone: .current).year().month().day()))
        defaults.set(Array(days), forKey: daysKey)
    }

    static func isDue(_ now: Date = .now) -> Bool {
        guard !defaults.bool(forKey: doneKey),
              (defaults.stringArray(forKey: daysKey) ?? []).count >= requiredDays else { return false }
        let shown = shownDates
        guard shown.count < maxShows else { return false }
        if let last = shown.last, now.timeIntervalSince(last) < laterGap { return false }
        return !RatePromptPolicy.wasShown(onSameDayAs: now)
    }

    static func markShown(_ now: Date = .now) { defaults.set(shownDates + [now], forKey: shownKey) }
    static func markDone() { defaults.set(true, forKey: doneKey) }

    static func wasShown(onSameDayAs date: Date) -> Bool {
        shownDates.contains { Calendar.current.isDate($0, inSameDayAs: date) }
    }

    private static var shownDates: [Date] { defaults.array(forKey: shownKey) as? [Date] ?? [] }

    /// A DailyClassical widget is already on the Home Screen (or in StandBy).
    static func hasWidget() async -> Bool {
        guard let widgets = try? await WidgetCenter.shared.currentConfigurations() else { return false }
        return !widgets.isEmpty
    }
}

extension View {
    /// Shows the widget tip over the app when it is due (on Today, nothing else on screen), or when
    /// `router.widgetTip` is set from Settings.
    func widgetTip() -> some View { modifier(WidgetTipHost()) }
}

private struct WidgetTipHost: ViewModifier {
    @Environment(AppRouter.self) private var router
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    func body(content: Content) -> some View {
        content
            .overlay {
                if let source = router.widgetTip {
                    WidgetTipCard(showsLater: source == .automatic,
                                  onDone: { close(done: true) },
                                  onLater: { close(done: false) })
                        .transition(.opacity)
                }
            }
            .animation(.easeOut(duration: 0.25), value: router.widgetTip)
            .task(id: scenePhase) {
                guard scenePhase == .active else { return }
                WidgetTipPolicy.recordActiveDay()
                try? await Task.sleep(for: .seconds(1.5))
                guard canShow, WidgetTipPolicy.isDue(), !(await WidgetTipPolicy.hasWidget()), canShow else { return }
                WidgetTipPolicy.markShown()
                router.widgetTip = .automatic
                Analytics.shared.widgetPrompt(.shown)
            }
    }

    /// Today on top, no piece, sheet, rating card or welcome flow in the way.
    private var canShow: Bool {
        scenePhase == .active && hasCompletedOnboarding && router.tab == .today && router.todayPath.isEmpty
            && router.sheet == nil && !router.showRatePrompt && router.widgetTip == nil
    }

    private func close(done: Bool) {
        let automatic = router.widgetTip == .automatic
        router.widgetTip = nil
        if done { WidgetTipPolicy.markDone() }
        if automatic { Analytics.shared.widgetPrompt(done ? .yes : .later) }
    }
}

/// Design A: a Home Screen with today's medium widget on top, the promise, three steps, Got it /
/// Later. Opened from Settings it has no "Later".
struct WidgetTipCard: View {
    let showsLater: Bool
    let onDone: () -> Void
    let onLater: () -> Void

    @State private var appeared = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.48)
                .ignoresSafeArea()
                .accessibilityHidden(true)

            // In one pane, not across the fold, when an iPhone Duo is half open like a book.
            FoldAware {
                // Its own height when it fits; on short screens (iPhone SE) without the row of app
                // icons and with a lower widget; scrolls only at the largest text sizes.
                ViewThatFits(in: .vertical) {
                    card(compact: false)
                    card(compact: true)
                    ScrollView { card(compact: true) }.scrollBounceBehavior(.basedOnSize)
                }
                .background(Palette.background)
                .clipShape(.rect(cornerRadius: 28, style: .continuous))
                .shadow(color: .black.opacity(0.3), radius: 30, y: 12)
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
                .frame(maxWidth: 440)
                .scaleEffect(appeared ? 1 : 0.94)
                .accessibilityElement(children: .contain)
                .accessibilityAddTraits(.isModal)
            }
        }
        .onAppear { withAnimation(.spring(duration: 0.4, bounce: 0.15)) { appeared = true } }
    }

    private func card(compact: Bool) -> some View {
        VStack(spacing: 0) {
            HomeScreenPreview(compact: compact)

            VStack(spacing: 0) {
                Text("widgetTip.title")
                    .font(Typography.titleM)
                    .lineHeight(1.25, literata: 24)
                    .foregroundStyle(Palette.ink)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)

                Text("widgetTip.body")
                    .font(Typography.body15)
                    .lineHeight(1.5)
                    .foregroundStyle(Palette.ink2)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 8)

                VStack(alignment: .leading, spacing: 12) {
                    WidgetTipStep(number: 1, text: "widgetTip.step1")
                    WidgetTipStep(number: 2, text: "widgetTip.step2")
                    WidgetTipStep(number: 3, text: "widgetTip.step3")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)

                VStack(spacing: 4) {
                    Button(action: onDone) { Text("widgetTip.done") }
                        .buttonStyle(.dcPrimary)
                    if showsLater {
                        Button(action: onLater) { Text("widgetTip.later").frame(maxWidth: .infinity, minHeight: 44) }
                            .buttonStyle(.dcTextLink)
                            .foregroundStyle(Palette.ink2)
                    }
                }
                .padding(.top, 22)
            }
            .padding(.horizontal, 24)
            .padding(.top, 22)
            .padding(.bottom, showsLater ? 16 : 24)
        }
    }
}

private struct WidgetTipStep: View {
    let number: Int
    let text: LocalizedStringKey

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            Text(verbatim: "\(number)")
                .font(Typography.system(13, .semibold, relativeTo: .footnote))
                .foregroundStyle(Palette.onTint)
                .frame(width: 24, height: 24)
                .background(Palette.accent, in: .circle)
                .alignmentGuide(.firstTextBaseline) { $0[VerticalAlignment.center] + 5 }
                .accessibilityHidden(true)
            Text(text)
                .font(Typography.body15)
                .lineHeight(1.4)
                .foregroundStyle(Palette.ink)
                .fixedSize(horizontal: false, vertical: true)
        }
        .accessibilityElement(children: .combine)
    }
}

/// A row of app icons and today's medium widget, as it looks on a Home Screen. The widget mirrors
/// DailyClassicalWidget's medium layout (TodayWidgetView), with today's piece.
private struct HomeScreenPreview: View {
    let compact: Bool
    @Environment(ContentStore.self) private var content
    @Environment(\.locale) private var locale

    private static let wallpaper = Color(red: 0x2E / 255, green: 0x2C / 255, blue: 0x28 / 255)

    var body: some View {
        VStack(spacing: 14) {
            if !compact {
                HStack(spacing: 16) {
                    ForEach(0..<4, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 13, style: .continuous)
                            .fill(.white.opacity(0.14))
                            .frame(height: 52)
                    }
                }
                .padding(.horizontal, 12)
                .accessibilityHidden(true)
            }

            widget
                .frame(height: compact ? 136 : 160)
                .clipShape(.rect(cornerRadius: 22, style: .continuous))
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("widgetTip.preview.accessibilityLabel"))
        }
        .padding(EdgeInsets(top: compact ? 18 : 22, leading: 20, bottom: compact ? 18 : 20, trailing: 20))
        .background(Self.wallpaper)
    }

    private var piece: Piece? { if case .loaded(let p) = content.today { p } else { nil } }

    private var widget: some View {
        HStack(spacing: 0) {
            PaintingImage(url: piece?.painting?.imageUrl)
                .frame(width: 138)
                .clipped()
            VStack(alignment: .leading, spacing: 3) {
                Text("widget.today \(Date.now.formatted(dateStyle))")
                    .font(.system(size: 9.5, weight: .semibold)).tracking(0.76).textCase(.uppercase)
                    .foregroundStyle(Palette.ink2).lineLimit(1)
                if let piece {
                    Text(verbatim: piece.composer.name)
                        .font(.system(size: 11.5, weight: .medium)).foregroundStyle(Palette.accent)
                        .lineLimit(1).padding(.top, 2)
                    Text(verbatim: piece.headerTitle)
                        .font(Typography.literata(16, .medium)).foregroundStyle(Palette.ink)
                        .lineLimit(2).minimumScaleFactor(0.85)
                    Spacer(minLength: 2)
                    Text(verbatim: piece.hook)
                        .font(Typography.literata(12.5).italic()).foregroundStyle(Palette.ink2)
                        .lineLimit(2)
                } else {
                    Text(verbatim: "DailyClassical")
                        .font(Typography.literata(16, .medium)).foregroundStyle(Palette.ink)
                        .padding(.top, 2)
                    Spacer(minLength: 0)
                }
            }
            .padding(EdgeInsets(top: 13, leading: 13, bottom: 13, trailing: 14))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Palette.background)
        .dynamicTypeSize(.large)  // a picture of the widget, which keeps its size too
    }

    /// "Mon 9 Nov" / "Pzt 9 Kas", as the medium widget writes it.
    private var dateStyle: Date.FormatStyle {
        let id = locale.language.languageCode?.identifier == "tr" ? "tr_TR" : "en_GB"
        return Date.FormatStyle(locale: Locale(identifier: id)).weekday(.abbreviated).day().month(.abbreviated)
    }
}
