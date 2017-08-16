/**
 Registers (and loads) fonts from a specified bundle
 */
final class BundleFontLoader {

    private struct FontDescription: Hashable {
        let fileName: String
        let type: String

        static func == (lhs: FontDescription, rhs: FontDescription) -> Bool {
            return lhs.fileName == rhs.fileName && lhs.type == rhs.type
        }

        var hashValue: Int {
            return self.fileName.hashValue
        }
    }

    private var attemptedFonts: [FontDescription] = []

    private let bundle: Bundle
    private let isStrict: Bool

    /**
     Create a new BundleFileLoader for the specified bundle

     - parameter bundle: The bundle to load fonts from (`nil` defaults to the main bundle)
     - parameter strict: Set this to true to make failure to load fonts `fatalError` instead of debugging to the console.
     */
    init(bundle: Bundle? = nil, strict: Bool = false) {
        self.bundle = bundle ?? .main
        self.isStrict = strict
    }

    private func debug(_ message: String, file: StaticString = #file, line: UInt = #line) {
        if self.isStrict {
            fatalError(message, file: file, line: line)
        }

        print(message)
    }

    /**
     Registers a font file for use with `BundleFontLoader.font(named:format:size:)` or `UIFont.font(name:size:)`

     You can safely call this method many times, subsequent calls will be ignored.

     - parameter forResource: The name of the font
     - parameter withExtension: The extension of the font file
     - returns: true if the font is registered, false otherwise.
     */
    func registerFontFamily(forResource fileName: String, withExtension type: String) {
        let description = FontDescription(fileName: fileName, type: type)

        guard !self.attemptedFonts.contains(description) else {
            return
        }

        self.attemptedFonts.append(description)

        guard let url = bundle.url(forResource: fileName, withExtension: type) else {
            self.debug("Failed to load font family named \(fileName) from \(self.bundle) - failed to find resource in bundle")
            return
        }

        var error: Unmanaged<CFError>?
        guard CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) else {
            self.debug("Failed to load font family named \(fileName) from \(self.bundle) - failed to register font: \(error?.takeUnretainedValue().localizedDescription ?? "unknown error")")
            return
        }
    }

    /**
     Convenience method to register and load a font in one call - this works by assuming that the dont family name is the same as the font file name.
     If this isn't the case, then use `registerFontFamily(fileName:type:)` instead, and call `UIFont(name:size)` directly.

     - parameter named: The family name of the font, which has to be the same as the file name of the font
     - parameter format: _(optional)_ The file extension, defaults to "otf"
     - parameter size: The point size of the UIFont to return
     - returns: The specified font, or a system font of the same size
    */
    func font(named familyName: String, format: String = "otf", size pointSize: CGFloat) -> UIFont? {
        self.registerFontFamily(forResource: familyName, withExtension: format)

        guard let font = UIFont(name: familyName, size: pointSize) else {
            return UIFont.systemFont(ofSize: pointSize)
        }
        
        return font
    }
}
