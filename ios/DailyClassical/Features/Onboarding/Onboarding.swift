import SwiftUI

extension View {
    /// Two-step onboarding (SPEC §4.15–4.16, flow 07): a non-dismissable card over the live
    /// Today screen, then a full-screen reminder picker. Sets `isComplete` when done.
    func onboarding(isComplete: Binding<Bool>) -> some View {
        modifier(OnboardingModifier(isComplete: isComplete))
    }
}

private struct OnboardingModifier: ViewModifier {
    @Binding var isComplete: Bool
    @State private var showIntro = false
    @State private var showReminder = false
    @State private var advance = false

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showIntro, onDismiss: {
                // Present step 2 only once the card has fully gone.
                if advance { showReminder = true }
            }) {
                OnboardingIntroSheet {
                    advance = true
                    showIntro = false
                }
            }
            .fullScreenCover(isPresented: $showReminder) {
                OnboardingReminderScreen {
                    isComplete = true
                    showReminder = false
                }
            }
            .onAppear {
                if !isComplete { showIntro = true }
            }
    }
}

// MARK: - Step 1 of 2

/// "One symphony a day…" card over today's piece. Content-sized, cannot be swiped away.
struct OnboardingIntroSheet: View {
    let onContinue: () -> Void

    @Environment(SessionStore.self) private var session
    @State private var showSignIn = false
    @State private var height: CGFloat = 420

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("onboarding.1.title")
                        .font(Typography.titleXL)
                        .tracking(-0.3)
                        .lineHeight(1.15, size: 30)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Text("onboarding.1.body")
                        .font(Typography.body15)
                        .lineHeight(1.5, size: 15)
                        .foregroundStyle(Palette.ink2)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 34)

                VStack(spacing: 16) {
                    PageDots(count: 2, current: 0)
                    Button(action: onContinue) { Text("onboarding.continue") }
                        .buttonStyle(.dcPrimary)
                    InlineLinkButton(sentence: { Text("auth.haveAccount \($0)") }, link: "onboarding.signIn", size: 14) {
                        showSignIn = true
                    }
                }
                .padding(.top, 8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 12)
            .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { height = $0 }
        }
        .scrollBounceBehavior(.basedOnSize)
        .presentationDetents([.height(height)])
        .presentationDragIndicator(.visible)
        .interactiveDismissDisabled()
        .sheet(isPresented: $showSignIn, onDismiss: {
            // Signed in from the card: nothing left to explain, move on to the reminder.
            if session.isSignedIn { onContinue() }
        }) {
            AuthSheet(initial: .signIn)
        }
    }
}

// MARK: - Step 2 of 2

/// "When should today's piece arrive?" Full screen on paper with the 5-minute wheel.
struct OnboardingReminderScreen: View {
    let onFinish: () -> Void

    @Environment(LanguageSettings.self) private var language
    @State private var hour = DailyReminder.defaultHour
    @State private var minute = 0
    @State private var scheduling = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    Text("onboarding.2.eyebrow")
                        .font(Typography.micro)
                        .tracking(1.54)
                        .textCase(.uppercase)
                        .foregroundStyle(Palette.accent)
                    Text("onboarding.2.title")
                        .font(Typography.titleXL)
                        .tracking(-0.3)
                        .lineHeight(1.15, size: 30)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Text("onboarding.2.body")
                        .font(Typography.body15)
                        .lineHeight(1.5, size: 15)
                        .foregroundStyle(Palette.ink2)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 32)
                .padding(.top, 92)   // 140 pt from the top of an 844 pt frame, minus the status bar

                TimeWheel(hour: $hour, minute: $minute)
                    .card(radius: Radius.groupedList)
                    .padding(.horizontal, 24)
                    .padding(.top, 40)
            }
            .scrollBounceBehavior(.basedOnSize)

            VStack(spacing: 16) {
                PageDots(count: 2, current: 1)
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

                Button("onboarding.2.notNow", action: onFinish)
                    .buttonStyle(.dcTextLink)
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 12)
        }
        .background(Palette.background.ignoresSafeArea())
    }
}

#Preview("Step 1 over Today") {
    @Previewable @State var done = false
    Color.gray.ignoresSafeArea()
        .onboarding(isComplete: $done)
        .environment(SessionStore())
        .environment(AppRouter())
        .environment(LanguageSettings())
}

#Preview("Step 2") {
    OnboardingReminderScreen {}
        .environment(LanguageSettings())
}
