import SwiftUI
import Testing
@testable import DailyClassical

/// The in-between SF sizes (14 pt chips, meta line) scale with Dynamic Type but must look exactly
/// like the fixed design size at the default text size: the screens are matched to the canvas 1:1.
@MainActor
struct TypographyTests {
    private func size(_ font: Font, _ dynamicType: DynamicTypeSize, _ text: String = "Favourites · Hg 1893 · 33 min") -> CGSize {
        let host = UIHostingController(rootView: Text(verbatim: text).font(font).fixedSize().environment(\.dynamicTypeSize, dynamicType))
        return host.sizeThatFits(in: CGSize(width: 2000, height: 2000))
    }

    @Test func scaledSystemFontsMatchTheDesignSizeByDefault() {
        let pairs: [(Font, Font)] = [
            (Typography.meta14, Font.system(size: 14, weight: .regular).leading(.standard)),
            (Typography.chip, Font.system(size: 14, weight: .medium)),
            (Typography.buttonS, Font.system(size: 14, weight: .semibold)),
            (Typography.tabLabel, Font.system(size: 10, weight: .medium)),
        ]
        for (scaled, fixed) in pairs {
            #expect(size(scaled, .large) == size(fixed, .large))
        }
    }

    @Test func scaledSystemFontsGrowWithDynamicType() {
        for font in [Typography.meta14, Typography.chip, Typography.buttonS] {
            #expect(size(font, .accessibility3).height > size(font, .large).height * 1.5)
            #expect(size(font, .xSmall).height < size(font, .large).height)
        }
    }
}
