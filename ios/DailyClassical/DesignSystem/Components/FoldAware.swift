import SwiftUI

/// Places a floating control that is centred on the page (the clear-glass primaries, the date
/// chip, the rating card) in one pane when an iPhone Duo is partially open like a book, instead
/// of on the fold. Fills the space it is given, like an overlay; the content keeps `alignment`
/// inside the pane. Everywhere else the pane is the whole space and nothing moves.
struct FoldAware<Content: View>: View {
    var alignment: Alignment = .center
    @ViewBuilder var content: Content

    var body: some View {
        GeometryReader { geo in
            let pane = FoldGeometry.pane(in: geo)
            content
                .frame(width: pane.width, height: pane.height, alignment: alignment)
                .offset(x: pane.minX, y: pane.minY)
        }
    }
}

enum FoldGeometry {
    /// The larger side of an active vertical fold (the leading one when they are equal), in the
    /// proxy's space; the whole space when there is none. A horizontal fold (the device held
    /// upright, half open like a laptop) is left alone: the controls sit across it, not on it.
    static func pane(in geo: GeometryProxy) -> CGRect {
        let bounds = CGRect(origin: .zero, size: geo.size)
        guard #available(iOS 27.1, *) else { return bounds }
        let folds = geo.reservedRegions(kind: .division)
            .filter { $0.isActive && $0.frame.height > $0.frame.width && $0.frame.intersects(bounds) }
        guard let fold = folds.first?.frame else { return bounds }
        let leading = CGRect(x: bounds.minX, y: bounds.minY, width: max(0, fold.minX - bounds.minX), height: bounds.height)
        let trailing = CGRect(x: fold.maxX, y: bounds.minY, width: max(0, bounds.maxX - fold.maxX), height: bounds.height)
        return trailing.width > leading.width ? trailing : leading
    }
}
