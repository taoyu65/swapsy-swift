
import UIKit

class ReceiveCurrencyCellBuilder: UICollectionViewCell {
    let flagImage = MainImageViewBuilder(imageName: "")
    let currencyName = MainLabelBuilder(text: "", textAligment: .left, numberOfLines: 1)
    let currencyRate = MainSmallLabelBuilder(text: "", textAligment: .left, numberOfLines: 1)
    let resultLabel = MainLabelBuilder(text: "", textAligment: .left, numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _init() {
        _initStyle(view: contentView)
        
        contentView.addSubview(flagImage)
        contentView.addSubview(currencyName)
        contentView.addSubview(currencyRate)
        contentView.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            flagImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            flagImage.heightAnchor.constraint(equalToConstant: 35),
            flagImage.widthAnchor.constraint(equalToConstant: 35),
            
            currencyName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            currencyName.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            currencyName.leftAnchor.constraint(equalTo: flagImage.rightAnchor, constant: 20),
            currencyName.rightAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            currencyRate.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            currencyRate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            currencyRate.leftAnchor.constraint(equalTo: flagImage.rightAnchor, constant: 20),
            currencyRate.rightAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            resultLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            resultLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 20),
            resultLabel.leftAnchor.constraint(equalTo: contentView.centerXAnchor),
            ])
    }
    
    private func _initStyle(view: UIView) {
        view.layer.masksToBounds = false
        view.backgroundColor = .swapsyWhite
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 5)
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.2
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 14, height: 14)).cgPath
    }
    
    public func updateData() {
        
    }
}
