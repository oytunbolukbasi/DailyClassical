import SwiftUI
import UIKit

/// The share image, "Wall label" direction (design/birthdays-sharing D1-*): the painting hangs whole,
/// never cropped, with a museum label underneath (or beside it, for an upright painting in a post).
/// Laid out in points at export pixels (1080 wide) and rendered at scale 1 by `ShareCardRenderer`;
/// the app shows it scaled down (`ShareCardPreview`). Always on light paper, whatever the theme.
struct ShareCardView: View {
    let card: ShareCard
    let format: ShareFormat
    /// The decoded painting; nil draws its average colour in its place (still loading).
    var image: UIImage?
    /// The painting could not be loaded (offline, not bundled): a label without it, rather than a
    /// flat block of colour.
    var hidesPainting = false

    private var hasPlate: Bool { card.caption != nil && !hidesPainting }
    private var aspect: CGFloat {
        if let image, image.size.height > 0 { return image.size.width / image.size.height }
        return card.aspectRatio ?? 4 / 3
    }
    private var isPortrait: Bool { aspect < 1 }
    private var isMoment: Bool { card.kind == .moment }

    var body: some View {
        Group {
            switch format {
            case .story: story
            case .post:
                if hasPlate && isPortrait { postBeside } else { postStacked }
            }
        }
        .frame(width: format.size.width, height: format.size.height, alignment: .topLeading)
        .background(CardInk.paper)
        .environment(\.colorScheme, .light)
        .dynamicTypeSize(.large)  // export pixels: never scaled by the reader's text size
    }

    // MARK: Layouts

    /// 1080 × 1920: label centred in the space above the footer.
    private var story: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer(minLength: 0)
            VStack(alignment: .leading, spacing: 0) {
                if hasPlate {
                    plate(max: isPortrait ? CGSize(width: 912, height: 600) : CGSize(width: 912, height: 760))
                    caption.padding(.top, 18)
                }
                if isMoment {
                    momentLabel(time: 26, timeGap: hasPlate ? (isPortrait ? 64 : 60) : 0, quote: 64, quoteGap: 16,
                                happening: 30, happeningGap: 22, ruleGap: 44, composer: 32, composerGap: 32, from: 28, fromGap: 6)
                } else {
                    pieceLabel(composer: 32, composerGap: hasPlate ? (isPortrait ? 52 : 56) : 0, title: 66, titleLine: 1.12, titleGap: 10,
                               hook: 38, hookGap: 18, ruleGap: isPortrait ? 38 : 40, time: 26, timeGap: isPortrait ? 32 : 34, hear: 40, hearGap: 10)
                }
            }
            .layoutPriority(1)
            Spacer(minLength: 40)
            footer
        }
        .padding(.vertical, 250)
        .padding(.horizontal, 84)
    }

    /// 1080 × 1350, a landscape painting: full width at the top, the label under it.
    private var postStacked: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                if hasPlate {
                    plate(max: CGSize(width: 936, height: 700))
                    caption.padding(.top, 14)
                }
                if isMoment {
                    let top: CGFloat = hasPlate ? 34 : 0
                    timeText(24).padding(.top, top)
                    quoteText(54, line: 1.18).padding(.top, 10)
                    happeningText(28).padding(.top, 14)
                    inlineFrom(28).padding(.top, 26)
                } else {
                    pieceLabel(composer: 32, composerGap: hasPlate ? 28 : 0, title: 50, titleLine: 1.12, titleGap: 6,
                               hook: 32, hookGap: 12, ruleGap: 24, time: 24, timeGap: 22, hear: 34, hearGap: 6)
                }
            }
            .layoutPriority(1)
            Spacer(minLength: 32)
            footer
        }
        .padding(72)
    }

    /// 1080 × 1350, an upright painting: painting on the left, label beside it.
    private var postBeside: some View {
        let box = isMoment ? CGSize(width: 440, height: 721) : CGSize(width: 500, height: 820)
        let size = PlateLayout.fit(aspect, in: box)
        return VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 56) {
                VStack(alignment: .leading, spacing: 0) {
                    plateImage.frame(width: size.width, height: size.height)
                    caption.frame(width: size.width, alignment: .leading).padding(.top, 16)
                }
                VStack(alignment: .leading, spacing: 0) {
                    if isMoment {
                        momentLabel(time: 22, timeGap: 0, quote: 46, quoteLine: 1.2, quoteGap: 12, happening: 26, happeningGap: 18,
                                    ruleGap: 30, composer: 26, composerGap: 24, from: 26, fromGap: 4)
                    } else {
                        pieceLabel(composer: 28, composerGap: 0, title: 46, titleLine: 1.14, titleGap: 10,
                                   hook: 30, hookGap: 16, ruleGap: 30, time: 22, timeGap: 26, hear: 32, hearGap: 8)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: .infinity)
            footer
        }
        .padding(72)
    }

    // MARK: Labels

    /// Composer, title, hook, then the stop: rule, time line, "What you hear".
    @ViewBuilder
    private func pieceLabel(composer: CGFloat, composerGap: CGFloat, title: CGFloat, titleLine: CGFloat, titleGap: CGFloat,
                            hook: CGFloat, hookGap: CGFloat, ruleGap: CGFloat, time: CGFloat, timeGap: CGFloat,
                            hear: CGFloat, hearGap: CGFloat) -> some View {
        composerText(composer).padding(.top, composerGap)
        titleText(title, line: titleLine).padding(.top, titleGap)
        hookText(hook).padding(.top, hookGap)
        if card.timeLine != nil {
            rule.padding(.top, ruleGap)
            timeText(time).padding(.top, timeGap)
            hearText(hear).padding(.top, hearGap)
        }
    }

    /// The moment first: time line, the quoted line, what is happening; then composer and title.
    @ViewBuilder
    private func momentLabel(time: CGFloat, timeGap: CGFloat, quote: CGFloat, quoteLine: CGFloat = 1.18, quoteGap: CGFloat,
                             happening: CGFloat, happeningGap: CGFloat, ruleGap: CGFloat, composer: CGFloat, composerGap: CGFloat,
                             from: CGFloat, fromGap: CGFloat) -> some View {
        timeText(time).padding(.top, timeGap)
        quoteText(quote, line: quoteLine).padding(.top, quoteGap)
        happeningText(happening).padding(.top, happeningGap)
        rule.padding(.top, ruleGap)
        composerText(composer).padding(.top, composerGap)
        Text(verbatim: card.title).font(Self.sf(from, .regular)).lineHeight(1.35).foregroundStyle(CardInk.ink)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, fromGap)
    }

    private func composerText(_ size: CGFloat) -> some View {
        Text(verbatim: card.composer).font(Self.sf(size, .medium)).lineHeight(1.2).foregroundStyle(CardInk.accent)
            .fixedSize(horizontal: false, vertical: true)
    }

    private func titleText(_ size: CGFloat, line: CGFloat) -> some View {
        Text(verbatim: card.title).font(Self.literata(size, .medium)).tracking(-size * 0.01)
            .lineHeight(line, literata: size).foregroundStyle(CardInk.ink)
            .fixedSize(horizontal: false, vertical: true)
    }

    private func hookText(_ size: CGFloat) -> some View {
        Text(verbatim: card.hook).font(Self.literata(size).italic()).lineHeight(1.4, literata: size).foregroundStyle(CardInk.ink2)
            .fixedSize(horizontal: false, vertical: true)
    }

    @ViewBuilder private func timeText(_ size: CGFloat) -> some View {
        if let line = card.timeLine {
            Text(verbatim: line).font(Self.sf(size, .semibold)).monospacedDigit().tracking(size * 0.06).lineHeight(1.2)
                .foregroundStyle(CardInk.accent)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    @ViewBuilder private func hearText(_ size: CGFloat) -> some View {
        if let hear = card.hear {
            Text(verbatim: hear).font(Self.literata(size, .medium)).lineHeight(1.32, literata: size).foregroundStyle(CardInk.ink)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    @ViewBuilder private func quoteText(_ size: CGFloat, line: CGFloat) -> some View {
        if let hear = card.hear {
            Text(verbatim: hear).font(Self.literata(size, .medium)).tracking(-size * 0.01).lineHeight(line, literata: size)
                .foregroundStyle(CardInk.ink)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    @ViewBuilder private func happeningText(_ size: CGFloat) -> some View {
        if let happening = card.happening, !happening.isEmpty {
            Text(verbatim: happening).font(Self.sf(size, .regular)).lineHeight(1.4).foregroundStyle(CardInk.ink2)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    /// "**Wolfgang Amadeus Mozart** · Symphony No. 40 in G minor" (landscape post, moment).
    private func inlineFrom(_ size: CGFloat) -> some View {
        var composer = AttributedString(card.composer)
        composer.font = Self.sf(size, .medium)
        composer.foregroundColor = CardInk.accent
        let text = composer + AttributedString(" · \(card.title)")
        return Text(text).font(Self.sf(size, .regular)).lineHeight(1.35).foregroundStyle(CardInk.ink2)
            .fixedSize(horizontal: false, vertical: true)
    }

    /// "Isaac Levitan, *Above Eternal Peace*, 1894"
    @ViewBuilder private var caption: some View {
        if let c = card.caption {
            let title: AttributedString = {
                var t = AttributedString(c.title)
                t.font = Self.sf(22, .regular).italic()
                return t
            }()
            Text(AttributedString("\(c.artist), ") + title + AttributedString(", \(c.year)"))
                .font(Self.sf(22, .regular)).lineHeight(1.4).foregroundStyle(CardInk.ink3)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var rule: some View {
        Rectangle().fill(CardInk.rule).frame(height: 1).frame(maxWidth: .infinity)
    }

    private var footer: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(verbatim: "DailyClassical").font(Self.literata(36, .medium)).foregroundStyle(CardInk.ink)
            Spacer(minLength: 24)
            Text(verbatim: "dailyclassical.co").font(Self.sf(26, .medium)).foregroundStyle(CardInk.ink2)
        }
    }

    // MARK: Painting

    /// The painting at the largest size inside `max` that the label leaves room for.
    private func plate(max: CGSize) -> some View {
        PlateLayout(aspect: aspect, maxSize: max) { plateImage }
    }

    /// Hung on the paper: a 1 px ring and a soft drop shadow (`.sc-plate`).
    private var plateImage: some View {
        Group {
            if let image {
                Image(uiImage: image).resizable().interpolation(.high)
            } else {
                ImagePipeline.shared.placeholderColor(for: card.imageURL) ?? CardInk.ink.opacity(0.08)
            }
        }
        .overlay { Rectangle().strokeBorder(CardInk.rule, lineWidth: 1).padding(-1) }
        .background {
            Rectangle().fill(CardInk.paper)
                .shadow(color: Color(red: 0x1E / 255, green: 0x1B / 255, blue: 0x17 / 255).opacity(0.22), radius: 30, y: 28)
        }
    }

    // MARK: Type (fixed sizes: export pixels)

    static func literata(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Font {
        .custom("Literata", fixedSize: size).weight(weight)
    }

    static func sf(_ size: CGFloat, _ weight: Font.Weight) -> Font {
        .system(size: size, weight: weight)
    }
}

/// The card's light paper tokens (project_information.md §8.3, light column). Fixed, never
/// theme-following: the card is seen in someone else's feed.
enum CardInk {
    static let paper = Color(red: 0xF5 / 255, green: 0xF2 / 255, blue: 0xEC / 255)
    static let ink = Color(red: 0x1E / 255, green: 0x1B / 255, blue: 0x17 / 255)
    static let ink2 = Color(red: 0x5E / 255, green: 0x58 / 255, blue: 0x52 / 255)
    static let ink3 = Color(red: 0x8A / 255, green: 0x83 / 255, blue: 0x7B / 255)
    static let rule = ink.opacity(0.12)
    static let accent = Color(red: 0x6B / 255, green: 0x4A / 255, blue: 0x2B / 255)
}

/// Sizes its one subview to `aspect` at the largest size inside both `maxSize` and the space
/// offered, so a long label shrinks the painting instead of running off the card (never a crop).
struct PlateLayout: Layout {
    let aspect: CGFloat
    let maxSize: CGSize

    static func fit(_ aspect: CGFloat, in box: CGSize) -> CGSize {
        guard aspect > 0, box.width > 0, box.height > 0 else { return .zero }
        let width = min(box.width, box.height * aspect)
        return CGSize(width: width.rounded(), height: (width / aspect).rounded())
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let box = CGSize(width: min(proposal.width ?? maxSize.width, maxSize.width),
                         height: min(proposal.height ?? maxSize.height, maxSize.height))
        return Self.fit(aspect, in: box)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for subview in subviews { subview.place(at: bounds.origin, proposal: ProposedViewSize(bounds.size)) }
    }
}

/// The card scaled into a box `height` points tall (coda block, preview sheet).
struct ShareCardPreview: View {
    let card: ShareCard
    let format: ShareFormat
    var image: UIImage?
    var hidesPainting = false
    let height: CGFloat

    var body: some View {
        let scale = height / format.size.height
        ShareCardView(card: card, format: format, image: image, hidesPainting: hidesPainting)
            .scaleEffect(scale, anchor: .topLeading)
            .frame(width: (format.size.width * scale).rounded(), height: height, alignment: .topLeading)
            .clipped()
            .allowsHitTesting(false)
            .accessibilityHidden(true)
    }
}

/// `ShareCardPreview` that loads the painting itself (the coda block's live preview).
struct ShareCardThumbnail: View {
    let card: ShareCard
    var format: ShareFormat = .post
    let height: CGFloat
    @Environment(\.displayScale) private var displayScale

    var body: some View {
        let scale = height / format.size.height
        CachedImage(url: card.imageURL, variant: .hero, size: CGSize(width: 936 * scale, height: 936 * scale),
                    scale: displayScale, contentMode: .fit) { image in
            ShareCardPreview(card: card, format: format, image: image, height: height)
        } placeholder: {
            ShareCardPreview(card: card, format: format, image: nil, height: height)
        }
    }
}

enum ShareCardRenderer {
    /// The painting decoded for the card: at most 1024 px on its long side (the card draws it at
    /// up to 936 × 700 or 500 × 820 px). Bundled hero first, else downloaded (ImagePipeline).
    static func painting(for card: ShareCard) async -> UIImage? {
        guard let request = ImagePipeline.shared.request(for: card.imageURL, variant: .hero,
                                                         size: CGSize(width: 1024, height: 1024), scale: 1, contentMode: .fit)
        else { return nil }
        return await ImagePipeline.shared.image(for: request)
    }

    /// The share image at export size (1080 × 1920 or 1080 × 1350 px).
    static func image(card: ShareCard, format: ShareFormat, painting: UIImage?, hidesPainting: Bool = false) -> UIImage? {
        let renderer = ImageRenderer(content: ShareCardView(card: card, format: format, image: painting, hidesPainting: hidesPainting))
        renderer.scale = 1
        renderer.isOpaque = true
        renderer.proposedSize = ProposedViewSize(format.size)
        return renderer.uiImage
    }
}
