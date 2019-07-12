import UIKit
import ChameleonFramework

extension String {
    //fonts
//    static let liteFont = "AppleSDGothicNeo-Light"
//    static let regularFont = "AppleSDGothicNeo-Regular"
    
    //
    static let swapsySendLabel = "Send"
}

extension UIFont {
    class func swapsyFontDefault(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func swapsyFontLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}


extension CGFloat {
    static let mainTextSize = CGFloat(15.0)
}

extension UIColor {
    static let swapsyFlatWhite = FlatWhite()
    static let swapsyWhite = UIColor.white
    static let swapsyBlock = UIColor.black
    static let swapsyMainText = UIColor.darkGray
    static let swapsyFlatBlue = FlatBlue()
}
