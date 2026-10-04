import SwiftUI

// MARK: - Form card (SPEC §3.12 Form row)

/// Solid surface card (radius 16) holding form rows separated by 0.5 pt rules.
struct FormCard<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 0) {
            Group(subviews: content) { rows in
                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                    if index > 0 { Rectangle().fill(Palette.rule).frame(height: 0.5) }
                    row
                }
            }
        }
        .card()
    }
}

/// Fixed 84 pt label (SF 15 ink2) and an SF 17 field.
struct FormRow<Field: View>: View {
    let label: LocalizedStringKey
    @ViewBuilder var field: Field
    @ScaledMetric(relativeTo: .subheadline) private var labelWidth: CGFloat = 84

    init(_ label: LocalizedStringKey, @ViewBuilder field: () -> Field) {
        self.label = label
        self.field = field()
    }

    var body: some View {
        HStack(spacing: 12) {
            Text(label)
                .font(Typography.body15)
                .foregroundStyle(Palette.ink2)
                .frame(width: labelWidth, alignment: .leading)
                .accessibilityHidden(true)
            field
                .font(Typography.body17)
                .foregroundStyle(Palette.ink)
                .tint(Palette.accent)
                .accessibilityLabel(Text(label))
        }
        .padding(.horizontal, 16)
        .frame(minHeight: 52)
    }
}

struct EmailField: View {
    @Binding var text: String
    /// `.username` on Sign in so AutoFill pairs it with the saved password.
    var contentType: UITextContentType = .emailAddress

    var body: some View {
        TextField(text: $text) { EmptyView() }
            .textContentType(contentType)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }
}

/// Secure field with the eye toggle; +0.12em tracking for the bullets.
struct PasswordField: View {
    @Binding var text: String
    var contentType: UITextContentType = .password
    @State private var revealed = false

    var body: some View {
        HStack(spacing: 8) {
            Group {
                if revealed {
                    TextField(text: $text) { EmptyView() }
                } else {
                    SecureField(text: $text) { EmptyView() }.tracking(2)
                }
            }
            .textContentType(contentType)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()

            Button { revealed.toggle() } label: {
                Icon("eye", size: 20)
                    .foregroundStyle(revealed ? Palette.accent : Palette.ink3)
                    .frame(width: 44, height: 44)
                    .contentShape(.rect)
            }
            .buttonStyle(.plain)
            .padding(.trailing, -12)
            .accessibilityLabel(Text(revealed ? "auth.password.hide.accessibilityLabel" : "auth.password.show.accessibilityLabel"))
        }
    }
}

// MARK: - Messages

/// Inline form message: the hint in ink3, or an error in danger.
struct FormMessage: View {
    let text: Text
    var isError = false

    var body: some View {
        text
            .font(Typography.meta13)
            .lineHeight(1.5)
            .foregroundStyle(isError ? Palette.danger : Palette.ink3)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityAddTraits(isError ? .isStaticText : [])
    }
}

enum AuthValidation {
    static let minimumPasswordLength = 8

    static func isPlausibleEmail(_ s: String) -> Bool {
        let parts = s.trimmingCharacters(in: .whitespaces).split(separator: "@", omittingEmptySubsequences: false)
        guard parts.count == 2, !parts[0].isEmpty, parts[1].contains("."), !parts[1].hasPrefix("."), !parts[1].hasSuffix(".") else { return false }
        return !s.contains(" ")
    }

    /// Maps API failures to the copy in strings (design/strings-en.md "Proposed").
    static func message(for error: Error) -> LocalizedStringKey {
        switch error as? APIError {
        case .server(409, "email_taken"): "auth.error.emailInUse"
        case .server(400, "invalid_code"): "auth.error.invalidCode"
        case .server(400, "expired"): "auth.error.codeExpired"
        case .server(400, "too_many_attempts"): "auth.error.codeTooManyAttempts"
        case .unauthorized: "auth.error.wrongCredentials"
        case .offline: "auth.error.offline"
        case .server(400, _): "auth.error.invalidEmail"
        case .server(429, _): "auth.error.tooManyAttempts"
        default: "state.error.generic"
        }
    }
}

/// "Already have an account? **Sign in**": ink2 sentence, accent link, one Text so it wraps.
struct InlineLinkButton: View {
    let sentence: (Text) -> Text
    let link: LocalizedStringKey
    let action: () -> Void
    @ScaledMetric private var size: CGFloat

    init(sentence: @escaping (Text) -> Text, link: LocalizedStringKey, size: CGFloat = 15, action: @escaping () -> Void) {
        self.sentence = sentence
        self.link = link
        self.action = action
        _size = ScaledMetric(wrappedValue: size, relativeTo: .subheadline)
    }

    var body: some View {
        Button(action: action) {
            sentence(Text(link).foregroundStyle(Palette.accent))
                .font(.system(size: size))
                .foregroundStyle(Palette.ink2)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, minHeight: 44)
                .contentShape(.rect)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Check your email (SPEC §4.20)

/// Mail icon, "A reset link is on its way to **{email}**…", Open Mail and Send again
/// (30 s cooldown, starting now because a link was just sent).
struct CheckEmailContent: View {
    let email: String
    let resend: () async -> Bool

    @Environment(\.openURL) private var openURL
    @State private var cooldownEnd = Date.now.addingTimeInterval(CheckEmailContent.cooldown)
    @State private var sending = false

    static let cooldown: TimeInterval = 30

    var body: some View {
        VStack(spacing: 6) {
            VStack(spacing: 16) {
                Icon("mail", size: 32).foregroundStyle(Palette.accent)
                Text("auth.checkEmail.body \(Text(verbatim: email).fontWeight(.medium))")
                    .readingStyle()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Text("auth.checkEmail.hint")
                    .font(Typography.meta13)
                    .lineHeight(1.5)
                    .foregroundStyle(Palette.ink3)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 30)
            .padding(.bottom, 10)

            VStack(spacing: 14) {
                Button {
                    if let url = URL(string: "message://") { openURL(url) }
                } label: {
                    Text("auth.checkEmail.openMail")
                }
                .buttonStyle(.dcPrimary)

                TimelineView(.periodic(from: .now, by: 1)) { context in
                    let remaining = max(0, Int(cooldownEnd.timeIntervalSince(context.date).rounded(.up)))
                    Button {
                        Task {
                            sending = true
                            if await resend() { cooldownEnd = .now.addingTimeInterval(Self.cooldown) }
                            sending = false
                        }
                    } label: {
                        if remaining > 0 {
                            Text("auth.checkEmail.sendAgainIn \(remaining)").monospacedDigit()
                        } else {
                            Text("auth.checkEmail.sendAgain")
                        }
                    }
                    .buttonStyle(.dcTextLink)
                    .disabled(remaining > 0 || sending)
                    .opacity(remaining > 0 ? 0.6 : 1)
                }
            }
        }
    }
}
