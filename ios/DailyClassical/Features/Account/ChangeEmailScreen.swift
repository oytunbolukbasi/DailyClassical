import SwiftUI

/// Account › Email. Step 1: the new address and the current password; the server emails a code to
/// the new address. Step 2: the code (same boxes as sign-up). Nothing changes until the code is
/// confirmed; the session stays, and the old address gets a notice. Sign in with Apple accounts
/// without a password don't get here (their email comes from Apple; AccountScreen).
struct ChangeEmailScreen: View {
    @Environment(SessionStore.self) private var session
    @Environment(LanguageSettings.self) private var language
    @Environment(\.dismiss) private var dismiss

    private enum Field: Hashable { case email, password, passwordShown }

    @State private var newEmail = ""
    @State private var password = ""
    @State private var sentTo: String?
    @State private var busy = false
    @State private var error: LocalizedStringKey?
    @FocusState private var focus: Field?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(sentTo == nil ? "account.changeEmail.title" : "account.changeEmail.verify.title")
                        .font(Typography.titleXL)
                        .tracking(-0.3)
                        .lineHeight(1.15, literata: 30)
                        .foregroundStyle(Palette.ink)
                        .accessibilityAddTraits(.isHeader)
                    Group {
                        if let sentTo {
                            Text("auth.verify.subtitle \(sentTo)")
                        } else if let email = session.email {
                            Text("account.changeEmail.body \(Text(verbatim: email).fontWeight(.medium))")
                        }
                    }
                    .font(Typography.body15)
                    .lineHeight(1.5)
                    .foregroundStyle(Palette.ink2)
                    .fixedSize(horizontal: false, vertical: true)
                }

                if let sentTo {
                    VerifyCodeView(
                        email: sentTo,
                        verify: { code in
                            do {
                                try await session.confirmEmailChange(code: code, language: language.code)
                                dismiss()
                                return nil
                            } catch {
                                return AuthValidation.message(for: error)
                            }
                        },
                        resend: { try? await session.resendEmailChangeCode(language: language.code) },
                        changeEmail: { self.sentTo = nil; focus = .email }
                    )
                } else {
                    form
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 16)
            .padding(.bottom, 44)
            .animation(.easeOut(duration: 0.2), value: sentTo)
        }
        .scrollDismissesKeyboard(.interactively)
        .background(Palette.background)
        .navigationTitle(Text("account.changeEmail.title"))
        // Inline + no title: the Literata title is drawn in the page (as on Change password).
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(removing: .title)
        .toolbarVisibility(.hidden, for: .tabBar)
        .onAppear { if sentTo == nil { focus = .email } }
    }

    @ViewBuilder private var form: some View {
        VStack(alignment: .leading, spacing: 14) {
            FormCard {
                FormRow("account.changeEmail.newEmail", focus: { focus = .email }) {
                    EmailField(text: $newEmail)
                        .focused($focus, equals: .email)
                        .submitLabel(.next)
                        .onSubmit { focus = .password }
                }
                FormRow("auth.field.password", focus: { focus = .password }) {
                    PasswordField(text: $password, contentType: .password, focus: $focus, secure: .password, plain: .passwordShown)
                        .submitLabel(.send)
                        .onSubmit { Task { await submit() } }
                }
            }
            if let error { FormMessage(text: Text(error), isError: true) }
        }

        Button { Task { await submit() } } label: {
            ZStack {
                Text("account.changeEmail.cta").opacity(busy ? 0 : 1)
                if busy { ProgressView().tint(Palette.onTint) }
            }
        }
        .buttonStyle(.dcPrimary)
        .disabled(busy)
    }

    private var trimmed: String { newEmail.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() }

    private func submit() async {
        guard !busy else { return }
        guard AuthValidation.isPlausibleEmail(trimmed) else { error = "auth.error.invalidEmail"; focus = .email; return }
        guard trimmed != session.email?.lowercased() else { error = "auth.error.sameEmail"; focus = .email; return }
        guard !password.isEmpty else { error = "auth.error.wrongPassword"; focus = .password; return }
        error = nil
        busy = true
        defer { busy = false }
        do {
            try await session.requestEmailChange(to: trimmed, password: password, language: language.code)
            focus = nil
            password = ""
            sentTo = trimmed
        } catch {
            self.error = AuthValidation.message(for: error)
            if case .server(400, "wrong_password") = error as? APIError { focus = .password }
        }
    }
}

#Preview("Change email") {
    NavigationStack { ChangeEmailScreen() }
        .environment(SessionStore())
        .environment(LanguageSettings())
}
