import SwiftUI

/// Keşfet / Discover (1.5): the Search tab before anything is typed. Three plates (Composers, Eras,
/// Forms) open browse pages; the glass search field (RootView) is unchanged and its results replace
/// the plates once the field is focused. Design: design/search-browse, canvas
/// https://claude.ai/artifact/1nx3ogpBs8uW2EYuzZwaHq (decisions 28 Nov 2026 in backlog.md).
/// Browsing is open to everyone; locked pieces behave as in the Library (lock on the row, paywall
/// on tap). Typing stays Premium.
enum BrowseRoute: Hashable {
    case composers, eras, era(Era), forms, form(PieceForm)
}

/// The pictures: each a piece's own painting (bundled with the app, so unpublished pieces work too).
enum BrowseArt {
    static let eras: [Era] = [.renaissance, .baroque, .classical, .romantic, .lateRomantic, .modern]

    /// Four paintings per era, in date order: paired with a piece by a composer of that era and
    /// painted in it. The Renaissance borrows Giorgione's *Tempest* from Vivaldi's Summer.
    static let eraCollage: [Era: [String]] = [
        .renaissance: ["vivaldi-four-seasons-summer", "palestrina-missa-papae-marcelli", "tallis-spem-in-alium"],
        .baroque: ["vivaldi-four-seasons-winter", "vivaldi-four-seasons-autumn", "bach-keyboard-concerto-5", "bach-orchestral-suite-3"],
        .classical: ["haydn-symphony-104", "mozart-piano-concerto-21", "mozart-symphony-40", "beethoven-piano-sonata-8"],
        .romantic: ["schubert-symphony-8", "berlioz-symphonie-fantastique", "mendelssohn-hebrides-overture", "chopin-piano-sonata-3"],
        .lateRomantic: ["dvorak-symphony-7", "tchaikovsky-symphony-6", "rachmaninoff-piano-concerto-2", "mahler-symphony-5"],
        .modern: ["bartok-concerto-for-orchestra", "ravel-daphnis-et-chloe-suite-2", "prokofiev-symphony-5", "erkin-violin-concerto"],
    ]
    /// The Eras plate: one painting per era, oldest first (Raphael, Vermeer, Fragonard, Friedrich, Monet, Bakst).
    static let erasPlate = ["palestrina-missa-papae-marcelli", "bach-keyboard-concerto-5", "mozart-piano-concerto-21",
                            "schubert-symphony-8", "dvorak-symphony-7", "ravel-daphnis-et-chloe-suite-2"]

    /// Music in paintings: people making music, one painting per form.
    static let formImage: [PieceForm: String] = [
        .symphony: "bach-brandenburg-concerto-5",                 // Menzel, The Flute Concert
        .orchestral: "tchaikovsky-swan-lake",                     // Degas, The Ballet Class
        .pianoConcerto: "liszt-piano-concerto-1",                 // Danhauser, Liszt at the Piano
        .violinConcerto: "mahler-symphony-4",                     // Böcklin (to review)
        .celloConcerto: "haydn-cello-concerto-1",                 // Zoffany, The Gore Family
        .concerto: "haydn-trumpet-concerto",                      // Brueghel and Rubens, Hearing
        .stringQuartet: "bach-brandenburg-concerto-3",            // Longhi, The Little Concert
        .chamber: "bach-double-violin-concerto",                  // Mercier, The Sense of Hearing
        .pianoSonata: "shostakovich-piano-concerto-2",            // Renoir, Two Young Girls at the Piano
        .sonata: "saint-saens-introduction-and-rondo-capriccioso", // Degas, Pagans and De Gas
        .choral: "saint-saens-symphony-3",                        // Lerolle, The Organ Rehearsal
    ]
    /// The Forms plate: orchestra, piano, chamber, voices.
    static let formsPlate = ["bach-brandenburg-concerto-5", "liszt-piano-concerto-1", "bach-double-violin-concerto", "saint-saens-symphony-3"]
    /// The Composers plate.
    static let composersPlate = ["bach", "mozart", "beethoven", "tchaikovsky"]

    /// A piece's painting in one rendition: bundled with the app if it is there, else the server's
    /// (many pieces bundle only the thumb, and the image pipeline derives one rendition's file
    /// name from another's, so a thumb file must not stand in for a hero).
    static func painting(_ pieceID: String, thumb: Bool = false) -> URL? {
        let v = thumb ? "thumb" : "hero"
        return Bundle.main.url(forResource: "\(pieceID)-\(v)", withExtension: "heic", subdirectory: "Artwork/paintings")
            ?? APIClient.shared.baseURL.appending(path: "images/paintings/\(pieceID)-\(v).heic")
    }
}

extension Era {
    var datesKey: LocalizedStringKey { LocalizedStringKey("era.dates." + rawValue) }
    var lineKey: LocalizedStringKey { LocalizedStringKey("era.line." + rawValue) }
}

// MARK: - Home (the three plates)

struct BrowseHome: View {
    @Environment(AppRouter.self) private var router
    @Environment(ContentStore.self) private var content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("browse.title")
                .font(Typography.display)
                .tracking(-0.34)
                .foregroundStyle(Palette.ink)
                .accessibilityAddTraits(.isHeader)
            VStack(spacing: 22) {
                plate(BrowseArt.composersPlate.map { composerPortrait($0) },
                      title: "browse.composers", meta: Text("browse.composers.meta"), route: .composers)
                plate(BrowseArt.erasPlate.map { (BrowseArt.painting($0), UnitPoint.center) },
                      title: "browse.eras", meta: Text("browse.eras.meta"), route: .eras)
                plate(BrowseArt.formsPlate.map { (BrowseArt.painting($0), UnitPoint.center) },
                      title: "browse.forms", meta: Text("browse.forms.meta"), route: .forms)
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func composerPortrait(_ id: String) -> (URL?, UnitPoint) {
        let p = content.composers[id]?.portrait
        return (p?.imageUrl, UnitPoint(x: 0.5, y: p?.focalY ?? 0.25))
    }

    private func plate(_ images: [(URL?, UnitPoint)], title: LocalizedStringKey, meta: Text, route: BrowseRoute) -> some View {
        Button { router.searchPath.append(route) } label: {
            BrowsePlate(images: images, height: 124, title: Text(title), meta: meta)
        }
        .buttonStyle(.plain)
    }
}

/// A strip of paintings over a label: name (Literata 20), meta (13), chevron.
struct BrowsePlate: View {
    let images: [(URL?, UnitPoint)]
    let height: CGFloat
    let title: Text
    let meta: Text

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            BrowseStrip(images: images, height: height)
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 1) {
                    title
                        .font(Typography.titleS)
                        .foregroundStyle(Palette.ink)
                    meta
                        .font(Typography.meta13)
                        .foregroundStyle(Palette.ink2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Chevron()
            }
        }
        .contentShape(.rect)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
    }
}

struct BrowseStrip: View {
    let images: [(URL?, UnitPoint)]
    let height: CGFloat

    var body: some View {
        HStack(spacing: 2) {
            ForEach(Array(images.enumerated()), id: \.offset) { _, image in
                PaintingImage(url: image.0, focus: image.1)
            }
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .clipShape(.rect(cornerRadius: 16, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).strokeBorder(Palette.rule, lineWidth: 0.5))
        .accessibilityHidden(true)
    }
}

private struct Chevron: View {
    var body: some View {
        Image("chevron-forward-small").renderingMode(.template).resizable().scaledToFit()
            .frame(width: 8, height: 14)
            .foregroundStyle(Palette.ink3)
            .accessibilityHidden(true)
    }
}

// MARK: - Shared

/// "a · b · c" from localized pieces (Text interpolation, as `+` is deprecated in iOS 26).
func joined(_ parts: [Text]) -> Text {
    guard var result = parts.first else { return Text(verbatim: "") }
    for part in parts.dropFirst() { result = Text("\(result) · \(part)") }
    return result
}

/// Published pieces, today's first, then by the year written.
@MainActor
private func browsePieces(_ content: ContentStore, where keep: (PieceSummary) -> Bool) -> [PieceSummary] {
    let pieces = (content.library.value ?? []).filter(keep).sorted { a, b in
        if a.id == content.todayID { return true }
        if b.id == content.todayID { return false }
        return a.year != b.year ? a.year < b.year : a.title < b.title
    }
    return pieces
}

private struct BrowsePieceList: View {
    let pieces: [PieceSummary]
    @Environment(ContentStore.self) private var content
    @Environment(EntitlementStore.self) private var entitlements
    @Environment(AppRouter.self) private var router

    var body: some View {
        VStack(spacing: 0) {
            ForEach(pieces) { piece in
                let locked = content.isLocked(piece.id, premium: entitlements.isPremium)
                LibraryRow(piece: piece, isToday: piece.id == content.todayID, isLocked: locked,
                           isBirthdayGift: !entitlements.isPremium && content.isBirthdayGift(piece.id)) {
                    if locked { router.present(.paywall) } else { router.searchPath.append(PieceRoute(id: piece.id)) }
                }
            }
        }
    }
}

/// "Kitaplık'ta göster": the Library with this filter set.
private struct ShowInLibrary: View {
    let request: AppRouter.LibraryFilter
    @Environment(AppRouter.self) private var router

    var body: some View {
        Button {
            router.libraryFilter = request
            router.tab = .library
        } label: {
            HStack {
                Text("browse.showInLibrary")
                    .font(Typography.body15.weight(.semibold))
                    .foregroundStyle(Palette.accent)
                Spacer()
                Chevron()
            }
            .padding(.vertical, 14)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .hairlineTop()
    }
}

private struct PageTitle: View {
    let text: Text
    var body: some View {
        text
            .font(Typography.display)
            .tracking(-0.34)
            .foregroundStyle(Palette.ink)
            .fixedSize(horizontal: false, vertical: true)
            .accessibilityAddTraits(.isHeader)
    }
}

/// Scroll page with the app's gutter, background and back-button title.
private struct BrowsePage<Content: View>: View {
    let navTitle: Text
    @ViewBuilder let content: Content

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) { content }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, Spacing.pageGutter)
                .padding(.top, 8)
                .padding(.bottom, 40)
        }
        .background(Palette.background)
        .navigationTitle(navTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(removing: .title)
    }
}

// MARK: - Composers

struct BrowseComposersPage: View {
    enum Sort: Hashable { case az, era }
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router
    @State private var sort: Sort = .az

    var body: some View {
        BrowsePage(navTitle: Text("browse.composers")) {
            PageTitle(text: Text("browse.composers"))
            GlassSegmented(segments: [
                .init(value: Sort.az, label: Text("browse.sort.az"), accessibilityLabel: nil),
                .init(value: Sort.era, label: Text("browse.sort.era"), accessibilityLabel: nil),
            ], selection: $sort.animation(.easeOut(duration: 0.2)))
            .fixedSize()
            .padding(.top, 18)
            .padding(.bottom, 8)
            switch sort {
            case .az:
                ForEach(sorted(Array(content.composers.values)), id: \.id) { row($0) }
            case .era:
                ForEach(BrowseArt.eras, id: \.self) { era in
                    let list = content.composers.values.filter { $0.era == era }
                        .sorted { ($0.birthYear ?? 0) < ($1.birthYear ?? 0) }
                    if !list.isEmpty {
                        joined([Text(era.titleKey), Text(era.datesKey)])
                            .font(Typography.sectionLabel)
                            .tracking(0.6)
                            .textCase(.uppercase)
                            .foregroundStyle(Palette.ink2)
                            .padding(.top, 26)
                            .padding(.bottom, 10)
                        ForEach(list, id: \.id) { row($0) }
                    }
                }
            }
        }
    }

    private func sorted(_ list: [Composer]) -> [Composer] {
        let locale = Locale(identifier: content.language)
        return list.sorted { $0.shortName.compare($1.shortName, locale: locale) == .orderedAscending }
    }

    private func row(_ c: Composer) -> some View {
        let count = (content.library.value ?? []).filter { $0.composer.id == c.id }.count
        return BrowseComposerRow(composer: c, pieceCount: count) {
            router.present(.composer(ComposerRef(id: c.id, name: c.name, shortName: c.shortName)))
        }
    }
}

struct BrowseComposerRow: View {
    let composer: Composer
    let pieceCount: Int
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                ComposerThumb(composer: composer, size: 56)
                VStack(alignment: .leading, spacing: 3) {
                    meta
                        .font(Typography.meta13)
                        .foregroundStyle(Palette.ink2)
                    Text(verbatim: composer.name)
                        .font(Typography.rowTitleS)
                        .foregroundStyle(Palette.ink)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Chevron()
            }
            .padding(.vertical, 12)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .hairlineTop()
        .accessibilityElement(children: .combine)
        .accessibilityHint(Text("common.composerLink.accessibilityHint"))
    }

    private var meta: Text {
        var parts: [Text] = []
        if let b = composer.birthYear, let d = composer.deathYear { parts.append(Text("composer.lifespan \(String(b)) \(String(d))")) }
        if let n = composer.nationality, !n.isEmpty { parts.append(Text(verbatim: n)) }
        if pieceCount > 0 { parts.append(Text("browse.count.pieces \(pieceCount)")) }
        return joined(parts)
    }
}

/// The composer's portrait (face-centred), or, for composers with no usable portrait (Pachelbel,
/// Barber, Rodrigo), a card: the initial in Literata on their era's colour.
struct ComposerThumb: View {
    let composer: Composer
    var size: CGFloat = 56

    var body: some View {
        Group {
            if let p = composer.portrait, let url = p.thumbUrl ?? p.imageUrl {
                PaintingImage(url: url, focus: UnitPoint(x: 0.5, y: p.focalY ?? 0.25), variant: .thumb)
            } else {
                ComposerInitialCard(composer: composer, size: size)
            }
        }
        .frame(width: size, height: size)
        .clipShape(.rect(cornerRadius: Radius.thumbM, style: .continuous))
        .accessibilityHidden(true)
    }
}

struct ComposerInitialCard: View {
    let composer: Composer
    let size: CGFloat

    /// Quiet, painting-like tones per era, dark enough for a light initial in both themes.
    private static func tone(_ era: Era?) -> Color {
        switch era {
        case .renaissance: Color(red: 0.54, green: 0.44, blue: 0.30)
        case .baroque: Color(red: 0.42, green: 0.31, blue: 0.24)
        case .classical: Color(red: 0.37, green: 0.44, blue: 0.47)
        case .romantic: Color(red: 0.36, green: 0.40, blue: 0.31)
        case .lateRomantic: Color(red: 0.43, green: 0.33, blue: 0.41)
        case .modern: Color(red: 0.31, green: 0.35, blue: 0.40)
        default: Color(red: 0.43, green: 0.42, blue: 0.39)
        }
    }

    var body: some View {
        let tone = Self.tone(composer.era)
        ZStack {
            LinearGradient(colors: [tone.mix(with: .white, by: 0.08), tone.mix(with: .black, by: 0.18)],
                           startPoint: .top, endPoint: .bottom)
            RoundedRectangle(cornerRadius: max(2, Radius.thumbM - size * 0.08), style: .continuous)
                .strokeBorder(Color.white.opacity(0.22), lineWidth: 0.75)
                .padding(size * 0.08)
            Text(verbatim: String(composer.shortName.prefix(1)))
                .font(Typography.literata(size * 0.46, .medium))
                .foregroundStyle(Color(red: 0.96, green: 0.95, blue: 0.93))
                .offset(y: -size * 0.02)
        }
    }
}

// MARK: - Eras

struct BrowseErasPage: View {
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router

    var body: some View {
        BrowsePage(navTitle: Text("browse.eras")) {
            PageTitle(text: Text("browse.eras"))
            VStack(spacing: 22) {
                ForEach(BrowseArt.eras, id: \.self) { era in
                    Button { router.searchPath.append(BrowseRoute.era(era)) } label: {
                        BrowsePlate(images: (BrowseArt.eraCollage[era] ?? []).map { (BrowseArt.painting($0), .center) },
                                    height: 110, title: Text(era.titleKey), meta: meta(era))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 20)
        }
    }

    private func meta(_ era: Era) -> Text {
        // Published pieces only: composers are listed before their pieces are published.
        let pieces = (content.library.value ?? []).filter { $0.era == era }.count
        var parts = [Text(era.datesKey)]
        if pieces > 0 { parts.append(Text("browse.count.pieces \(pieces)")) }
        return joined(parts)
    }
}

struct BrowseEraPage: View {
    let era: Era
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router

    var body: some View {
        let pieces = browsePieces(content) { $0.era == era }
        let composers = content.composers.values.filter { $0.era == era }.sorted { ($0.birthYear ?? 0) < ($1.birthYear ?? 0) }
        BrowsePage(navTitle: Text(era.titleKey)) {
            BrowseStrip(images: (BrowseArt.eraCollage[era] ?? []).map { (BrowseArt.painting($0), .center) }, height: 124)
            Text(era.titleKey)
                .font(Typography.titleXL)
                .foregroundStyle(Palette.ink)
                .accessibilityAddTraits(.isHeader)
                .padding(.top, 22)
            Text(era.datesKey)
                .font(Typography.meta14)
                .foregroundStyle(Palette.ink2)
                .padding(.top, 6)
            Text(era.lineKey)
                .font(Typography.reading)
                .lineHeight(1.5)
                .foregroundStyle(Palette.ink)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 14)

            SectionLabel("browse.composers").padding(.top, 30).padding(.bottom, 14)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 14) {
                    ForEach(composers, id: \.id) { c in
                        Button {
                            router.present(.composer(ComposerRef(id: c.id, name: c.name, shortName: c.shortName)))
                        } label: {
                            VStack(spacing: 8) {
                                ComposerThumb(composer: c, size: 72)
                                // One line, never broken inside a name ("Mendelssohn"):
                                // shrinks a little, and the column is a little wider than the portrait.
                                Text(verbatim: c.shortName)
                                    .font(Typography.meta13)
                                    .foregroundStyle(Palette.ink)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.75)
                                    .frame(width: 92)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .scrollClipDisabled()

            HStack(alignment: .firstTextBaseline) {
                SectionLabel("search.group.pieces")
                Spacer()
                if !pieces.isEmpty {
                    Text("browse.count.pieces \(pieces.count)").font(Typography.meta13).foregroundStyle(Palette.ink2)
                }
            }
            .padding(.top, 30).padding(.bottom, 10)
            if pieces.isEmpty {
                Text("browse.era.empty")
                    .font(Typography.body15)
                    .foregroundStyle(Palette.ink2)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.vertical, 12)
                    .hairlineTop()
            } else {
                BrowsePieceList(pieces: pieces)
                ShowInLibrary(request: .init(era: era))
            }
        }
    }
}

// MARK: - Forms

struct BrowseFormsPage: View {
    @Environment(ContentStore.self) private var content
    @Environment(AppRouter.self) private var router

    var body: some View {
        let library = content.library.value ?? []
        let forms = PieceForm.allCases.filter { f in f != .other && library.contains { $0.kind == f } }
        BrowsePage(navTitle: Text("browse.forms")) {
            PageTitle(text: Text("browse.forms"))
            VStack(spacing: 0) {
                ForEach(forms, id: \.self) { form in
                    Button { router.searchPath.append(BrowseRoute.form(form)) } label: {
                        HStack(spacing: 14) {
                            PieceThumbnail(url: BrowseArt.formImage[form].map { BrowseArt.painting($0, thumb: true) } ?? nil, size: 56)
                            VStack(alignment: .leading, spacing: 3) {
                                Text(form.titleKey)
                                    .font(Typography.rowTitleS)
                                    .foregroundStyle(Palette.ink)
                                Text("browse.count.pieces \(library.filter { $0.kind == form }.count)")
                                    .font(Typography.meta13)
                                    .foregroundStyle(Palette.ink2)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Chevron()
                        }
                        .padding(.vertical, 12)
                        .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .hairlineTop()
                    .accessibilityElement(children: .combine)
                }
            }
            .padding(.top, 20)
            Text("browse.forms.footer")
                .font(Typography.meta13)
                .foregroundStyle(Palette.ink3)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 16)
                .hairlineTop()
        }
    }
}

struct BrowseFormPage: View {
    let form: PieceForm
    @Environment(ContentStore.self) private var content

    var body: some View {
        let pieces = browsePieces(content) { $0.kind == form }
        BrowsePage(navTitle: Text(form.titleKey)) {
            PageTitle(text: Text(form.titleKey))
            Text("browse.form.meta \(pieces.count)")
                .font(Typography.meta14)
                .foregroundStyle(Palette.ink2)
                .padding(.top, 10)
                .padding(.bottom, 16)
            BrowsePieceList(pieces: pieces)
            if !pieces.isEmpty { ShowInLibrary(request: .init(form: form)) }
        }
    }
}
