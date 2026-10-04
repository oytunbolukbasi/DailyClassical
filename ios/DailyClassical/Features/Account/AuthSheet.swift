import SwiftUI

/// Large solid sheet for email accounts (SPEC §4.17, §4.19, §4.20): Create account, Sign in,
/// Reset password and Check your email swap inside the same sheet. The email carries over.
struct AuthSheet: View {
    enum Step: Equatable {
        case createAccount, signIn, reset
        case checkEmail(String)
        /// 6-digit code sent to this address (after sign-up, or signing in unverified).
        case verify(String)
    }

    private enum Field: Hashable { case email, password }

    @Environment(SessionStore.self) private var session
    @Environment(AppRouter.self) private var router
    @Environment(LanguageSettings.self) private var language
    @Environment(\.dismiss) private var dismiss

    @State private var step: Step
    @State private var email = ""
    @State private var password = ""
    @State private var error: LocalizedStringKey?
    @State private var busy = false
    @FocusState private var focus: Field?

    init(initial: AppRouter.AuthFlow) {
        _step = State(initialValue: initial == .signIn ? .signIn : .createAccount)
    }

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    content
                }
                .padding(.horizontal, 24)
                .padding(.top, 32)
                .padding(.bottom, 12)
                .frame(minHeight: geo.size.height, alignment: .top)
            }
            .scrollBounceBehavior(.basedOnSize)
            .scrollDismissesKeyboard(.interactively)
        }
        .background(Palette.background)
        .presentationDetents([.large])
        .presentationBackground(Palette.background)
        .presentationDragIndicator(.visible)
        .animation(.easeOut(duration: 0.2), value: step)
        .onChange(of: step) { error = nil }
    }

    @ViewBuilder private var content: some View {
        switch step {
        case .createAccount: createAccount
        case .signIn: signIn
        case .reset: reset
        case .checkEmail(let address): checkEmail(address)
        case .verify(let address): verifyEmail(address)
        }
    }

    // MARK: Create an account

    @ViewBuilder private var createAccount: some View {
        header("auth.create.title", subtitle: "auth.create.subtitle")

        VStack(alignment: .leading, spacing: 14) {
            FormCard {
                FormRow("auth.field.email") {
                    EmailField(text: $email)
                        .focused($focus, equals: .email)
                        .submitLabel(.next)
                        .onSubmit { focus = .password }
                }
                FormRow("auth.field.password") {
                    PasswordField(text: $password, contentType: .newPassword)
                        .focused($focus, equals: .password)
                        .submitLabel(.go)
                        .onSubmit { Task { await submitCreate() } }
                }
            }
            if let error {
                FormMessage(text: Text(error), isError: true)
            } else {
                FormMessage(text: Text("auth.password.hint"))
            }
        }

        VStack(spacing: 14) {
            primaryButton("auth.create.cta") { await submitCreate() }
            Text("auth.legal")
                .font(Typography.caption)
                .lineHeight(1.5, size: 12)
                .foregroundStyle(Palette.ink3)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }

        Spacer(minLength: 0)
        InlineLinkButton(sentence: { Text("auth.haveAccount \($0)") }, link: "auth.signInLink") { step = .signIn }
    }

    // MARK: Sign in

    @ViewBuilder private var signIn: some View {
        header("auth.signIn.title", subtitle: "auth.signIn.subtitle")

        VStack(alignment: .leading, spacing: 14) {
            FormCard {
                FormRow("auth.field.email") {
                    EmailField(text: $email, contentType: .username)
                        .focused($focus, equals: .email)
                        .submitLabel(.next)
                        .onSubmit { focus = .password }
                }
                FormRow("auth.field.password") {
                    PasswordField(text: $password, contentType: .password)
                        .focused($focus, equals: .password)
                        .submitLabel(.go)
                        .onSubmit { Task { await submitSignIn() } }
                }
            }
            if let error { FormMessage(text: Text(error), isError: true) }
        }

        VStack(spacing: 14) {
            primaryButton("auth.signIn.cta") { await submitSignIn() }
            Button("auth.forgotPassword") { step = .reset }
                .buttonStyle(.dcTextLink)
        }
        .padding(.top, 2)

        Spacer(minLength: 0)
        InlineLinkButton(sentence: { Text("auth.newHere \($0)") }, link: "auth.createAccountLink") { step = .createAccount }
    }

    // MARK: Reset password

    @ViewBuilder private var reset: some View {
        header("auth.reset.title", subtitle: "auth.reset.subtitle")

        VStack(alignment: .leading, spacing: 14) {
            FormCard {
                FormRow("auth.field.email") {
                    EmailField(text: $email, contentType: .username)
                        .focused($focus, equals: .email)
                        .submitLabel(.send)
                        .onSubmit { Task { await submitReset() } }
                }
            }
            if let error { FormMessage(text: Text(error), isError: true) }
        }

        VStack(spacing: 14) {
            primaryButton("auth.reset.cta") { await submitReset() }
            Button("auth.reset.backToSignIn") { step = .signIn }
                .buttonStyle(.dcTextLink)
        }
        .padding(.top, 2)
        .onAppear { if email.isEmpty { focus = .email } }
    }

    // MARK: Check your email

    @ViewBuilder private func checkEmail(_ address: String) -> some View {
        header("auth.checkEmail.title", subtitle: nil)
        CheckEmailContent(email: address) {
            (try? await session.requestPasswordReset(email: address, language: language.code)) != nil
        }
    }

    // MARK: Confirm your email

    @ViewBuilder private func verifyEmail(_ address: String) -> some View {
        header("auth.verify.title", subtitle: nil)
        Text("auth.verify.subtitle \(address)")
            .font(Typography.body15).lineHeight(1.5, size: 15)
            .foregroundStyle(Palette.ink2)
            .padding(.top, -14)
        VerifyCodeView(
            email: address,
            verify: { code in
                do {
                    try await session.verifyEmail(email: address, code: code, language: language.code)
                    await finishSignedIn()
                    return nil
                } catch {
                    return AuthValidation.message(for: error)
                }
            },
            resend: { try? await session.resendVerificationCode(email: address, language: language.code) },
            changeEmail: { step = .createAccount }
        )
    }

    // MARK: Pieces

    private func header(_ title: LocalizedStringKey, subtitle: LocalizedStringKey?) -> some View {
        SheetHeader(
            title: Text(title),
            subtitle: subtitle.map { Text($0) },
            titleFont: Typography.titleXL,
            close: { dismiss() }
        )
    }

    private func primaryButton(_ title: LocalizedStringKey, action: @escaping () async -> Void) -> some View {
        Button {
            Task { await action() }
        } label: {
            ZStack {
                Text(title).opacity(busy ? 0 : 1)
                if busy { ProgressView().tint(Palette.onTint) }
            }
        }
        .buttonStyle(.dcPrimary)
        .disabled(busy)
    }

    // MARK: Actions

    private var trimmedEmail: String { email.trimmingCharacters(in: .whitespacesAndNewlines) }

    private func submitCreate() async {
        guard AuthValidation.isPlausibleEmail(trimmedEmail) else { return fail("auth.error.invalidEmail", focus: .email) }
        guard password.count >= AuthValidation.minimumPasswordLength else { return fail("auth.error.passwordTooShort", focus: .password) }
        error = nil
        busy = true
        defer { busy = false }
        do {
            try await session.register(email: trimmedEmail, password: password, language: language.code)
            focus = nil
            step = .verify(trimmedEmail)
        } catch {
            self.error = AuthValidation.message(for: error)
        }
    }

    private func submitSignIn() async {
        guard AuthValidation.isPlausibleEmail(trimmedEmail) else { return fail("auth.error.invalidEmail", focus: .email) }
        // The server refuses passwords under 8 characters, so this can only be wrong.
        guard password.count >= AuthValidation.minimumPasswordLength else { return fail("auth.error.wrongCredentials", focus: .password) }
        await run { try await session.signIn(email: trimmedEmail, password: password, language: language.code) }
    }

    private func submitReset() async {
        guard AuthValidation.isPlausibleEmail(trimmedEmail) else { return fail("auth.error.invalidEmail", focus: .email) }
        busy = true
        defer { busy = false }
        do {
            try await session.requestPasswordReset(email: trimmedEmail, language: language.code)
            focus = nil
            step = .checkEmail(trimmedEmail)
        } catch {
            self.error = AuthValidation.message(for: error)
        }
    }

    private func fail(_ message: LocalizedStringKey, focus field: Field) {
        error = message
        focus = field
    }

    /// Runs register/sign-in, then finishes the favourite that sent the guest here.
    private func run(_ operation: () async throws -> Void) async {
        error = nil
        busy = true
        defer { busy = false }
        do {
            try await operation()
            focus = nil
            await finishSignedIn()
        } catch APIError.server(403, "email_not_verified") {
            // Right password, never confirmed: the server just sent a fresh code.
            focus = nil
            step = .verify(trimmedEmail)
        } catch {
            self.error = AuthValidation.message(for: error)
        }
    }

    /// Saves the favourite that sent the guest here, then closes the sheet.
    private func finishSignedIn() async {
        if let pending = router.pendingFavourite {
            router.pendingFavourite = nil
            await session.setFavourite(pending, true)
            router.toast = "favourites.toast.saved"
        }
        dismiss()
    }
}

#Preview("Create account") {
    Color.gray.sheet(isPresented: .constant(true)) { AuthSheet(initial: .createAccount) }
        .environment(SessionStore())
        .environment(AppRouter())
        .environment(LanguageSettings())
}

#Preview("Sign in") {
    Color.gray.sheet(isPresented: .constant(true)) { AuthSheet(initial: .signIn) }
        .environment(SessionStore())
        .environment(AppRouter())
        .environment(LanguageSettings())
}
