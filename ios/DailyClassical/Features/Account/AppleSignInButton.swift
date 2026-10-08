import AuthenticationServices
import SwiftUI

/// "Continue with Apple" (Apple's own button, black on paper, white in dark mode), at the size of
/// our solid buttons. One button for both sign-up and sign-in: the server creates the account the
/// first time and links an existing one with the same verified email.
struct AppleSignInButton: View {
    /// Called once the session exists (save the pending favourite, close the sheet).
    let onSignedIn: () async -> Void
    let onError: (LocalizedStringKey) -> Void

    @Environment(SessionStore.self) private var session
    @Environment(LanguageSettings.self) private var language
    @Environment(\.colorScheme) private var colorScheme
    @State private var busy = false

    var body: some View {
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.email]
        } onCompletion: { result in
            Task { await handle(result) }
        }
        .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
        .frame(height: 52)
        .clipShape(.capsule)
        .disabled(busy)
        .opacity(busy ? 0.5 : 1)
        .overlay { if busy { ProgressView().tint(colorScheme == .dark ? .black : .white) } }
    }

    private func handle(_ result: Result<ASAuthorization, Error>) async {
        switch result {
        case .failure(let error):
            if (error as? ASAuthorizationError)?.code == .canceled { return }
            onError("auth.apple.error.failed")
        case .success(let authorization):
            guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
                  let token = credential.identityToken.flatMap({ String(data: $0, encoding: .utf8) })
            else { return onError("auth.apple.error.failed") }
            let code = credential.authorizationCode.flatMap { String(data: $0, encoding: .utf8) }
            busy = true
            defer { busy = false }
            do {
                try await session.signInWithApple(identityToken: token, authorizationCode: code, language: language.code)
                await onSignedIn()
            } catch {
                onError(Self.message(for: error))
            }
        }
    }

    static func message(for error: Error) -> LocalizedStringKey {
        switch error as? APIError {
        case .server(409, _): "auth.apple.error.otherAppleID"
        case .server(400, "apple_email_missing"): "auth.apple.error.noEmail"
        case .unauthorized: "auth.apple.error.failed"
        default: AuthValidation.message(for: error)
        }
    }
}

/// "or" between Sign in with Apple and the email form.
struct AuthDivider: View {
    var body: some View {
        HStack(spacing: 12) {
            Rectangle().fill(Palette.rule).frame(height: 0.5)
            Text("auth.or").font(Typography.caption).foregroundStyle(Palette.ink3).fixedSize()
            Rectangle().fill(Palette.rule).frame(height: 0.5)
        }
        .accessibilityHidden(true)
    }
}
