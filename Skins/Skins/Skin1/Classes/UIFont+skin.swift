import Foundation
import UIKit


extension UIFont {

    private class BundleFlag: NSObject { }

    private static let fontLoader: BundleFontLoader! = {
        let bundle = Bundle(for: BundleFlag.self)

        guard let fontBundleUrl = bundle.url(forResource: "Fonts", withExtension: "bundle") else {
            assertionFailure("Failed to find Fonts.bundle in Skin")
            return nil
        }

        let fontBundle = Bundle(url: fontBundleUrl)
        return BundleFontLoader(bundle: fontBundle)
    }()

    public static let title: UIFont! = {
        return fontLoader.font(named: "SnellRoundhand", format: "ttc", size: 32)
    }()
}
