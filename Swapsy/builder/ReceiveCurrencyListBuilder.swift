
import UIKit

struct ReceiveCurrencyListBuilder {
    static func startBuild () {
        var currencyLabel = UILabel(frame: .zero)
        
        var collection: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 15
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(named: "")?.withAlphaComponent(1)
            view.isScrollEnabled = true
            //            view.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
            return view
        }()
    }
    
    private func initLabel () -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = .swapsyFontLight(ofSize: 10)
        label.textColor = .swapsyWhite
        
        return label
    }
    
    private func initImage(imageName: String) -> UIImage? {
        guard let image = UIImage(named: imageName) else {  return nil }
        
        return image
    }
}
