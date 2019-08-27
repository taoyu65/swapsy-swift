
import UIKit

class MainImageViewBuilder: UIImageView {
    
    init(imageName: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints  = false
        self.image                                      = UIImage(named: imageName)
        self.contentMode                                = .scaleAspectFit
        self.clipsToBounds                              = true
        self.tintColor                                  = UIColor(named: "system")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
