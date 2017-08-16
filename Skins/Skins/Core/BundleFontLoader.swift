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

    func registerFontFamily(fileName: String, type: String) {
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
            error?.release()
            return
        }
    }

    func font(named familyName: String, format: String = "otf", size pointSize: CGFloat) -> UIFont? {
        self.registerFontFamily(fileName: familyName, type: format)

        guard let font = UIFont(name: familyName, size: pointSize) else {
            return UIFont.systemFont(ofSize: pointSize)
        }
        
        return font
    }
}
