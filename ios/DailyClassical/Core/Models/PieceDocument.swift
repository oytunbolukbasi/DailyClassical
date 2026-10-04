import Foundation

// Mirrors backend/src/content/types.ts. "Rich" strings may contain
// [[term-id|surface]] glossary links and *emphasis*; see RichText.

nonisolated struct PieceDocument: Codable, Hashable, Sendable {
    struct BigPicture: Codable, Hashable, Sendable {
        let facts: [String]
        let inOneLine: String?
    }
    let bigPicture: BigPicture
    let movements: [Movement]
    let threads: [PieceThread]
}

nonisolated struct Movement: Codable, Hashable, Identifiable, Sendable {
    let index: Int
    let numeral: String
    let heading: String
    let title: String?
    let tempo: String?
    let key: String?
    let metre: String?
    let durationSec: Int?
    let durationApprox: Bool
    let summary: String?
    let mainIdeas: [MainIdea]
    let stops: [ListeningStop]
    let notice: [String]
    let notes: [Note]

    var id: Int { index }
}

nonisolated struct MainIdea: Codable, Hashable, Sendable {
    let name: String?
    let description: String
}

nonisolated struct ListeningStop: Codable, Hashable, Sendable {
    let startSec: Int?
    let endSec: Int?
    let approximate: Bool
    let label: String?
    let hear: String
    let happening: String

    enum Kind { case single, range, untimed }
    var kind: Kind {
        if startSec == nil { return .untimed }
        return endSec == nil ? .single : .range
    }
}

nonisolated struct Note: Codable, Hashable, Sendable {
    let title: String
    let body: String
}

nonisolated struct PieceThread: Codable, Hashable, Sendable {
    let title: String?
    let body: String
}
