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
            Text(caption)
                .font(Typography.caption)
                .lineHeight(1.4, size: 12)
                .foregroundStyle(Palette.ink3)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private var caption: AttributedString {
        var title = AttributedString(painting.title)
        title.inlinePresentationIntent = .emphasized
        return AttributedString("\(painting.artist), ") + title + AttributedString(", \(painting.yearLabel). \(painting.collection).")
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
            .padding(.vertical, 4)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
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

/// A painting filling its frame (`cover`) with a focal point, over the stripe placeholder.
struct PaintingImage: View {
    let url: URL?
    var focus: UnitPoint = .center
    var contentMode: ContentMode = .fill

    var body: some View {
        StripePlaceholder()
            .overlay {
                AsyncImage(url: url, transaction: Transaction(animation: .easeOut(duration: 0.25))) { phase in
                    if let image = phase.image {
                        image.resizable().aspectRatio(contentMode: contentMode)
                    }
                }
            }
            .clipped()
    }
}

/// Flat skeleton bars (`skel`) for loading states.
struct SkeletonBar: View {
    var width: CGFloat? = nil
    var height: CGFloat

    var body: some View {
        Capsule().fill(Palette.skeleton).frame(width: width, height: height)
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
        VStack(spacing: 12) {
            if let icon {
                Icon(icon, size: 36).foregroundStyle(Palette.accent).padding(.bottom, 6)
            }
            title.font(titleFont).foregroundStyle(Palette.ink)
            message.font(Typography.body15).lineHeight(1.5, size: 15).foregroundStyle(Palette.ink2)
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
        .accessibilityValue(Text("\(current + 1) / \(count)"))
    }
}

/// Sheet title row: Literata title (+ optional subtitle) and a 34 pt close circle.
struct SheetHeader: View {
    let title: Text
    var subtitle: Text? = nil
    var titleFont: Font = Typography.titleM
    var subtitleFont: Font = Typography.meta13
    let close: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                title.font(titleFont).foregroundStyle(Palette.ink).accessibilityAddTraits(.isHeader)
                subtitle?.font(subtitleFont).lineHeight(1.45, size: 13).foregroundStyle(Palette.ink2)
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

    var body: some View {
        LinearGradient(stops: [.init(color: Palette.background.opacity(0), location: 0), .init(color: Palette.background, location: 0.6)],
                       startPoint: .top, endPoint: .bottom)
            .frame(height: height)
            .allowsHitTesting(false)
    }
}
