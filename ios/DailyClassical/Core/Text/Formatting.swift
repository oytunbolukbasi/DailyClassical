import Foundation

nonisolated enum Formatting {
    /// 450 → "7:30", 3725 → "1:02:05".
    static func clock(_ seconds: Int) -> String {
        let h = seconds / 3600, m = (seconds % 3600) / 60, s = seconds % 60
        return h > 0 ? String(format: "%d:%02d:%02d", h, m, s) : String(format: "%d:%02d", m, s)
    }

    static func surname(_ fullName: String) -> String {
        fullName.split(separator: " ").last.map(String.init) ?? fullName
    }
}

extension Recording {
    /// Named before the conductor: a concerto's soloist, a sonata's player. A symphony's vocal
    /// quartet (Beethoven 9) stays in the credits line instead.
    var leadSoloists: [Soloist] { soloists.count <= 2 ? soloists : [] }
    var otherSoloists: [Soloist] { soloists.count <= 2 ? [] : soloists }

    /// "Teodor Currentzis, musicAeterna"; "Sviatoslav Richter, Stanisław Wisłocki, Warsaw Philharmonic"
    var performers: String {
        (leadSoloists.map(\.name) + [conductor, orchestra].compactMap { $0 }).joined(separator: ", ")
    }

    var displayYear: String? { releaseYear.map(String.init) ?? recordedYear }

    /// "Currentzis, musicAeterna (Sony Classical, 2017)" — used in stop and duration notes.
    /// People are cited by surname unless `fullNames`; the orchestra always in full.
    func citation(fullNames: Bool = false) -> String {
        let name = { (n: String) in fullNames ? n : Formatting.surname(n) }
        let who = (leadSoloists.map { name($0.name) } + [conductor.map(name), orchestra].compactMap { $0 })
            .joined(separator: ", ")
        let meta = [label, displayYear].compactMap { $0 }.joined(separator: ", ")
        return meta.isEmpty ? who : "\(who) (\(meta))"
    }

    /// "Sony Classical · 2017"
    var labelAndYear: String { [label, displayYear].compactMap { $0 }.joined(separator: " · ") }
}

extension Movement {
    /// "B minor · 4/4" (table) or "B minor · 4/4 · 19:44" (section header).
    func metaLine(includeDuration: Bool) -> String {
        var parts = [key, metre].compactMap { $0 }
        if title != nil, let tempo { parts.insert(tempo, at: 0) }
        if includeDuration, let durationSec { parts.append(Formatting.clock(durationSec)) }
        return parts.joined(separator: " · ")
    }

    /// The heading shown for the movement: its title (Berlioz, Mahler) or tempo marking.
    var displayHeading: String { title ?? tempo ?? heading }
}

extension Piece {
    /// Header title with the catalogue number before the nickname, as in the design:
    /// "Symphony No. 6 in B minor, Op. 74, “Pathétique”". Library rows keep the short `title`.
    var headerTitle: String {
        guard let catalogue, !title.contains(catalogue) else { return title }
        if let range = title.range(of: ", “") {
            return title[..<range.lowerBound] + ", \(catalogue)" + title[range.lowerBound...]
        }
        return "\(title), \(catalogue)"
    }
}
