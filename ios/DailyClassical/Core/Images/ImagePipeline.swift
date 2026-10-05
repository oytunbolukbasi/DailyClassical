import CryptoKit
import ImageIO
import SwiftUI
import UIKit

/// Which rendition of a painting or portrait to show. `hero` for full-width images and the artwork
/// viewer, `thumb` (≤ 256 px short side) for list thumbnails of 64 pt and smaller.
nonisolated enum ImageVariant: String, Sendable {
    case hero, thumb
}

/// `Resources/Artwork/manifest.json`, written by `npm run images` in backend/
/// (backend/scripts/optimize-images.ts). Keys are `paintings/<pieceId>` and `composers/<composerId>`.
nonisolated struct ArtworkManifest: Decodable, Sendable {
    struct File: Decodable, Sendable {
        let path: String
        let width: Int
        let height: Int
        let hash: String
    }

    struct Entry: Decodable, Sendable {
        /// The vetted original (Wikimedia Commons) URL the derivatives were made from.
        let source: String
        /// Average colour, "#rrggbb": the placeholder while the image loads.
        let color: String
        let hero: File
        let thumb: File
        /// Required attribution per language ("en", "tr") for freely licensed (non-PD) images.
        let credit: [String: String]?
        let licenseUrl: String?

        func file(_ variant: ImageVariant) -> File { variant == .hero ? hero : thumb }
    }

    let images: [String: Entry]
}

/// What to load for one (url, variant): resolved once, used as the cache identity.
nonisolated struct ImageRequest: Hashable, Sendable {
    /// Memory-cache key; also identifies the request in `.task(id:)`.
    let key: String
    /// Optimized copy shipped in the app bundle, used when it matches the requested version.
    let bundled: URL?
    /// Network URL for this variant (our API / CDN copy, or whatever URL the content carries).
    let remote: URL?
    /// Longest side to decode a remote image at; unknown originals can be 6000+ px.
    let maxPixel: CGFloat
    /// Average colour from the manifest, if the image is known.
    let placeholderHex: String?
}

/// Painting and portrait loading: bundled file → memory (NSCache) → disk (Caches/images) → network.
/// Decoding happens off the main thread, so a view only ever receives display-ready bitmaps.
nonisolated final class ImagePipeline: @unchecked Sendable {
    static let shared = ImagePipeline()

    private let manifest: ArtworkManifest
    private let bySource: [String: String]
    private let artworkRoot: URL?
    private let memory = NSCache<NSString, UIImage>()
    private let lock = NSLock()
    private var inFlight: [String: Task<UIImage?, Never>] = [:]
    private let session: URLSession
    private let diskDirectory: URL

    init(bundle: Bundle = .main) {
        artworkRoot = bundle.resourceURL?.appending(path: "Artwork", directoryHint: .isDirectory)
        manifest = artworkRoot
            .flatMap { try? Data(contentsOf: $0.appending(path: "manifest.json")) }
            .flatMap { try? JSONDecoder().decode(ArtworkManifest.self, from: $0) }
            ?? ArtworkManifest(images: [:])
        bySource = Dictionary(manifest.images.map { ($0.value.source, $0.key) }, uniquingKeysWith: { a, _ in a })
        memory.totalCostLimit = 120 * 1024 * 1024
        let config = URLSessionConfiguration.default
        config.urlCache = nil  // the disk cache below holds the bytes
        config.timeoutIntervalForRequest = 30
        session = URLSession(configuration: config)
        diskDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appending(path: "images", directoryHint: .isDirectory)
        try? FileManager.default.createDirectory(at: diskDirectory, withIntermediateDirectories: true)
    }

    // MARK: Resolving

    /// Our image URLs look like `…/images/<kind>/<id>-<variant>.jpg?v=<hash>`.
    nonisolated(unsafe) private static let ownPath = /\/(paintings|composers)\/([^\/]+)-(hero|thumb)\.jpg$/

    func request(for url: URL?, variant: ImageVariant) -> ImageRequest? {
        guard let url else { return nil }
        let path = url.path(percentEncoded: false)
        let version = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.first { $0.name == "v" }?.value

        var entryKey: String?
        var remote: URL? = url
        if let match = path.firstMatch(of: Self.ownPath) {
            entryKey = "\(match.1)/\(match.2)"
            if variant.rawValue != match.3, var parts = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                // Same version query, sibling file: the hash still changes whenever the hero does.
                parts.path = String(parts.path.dropLast("-\(match.3).jpg".count)) + "-\(variant.rawValue).jpg"
                remote = parts.url
            }
        } else {
            var bare = URLComponents(url: url, resolvingAgainstBaseURL: false)
            bare?.query = nil
            entryKey = bare?.url.flatMap { bySource[$0.absoluteString] }
        }

        let entry = entryKey.flatMap { manifest.images[$0] }
        var bundled: URL?
        if let entry, let artworkRoot {
            let file = entry.file(variant)
            // A newer server copy (different ?v=) wins over the bundled one; Commons/no-version URLs use the bundle.
            let current = version == nil || version == file.hash || version == entry.hero.hash
            if current { bundled = artworkRoot.appending(path: file.path) }
        }
        let key = "\(variant.rawValue)|\(remote?.absoluteString ?? bundled?.path() ?? url.absoluteString)"
        return ImageRequest(key: key, bundled: bundled, remote: remote, maxPixel: variant == .hero ? 2048 : 512,
                            placeholderHex: entry?.color)
    }

    /// The manifest's average colour for a painting/portrait URL, if known.
    func placeholderColor(for url: URL?) -> Color? {
        request(for: url, variant: .thumb)?.placeholderHex.flatMap(Self.color(hex:))
    }

    /// "#rrggbb" (sRGB).
    private static func color(hex: String) -> Color? {
        let digits = hex.hasPrefix("#") ? hex.dropFirst() : Substring(hex)
        guard digits.count == 6, let value = UInt32(digits, radix: 16) else { return nil }
        return Color(.sRGB, red: Double((value >> 16) & 0xFF) / 255, green: Double((value >> 8) & 0xFF) / 255,
                     blue: Double(value & 0xFF) / 255, opacity: 1)
    }

    /// The attribution a freely licensed image requires (manifest `credit`, from the yaml `credit_line`),
    /// in `language` with English fallback; nil for public-domain images.
    func credit(for url: URL?, language: String) -> String? {
        guard let entry = entry(for: url) else { return nil }
        return entry.credit?[language] ?? entry.credit?["en"]
    }

    private func entry(for url: URL?) -> ArtworkManifest.Entry? {
        guard let url else { return nil }
        if let match = url.path(percentEncoded: false).firstMatch(of: Self.ownPath) {
            return manifest.images["\(match.1)/\(match.2)"]
        }
        var bare = URLComponents(url: url, resolvingAgainstBaseURL: false)
        bare?.query = nil
        return bare?.url.flatMap { bySource[$0.absoluteString] }.flatMap { manifest.images[$0] }
    }

    // MARK: Loading

    /// Synchronous memory-cache hit, for drawing a cached image in the very first frame.
    func cachedImage(for request: ImageRequest) -> UIImage? {
        memory.object(forKey: request.key as NSString)
    }

    func image(for request: ImageRequest) async -> UIImage? {
        if let hit = cachedImage(for: request) { return hit }
        let task: Task<UIImage?, Never> = lock.withLock {
            if let running = inFlight[request.key] { return running }
            let task = Task.detached(priority: .userInitiated) { [self] in await load(request) }
            inFlight[request.key] = task
            return task
        }
        let image = await task.value
        lock.withLock { inFlight[request.key] = nil }
        return image
    }

    /// Warms memory (and disk) for images about to appear, e.g. today's hero at launch.
    func prefetch(_ urls: [URL?], variant: ImageVariant = .hero) {
        for request in urls.compactMap({ self.request(for: $0, variant: variant) }) where cachedImage(for: request) == nil {
            Task.detached(priority: .utility) { [self] in _ = await image(for: request) }
        }
    }

    private func load(_ request: ImageRequest) async -> UIImage? {
        var image: UIImage?
        if let bundled = request.bundled {
            image = Self.decode(CGImageSourceCreateWithURL(bundled as CFURL, nil), maxPixel: request.maxPixel)
        }
        if image == nil, let remote = request.remote {
            let file = diskFile(for: remote)
            if remote.isFileURL {
                image = Self.decode(CGImageSourceCreateWithURL(remote as CFURL, nil), maxPixel: request.maxPixel)
            } else if let data = try? Data(contentsOf: file), let cached = Self.decode(data, maxPixel: request.maxPixel) {
                image = cached
            } else if let (data, response) = try? await session.data(from: remote),
                      (response as? HTTPURLResponse).map({ (200..<300).contains($0.statusCode) }) ?? true,
                      let fetched = Self.decode(data, maxPixel: request.maxPixel) {
                image = fetched
                try? data.write(to: file, options: .atomic)
            }
        }
        if let image {
            let cost = Int(image.size.width * image.scale * image.size.height * image.scale * 4)
            memory.setObject(image, forKey: request.key as NSString, cost: cost)
        }
        return image
    }

    private func diskFile(for url: URL) -> URL {
        let digest = SHA256.hash(data: Data(url.absoluteString.utf8)).map { String(format: "%02x", $0) }.joined()
        return diskDirectory.appending(path: digest.prefix(32) + ".img")
    }

    private static func decode(_ data: Data, maxPixel: CGFloat) -> UIImage? {
        decode(CGImageSourceCreateWithData(data as CFData, nil), maxPixel: maxPixel)
    }

    /// Full decode + `preparingForDisplay()` when the image is within `maxPixel`; an ImageIO
    /// downsample otherwise (never inflating a 24 MP original into memory).
    private static func decode(_ source: CGImageSource?, maxPixel: CGFloat) -> UIImage? {
        guard let source, CGImageSourceGetCount(source) > 0 else { return nil }
        let props = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [CFString: Any]
        let width = props?[kCGImagePropertyPixelWidth] as? CGFloat ?? 0
        let height = props?[kCGImagePropertyPixelHeight] as? CGFloat ?? 0
        let orientation = props?[kCGImagePropertyOrientation] as? UInt32 ?? 1
        if max(width, height) <= maxPixel, orientation == 1,
           let cg = CGImageSourceCreateImageAtIndex(source, 0, nil) {
            let image = UIImage(cgImage: cg)
            return image.preparingForDisplay() ?? image
        }
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: maxPixel,
        ]
        return CGImageSourceCreateThumbnailAtIndex(source, 0, options as CFDictionary).map { UIImage(cgImage: $0) }
    }
}

/// An image from `ImagePipeline`: drawn in the first frame when it is already in memory, otherwise
/// faded in over `placeholder` once decoded.
struct CachedImage<Content: View, Placeholder: View>: View {
    private let request: ImageRequest?
    private let content: (UIImage) -> Content
    private let placeholder: () -> Placeholder
    @State private var loaded: (key: String, image: UIImage)?

    init(url: URL?, variant: ImageVariant = .hero,
         @ViewBuilder content: @escaping (UIImage) -> Content,
         @ViewBuilder placeholder: @escaping () -> Placeholder) {
        let request = ImagePipeline.shared.request(for: url, variant: variant)
        self.request = request
        self.content = content
        self.placeholder = placeholder
        _loaded = State(initialValue: request.flatMap { r in ImagePipeline.shared.cachedImage(for: r).map { (r.key, $0) } })
    }

    var body: some View {
        ZStack {
            if let loaded, loaded.key == request?.key {
                content(loaded.image).transition(.opacity)
            } else {
                placeholder()
            }
        }
        .task(id: request?.key) {
            guard let request, loaded?.key != request.key else { return }
            if let image = await ImagePipeline.shared.image(for: request), !Task.isCancelled {
                withAnimation(.easeOut(duration: 0.25)) { loaded = (request.key, image) }
            }
        }
    }
}
