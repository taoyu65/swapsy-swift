
import UIKit

class SendAmountBoxBuilder: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 5)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.2
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("not initialed.")
    }
}
