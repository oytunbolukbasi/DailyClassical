import Foundation

nonisolated enum APIError: Error, Equatable {
    case offline
    case unauthorized
    case notFound
    case server(status: Int, code: String?)
    case decoding
}

/// Thin async client for the DailyClassical API. Content requests carry the active
/// language; successful content responses are cached so the app can open offline.
nonisolated struct APIClient: Sendable {
    let baseURL: URL
    let session: URLSession
    let cache: ResponseCache

    static let shared = APIClient(
        baseURL: URL(string: Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String ?? "")
            ?? URL(string: "https://api.dailyclassical.co")!,
        session: .shared,
        cache: ResponseCache()
    )

    private static let decoder: JSONDecoder = {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .iso8601
        return d
    }()

    // MARK: Content

    /// "YYYY-MM-DD" for the user's calendar day containing `date`.
    static func day(_ date: Date = .now) -> String {
        date.formatted(Date.ISO8601FormatStyle(timeZone: .current).year().month().day())
    }

    func today(date: Date = .now, language: String) async throws -> TodayResponse {
        let day = Self.day(date)
        return try await get("v1/today", query: ["date": day], language: language, cacheKey: "today-\(day)")
    }

    /// Pieces published on or before `day`, newest first, each with its `publishDate`.
    func pieces(day: String, language: String) async throws -> [PieceSummary] {
        struct R: Decodable { let pieces: [PieceSummary] }
        let r: R = try await get("v1/pieces", query: ["date": day], language: language, cacheKey: "pieces")
        return r.pieces
    }

    /// Scheduled days up to and including `until`, oldest first.
    func schedule(until day: String, language: String) async throws -> [ScheduledDay] {
        struct R: Decodable { let days: [ScheduledDay] }
        let r: R = try await get("v1/schedule", query: ["until": day], language: language, cacheKey: "schedule")
        return r.days
    }

    func piece(id: String, language: String) async throws -> Piece {
        try await get("v1/pieces/\(id)", language: language, cacheKey: "piece-\(id)")
    }

    func glossary(language: String) async throws -> [GlossaryTerm] {
        struct R: Decodable { let terms: [GlossaryTerm] }
        let r: R = try await get("v1/glossary", language: language, cacheKey: "glossary")
        return r.terms
    }

    func composers(language: String) async throws -> [Composer] {
        struct R: Decodable { let composers: [Composer] }
        let r: R = try await get("v1/composers", language: language, cacheKey: "composers")
        return r.composers
    }

    // MARK: Plumbing

    private func get<T: Decodable>(
        _ path: String, query: [String: String] = [:], language: String, cacheKey: String, token: String? = nil
    ) async throws -> T {
        var components = URLComponents(url: baseURL.appending(path: path), resolvingAgainstBaseURL: false)!
        components.queryItems = (query.merging(["locale": language]) { a, _ in a }).map { URLQueryItem(name: $0, value: $1) }
        var request = URLRequest(url: components.url!)
        request.setValue(language, forHTTPHeaderField: "Accept-Language")
        if let token { request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization") }
        let key = "\(language)/\(cacheKey)"

        do {
            let (data, response) = try await session.data(for: request)
            try Self.check(response, data: data)
            let value = try Self.decode(T.self, from: data)
            await cache.store(data, for: key)
            return value
        } catch let error as URLError where error.isConnectivity {
            guard let cached = await cache.data(for: key) else { throw APIError.offline }
            return try Self.decode(T.self, from: cached)
        }
    }

    static func check(_ response: URLResponse, data: Data) throws {
        guard let http = response as? HTTPURLResponse else { return }
        switch http.statusCode {
        case 200..<300: return
        case 401: throw APIError.unauthorized
        case 404: throw APIError.notFound
        default:
            struct E: Decodable { let error: String }
            throw APIError.server(status: http.statusCode, code: try? JSONDecoder().decode(E.self, from: data).error)
        }
    }

    static func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do { return try decoder.decode(T.self, from: data) } catch { throw APIError.decoding }
    }
}

private extension URLError {
    var isConnectivity: Bool {
        [.notConnectedToInternet, .networkConnectionLost, .timedOut, .cannotFindHost, .cannotConnectToHost, .dataNotAllowed]
            .contains(code)
    }
}
