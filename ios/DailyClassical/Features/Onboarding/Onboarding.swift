import SwiftUI

extension View {
    /// First-launch welcome flow (design §09): a horizontal pager of painting cards, then the
    /// reminder picker. Sets `isComplete` when done.
    func onboarding(isComplete: Binding<Bool>) -> some View {
        modifier(OnboardingModifier(isComplete: isComplete))
    }
}

private struct OnboardingModifier: ViewModifier {
    @Binding var isComplete: Bool
    @State private var show = false

    func body(content: Content) -> some View {
        content
            // On its own host view: RootView already has full-screen covers (paywall, update), and
            // a second cover on the same view never presents.
            .background {
                Color.clear
                    .fullScreenCover(isPresented: $show) {
                        WelcomeFlow {
                            isComplete = true
                            show = false
                        }
                    }
            }
            .onAppear { if !isComplete { show = true } }
    }
}

// MARK: - Pager

/// Cards 1–3 (idea, follow along, written for listeners), card 4 (the free trial, only while the
/// Apple ID can take it and the reader isn't Premium), then the reminder. "Skip" jumps to the
/// reminder; signing in from card 1 does too.
struct WelcomeFlow: View {
    let onFinish: () -> Void

    enum Page: Hashable { case idea, follow, listeners, trial, reminder }

    @Environment(EntitlementStore.self) private var entitlements
    @Environment(SessionStore.self) private var session
    @Environment(LanguageSettings.self) private var language
    @State private var page: Page = .idea
    @State private var showSignIn = false

    private var pages: [Page] {
        var list: [Page] = [.idea, .follow, .listeners]
        if entitlements.trialDays != nil, !entitlements.isPremium { list.append(.trial) }
        return list + [.reminder]
    }

    private func dots(_ p: Page) -> PageDots {
        PageDots(count: pages.count, current: pages.firstIndex(of: p) ?? 0)
    }

    var body: some View {
        TabView(selection: $page) {
            ForEach(pages, id: \.self) { p in
                content(for: p).tag(p)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(Palette.background.ignoresSafeArea())
        .ignoresSafeArea(edges: .top)
        .overlay(alignment: .topTrailing) {
            if page != .reminder {
                Button { withAnimation { page = .reminder } } label: {
                    Text("onboarding.skip")
                        .font(Typography.chip)
                        .foregroundStyle(Palette.glassInk)
                        .padding(.horizontal, 16)
                        .frame(minHeight: 40)
                        .contentShape(.capsule)
                }
                .buttonStyle(.plain)
                .glassEffect(.regular.interactive(), in: .capsule)
                .padding(.trailing, 16)
                .padding(.top, 4)  // the paywall close button's position (top 58 on the 844 pt frame)
                .transition(.opacity)
            }
        }
        .sheet(isPresented: $showSignIn, onDismiss: {
            // Signed in from card 1: nothing left to explain, move on to the reminder.
            if session.isSignedIn { withAnimation { page = .reminder } }
        }) {
            AuthSheet(initial: .signIn)
        }
        .interactiveDismissDisabled()
    }

    @ViewBuilder private func content(for p: Page) -> some View {
        switch p {
        case .idea:
            WelcomeCard(painting: .vernet, paintingHeight: 340) {
                EmptyView()
            } text: {
                WelcomeText(title: "onboarding.idea.title", paragraph: "onboarding.idea.body")
            } controls: {
                dots(.idea)
                continueButton(from: .idea)
                InlineLinkButton(sentence: { Text("onboarding.haveAccount \($0)") }, link: "onboarding.signIn", size: 14) {
                    showSignIn = true
                }
                .padding(.vertical, -13)  // keep the 44 pt hit target out of the 16 pt rhythm
            }
        case .follow:
            WelcomeCard(painting: .levitan, paintingHeight: 220) {
                ListeningStopRow(stop: WelcomeSamples.stop(language: language.code), focus: .current, isLast: true)
                    .shadow(color: .black.opacity(0.1), radius: 12, y: 8)
            } text: {
                WelcomeText(title: "onboarding.follow.title", paragraph: "onboarding.follow.body")
            } controls: {
                dots(.follow)
                continueButton(from: .follow)
            }
        case .listeners:
            WelcomeCard(painting: .monk, paintingHeight: 220) {
                GlossaryFragment()
            } text: {
                WelcomeText(title: "onboarding.listeners.title", paragraph: "onboarding.listeners.body")
            } controls: {
                dots(.listeners)
                continueButton(from: .listeners)
            }
        case .trial:
            TrialCard(dots: dots(.trial)) { withAnimation { page = .reminder } }
        case .reminder:
            OnboardingReminderScreen(dots: dots(.reminder), onFinish: onFinish)
        }
    }

    private func continueButton(from p: Page) -> some View {
        Button {
            guard let i = pages.firstIndex(of: p), i + 1 < pages.count else { return }
            withAnimation { page = pages[i + 1] }
        } label: {
            Text("onboarding.continue")
        }
        .buttonStyle(.dcPrimary)
    }
}

// MARK: - Card layout

/// A painting (credited under it), an optional piece of the app overlapping its lower edge by
/// 56 pt, the title and paragraph, and the controls pinned to the bottom. At accessibility text
/// sizes the painting shrinks first and the text scrolls; nothing is clipped.
private struct WelcomeCard<Overlap: View, TextBlock: View, Controls: View>: View {
    let painting: WelcomePainting
    let paintingHeight: CGFloat
    @ViewBuilder let overlap: () -> Overlap
    @ViewBuilder let text: () -> TextBlock
    @ViewBuilder let controls: () -> Controls

    @Environment(\.dynamicTypeSize) private var typeSize

    private var height: CGFloat {
        typeSize.isAccessibilitySize ? min(paintingHeight, paintingHeight > 300 ? 240 : 160) : paintingHeight
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    PaintingImage(url: painting.url, focus: painting.focus)
                        .frame(height: height)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .accessibilityHidden(true)
                    if Overlap.self != EmptyView.self {
                        overlap()
                            .padding(.horizontal, 24)
                            .padding(.top, -56)
                    }
                    Text(painting.caption)
                        .font(Typography.caption)
                        .lineHeight(1.4)
                        .dynamicTypeSize(...DynamicTypeSize.accessibility1)  // a credit line; keep the title in view
                        .foregroundStyle(Palette.ink3)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 24)
                        .padding(.top, 10)
                    text()
                        .padding(.horizontal, 24)
                        .padding(.top, 28)
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .ignoresSafeArea(edges: .top)

            VStack(spacing: 16, content: controls)
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 8)
        }
        .background(Palette.background.ignoresSafeArea())
    }
}

private struct WelcomeText: View {
    let title: LocalizedStringKey
    let paragraph: LocalizedStringKey

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(Typography.titleXL)
                .tracking(-0.3)
                .lineHeight(1.15, literata: 30)
                .foregroundStyle(Palette.ink)
                .accessibilityAddTraits(.isHeader)
            Text(paragraph)
                .font(Typography.body15)
                .lineHeight(1.5)
                .foregroundStyle(Palette.ink2)
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/// The paintings of the welcome flow. Vernet and Levitan are the Mozart 40 and Tchaikovsky 6
/// paintings (bundled with the pieces); the Monk and the Wanderer are app images
/// (content/app-images.yaml). The URLs must match the yaml `image_url`s.
private enum WelcomePainting {
    case vernet, levitan, monk, wanderer

    var url: URL? {
        switch self {
        case .vernet: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Claude-Joseph_Vernet_-_A_Shipwreck_in_Stormy_Seas_(Temp%C3%AAte)_-_c_1773_-_National_Gallery_UK.jpg")
        case .levitan: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Isaac_Levitan_-_Au-dessus_du_repos_%C3%A9ternel.jpg")
        case .monk: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Caspar_David_Friedrich_-_Der_M%C3%B6nch_am_Meer_-_Google_Art_Project.jpg")
        case .wanderer: PaywallPainting.url
        }
    }

    var focus: UnitPoint {
        switch self {
        case .vernet: UnitPoint(x: 0.5, y: 0.4)
        case .levitan: UnitPoint(x: 0.5, y: 0.6)
        case .monk: UnitPoint(x: 0.5, y: 0.4)
        case .wanderer: UnitPoint(x: 0.5, y: 0.3)
        }
    }

    var caption: LocalizedStringKey {
        switch self {
        case .vernet: "onboarding.caption.vernet"
        case .levitan: "onboarding.caption.levitan"
        case .monk: "onboarding.caption.monk"
        case .wanderer: "paywall.painting.caption"
        }
    }
}

private enum WelcomeSamples {
    /// A real stop card's content, in the app's language (the card shows plain strings).
    static func stop(language: String) -> ListeningStop {
        ListeningStop(startSec: 270, endSec: nil, approximate: true, label: nil,
                      hear: L10n.string("onboarding.follow.stop.hear", code: language),
                      happening: L10n.string("onboarding.follow.stop.happening", code: language))
    }
}

/// A glossary sheet as it appears over a piece (grabber, term, definition), for card 3.
private struct GlossaryFragment: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Capsule().fill(Palette.ink3.opacity(0.5)).frame(width: 36, height: 5)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 4)
            Text("onboarding.listeners.term")
                .font(Typography.literata(22, .medium, relativeTo: .title2))
                .foregroundStyle(Palette.ink)
            Text("onboarding.listeners.definition")
                .font(Typography.reading)
                .lineHeight(1.5, literata: 17)
                .foregroundStyle(Palette.ink)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 18, trailing: 20))
        .background(Palette.surface.opacity(0.88), in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.12), radius: 12, y: 8)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Card 4: the free trial

/// "The whole library, free for 3 days." An offer, not a wall: "Continue with today's piece"
/// is as easy to reach as the trial.
private struct TrialCard: View {
    let dots: PageDots
    let onContinue: () -> Void

    @Environment(EntitlementStore.self) private var entitlements
    @Environment(\.dynamicTypeSize) private var typeSize
    @State private var purchasing = false
    @State private var failed = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    PaywallPainting()
                        .frame(height: typeSize.isAccessibilitySize ? 160 : 220)
                        .frame(maxWidth: .infinity)
                        .clipped()
                    Text("paywall.painting.caption")
                        .font(Typography.caption)
                        .lineHeight(1.4)
                        .dynamicTypeSize(...DynamicTypeSize.accessibility1)  // a credit line; keep the title in view
                        .foregroundStyle(Palette.ink3)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 24)
                        .padding(.top, 10)
                    Text("onboarding.trial.title \(entitlements.trialDays ?? 3)")
                        .font(Typography.titleXL)
                        .tracking(-0.3)
                        .lineHeight(1.15, literata: 30)
                        .foregroundStyle(Palette.ink)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityAddTraits(.isHeader)
                        .padding(.horizontal, 24)
                        .padding(.top, 22)
                    VStack(alignment: .leading, spacing: 10) {
                        BenefitLine("onboarding.trial.benefit.library")
                        BenefitLine("onboarding.trial.benefit.search")
                        BenefitLine("paywall.benefit.catchUp")
                        BenefitLine("paywall.benefit.wallpaper")
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 18)
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .ignoresSafeArea(edges: .top)

            VStack(spacing: 12) {
                dots
                if failed {
                    FormMessage(text: Text("paywall.error.purchase"), isError: true)
                        .multilineTextAlignment(.center)
                }
                Button { Task { await startTrial() } } label: {
                    ZStack {
                        Text("paywall.cta.trial \(entitlements.trialDays ?? 3)").opacity(purchasing ? 0 : 1)
                        if purchasing { ProgressView().tint(Palette.onTint) }
                    }
                }
                .buttonStyle(.dcPrimary)
                .disabled(purchasing || !entitlements.isAvailable(.monthly))
                Text("paywall.trial.terms \(entitlements.trialDays ?? 3) \(entitlements.prices[.monthly] ?? "—")")
                    .font(Typography.caption)
                    .lineHeight(1.5)
                    .foregroundStyle(Palette.ink3)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Button("onboarding.trial.continueToday", action: onContinue)
                    .buttonStyle(.dcTextLink)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 8)
        }
        .background(Palette.background.ignoresSafeArea())
    }

    private func startTrial() async {
        failed = false
        purchasing = true
        defer { purchasing = false }
        do {
            if try await entitlements.purchase(.monthly) { onContinue() }
        } catch {
            failed = true
        }
    }
}

// MARK: - Last page: the reminder

/// "When should today's piece arrive?" Full screen on paper with the 5-minute wheel.
struct OnboardingReminderScreen: View {
    let dots: PageDots
    let onFinish: () -> Void

    @Environment(LanguageSettings.self) private var language
    @State private var hour = DailyReminder.defaultHour
    @State private var minute = 0
    @State private var scheduling = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
              VStack(spacing: 0) {  // explicit: the implicit stack added ~12 pt above the card
                VStack(alignment: .leading, spacing: 12) {
                    Text("onboarding.2.title")
                        .font(Typography.titleXL)
                        .tracking(-0.3)
                        .lineHeight(1.15, literata: 30)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Text("onboarding.2.body")
                        .font(Typography.body15)
                        .lineHeight(1.5)
                        .foregroundStyle(Palette.ink2)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.top, 140)  // from the top of the screen, whatever the status bar height

                TimeWheel(hour: $hour, minute: $minute)
                    .card(radius: Radius.groupedList)
                    .padding(.horizontal, 24)
                    .padding(.top, 40)
              }
            }
            .scrollBounceBehavior(.basedOnSize)
            .ignoresSafeArea(edges: .top)

            VStack(spacing: 16) {
                dots
                Button {
                    Task {
                        scheduling = true
                        // Declining the system prompt still finishes onboarding.
                        await DailyReminder.schedule(hour: hour, minute: minute, languageCode: language.code)
                        onFinish()
                    }
                } label: {
                    Text("onboarding.2.cta \(DailyReminder.label(hour: hour, minute: minute))")
                }
                .buttonStyle(.dcPrimary)
                .disabled(scheduling)

                Button(action: onFinish) {
                    Text("onboarding.2.notNow")
                        .font(Typography.body15)
                        .foregroundStyle(Palette.ink2)
                        .frame(minHeight: 44)
                        .contentShape(.rect)
                }
                .buttonStyle(.plain)
                .padding(.vertical, -13)  // keep the 44 pt hit target out of the 16 pt rhythm
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 8)
        }
        .background(Palette.background.ignoresSafeArea())
    }
}

#Preview("Welcome") {
    WelcomeFlow {}
        .environment(SessionStore())
        .environment(EntitlementStore())
        .environment(AppRouter())
        .environment(LanguageSettings())
}
