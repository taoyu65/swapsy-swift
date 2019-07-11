import UIKit

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
    static let swapsyWhite = SwapsyColor.white
    static let swapsyBlock = SwapsyColor.black
    static let swapsyMainText = SwapsyColor.darkGray
}
