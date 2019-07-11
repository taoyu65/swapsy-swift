
import UIKit

class MainLabelBuilder: UILabel {
    let size: CGFloat = 10
    
    init(text: String, textAligment: NSTextAlignment, numberOfLines: Int) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = textAlignment
        self.font = .swapsyFontLight(ofSize: size)
        self.textColor = .swapsyMainText
        self.text = text
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.numberOfLines = numberOfLines
        self.backgroundColor = .swapsyWhite
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
