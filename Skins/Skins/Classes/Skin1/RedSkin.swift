import Foundation


public struct RedSkin: Skin, SkinFontProvider, SkinColorProvider {

    public init() { }



    public let titleFont: UIFont = UIFont.boldSystemFont(ofSize: 24)

    public let subtitleFont: UIFont = UIFont.systemFont(ofSize: 24)



    public let primaryDark: UIColor = .red

    public let primaryMid: UIColor = .gray

    public let primaryLight: UIColor = .white
}
