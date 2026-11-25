import SwiftUI

/// In-app messages from /admin/messages (backend routes/push.ts › GET /v1/messages): a card over
/// the app with an optional image, a title, a text and an optional button that opens a link.
/// Each message is shown once on this device. Checked when the app comes forward (at most every
/// minute), shown on Today when nothing else is on screen.
struct InAppMessage: Decodable, Identifiable, Equatable {
    let id: String
    let title: String
    let body: String
    let button: String?
    let link: String?
    let imageUrl: String?
}

enum InAppMessages {
    private static let seenKey = "inApp.seen"
    private static let checkedKey = "inApp.checkedAt"

    static func next(language: String, premium: Bool) async -> InAppMessage? {
        let defaults = UserDefaults.standard
        if let last = defaults.object(forKey: checkedKey) as? Date, Date.now.timeIntervalSince(last) < 60 { return nil }
        defaults.set(Date.now, forKey: checkedKey)
        var url = APIClient.shared.baseURL.appending(path: "v1/messages")
        url.append(queryItems: [
            URLQueryItem(name: "locale", value: language),
            URLQueryItem(name: "premium", value: premium ? "1" : "0"),
            URLQueryItem(name: "appVersion", value: AppVersion.current),
            URLQueryItem(name: "installId", value: Analytics.shared.installId),
        ])
        struct R: Decodable { let messages: [InAppMessage] }
        // Never from the URL cache: a message switched off on the admin page must disappear.
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 15)
        guard let (data, response) = try? await URLSession.shared.data(for: request),
              (response as? HTTPURLResponse)?.statusCode == 200,
              let r = try? JSONDecoder().decode(R.self, from: data) else { return nil }
        let seen = Set(defaults.stringArray(forKey: seenKey) ?? [])
        return r.messages.first { !seen.contains($0.id) }
    }

    static func markShown(_ m: InAppMessage) {
        let defaults = UserDefaults.standard
        defaults.set(Array((defaults.stringArray(forKey: seenKey) ?? []).suffix(200)) + [m.id], forKey: seenKey)
        Task { _ = await PushNotifications.post("v1/messages/\(m.id)/event", ["action": "shown"]) }
    }

    static func tapped(_ m: InAppMessage) {
        Task { _ = await PushNotifications.post("v1/messages/\(m.id)/event", ["action": "tapped"]) }
    }
}

extension View {
    /// Shows a waiting in-app message over the app (see InAppMessages).
    func inAppMessages() -> some View { modifier(InAppMessageHost()) }
}

private struct InAppMessageHost: ViewModifier {
    @Environment(AppRouter.self) private var router
    @Environment(LanguageSettings.self) private var language
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    func body(content: Content) -> some View {
        content
            .overlay {
                if let message = router.inAppMessage {
                    InAppMessageCard(message: message,
                                     onAction: { act(message) },
                                     onClose: { router.inAppMessage = nil })
                        .transition(.opacity)
                }
            }
            .animation(.easeOut(duration: 0.25), value: router.inAppMessage)
            .task(id: scenePhase) {
                guard scenePhase == .active else { return }
                try? await Task.sleep(for: .seconds(2))
                guard canShow, let message = await InAppMessages.next(language: language.code, premium: entitlements.isPremium),
                      canShow else { return }
                InAppMessages.markShown(message)
                router.inAppMessage = message
            }
    }

    /// Nothing else on screen: no welcome flow, sheet, rating card or widget tip.
    private var canShow: Bool {
        scenePhase == .active && hasCompletedOnboarding && router.sheet == nil
            && !router.showRatePrompt && router.widgetTip == nil && router.inAppMessage == nil
    }

    private func act(_ message: InAppMessage) {
        InAppMessages.tapped(message)
        router.inAppMessage = nil
        if let link = message.link, let url = URL(string: link) { DeepLinks.shared.open(url) }
    }
}

/// The card, in the widget tip's frame: dimmed app behind, the message on the background colour.
struct InAppMessageCard: View {
    let message: InAppMessage
    let onAction: () -> Void
    let onClose: () -> Void

    @State private var appeared = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.48)
                .ignoresSafeArea()
                .onTapGesture(perform: onClose)
                .accessibilityHidden(true)

            FoldAware {
                ViewThatFits(in: .vertical) {
                    card
                    ScrollView { card }.scrollBounceBehavior(.basedOnSize)
                }
                .background(Palette.background)
                .clipShape(.rect(cornerRadius: 28, style: .continuous))
                .shadow(color: .black.opacity(0.3), radius: 30, y: 12)
                .padding(24)
                .frame(maxWidth: 440)
                .scaleEffect(appeared ? 1 : 0.94)
                .accessibilityElement(children: .contain)
                .accessibilityAddTraits(.isModal)
            }
        }
        .onAppear { withAnimation(.spring(duration: 0.4, bounce: 0.15)) { appeared = true } }
    }

    private var card: some View {
        VStack(spacing: 0) {
            if let s = message.imageUrl, let url = URL(string: s) {
                // A 4:3 frame the image fills; the image's own size never widens the card.
                Color.clear
                    .aspectRatio(4 / 3, contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        AsyncImage(url: url, transaction: Transaction(animation: .easeOut(duration: 0.2))) { phase in
                            if let image = phase.image {
                                image.resizable().scaledToFill()
                            } else {
                                Palette.ink.opacity(0.06)
                            }
                        }
                    }
                    .clipped()
                    .accessibilityHidden(true)
            }

            VStack(spacing: 0) {
                Text(verbatim: message.title)
                    .font(Typography.titleM)
                    .lineHeight(1.25, literata: 24)
                    .foregroundStyle(Palette.ink)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)

                Text(verbatim: message.body)
                    .font(Typography.body15)
                    .lineHeight(1.5)
                    .foregroundStyle(Palette.ink2)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 8)

                VStack(spacing: 4) {
                    if let button = message.button {
                        Button(action: onAction) { Text(verbatim: button) }
                            .buttonStyle(.dcPrimary)
                    }
                    Button(action: onClose) { Text("inApp.close").frame(maxWidth: .infinity, minHeight: 44) }
                        .buttonStyle(.dcTextLink)
                        .foregroundStyle(Palette.ink2)
                }
                .padding(.top, 22)
            }
            .padding(.horizontal, 24)
            .padding(.top, 22)
            .padding(.bottom, 16)
        }
    }
}
