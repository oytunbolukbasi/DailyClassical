import Foundation

/// The piece page flattened into one list of blocks, so a single lazy stack can report
/// which block sits at the centre of the screen (reading focus, current movement) and
/// jump to any movement.
enum PieceBlock: Hashable, Identifiable {
    case header
    case bigPicture
    case movementsTable
    case movementHeader(Int)
    case summary(Int)
    case mainIdeas(Int)
    case stopsHeader(Int)
    case stop(Int, Int)
    case notice(Int)
    case notes(Int)
    case threads
    case recordings
    case sources

    var id: Self { self }

    var movement: Int? {
        switch self {
        case .movementHeader(let m), .summary(let m), .mainIdeas(let m), .stopsHeader(let m), .notice(let m), .notes(let m): m
        case .stop(let m, _): m
        default: nil
        }
    }

    static func blocks(for document: PieceDocument) -> [PieceBlock] {
        var out: [PieceBlock] = [.header, .bigPicture, .movementsTable]
        for m in document.movements {
            out.append(.movementHeader(m.index))
            if m.summary != nil { out.append(.summary(m.index)) }
            if !m.mainIdeas.isEmpty { out.append(.mainIdeas(m.index)) }
            if !m.stops.isEmpty {
                out.append(.stopsHeader(m.index))
                out += m.stops.indices.map { .stop(m.index, $0) }
            }
            if !m.notice.isEmpty { out.append(.notice(m.index)) }
            if !m.notes.isEmpty { out.append(.notes(m.index)) }
        }
        if !document.threads.isEmpty { out.append(.threads) }
        out += [.recordings, .sources]
        return out
    }
}
