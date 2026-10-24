import StoreKit
import SwiftUI

/// When to ask for an App Store rating. Our own card comes first ("Would you like to rate
/// DailyClassical?"); only "Yes" calls the system prompt, which iOS shows at most three times in
/// 365 days and may skip. So the card follows the same budget, at most once per app version, and
/// only after the listener has opened pieces on three different days.
enum RatePromptPolicy {
    private static let defaults = UserDefaults.standard
    private static let daysKey = "ratePrompt.pieceDays"
    private static let shownKey = "ratePrompt.shownDates"
    private static let versionKey = "ratePrompt.shownForVersion"
    static let requiredDays = 3
    static let maxPerYear = 3

    /// A piece page opened today (Features/Piece). Days, not views: three visits in one evening
    /// say less than three evenings.
    static func recordPieceDay(_ date: Date = .now) {
        var days = Set(defaults.stringArray(forKey: daysKey) ?? [])
        guard days.count < requiredDays else { return }
        days.insert(dayKey(date))
        defaults.set(Array(days), forKey: daysKey)
    }

    static func isDue(_ now: Date = .now) -> Bool {
        guard (defaults.stringArray(forKey: daysKey) ?? []).count >= requiredDays,
              defaults.string(forKey: versionKey) != AppVersion.current else { return false }
        return shownInLastYear(now) < maxPerYear
    }

    static func markShown(_ now: Date = .now) {
        let yearAgo = now.addingTimeInterval(-365 * 24 * 3600)
        let recent = (defaults.array(forKey: shownKey) as? [Date] ?? []).filter { $0 > yearAgo }
        defaults.set(recent + [now], forKey: shownKey)
        defaults.set(AppVersion.current, forKey: versionKey)
    }

    private static func shownInLastYear(_ now: Date) -> Int {
        let yearAgo = now.addingTimeInterval(-365 * 24 * 3600)
        return (defaults.array(forKey: shownKey) as? [Date] ?? []).filter { $0 > yearAgo }.count
    }

    private static func dayKey(_ date: Date) -> String {
        date.formatted(Date.ISO8601FormatStyle(timeZone: .current).year().month().day())
    }
}

extension View {
    /// Shows the rating card over the app when it is due: on returning to Today from a piece, never
    /// during onboarding or over another sheet. `router.showRatePrompt` forces it (Settings › Test).
    func ratePrompt() -> some View { modifier(RatePromptHost()) }
}

private struct RatePromptHost: ViewModifier {
    @Environment(AppRouter.self) private var router
    @Environment(\.requestReview) private var requestReview
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    func body(content: Content) -> some View {
        content
            .overlay {
                if router.showRatePrompt {
                    RatePromptCard(
                        onYes: { close(thenReview: true) },
                        onLater: { close(thenReview: false) }
                    )
                    .transition(.opacity)
                }
            }
            .animation(.easeOut(duration: 0.25), value: router.showRatePrompt)
            .onChange(of: router.todayPath.count) { old, new in
                // Back on Today from a piece page, nothing else on screen.
                guard old > 0, new == 0, router.tab == .today, router.sheet == nil,
                      hasCompletedOnboarding, RatePromptPolicy.isDue() else { return }
                Task {
                    try? await Task.sleep(for: .milliseconds(700))
                    guard router.todayPath.isEmpty, router.sheet == nil else { return }
                    RatePromptPolicy.markShown()
                    router.showRatePrompt = true
                }
            }
    }

    private func close(thenReview: Bool) {
        router.showRatePrompt = false
        guard thenReview else { return }
        Task {
            // After our card has faded, so the two never overlap.
            try? await Task.sleep(for: .milliseconds(400))
            requestReview()
        }
    }
}

/// Design B ("Tablolu kart"): Friedrich on top, five stars, the question, Yes / Later.
/// The stars arrive filled one by one, resolve into outlines, then fill again (5 → 0 → 5).
struct RatePromptCard: View {
    let onYes: () -> Void
    let onLater: () -> Void

    @State private var appeared = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.48)
                .ignoresSafeArea()
                .accessibilityHidden(true)

            VStack(spacing: 0) {
                PaywallPainting()
                    .frame(height: 220)
                    .clipped()

                Text("paywall.painting.caption")
                    .font(Typography.caption)
                    .lineHeight(1.4)
                    .foregroundStyle(Palette.ink3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)

                VStack(spacing: 0) {
                    RateStars()
                        .padding(.top, 22)

                    Text("rate.title")
                        .font(Typography.titleM)
                        .lineHeight(1.25, literata: 24)
                        .foregroundStyle(Palette.ink)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityAddTraits(.isHeader)
                        .padding(.top, 16)

                    Text("rate.body")
                        .font(Typography.body15)
                        .lineHeight(1.5)
                        .foregroundStyle(Palette.ink2)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 8)

                    VStack(spacing: 4) {
                        Button(action: onYes) { Text("rate.yes") }
                            .buttonStyle(.dcPrimary)
                        Button(action: onLater) { Text("rate.later").frame(maxWidth: .infinity, minHeight: 44) }
                            .buttonStyle(.dcTextLink)
                            .foregroundStyle(Palette.ink2)
                    }
                    .padding(.top, 22)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
            .background(Palette.background)
            .clipShape(.rect(cornerRadius: 28, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, y: 12)
            .padding(.horizontal, 24)
            .frame(maxWidth: 440)
            .scaleEffect(appeared ? 1 : 0.94)
            .accessibilityElement(children: .contain)
            .accessibilityAddTraits(.isModal)
        }
        .onAppear { withAnimation(.spring(duration: 0.4, bounce: 0.15)) { appeared = true } }
    }
}

/// Five stars: filled in one by one, held, resolved into outlines from the last to the first, then
/// filled again from the first. Reduce Motion shows them filled, without the play.
private struct RateStars: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var shown = 0          // stars that have arrived
    @State private var resolved = 0       // stars, from the right, whose fill has gone

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<5, id: \.self) { i in
                let filled = i < 5 - resolved
                ZStack {
                    StarShape().stroke(style: StrokeStyle(lineWidth: 1.75, lineJoin: .round))
                    StarShape().fill()
                        .opacity(filled ? 1 : 0)
                        .scaleEffect(filled ? 1 : 0.6)
                        .blur(radius: filled ? 0 : 3)
                }
                .frame(width: 28, height: 28)
                .foregroundStyle(Palette.accent)
                .opacity(i < shown ? 1 : 0)
                .scaleEffect(i < shown ? 1 : 0.4)
            }
        }
        .accessibilityHidden(true)
        .task { await play() }
    }

    /// Five-pointed star in the icon set's 24 pt grid (round joins, like the line icons).
    private nonisolated struct StarShape: Shape {
        func path(in rect: CGRect) -> Path {
            let c = CGPoint(x: rect.midX, y: rect.midY + rect.height * 0.04)
            let outer = min(rect.width, rect.height) * 0.48, inner = outer * 0.46
            var p = Path()
            for k in 0..<10 {
                let r = k.isMultiple(of: 2) ? outer : inner
                let a = -Double.pi / 2 + Double(k) * .pi / 5
                let pt = CGPoint(x: c.x + r * cos(a), y: c.y + r * sin(a))
                k == 0 ? p.move(to: pt) : p.addLine(to: pt)
            }
            p.closeSubpath()
            return p
        }
    }

    private func play() async {
        if reduceMotion { shown = 5; return }
        try? await Task.sleep(for: .milliseconds(250))
        for i in 1...5 {
            withAnimation(.spring(duration: 0.35, bounce: 0.4)) { shown = i }
            try? await Task.sleep(for: .milliseconds(90))
        }
        try? await Task.sleep(for: .milliseconds(1100))
        for i in 1...5 {
            withAnimation(.easeInOut(duration: 0.45)) { resolved = i }
            try? await Task.sleep(for: .milliseconds(110))
        }
        // 5 → 0 → 5: after a beat the fills come back from the first star to the last.
        try? await Task.sleep(for: .milliseconds(650))
        for i in stride(from: 4, through: 0, by: -1) {
            withAnimation(.spring(duration: 0.4, bounce: 0.35)) { resolved = i }
            try? await Task.sleep(for: .milliseconds(110))
        }
    }
}
