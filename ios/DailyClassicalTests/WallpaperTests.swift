import Testing
import UIKit
@testable import DailyClassical

/// The wallpaper is the chosen screen-shaped crop of the painting, never upscaled.
@MainActor
struct WallpaperTests {
    private func image(width: Int, height: Int) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        return UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: format).image { ctx in
            UIColor.red.setFill(); ctx.fill(CGRect(x: 0, y: 0, width: width / 2, height: height))
            UIColor.blue.setFill(); ctx.fill(CGRect(x: width / 2, y: 0, width: width - width / 2, height: height))
        }
    }

    @Test func landscapePaintingIsCroppedToTheScreenAspectAtItsOwnHeight() throws {
        let out = try #require(WallpaperSheet.render(image(width: 4000, height: 2600), focus: CGPoint(x: 0, y: 0.5),
                                                    aspect: 1320.0 / 2868.0, maxSize: CGSize(width: 1320, height: 2868)))
        #expect(out.size.height == 2600)            // not upscaled to 2868
        #expect(abs(out.size.width / out.size.height - 1320.0 / 2868.0) < 0.01)
        // focus.x = 0 takes the left (red) edge
        let pixel = try #require(out.cgImage?.dataProvider?.data as Data?)
        #expect(pixel[0] > 200 || pixel[2] > 200)
    }

    @Test func largePortraitPaintingIsScaledDownToTheScreen() throws {
        let out = try #require(WallpaperSheet.render(image(width: 3000, height: 6000), focus: CGPoint(x: 0.5, y: 0.5),
                                                    aspect: 1320.0 / 2868.0, maxSize: CGSize(width: 1320, height: 2868)))
        #expect(out.size.width <= 1320 && out.size.height <= 2868)
        #expect(abs(out.size.width / out.size.height - 1320.0 / 2868.0) < 0.01)
    }
}
