import CoreGraphics
import Foundation

/// What is being shared: the whole piece (the coda block) or one listening stop (a long-press on
/// its card). `movement` is the movement's index (1-based), `stop` the stop's position in it.
nonisolated enum ShareSubject: Hashable, Identifiable, Sendable {
    case piece
    case moment(movement: Int, stop: Int)

    var id: String {
        switch self {
        case .piece: "piece"
        case .moment(let m, let s): "moment-\(m)-\(s)"
        }
    }

    /// `utm_medium` of the shared link.
    var medium: String {
        switch self {
        case .piece: "piece"
        case .moment: "moment"
        }
    }
}

/// The two image sizes: Story 9:16 and Post 4:5 (the default).
nonisolated enum ShareFormat: String, CaseIterable, Hashable, Sendable {
    case story, post

    /// Export pixels (the card is laid out in points at these sizes and rendered at scale 1).
    var size: CGSize {
        switch self {
        case .story: CGSize(width: 1080, height: 1920)
        case .post: CGSize(width: 1080, height: 1350)
        }
    }
}

/// Everything the "wall label" card prints, as plain text in the content's language
/// (design/birthdays-sharing D1-*).
struct ShareCard {
    enum Kind { case piece, moment }

    struct Caption {
        let artist: String
        let title: String
        let year: String
    }

    let kind: Kind
    let composer: String
    let title: String
    let hook: String
    let caption: Caption?
    /// "≈ 4:30 · I. ADAGIO – ALLEGRO NON TROPPO", already upper-cased (ShareText.uppercasedLabel).
    /// Nil when the piece has no listening stops.
    let timeLine: String?
    /// The stop's "What you hear" line.
    let hear: String?
    /// The stop's "What is happening" line (moment card only).
    let happening: String?
    let imageURL: URL?
    /// The painting's width / height (API), until the image itself is loaded.
    let aspectRatio: CGFloat?

    init(piece: Piece, subject: ShareSubject) {
        let position: (movement: Int, stop: Int)?
        switch subject {
        case .piece: position = piece.shareStop
        case .moment(let m, let s): position = (m, s)
        }
        let resolved: (movement: Movement, stop: ListeningStop)? = position.flatMap { p in
            guard let mv = piece.document.movements.first(where: { $0.index == p.movement }), mv.stops.indices.contains(p.stop) else { return nil }
            return (mv, mv.stops[p.stop])
        }
        kind = subject == .piece ? .piece : .moment
        composer = piece.composer.name
        // "E-flat", "C-sharp": a word joiner after the hyphen keeps the key on one line.
        title = piece.title.replacingOccurrences(of: #"(?<=\p{L})-(?=\p{L})"#, with: "-\u{2060}", options: .regularExpression)
        hook = piece.hook
        caption = piece.painting.map { Caption(artist: $0.artist, title: $0.title, year: $0.yearLabel) }
        imageURL = piece.painting?.imageUrl
        aspectRatio = piece.painting?.aspectRatio
        if let resolved {
            timeLine = ShareText.timeLine(stop: resolved.stop, movement: resolved.movement,
                                          movementCount: piece.document.movements.count, language: piece.contentLocale)
            hear = RichText.plain(resolved.stop.hear)
            happening = RichText.plain(resolved.stop.happening)
        } else {
            timeLine = nil
            hear = nil
            happening = nil
        }
    }
}

extension Piece {
    /// The stop the piece card quotes: the first timed stop after 0:00 in movement I whose "What
    /// you hear" line is under 90 characters; otherwise the first timed stop (movement I first),
    /// otherwise the first stop at all. Nil for a piece without stops.
    var shareStop: (movement: Int, stop: Int)? {
        let movements = document.movements
        if let first = movements.first,
           let i = first.stops.firstIndex(where: { ($0.startSec ?? 0) > 0 && RichText.plain($0.hear).count < 90 }) {
            return (first.index, i)
        }
        for m in movements {
            if let i = m.stops.firstIndex(where: { $0.startSec != nil }) { return (m.index, i) }
        }
        for m in movements where !m.stops.isEmpty { return (m.index, 0) }
        return nil
    }

    /// The link every share carries: the App Store redirect (backend routes/app-link.ts), tagged so
    /// clicks count per piece and per entry point.
    func shareURL(_ subject: ShareSubject) -> URL {
        var c = URLComponents(string: "https://dailyclassical.co/app")!
        c.queryItems = [
            URLQueryItem(name: "utm_source", value: "app-share"),
            URLQueryItem(name: "utm_medium", value: subject.medium),
            URLQueryItem(name: "utm_content", value: id),
        ]
        return c.url!
    }

    /// The share sheet's header title: "Tchaikovsky, Symphony No. 6 in B minor, “Pathétique”".
    var shareHeaderTitle: String { "\(composer.shortName), \(title)" }

    /// The text that goes with the image (design B3-Share-text): one string ending in the link.
    func shareText(_ subject: ShareSubject) -> String {
        let code = contentLocale
        let link = shareURL(subject).absoluteString
        switch subject {
        case .piece:
            let text = L10n.string("share.text.piece \(composer.shortName) \(title) \(ShareText.sentence(hook))", code: code)
            return "\(text) \(link)"
        case .moment(let m, let s):
            guard let movement = document.movements.first(where: { $0.index == m }), movement.stops.indices.contains(s) else {
                return shareText(.piece)
            }
            let stop = movement.stops[s]
            let quote = ShareText.sentence(RichText.plain(stop.hear))
            let text: String
            if let start = stop.startSec {
                let clock = Formatting.clock(start)
                let at = code == "tr" ? clock + ShareText.turkishLocative(clock) : clock
                text = L10n.string("share.text.moment \(composer.shortName) \(shortTitle) \(at) \(quote)", code: code)
            } else {
                text = L10n.string("share.text.moment.untimed \(composer.shortName) \(shortTitle) \(quote)", code: code)
            }
            return "\(text) \(link)"
        }
    }

    /// The title as the moment text names it: a numbered work without its key and nickname
    /// ("Symphony No. 6", "6. Senfoni"); any other title in full ("Piano Quintet in A major, “Trout”").
    var shortTitle: String {
        let numbered = contentLocale == "tr"
            ? title.range(of: #"\d+\. "#, options: .regularExpression) != nil
            : title.contains("No. ")
        guard numbered else { return title }
        var t = title
        if let nickname = t.range(of: #", “[^”]*”$"#, options: .regularExpression) { t.removeSubrange(nickname) }
        if let keyLabel {
            let keys = [keyLabel, keyLabel.components(separatedBy: " (").first ?? keyLabel]
            for key in keys {
                let pattern = contentLocale == "tr" ? "\(key) " : " in \(key)"
                if let r = t.range(of: pattern) {
                    t.removeSubrange(r)
                    break
                }
            }
        }
        return t.trimmingCharacters(in: .whitespaces)
    }
}

/// Text rules of the share card and share text.
enum ShareText {
    /// "≈ 4:30 · I. ADAGIO – ALLEGRO NON TROPPO"; a range reads "≈ 9:30–10:30"; an untimed stop
    /// shows its label ("SONA DOĞRU") instead of a time. Single-movement works print no movement.
    static func timeLine(stop: ListeningStop, movement: Movement, movementCount: Int, language: String) -> String {
        var parts: [String] = []
        if let start = stop.startSec {
            parts.append("≈ " + Formatting.clock(start) + (stop.endSec.map { "–" + Formatting.clock($0) } ?? ""))
        } else if let label = stop.label, !label.isEmpty {
            parts.append(uppercasedLabel(label, language: language))
        }
        if movementCount > 1 {
            parts.append(uppercasedLabel("\(movement.numeral). \(movement.displayHeading)", language: language))
        }
        return parts.joined(separator: " · ")
    }

    /// Ends `s` with a full stop unless it already ends a sentence.
    static func sentence(_ s: String) -> String {
        let trimmed = s.trimmingCharacters(in: .whitespacesAndNewlines)
        let core = trimmed.trimmingCharacters(in: CharacterSet(charactersIn: "”’\")"))
        guard let last = core.last else { return trimmed }
        return ".!?…".contains(last) ? trimmed : trimmed + "."
    }

    // MARK: Turkish

    /// The locative suffix for a time read aloud in Turkish: "8:00" → "’de" (sekiz), "4:30" → "’da"
    /// (otuz), "1:45" → "’te" (beş). Vowel harmony follows the last spoken word; the consonant
    /// hardens after a voiceless one.
    static func turkishLocative(_ clock: String) -> String {
        let numbers = clock.split(separator: ":").compactMap { Int($0) }
        // "8:00" is read "sekiz"; "8:05" "sekiz beş": the last non-zero group is spoken last.
        let spoken = numbers.last(where: { $0 != 0 }) ?? 0
        let word = turkishLastWord(spoken)
        let lastVowel = word.last { "aeıioöuü".contains($0) } ?? "e"
        let vowel = "aıou".contains(lastVowel) ? "a" : "e"
        let consonant = "fstkçşhp".contains(word.last ?? "e") ? "t" : "d"
        return "’\(consonant)\(vowel)"
    }

    /// The last word of `n` read aloud in Turkish (0–99 is all a clock needs).
    private static func turkishLastWord(_ n: Int) -> String {
        let ones = ["", "bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz"]
        let tens = ["", "on", "yirmi", "otuz", "kırk", "elli", "altmış", "yetmiş", "seksen", "doksan"]
        if n == 0 { return "sıfır" }
        if n % 10 != 0 { return ones[n % 10] }
        if n % 100 != 0 { return tens[(n / 10) % 10] }
        return "yüz"
    }

    /// Upper-cases a label for the card. Turkish case rules turn "Adagio" into "ADAGİO", so in
    /// Turkish content Latin-derived words (tempo and form names, French and German titles) are
    /// upper-cased with the root locale ("ADAGIO") and genuinely Turkish words keep Turkish rules
    /// ("SONA DOĞRU", "BİR BALO"). Only words with an "i" can differ, so only those are judged.
    static func uppercasedLabel(_ s: String, language: String) -> String {
        guard language == "tr" else { return s.uppercased(with: Locale(identifier: "en")) }
        let turkish = Locale(identifier: "tr")
        let root = Locale(identifier: "")

        // Words and the separators between them, with the segment (split at dashes, colons,
        // commas and brackets) and bracket depth of each word.
        struct Word { var text: String; var segment: Int; var inBrackets: Bool; var afterApostrophe: Bool }
        var tokens: [(isWord: Bool, text: String)] = []
        var words: [Word] = []
        var segment = 0, depth = 0
        var current = ""
        var previous: Character?
        func flush() {
            guard !current.isEmpty else { return }
            words.append(Word(text: current, segment: segment, inBrackets: depth > 0,
                              afterApostrophe: previous.map { "'’".contains($0) } ?? false))
            tokens.append((true, current))
            current = ""
        }
        for ch in s {
            if ch.isLetter {
                current.append(ch)
                continue
            }
            flush()
            previous = ch  // the separator just before the next word
            if ch == "(" { depth += 1; segment += 1 }
            if ch == ")" { depth = max(0, depth - 1); segment += 1 }
            if "–—:,;".contains(ch) { segment += 1 }
            tokens.append((false, String(ch)))
        }
        flush()

        let foreignSegments = Set(words.filter { !$0.inBrackets && isForeign($0.text) }.map(\.segment))
        var out = ""
        var w = 0
        for token in tokens {
            guard token.isWord else { out += token.text; continue }
            let word = words[w]
            w += 1
            let useTurkish: Bool
            if word.inBrackets || word.afterApostrophe || hasTurkishLetter(word.text) {
                useTurkish = true  // "(korolu final)", "Borghese’nin", "Giriş"
            } else {
                useTurkish = !(isForeign(word.text) || foreignSegments.contains(word.segment))
            }
            out += word.text.uppercased(with: useTurkish ? turkish : root)
        }
        return out
    }

    /// Letters only Turkish uses among the languages in the catalogue (ö and ü are German too).
    private static func hasTurkishLetter(_ word: String) -> Bool {
        word.contains { "çğışÇĞİŞ".contains($0) }
    }

    /// Italian, Latin, French or German by its letters, spelling or as a known music word.
    private static func isForeign(_ word: String) -> Bool {
        let w = word.lowercased(with: Locale(identifier: ""))
        if w.contains(where: { "àáäèéêëìíïòóôùúßñœæqwx".contains($0) }) { return true }
        if musicWords.contains(w) { return true }
        return w.range(of: #"ch|qu|ue$|ui|ie|ei|ae|gi[aou]|ci[aou]|zz"#, options: .regularExpression) != nil
    }

    /// Tempo, form and liturgical words with an "i" (where Turkish rules would dot it).
    private static let musicWords: Set<String> = [
        "adagio", "adagietto", "andantino", "allegrissimo", "assai", "animato", "agitato", "air", "aria", "brillante",
        "brio", "cantabile", "capriccio", "deciso", "di", "divertimento", "elegia", "espressivo", "fantasia", "finale",
        "giocoso", "giusto", "gigue", "grazia", "grazioso", "intermezzo", "introitus", "larghissimo", "leggiero",
        "lirico", "marcia", "miserere", "misterioso", "passacaglia", "pizzicato", "piu", "più", "poi", "preludio",
        "prestissimo", "quasi", "religioso", "risoluto", "ritenuto", "sempre", "sicilienne", "siciliano", "sinfonia",
        "spiritoso", "tranquillo", "trio", "variazioni", "vivace", "vivacissimo", "vivo", "minuetto", "ciaccona",
        "kyrie", "gloria", "dies", "irae", "benedictus", "agnus", "dei", "domine", "spiritus", "libera", "lacrimosa",
        "infernale", "fine", "ripieno", "sostenuto", "affettuoso", "doloroso", "dolcissimo", "pianissimo",
    ]
}
