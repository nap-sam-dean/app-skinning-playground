import Foundation
import UIKit


extension UIImage {

    public static let background: UIImage? = {
        return UIImage(named: "Background", in: Bundle.assetBundle, compatibleWith: nil)
    }()
}
