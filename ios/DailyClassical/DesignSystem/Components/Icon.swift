import SwiftUI

/// The custom line-icon set (design/icons, 24 pt grid, 1.75 stroke). Template images,
/// so they take the foreground style; the size follows Dynamic Type.
struct Icon: View {
    let name: String
    @ScaledMetric private var size: CGFloat

    init(_ name: String, size: CGFloat = 24, relativeTo style: Font.TextStyle = .body) {
        self.name = name
        _size = ScaledMetric(wrappedValue: size, relativeTo: style)
    }

    var body: some View {
        Image(name)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .accessibilityHidden(true)
    }
}
