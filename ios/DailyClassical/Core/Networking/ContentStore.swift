import Observation
import SwiftUI

enum Loadable<Value> {
    case idle, loading, loaded(Value), failed(APIError)

    var value: Value? { if case .loaded(let v) = self { v } else { nil } }
}

/// App-wide content state. Reloads when the language changes so every screen
/// switches language together.
@Observable
final class ContentStore {
    private(set) var today: Loadable<Piece> = .idle
    private(set) var library: Loadable<[PieceSummary]> = .idle
    private(set) var glossary: [String: GlossaryTerm] = [:]
    private(set) var composers: [String: Composer] = [:]
    private(set) var language = "en"

    private let source: ContentSource

    init(source: ContentSource = .default) {
        self.source = source
    }

    func reload(language: String) async {
        self.language = language
        today = .loading
        library = .loading
        async let t = Result { try await source.today(language) }
        async let l = Result { try await source.pieces(language) }
        async let g = Result { try await source.glossary(language) }
        async let c = Result { try await source.composers(language) }
        today = Self.loadable(await t)
        library = Self.loadable(await l)
        if case .success(let terms) = await g {
            glossary = Dictionary(terms.map { ($0.id, $0) }, uniquingKeysWith: { a, _ in a })
        }
        if case .success(let list) = await c {
            composers = Dictionary(list.map { ($0.id, $0) }, uniquingKeysWith: { a, _ in a })
        }
    }

    /// Glossary terms sorted for the current language.
    var sortedGlossary: [GlossaryTerm] {
        glossary.values.sorted { $0.term.compare($1.term, locale: Locale(identifier: language)) == .orderedAscending }
    }

    var todayID: String? { today.value?.id }

    /// Free users get today's piece; everything else in the library needs Premium.
    func isLocked(_ pieceID: String, premium: Bool) -> Bool {
        !premium && pieceID != todayID
    }

    func retry() async { await reload(language: language) }

    func piece(id: String) async throws -> Piece {
        if let p = today.value, p.id == id { return p }
        return try await source.piece(id, language)
    }

    private static func loadable<T>(_ r: Result<T, Error>) -> Loadable<T> {
        switch r {
        case .success(let v): .loaded(v)
        case .failure(let e): .failed(e as? APIError ?? .offline)
        }
    }
}

private extension Result where Failure == Error {
    init(catching body: () async throws -> Success) async {
        do { self = .success(try await body()) } catch { self = .failure(error) }
    }
}
