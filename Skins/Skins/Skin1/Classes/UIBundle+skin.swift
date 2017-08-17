import Foundation


extension Bundle {

    private class BundleFlag: NSObject {
        private override init() { }
    }

    static let skinBundle = Bundle(for: BundleFlag.self)

    static let fontBundle: Bundle! = Bundle.skinBundle.loadNestedBundle(named: "Fonts")

    static let assetBundle: Bundle! = Bundle.skinBundle.loadNestedBundle(named: "Assets")
}
