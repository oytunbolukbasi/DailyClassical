import SwiftUI

/// Always-black, uncropped painting with pinch and double-tap zoom (SPEC §4.14).
struct ArtworkViewer: View {
    let painting: Painting
    @Environment(\.dismiss) private var dismiss
    @Environment(\.locale) private var locale
    @Environment(EntitlementStore.self) private var entitlements
    @State private var showWallpaper = false
    @State private var showPaywall = false
    @State private var scale: CGFloat = 1
    @State private var lastScale: CGFloat = 1
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    /// The `full` rendition (long side ≤ 4000 px) for zooming: downloaded (then disk-cached) while the
    /// hero is already on screen, and held only here — released when the viewer closes.
    @State private var full: UIImage?
    @Environment(\.displayScale) private var displayScale

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GeometryReader { geo in
                ZStack {
                    // Bundled/cached hero via ImagePipeline: instant for launch content, works offline.
                    CachedImage(url: painting.imageUrl, size: geo.size, scale: displayScale, contentMode: .fit,
                                artwork: painting.artwork) { Image(uiImage: $0).resizable().aspectRatio(contentMode: .fit) }
                        placeholder: { ProgressView().tint(Palette.viewerInk2) }
                    // Same fit frame and aspect as the hero underneath, so the swap is invisible except in detail.
                    if let full {
                        Image(uiImage: full).resizable().aspectRatio(contentMode: .fit)
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .scaleEffect(scale)
                .offset(offset)
                // Gestures sit on an untransformed frame, so tap locations are in screen space.
                .frame(width: geo.size.width, height: geo.size.height)
                .contentShape(.rect)
                .gesture(zoom(in: geo.size).simultaneously(with: pan(in: geo.size)))
                .onTapGesture(count: 2) { location in
                    withAnimation(.easeOut(duration: 0.25)) {
                        if scale > 1 { reset() } else { zoom(to: 2.5, at: location, in: geo.size) }
                    }
                }
            }
            .task(id: painting.imageUrl) {
                guard let request = ImagePipeline.shared.request(for: painting.imageUrl, variant: .full, artwork: painting.artwork),
                      let image = await ImagePipeline.shared.image(for: request), !Task.isCancelled else { return }
                full = image
            }
            .accessibilityLabel(Text("today.painting.accessibilityLabel \(painting.title) \(painting.artist)"))
        }
        .overlay(alignment: .topTrailing) {
            GlassIconButton(icon: "close", iconSize: 18, tint: Palette.viewerInk, label: "common.close.accessibilityLabel") { dismiss() }
                .shadow(color: .black.opacity(0.35), radius: 3, y: 2)  // G4 over the image
                .padding(.trailing, 16).padding(.top, 4)  // as the paywall close (SPEC: top 58)
        }
        .overlay(alignment: .topLeading) {
            // Premium: the painting as a wallpaper; free readers see the paywall first.
            GlassIconButton(icon: "wallpaper", iconSize: 20, tint: Palette.viewerInk, label: "wallpaper.button.accessibilityLabel") {
                if entitlements.isPremium { showWallpaper = true } else { showPaywall = true }
            }
            .shadow(color: .black.opacity(0.35), radius: 3, y: 2)
            .padding(.leading, 16).padding(.top, 4)
            .opacity(scale > 1 ? 0 : 1)
        }
        .overlay(alignment: .bottomLeading) { caption }
        .sheet(isPresented: $showWallpaper) {
            WallpaperSheet(painting: painting, preloaded: full)
                .presentationDetents([.large])
                .presentationBackground(.black)
        }
        .fullScreenCover(isPresented: $showPaywall) { PaywallScreen() }
        #if DEBUG
        .task {
            guard ScreenshotScene.wallpaper else { return }
            try? await Task.sleep(for: .seconds(1))
            showWallpaper = true
        }
        #endif
        .environment(\.colorScheme, .dark)
        .statusBarHidden()
    }

    private var caption: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(verbatim: painting.artist).font(Typography.literata(17, .medium)).foregroundStyle(Palette.viewerInk)
            Text(verbatim: "\(painting.title), \(painting.yearLabel)").font(Typography.literata(17).italic()).foregroundStyle(Palette.viewerInk2)
            Text(verbatim: details)
                .font(Typography.meta13).lineHeight(1.45).foregroundStyle(Palette.viewerInk2)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .opacity(scale > 1 ? 0 : 1)
        .allowsHitTesting(false)
    }

    /// "Oil on canvas · State Tretyakov Gallery, Moscow · Public domain" (rights only when public domain).
    private var details: String {
        var parts = [painting.medium, painting.collection].compactMap { $0 }
        if painting.rightsStatus == "public_domain" {
            parts.append(L10n.string("artwork.publicDomain", code: locale.language.languageCode?.identifier ?? "en"))
        }
        return parts.joined(separator: " · ")
    }

    private func zoom(in size: CGSize) -> some Gesture {
        MagnifyGesture()
            .onChanged {
                scale = max(1, min(lastScale * $0.magnification, 6))
                offset = clamped(offset, in: size)  // zooming out pulls the image back on screen
            }
            .onEnded { _ in
                lastScale = scale
                lastOffset = offset
                if scale <= 1 { withAnimation(.easeOut(duration: 0.2)) { reset() } }
            }
    }

    private func pan(in size: CGSize) -> some Gesture {
        DragGesture()
            .onChanged { v in
                guard scale > 1 else { return }
                offset = clamped(CGSize(width: lastOffset.width + v.translation.width,
                                        height: lastOffset.height + v.translation.height), in: size)
            }
            .onEnded { _ in lastOffset = offset }
    }

    /// Zooms to `newScale` keeping the painting point under `location` where it is.
    private func zoom(to newScale: CGFloat, at location: CGPoint, in size: CGSize) {
        let dx = location.x - size.width / 2, dy = location.y - size.height / 2
        scale = newScale; lastScale = newScale
        offset = clamped(CGSize(width: dx * (1 - newScale), height: dy * (1 - newScale)), in: size)
        lastOffset = offset
    }

    /// Keeps the zoomed painting covering the screen: it can pan until its edge meets the screen's
    /// edge, and not along an axis where it is still narrower than the screen.
    private func clamped(_ offset: CGSize, in size: CGSize) -> CGSize {
        let fitted = fittedSize(in: size)
        let maxX = max(0, (fitted.width * scale - size.width) / 2)
        let maxY = max(0, (fitted.height * scale - size.height) / 2)
        return CGSize(width: min(max(offset.width, -maxX), maxX), height: min(max(offset.height, -maxY), maxY))
    }

    /// The painting's aspect-fit size on screen (the whole screen when its size is unknown).
    private func fittedSize(in size: CGSize) -> CGSize {
        let aspect = full.map { $0.size.width / max($0.size.height, 1) }
            ?? painting.width.flatMap { w in painting.height.map { CGFloat(w) / CGFloat(max($0, 1)) } }
        guard let aspect, aspect > 0, size.height > 0 else { return size }
        return aspect > size.width / size.height
            ? CGSize(width: size.width, height: size.width / aspect)
            : CGSize(width: size.height * aspect, height: size.height)
    }

    private func reset() {
        scale = 1; lastScale = 1; offset = .zero; lastOffset = .zero
    }
}
