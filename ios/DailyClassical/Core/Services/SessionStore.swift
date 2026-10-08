import Foundation
import Observation

/// Email + password account. The heart is the only thing that needs it; everything
/// else in the app stays open to guests.
@Observable
final class SessionStore {
    private(set) var email: String?
    /// The account's id; identifies the buyer to RevenueCat (EntitlementStore.identify).
    private(set) var userID: String? = UserDefaults.standard.string(forKey: "accountUserID") {
        didSet { UserDefaults.standard.set(userID, forKey: "accountUserID") }
    }
    private(set) var favourites: [String: Date] = [:]   // pieceId → savedAt
    /// Complimentary Premium on the account (in addition to App Store purchases).
    private(set) var accountPremium = UserDefaults.standard.bool(forKey: "accountPremium") {
        didSet { UserDefaults.standard.set(accountPremium, forKey: "accountPremium") }
    }
    private var token: String?
    private let api: APIClient

    var isSignedIn: Bool { token != nil }

    init(api: APIClient = .shared) {
        self.api = api
        token = Keychain.get("token")
        email = UserDefaults.standard.string(forKey: "accountEmail")
        #if DEBUG
        // Screen checks in the simulator: DC_SESSION_TOKEN=<jwt> (from POST /v1/auth/login with a
        // test account) starts the app signed in, without typing credentials into the UI.
        if let injected = ProcessInfo.processInfo.environment["DC_SESSION_TOKEN"], !injected.isEmpty {
            token = injected
        }
        #endif
        // Account Premium belongs to a session: without one (signed out, or the Keychain token is
        // gone) a stale flag must not unlock anything.
        if token == nil { accountPremium = false; userID = nil }
    }

    func isFavourite(_ pieceId: String) -> Bool { favourites[pieceId] != nil }

    /// Sign-up step 1: the server emails a code; call `verifyEmail` with it to get a session.
    func register(email: String, password: String, language: String) async throws {
        _ = try await api.register(email: email, password: password, language: language)
    }

    /// Sign-up step 2 (also after signing in to an unverified account).
    func verifyEmail(email: String, code: String, language: String) async throws {
        apply(try await api.verifyEmail(email: email, code: code, language: language))
        await refreshFavourites()
    }

    func resendVerificationCode(email: String, language: String) async throws {
        try await api.resendVerificationCode(email: email, language: language)
    }

    /// Re-reads the account (email, comp Premium); signs out if the session was revoked.
    func refreshAccount() async {
        guard let token else { return }
        do {
            let user = try await api.me(token: token)
            email = user.email
            userID = user.id
            accountPremium = user.premium
        } catch APIError.unauthorized {
            signOut()
        } catch {}
    }

    func signIn(email: String, password: String, language: String) async throws {
        apply(try await api.login(email: email, password: password, language: language))
        await refreshFavourites()
    }

    func signInWithApple(identityToken: String, authorizationCode: String?, language: String) async throws {
        apply(try await api.signInWithApple(identityToken: identityToken, authorizationCode: authorizationCode, language: language))
        await refreshFavourites()
    }

    func requestPasswordReset(email: String, language: String) async throws {
        try await api.requestPasswordReset(email: email, language: language)
    }

    func signOut() {
        token = nil
        email = nil
        userID = nil
        favourites = [:]
        accountPremium = false
        Keychain.set(nil, for: "token")
        UserDefaults.standard.removeObject(forKey: "accountEmail")
    }

    func deleteAccount() async throws {
        guard let token else { return }
        try await api.deleteAccount(token: token)
        signOut()
    }

    func refreshFavourites() async {
        guard let token else { return }
        do {
            let list = try await api.favourites(token: token)
            favourites = Dictionary(list.map { ($0.pieceId, $0.createdAt) }, uniquingKeysWith: { a, _ in a })
        } catch APIError.unauthorized {
            signOut()
        } catch {}
    }

    /// Optimistic toggle; rolls back if the server refuses.
    func setFavourite(_ pieceId: String, _ on: Bool) async {
        guard let token else { return }
        let previous = favourites[pieceId]
        favourites[pieceId] = on ? .now : nil
        do { try await api.setFavourite(pieceId, on, token: token) } catch { favourites[pieceId] = previous }
    }

    private func apply(_ auth: AuthResponse) {
        token = auth.token
        email = auth.user.email
        userID = auth.user.id
        accountPremium = auth.user.premium
        Keychain.set(auth.token, for: "token")
        UserDefaults.standard.set(auth.user.email, forKey: "accountEmail")
    }
}
