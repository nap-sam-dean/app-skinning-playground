import Foundation


extension Bundle {

    func loadNestedBundle(named name: String) -> Bundle? {
        guard let bundleUrl = self.url(forResource: name, withExtension: "bundle") else {
            assertionFailure("Failed to find \(name).bundle in Skin")
            return nil
        }

        return Bundle(url: bundleUrl)
    }
}
