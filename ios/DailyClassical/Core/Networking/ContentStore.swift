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
    /// Published pieces only, newest first (today's piece first).
    private(set) var library: Loadable<[PieceSummary]> = .idle
    /// The days Today pages through, oldest first; the last one is today. Never future days.
    private(set) var days: [ScheduledDay] = []
    /// The reader's calendar day ("YYYY-MM-DD") the content was loaded for.
    private(set) var todayDay = APIClient.day()
    private(set) var glossary: [String: GlossaryTerm] = [:]
    private(set) var composers: [String: Composer] = [:]
    private(set) var language = "en"

    @ObservationIgnored private var pieceCache: [String: Piece] = [:]
    private let source: ContentSource

    init(source: ContentSource = .default) {
        self.source = source
    }

    func reload(language: String) async {
        self.language = language
        let day = APIClient.day()
        todayDay = day
        pieceCache = [:]
        today = .loading
        library = .loading
        async let t = Result { try await source.today(language) }
        async let l = Result { try await source.pieces(language, day) }
        async let s = Result { try await source.schedule(language, day) }
        async let g = Result { try await source.glossary(language) }
        async let c = Result { try await source.composers(language) }
        today = Self.loadable(await t)
        let todayPiece = today.value
        switch Self.loadable(await l) {
        case .loaded(let pieces): library = .loaded(Self.published(pieces, today: todayPiece, day: day))
        case let other: library = other
        }
        // Without the schedule (offline, nothing cached) Today still shows today's page.
        let past = ((try? await s.get()) ?? []).filter { $0.day < day }.sorted { $0.day < $1.day }
        days = past + (todayPiece.map { [ScheduledDay(day: day, pieceId: $0.id)] } ?? [])
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
        if let p = cachedPiece(id: id) { return p }
        let language = language
        let p = try await source.piece(id, language)
        if language == self.language { pieceCache[id] = p }
        return p
    }

    /// A piece already loaded in the current language, for showing a page without a skeleton.
    func cachedPiece(id: String) -> Piece? {
        if let p = today.value, p.id == id { return p }
        return pieceCache[id]
    }

    /// Published pieces newest first. Today's piece always counts as published today (the API
    /// may fall back to a rotation for unscheduled days); a response without publish dates
    /// (older API) is kept whole with today's piece first.
    private static func published(_ pieces: [PieceSummary], today: Piece?, day: String) -> [PieceSummary] {
        var list = pieces
        if pieces.contains(where: { $0.publishDate != nil }) {
            list = pieces.filter { ($0.publishDate ?? "9999") <= day }
        }
        if let today {
            if let i = list.firstIndex(where: { $0.id == today.id }) {
                list[i].publishDate = day
            } else {
                list.append(PieceSummary(today, publishDate: day))
            }
        }
        // Stable: equal or missing dates keep the source order.
        return list.enumerated()
            .sorted { a, b in
                let (da, db) = (a.element.publishDate ?? "", b.element.publishDate ?? "")
                return da != db ? da > db : a.offset < b.offset
            }
            .map(\.element)
    }

    private static func loadable<T>(_ r: Result<T, Error>) -> Loadable<T> {
        switch r {
        case .success(let v): .loaded(v)
        case .failure(let e): .failed(e as? APIError ?? .offline)
        }
    }
}

private extension PieceSummary {
    init(_ p: Piece, publishDate: String) {
        self.init(id: p.id, contentLocale: p.contentLocale, composer: p.composer, title: p.title, catalogue: p.catalogue,
                  keyLabel: p.keyLabel, year: p.year, era: p.era, durationMin: p.durationMin, movementCount: p.movementCount,
                  hook: p.hook, painting: p.painting, publishDate: publishDate)
    }
}

private extension Result where Failure == Error {
    init(catching body: () async throws -> Success) async {
        do { self = .success(try await body()) } catch { self = .failure(error) }
    }
}
