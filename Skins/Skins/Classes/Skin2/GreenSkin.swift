import Foundation


public struct GreenSkin: Skin, SkinFontProvider, SkinColorProvider {

    public init() { }



    public let titleFont: UIFont = UIFont.boldSystemFont(ofSize: 24)

    public let subtitleFont: UIFont = UIFont.systemFont(ofSize: 24)



    public let primaryDark: UIColor = .green

    public let primaryMid: UIColor = .gray

    public let primaryLight: UIColor = .white
}
