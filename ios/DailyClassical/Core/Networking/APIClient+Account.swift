import Foundation

nonisolated struct AccountUser: Decodable, Sendable {
    let id: String
    let email: String
    /// Complimentary Premium granted to this account (testers, press).
    let premium: Bool
    /// Linked to Sign in with Apple.
    let apple: Bool

    enum CodingKeys: String, CodingKey { case id, email, premium, apple }
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(String.self, forKey: .id)
        email = try c.decode(String.self, forKey: .email)
        premium = try c.decodeIfPresent(Bool.self, forKey: .premium) ?? false
        apple = try c.decodeIfPresent(Bool.self, forKey: .apple) ?? false
    }
}

nonisolated struct AuthResponse: Decodable, Sendable {
    let token: String
    let user: AccountUser
}

nonisolated struct RegisterResponse: Decodable, Sendable {
    let status: String
    let email: String
}

nonisolated struct FavouriteDTO: Decodable, Sendable {
    let pieceId: String
    let createdAt: Date
}

extension APIClient {
    /// Creates an unverified account and emails a 6-digit code; no session yet.
    func register(email: String, password: String, language: String) async throws -> RegisterResponse {
        try await send("v1/auth/register", method: "POST", body: ["email": email, "password": password], language: language)
    }

    func verifyEmail(email: String, code: String, language: String) async throws -> AuthResponse {
        try await send("v1/auth/verify", method: "POST", body: ["email": email, "code": code], language: language)
    }

    func resendVerificationCode(email: String, language: String) async throws {
        let _: Empty = try await send("v1/auth/verify/resend", method: "POST", body: ["email": email], language: language)
    }

    func me(token: String) async throws -> AccountUser {
        struct R: Decodable { let user: AccountUser }
        let r: R = try await send("v1/me", method: "GET", token: token)
        return r.user
    }

    func login(email: String, password: String, language: String) async throws -> AuthResponse {
        try await send("v1/auth/login", method: "POST", body: ["email": email, "password": password], language: language)
    }

    /// Sign up or sign in with Apple: the identity token proves the user; the one-time code lets the
    /// server revoke the Apple link if the account is deleted.
    func signInWithApple(identityToken: String, authorizationCode: String?, language: String) async throws -> AuthResponse {
        var body = ["identityToken": identityToken]
        if let authorizationCode { body["authorizationCode"] = authorizationCode }
        return try await send("v1/auth/apple", method: "POST", body: body, language: language)
    }

    func requestPasswordReset(email: String, language: String) async throws {
        let _: Empty = try await send("v1/auth/password-reset", method: "POST", body: ["email": email], language: language)
    }

    func deleteAccount(token: String) async throws {
        let _: Empty = try await send("v1/me", method: "DELETE", token: token)
    }

    func favourites(token: String) async throws -> [FavouriteDTO] {
        struct R: Decodable { let favourites: [FavouriteDTO] }
        let r: R = try await send("v1/favourites", method: "GET", token: token)
        return r.favourites
    }

    func setFavourite(_ pieceId: String, _ on: Bool, token: String) async throws {
        let _: Empty = try await send("v1/favourites/\(pieceId)", method: on ? "PUT" : "DELETE", token: token)
    }

    // MARK: Plumbing

    nonisolated struct Empty: Decodable {}

    private func send<T: Decodable>(
        _ path: String, method: String, body: [String: String]? = nil, language: String = "en", token: String? = nil
    ) async throws -> T {
        var request = URLRequest(url: baseURL.appending(path: path))
        request.httpMethod = method
        request.setValue(language, forHTTPHeaderField: "Accept-Language")
        if let token { request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization") }
        if let body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(body)
        }
        let (data, response): (Data, URLResponse)
        do { (data, response) = try await session.data(for: request) } catch { throw APIError.offline }
        try Self.check(response, data: data)
        if T.self == Empty.self { return Empty() as! T }
        return try Self.decode(T.self, from: data)
    }
}
