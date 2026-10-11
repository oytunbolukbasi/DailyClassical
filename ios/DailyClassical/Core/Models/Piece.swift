import Foundation

// Mirrors the API responses in backend/src/content/repository.ts.

nonisolated struct ComposerRef: Codable, Hashable, Sendable {
    let id: String
    let name: String
    let shortName: String
}

nonisolated struct Painting: Codable, Hashable, Sendable {
    let artist: String
    let title: String
    let yearLabel: String
    let collection: String
    let pairingNote: String?
    let medium: String?
    /// `hero` rendition (short side ≤ 1800 px); `thumbUrl` (≤ 300 px) for lists, `fullUrl` (≤ 4000 px)
    /// for the artwork viewer's zoom. Older responses only carry `imageUrl` (ImagePipeline then derives
    /// the others from the bundled manifest).
    let imageUrl: URL?
    var thumbUrl: URL? = nil
    var fullUrl: URL? = nil
    /// Average colour "#rrggbb", shown while the image loads.
    var placeholderColor: String? = nil
    /// Attribution a freely licensed (non-PD) image requires, and its licence deed.
    var creditLine: String? = nil
    var licenseUrl: URL? = nil
    let sourceUrl: URL?
    let width: Int?
    let height: Int?
    let rightsStatus: String

    private enum CodingKeys: String, CodingKey {
        case artist, title, yearLabel, collection, pairingNote, medium, imageUrl, thumbUrl, fullUrl,
             placeholderColor, creditLine, licenseUrl, sourceUrl, width, height, rightsStatus
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        artist = try c.decode(String.self, forKey: .artist)
        title = try c.decode(String.self, forKey: .title)
        yearLabel = try c.decode(String.self, forKey: .yearLabel)
        collection = try c.decode(String.self, forKey: .collection)
        pairingNote = try c.decodeIfPresent(String.self, forKey: .pairingNote)
        medium = try c.decodeIfPresent(String.self, forKey: .medium)
        imageUrl = try c.decodeIfPresent(URL.self, forKey: .imageUrl)
        // Image extras are optional and decode-tolerant: a malformed one never drops the painting.
        thumbUrl = try? c.decodeIfPresent(URL.self, forKey: .thumbUrl)
        fullUrl = try? c.decodeIfPresent(URL.self, forKey: .fullUrl)
        placeholderColor = try? c.decodeIfPresent(String.self, forKey: .placeholderColor)
        creditLine = try? c.decodeIfPresent(String.self, forKey: .creditLine)
        licenseUrl = try? c.decodeIfPresent(URL.self, forKey: .licenseUrl)
        sourceUrl = try c.decodeIfPresent(URL.self, forKey: .sourceUrl)
        width = try c.decodeIfPresent(Int.self, forKey: .width)
        height = try c.decodeIfPresent(Int.self, forKey: .height)
        rightsStatus = try c.decode(String.self, forKey: .rightsStatus)
    }

    var aspectRatio: CGFloat? {
        guard let width, let height, height > 0 else { return nil }
        return CGFloat(width) / CGFloat(height)
    }
}

/// Decoding is tolerant: an era or form added on the server after this build shipped becomes
/// `.other` instead of failing the whole Library response (content ships without app updates).
nonisolated enum Era: String, Codable, CaseIterable, Sendable {
    case renaissance, baroque, classical, romantic, lateRomantic = "late_romantic", modern, other

    init(from decoder: Decoder) throws {
        self = Era(rawValue: try decoder.singleValueContainer().decode(String.self)) ?? .other
    }
}

/// The work's form (backend `PIECE_FORMS`); drives the Library's form filter.
nonisolated enum PieceForm: String, Codable, CaseIterable, Sendable {
    case symphony
    case pianoConcerto = "piano-concerto", violinConcerto = "violin-concerto", celloConcerto = "cello-concerto"
    case concerto
    case pianoSonata = "piano-sonata", sonata
    case stringQuartet = "string-quartet", chamber, orchestral, choral, other

    init(from decoder: Decoder) throws {
        self = PieceForm(rawValue: try decoder.singleValueContainer().decode(String.self)) ?? .other
    }
}

nonisolated struct PieceSummary: Codable, Hashable, Identifiable, Sendable {
    let id: String
    let contentLocale: String
    let composer: ComposerRef
    let title: String
    let catalogue: String?
    let keyLabel: String?
    let year: Int
    let era: Era
    /// Absent from older API responses (all symphonies then); see `kind`.
    var form: PieceForm?
    let durationMin: Int
    let movementCount: Int
    let hook: String
    let painting: Painting?
    /// "YYYY-MM-DD": the piece's latest scheduled day up to the reader's today. Absent from older
    /// API responses; ContentStore fills it for bundled content.
    var publishDate: String?
}

nonisolated struct Recording: Codable, Hashable, Identifiable, Sendable {
    enum Role: String, Codable, Sendable {
        case reference, alternative

        /// A role added later on the server reads as an alternative recording.
        init(from decoder: Decoder) throws {
            self = Role(rawValue: try decoder.singleValueContainer().decode(String.self)) ?? .alternative
        }
    }
    struct Soloist: Codable, Hashable, Sendable { let name: String; let role: String }

    let id: String
    let role: Role
    /// Nil for solo and chamber recordings (a sonata's pianist is a soloist).
    let conductor: String?
    let orchestra: String?
    let soloists: [Soloist]
    let chorus: String?
    let label: String?
    let recordedYear: String?
    let releaseYear: Int?
    let spotifyUrl: URL?
}

nonisolated struct Piece: Codable, Hashable, Identifiable, Sendable {
    let id: String
    let contentLocale: String
    let composer: ComposerRef
    let title: String
    let catalogue: String?
    let keyLabel: String?
    let year: Int
    let era: Era
    let durationMin: Int
    let movementCount: Int
    let hook: String
    let painting: Painting?
    let document: PieceDocument
    let recordings: [Recording]

    var referenceRecording: Recording? { recordings.first { $0.role == .reference } }
}

extension PieceSummary {
    var kind: PieceForm { form ?? .symphony }
}

nonisolated struct TodayResponse: Codable, Sendable {
    let date: String
    let piece: Piece
}

nonisolated struct GlossaryTerm: Codable, Hashable, Identifiable, Sendable {
    let id: String
    let term: String
    /// One line for the glossary list and search results (SPEC §4.9). Absent from older API
    /// responses; rows then fall back to the definition.
    var short: String?
    /// The full text (1–2 sentences, rich text), shown in the term sheet.
    let definition: String

    /// The list/search sub-line: `short`, else the definition as plain text.
    var summary: String { RichText.plain(short ?? definition) }
}

/// Composer sheet content (SPEC §4.8). Everything past the names is optional, and a malformed
/// optional block is dropped rather than failing the whole composer list.
nonisolated struct Composer: Codable, Hashable, Identifiable, Sendable {
    /// One cell of the facts card. `label` is a key: born, died, symphonies, bestKnownFor
    /// (shown via `composer.fact.<label>`). `value` may contain *italics*.
    struct Fact: Codable, Hashable, Sendable {
        let label: String
        let value: String
    }

    struct Portrait: Codable, Hashable, Sendable {
        /// `hero` rendition; `thumbUrl` / `fullUrl` / `placeholderColor` as for `Painting`.
        let imageUrl: URL?
        var thumbUrl: URL? = nil
        var fullUrl: URL? = nil
        var placeholderColor: String? = nil
        /// Attribution the licence requires (in the response's language) and the licence deed, for
        /// freely licensed (non-PD) portraits.
        var creditLine: String? = nil
        var licenseUrl: URL? = nil
        let sourceUrl: URL?
        let width: Int?
        let height: Int?
        /// CSS object-position y (0–1): the share of the vertical overflow cropped from the top.
        let focalY: Double?
        let artist: String
        let title: String
        let year: String?
        let collection: String?
        let license: String?

        private enum CodingKeys: String, CodingKey {
            case imageUrl, thumbUrl, fullUrl, placeholderColor, creditLine, licenseUrl, sourceUrl, width, height,
                 focalY, artist, title, year, collection, license
        }

        init(from decoder: Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            imageUrl = try c.decodeIfPresent(URL.self, forKey: .imageUrl)
            thumbUrl = try? c.decodeIfPresent(URL.self, forKey: .thumbUrl)
            fullUrl = try? c.decodeIfPresent(URL.self, forKey: .fullUrl)
            placeholderColor = try? c.decodeIfPresent(String.self, forKey: .placeholderColor)
            creditLine = try? c.decodeIfPresent(String.self, forKey: .creditLine)
            licenseUrl = try? c.decodeIfPresent(URL.self, forKey: .licenseUrl)
            sourceUrl = try c.decodeIfPresent(URL.self, forKey: .sourceUrl)
            width = try c.decodeIfPresent(Int.self, forKey: .width)
            height = try c.decodeIfPresent(Int.self, forKey: .height)
            focalY = try c.decodeIfPresent(Double.self, forKey: .focalY)
            artist = try c.decode(String.self, forKey: .artist)
            title = try c.decode(String.self, forKey: .title)
            year = try c.decodeIfPresent(String.self, forKey: .year)
            collection = try c.decodeIfPresent(String.self, forKey: .collection)
            license = try c.decodeIfPresent(String.self, forKey: .license)
        }

        var aspectRatio: CGFloat? {
            guard let width, let height, height > 0 else { return nil }
            return CGFloat(width) / CGFloat(height)
        }
    }

    let id: String
    let name: String
    let shortName: String
    let birthYear: Int?
    let deathYear: Int?
    let era: Era?
    let nationality: String?
    let facts: [Fact]
    let bio: String?
    let portrait: Portrait?

    private enum CodingKeys: String, CodingKey {
        case id, name, shortName, birthYear, deathYear, era, nationality, facts, bio, portrait
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(String.self, forKey: .id)
        name = try c.decode(String.self, forKey: .name)
        shortName = try c.decodeIfPresent(String.self, forKey: .shortName) ?? name
        birthYear = try? c.decodeIfPresent(Int.self, forKey: .birthYear)
        deathYear = try? c.decodeIfPresent(Int.self, forKey: .deathYear)
        era = try? c.decodeIfPresent(Era.self, forKey: .era)
        nationality = try? c.decodeIfPresent(String.self, forKey: .nationality)
        facts = (try? c.decodeIfPresent([Fact].self, forKey: .facts)) ?? []
        bio = try? c.decodeIfPresent(String.self, forKey: .bio)
        portrait = try? c.decodeIfPresent(Portrait.self, forKey: .portrait)
    }
}

// Years are labels, not quantities: never "1,893".
extension PieceSummary { var yearText: String { String(year) } }
extension Piece { var yearText: String { String(year) } }
