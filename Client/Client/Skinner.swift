import Foundation

import Skins


private var _skin: Skin!


extension Notification.Name {

    static let SkinDidChangeNotification = Notification.Name("SkinDidChangeNotification")
}


enum Skinner {

    static var currentSkin: Skin! {
        get {
            return _skin
        }
        set {
            _skin = newValue

            NotificationCenter.default.post(name: .SkinDidChangeNotification, object: nil, userInfo: [ "skin" : _skin ])
        }
    }
}
