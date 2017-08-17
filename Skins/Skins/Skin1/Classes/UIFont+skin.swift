import Foundation
import UIKit


extension UIFont {

    private static let fontLoader = BundleFontLoader(bundle: Bundle.fontBundle)

    public static let title: UIFont! = {
        return fontLoader.font(named: "Luminari", format: "ttf", size: 32)
    }()
}
