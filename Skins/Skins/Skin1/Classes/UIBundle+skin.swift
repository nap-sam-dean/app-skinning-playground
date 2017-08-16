import Foundation


extension Bundle {

    private class BundleFlag: NSObject { }

    static let skinBundle = Bundle(for: BundleFlag.self)

    static let fontBundle: Bundle! = {
        guard let fontBundleUrl = skinBundle.url(forResource: "Fonts", withExtension: "bundle") else {
            assertionFailure("Failed to find Fonts.bundle in Skin")
            return nil
        }

        return Bundle(url: fontBundleUrl)
    }()
}
