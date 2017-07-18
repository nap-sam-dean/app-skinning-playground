import Foundation


public protocol Skin {

    var fonts: SkinFontProvider { get }

    var colors: SkinColorProvider { get }

}


public protocol SkinFontProvider {

    var titleFont: UIFont { get }
    var subtitleFont: UIFont { get }
}

public protocol SkinColorProvider {

    var primaryDark: UIColor { get }
    var primaryMid: UIColor { get }
    var primaryLight: UIColor { get }
}


public extension Skin where Self: SkinFontProvider {

    var fonts: SkinFontProvider { return self }
}

public extension Skin where Self: SkinColorProvider {

    var colors: SkinColorProvider { return self }
}
