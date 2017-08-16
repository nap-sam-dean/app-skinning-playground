import Foundation
import UIKit


extension UIFont {

    private class BundleFlag: NSObject { }

    private static let fontLoader = BundleFontLoader(bundle: Bundle.fontBundle)

    public static let title: UIFont! = {
        return fontLoader.font(named: "SnellRoundhand", format: "ttc", size: 32)
    }()
}
