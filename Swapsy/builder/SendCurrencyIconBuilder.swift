
import UIKit

class SendCurrencyIconBuilder: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.layer.addSublayer(puslsatingLayer)
        self.layer.addSublayer(trackShape)
        self.layer.addSublayer(timeShape)
        
    }
    
    func run() {
        runAnimation()
        animatePulsatingLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        timeShape.position = self.center
        puslsatingLayer.position = self.center
        trackShape.position = self.center
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 40, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        timeShape.path = circularPath.cgPath
        puslsatingLayer.path = circularPath.cgPath
        trackShape.path = circularPath.cgPath
    }
    
//    lazy var centerPoint = .zero
    
    lazy var trackShape: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.gray.cgColor
        shape.lineWidth = 6
        shape.strokeEnd = 1
        shape.lineCap = CAShapeLayerLineCap.round
        shape.fillColor = UIColor.white.cgColor
        return shape
    }()
    
    lazy var timeShape: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.flatBlue.withAlphaComponent(0.8).cgColor
        shape.lineWidth = 6
        shape.strokeEnd = 0
        shape.lineCap = CAShapeLayerLineCap.round
        shape.fillColor = UIColor.white.cgColor
        return shape
    }()
    
    lazy var puslsatingLayer: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.strokeColor = UIColor.clear.cgColor
        shape.lineWidth = 10
        shape.lineCap = CAShapeLayerLineCap.round
        shape.fillColor = UIColor.flatBlue.withAlphaComponent(0.3).cgColor // UIColor(named: "system")?.withAlphaComponent(0.3).cgColor
        return shape
    }()
    
    private func runAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue  = 1
        basicAnimation.duration = 1.5
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        timeShape.add(basicAnimation, forKey: "basic")
    }
    
    private func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale.xy")
        animation.toValue = 1.3
        animation.duration = 1.2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
//        animation.position = centerPoint
        puslsatingLayer.add(animation, forKey: "pulsating")
    }
    
//    private func initCurrencyImage() -> UIImage {
//        var image =
//
//
//    }
}
