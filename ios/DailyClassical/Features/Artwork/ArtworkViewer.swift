import SwiftUI

/// Always-black, uncropped painting with pinch and double-tap zoom (SPEC §4.14).
struct ArtworkViewer: View {
    let painting: Painting
    @Environment(\.dismiss) private var dismiss
    @State private var scale: CGFloat = 1
    @State private var lastScale: CGFloat = 1
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            AsyncImage(url: painting.imageUrl) { phase in
                if let image = phase.image {
                    image.resizable().aspectRatio(contentMode: .fit)
                } else {
                    ProgressView().tint(Palette.viewerInk2)
                }
            }
            .scaleEffect(scale)
            .offset(offset)
            .gesture(zoom.simultaneously(with: pan))
            .onTapGesture(count: 2) {
                withAnimation(.easeOut(duration: 0.25)) {
                    if scale > 1 { reset() } else { scale = 2.5; lastScale = 2.5 }
                }
            }
            .accessibilityLabel(Text("today.painting.accessibilityLabel \(painting.title) \(painting.artist)"))
        }
        .overlay(alignment: .topTrailing) {
            GlassIconButton(icon: "close", iconSize: 18, tint: Palette.viewerInk, label: "common.close.accessibilityLabel") { dismiss() }
                .padding(.trailing, 16).padding(.top, 8)
        }
        .overlay(alignment: .bottomLeading) { caption }
        .environment(\.colorScheme, .dark)
        .statusBarHidden()
    }

    private var caption: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(verbatim: painting.artist).font(Typography.literata(17, .medium)).foregroundStyle(Palette.viewerInk)
            Text(verbatim: "\(painting.title), \(painting.yearLabel)").font(Typography.literata(17).italic()).foregroundStyle(Palette.viewerInk2)
            (Text(verbatim: [painting.medium, painting.collection].compactMap { $0 }.joined(separator: " · ") + " · ") + Text("artwork.publicDomain"))
                .font(Typography.meta13).lineHeight(1.45, size: 13).foregroundStyle(Palette.viewerInk2)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .opacity(scale > 1 ? 0 : 1)
        .allowsHitTesting(false)
    }

    private var zoom: some Gesture {
        MagnifyGesture()
            .onChanged { scale = max(1, min(lastScale * $0.magnification, 6)) }
            .onEnded { _ in
                lastScale = scale
                if scale <= 1 { withAnimation(.easeOut(duration: 0.2)) { reset() } }
            }
    }

    private var pan: some Gesture {
        DragGesture()
            .onChanged { v in
                guard scale > 1 else { return }
                offset = CGSize(width: lastOffset.width + v.translation.width, height: lastOffset.height + v.translation.height)
            }
            .onEnded { _ in lastOffset = offset }
    }

    private func reset() {
        scale = 1; lastScale = 1; offset = .zero; lastOffset = .zero
    }
}
