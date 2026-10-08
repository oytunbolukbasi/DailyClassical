import SwiftUI

/// "THE BIG PICTURE": SF 12/600, +0.1em, uppercase, ink2. Stored in sentence case so it translates.
struct SectionLabel: View {
    let text: Text
    var color: Color = Palette.ink2

    init(_ key: LocalizedStringKey, color: Color = Palette.ink2) {
        text = Text(key)
        self.color = color
    }

    init(verbatim: String, color: Color = Palette.ink2) {
        text = Text(verbatim: verbatim)
        self.color = color
    }

    var body: some View {
        text
            .font(Typography.sectionLabel)
            .tracking(1.2)
            .textCase(.uppercase)
            .foregroundStyle(color)
            .accessibilityAddTraits(.isHeader)
    }
}

/// "Isaac Levitan, *Above Eternal Peace*, 1894. State Tretyakov Gallery, Moscow."
struct PaintingCaption: View {
    let painting: Painting
    var withDash = false

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            if withDash {
                Rectangle().fill(Palette.ink3).frame(width: 14, height: 1).alignmentGuide(.firstTextBaseline) { _ in -1 }
            }
            Text(painting.credit)
                .font(Typography.caption)
                .lineHeight(1.4)
                .foregroundStyle(Palette.ink3)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

extension Painting {
    /// "Isaac Levitan, *Above Eternal Peace*, 1894. State Tretyakov Gallery, Moscow." (title in italics)
    var credit: AttributedString {
        var italicTitle = AttributedString(title)
        italicTitle.inlinePresentationIntent = .emphasized
        return AttributedString("\(artist), ") + italicTitle + AttributedString(", \(yearLabel). \(collection).")
    }
}

/// Composer name in accent with a small chevron; opens the composer sheet.
struct ComposerLink: View {
    let name: String
    var font: Font = Typography.composerLink
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Text(verbatim: name).font(font).tracking(-0.2)
                Image("chevron-forward-small").renderingMode(.template).resizable().scaledToFit()
                    .frame(width: 8, height: 12).opacity(0.7)
            }
            .foregroundStyle(Palette.accent)
            .padding(.vertical, 4)  // taller hit target…
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .padding(.vertical, -4)  // …that doesn't push the layout
        .accessibilityHint(Text("common.composerLink.accessibilityHint"))
    }
}

/// 135° diagonal stripes, 6 pt bands: the placeholder behind every image.
struct StripePlaceholder: View {
    var body: some View {
        Canvas { context, size in
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Palette.stripeB))
            let band: CGFloat = 6 * 2.squareRoot()
            var x: CGFloat = -size.height
            var path = Path()
            while x < size.width + size.height {
                path.move(to: CGPoint(x: x, y: size.height))
                path.addLine(to: CGPoint(x: x + size.height, y: 0))
                path.addLine(to: CGPoint(x: x + size.height + band, y: 0))
                path.addLine(to: CGPoint(x: x + band, y: size.height))
                path.closeSubpath()
                x += band * 2
            }
            context.fill(path, with: .color(Palette.stripeA))
        }
        .accessibilityHidden(true)
    }
}

/// A painting (or portrait) filling its frame: `.fill` is CSS `object-fit: cover` with `focus` as
/// `object-position` (the share of the overflow cropped from the leading/top edge), `.fit` is
/// centered. Shows the image's average colour (or the stripes, for unknown images) until it is
/// decoded, then fades in. Use `variant: .thumb` for thumbnails of 64 pt and smaller. The image is
/// decoded at the pixel size of its frame (ImagePipeline), not at a fixed maximum.
struct PaintingImage: View {
    let url: URL?
    var focus: UnitPoint = .center
    var contentMode: ContentMode = .fill
    var variant: ImageVariant = .hero
    @Environment(\.displayScale) private var displayScale

    var body: some View {
        placeholder
            .overlay {
                GeometryReader { geo in
                    CachedImage(url: url, variant: variant, size: geo.size, scale: displayScale, contentMode: contentMode) { image in
                        let rect = Self.rect(for: image.size, in: geo.size, focus: focus, mode: contentMode)
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: rect.width, height: rect.height)
                            .offset(x: rect.minX, y: rect.minY)
                    } placeholder: {
                        Color.clear
                    }
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
                }
            }
            .clipped()
    }

    @ViewBuilder private var placeholder: some View {
        if let color = ImagePipeline.shared.placeholderColor(for: url) {
            color.accessibilityHidden(true)
        } else {
            StripePlaceholder()
        }
    }

    /// Where an image of `size` is drawn inside `frame`.
    static func rect(for size: CGSize, in frame: CGSize, focus: UnitPoint, mode: ContentMode) -> CGRect {
        guard size.width > 0, size.height > 0, frame.width > 0, frame.height > 0 else { return CGRect(origin: .zero, size: frame) }
        let scale = mode == .fill
            ? max(frame.width / size.width, frame.height / size.height)
            : min(frame.width / size.width, frame.height / size.height)
        let drawn = CGSize(width: size.width * scale, height: size.height * scale)
        let fx = mode == .fill ? min(max(focus.x, 0), 1) : 0.5
        let fy = mode == .fill ? min(max(focus.y, 0), 1) : 0.5
        return CGRect(x: (frame.width - drawn.width) * fx, y: (frame.height - drawn.height) * fy,
                      width: drawn.width, height: drawn.height)
    }
}

/// Flat skeleton bars (`skel`) for loading states: radius height/2, at most 8 (SPEC §3.24).
struct SkeletonBar: View {
    var width: CGFloat? = nil
    var height: CGFloat

    var body: some View {
        RoundedRectangle(cornerRadius: min(height / 2, 8), style: .continuous)
            .fill(Palette.skeleton).frame(width: width, height: height)
            .frame(maxWidth: width == nil ? .infinity : nil, alignment: .leading)
    }
}

/// Empty state: optional accent icon, Literata title, SF body, optional tint action.
struct EmptyStateView<Action: View>: View {
    var icon: String? = nil
    let title: Text
    let message: Text
    var titleFont: Font = Typography.titleM
    @ViewBuilder var action: () -> Action

    var body: some View {
        VStack(spacing: icon == nil ? 10 : 12) {  // the search-empty variant (no icon) uses 10
            if let icon {
                Icon(icon, size: 36).foregroundStyle(Palette.accent).padding(.bottom, 6)
            }
            title.font(titleFont).lineHeight(1.2, literata: 24).foregroundStyle(Palette.ink)
            message.font(Typography.body15).lineHeight(1.5).foregroundStyle(Palette.ink2)
            action().padding(.top, 14)
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, 48)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension EmptyStateView where Action == EmptyView {
    init(icon: String? = nil, title: Text, message: Text, titleFont: Font = Typography.titleM) {
        self.init(icon: icon, title: title, message: message, titleFont: titleFont) { EmptyView() }
    }
}

/// 7 pt page dots for onboarding.
struct PageDots: View {
    let count: Int
    let current: Int

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<count, id: \.self) { i in
                Circle().fill(Palette.ink).opacity(i == current ? 1 : 0.25).frame(width: 7, height: 7)
            }
        }
        .accessibilityElement()
        .accessibilityValue(Text("onboarding.page \(current + 1) \(count)"))
    }
}

/// Sheet title row: Literata title (+ optional subtitle) and a 34 pt close circle.
struct SheetHeader: View {
    let title: Text
    var subtitle: Text? = nil
    var titleFont: Font = Typography.titleM
    /// Title line height and design size: 24/1.2 in sheets, 30/1.15 on the auth sheets.
    var titleLineHeight: CGFloat = 1.2
    var titleSize: CGFloat = 24
    /// Subtitle style: SF 13/1.45 in content sheets (recordings), 15/1.5 on the auth sheets.
    var subtitleFont: Font = Typography.meta13
    var subtitleLineHeight: CGFloat = 1.45
    let close: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                title.font(titleFont).lineHeight(titleLineHeight, literata: titleSize)
                    .foregroundStyle(Palette.ink).accessibilityAddTraits(.isHeader)
                subtitle?.font(subtitleFont).lineHeight(subtitleLineHeight).foregroundStyle(Palette.ink2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            SheetCloseButton(action: close)
        }
    }
}

struct SheetCloseButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Icon("close", size: 16)
                .foregroundStyle(Palette.ink2)
                .frame(width: 34, height: 34)
                .background(Palette.ink.opacity(0.08), in: .circle)
                .frame(width: 44, height: 44)
                .contentShape(.circle)
        }
        .buttonStyle(.plain)
        .padding(-5)
        .accessibilityLabel(Text("common.close.accessibilityLabel"))
    }
}

/// Bottom fade (transparent → page colour) behind floating controls.
struct BottomFade: View {
    var height: CGFloat = 150
    /// Where the gradient reaches the solid page colour (60 % on most screens, 70 % on Library › Glossary).
    var solidFrom: CGFloat = 0.6

    var body: some View {
        LinearGradient(stops: [.init(color: Palette.background.opacity(0), location: 0), .init(color: Palette.background, location: solidFrom)],
                       startPoint: .top, endPoint: .bottom)
            .frame(height: height)
            .allowsHitTesting(false)
    }
}
