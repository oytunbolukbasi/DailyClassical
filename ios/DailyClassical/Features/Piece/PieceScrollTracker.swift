import SwiftUI

/// Scroll bookkeeping for the piece page: block frames in content space (they only change
/// on layout, since the page is one non-lazy stack), plus the latest scroll offset and
/// viewport. A plain class, so per-frame scroll updates don't re-render the page; the page
/// copies the derived values (docked, current movement, current stop) into state only
/// when they change.
final class PieceScrollTracker {
    /// Frame of every block in the page's content coordinate space.
    var blockFrames: [PieceBlock: CGRect] = [:]
    /// Content-space y of each movement header's visible top (the hairline, or the
    /// "Movement I" label row): the line a jump aligns under the nav bar.
    var headerTops: [Int: CGFloat] = [:]

    var offset: CGFloat = 0
    var minOffset: CGFloat = 0
    var maxOffset: CGFloat = 0
    var viewportHeight: CGFloat = 0
    /// Bottom of the floating nav bar in scroll-view coordinates (the scroll view runs
    /// under the status bar). Measured from the safe area; 110 until the first layout.
    var navBottom: CGFloat = 110

    /// True while a jump's programmatic scroll runs: tracking updates are suppressed so the
    /// switcher doesn't flicker through the movements it passes.
    var isProgrammaticScroll = false
    /// Scrolls issued for the current jump (the first, plus any retries).
    var jumpAttempts = 0
    var phase: ScrollPhase = .idle

    /// Gap between the nav bar and a movement header after a jump.
    private let jumpGap: CGFloat = 8

    /// The reading line in content space: centre of the area below the nav bar (SPEC §3.6).
    var readingLine: CGFloat { offset + (navBottom + viewportHeight) / 2 }

    /// Drops frames of blocks the page no longer shows (the piece reloaded in another language).
    func keep(_ blocks: Set<PieceBlock>) {
        blockFrames = blockFrames.filter { blocks.contains($0.key) }
        headerTops = headerTops.filter { blocks.contains(.movementHeader($0.key)) }
    }

    /// The "Movement I" header block has scrolled under the nav bar (SPEC §3.8).
    var isDocked: Bool {
        guard let first = blockFrames[.movementHeader(1)] else { return false }
        return first.minY - offset < navBottom
    }

    /// The movement under the reading line: the last one whose header is above it.
    var movementAtReadingLine: Int {
        let line = readingLine
        return headerTops.filter { $0.value <= line }.max(by: { $0.key < $1.key })?.key ?? 1
    }

    /// Scroll offset that puts `movement`'s header just below the nav bar, clamped to the
    /// scrollable range.
    func offset(forMovement movement: Int) -> CGFloat? {
        guard let top = headerTops[movement] else { return nil }
        return min(max(top - navBottom - jumpGap, minOffset), max(maxOffset, minOffset))
    }

    /// The listening stop nearest the reading line, or nil while the line is outside a
    /// movement's stop list: reading the summary above the list must not fade it.
    func stopNearestReadingLine() -> PieceBlock? {
        guard viewportHeight > 0 else { return nil }
        let line = readingLine
        let stops = blockFrames.filter { if case .stop = $0.key { true } else { false } }
        guard let nearest = stops.min(by: { abs($0.value.midY - line) < abs($1.value.midY - line) }) else { return nil }
        let sameMovement = stops.filter { $0.key.movement == nearest.key.movement }.values
        let top = sameMovement.map(\.minY).min() ?? 0, bottom = sameMovement.map(\.maxY).max() ?? 0
        return (top - 14)...(bottom + 14) ~= line ? nearest.key : nil
    }
}
