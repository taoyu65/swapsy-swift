
import SideMenu
import Segmentio

class MainViewController: UIViewController {
    
    @IBOutlet weak var safeView: UIView!
    @IBOutlet weak var sendCurrencyIconView: UIView!
    @IBOutlet weak var sendLabel: UILabel!
    @IBOutlet weak var sendAmountBoxView: UIView!
    
    private var circleViewController: SendCurrencyIconViewControlelr?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _initSideMenu()
        
        //MARK: segmentio
        var segmentioView: Segmentio!
        let segmentioViewRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        segmentioView = Segmentio(frame: segmentioViewRect)
        safeView.addSubview(segmentioView)
        
        SegmentioBuilder.startBuild(segmentioView: segmentioView, segmentioStyle: .onlyLabel)
        segmentioView.selectedSegmentioIndex = 0
        
        //MARK: send label
        sendLabel.text = .swapsySendLabel
        
        //MARK: send amount box
        let sendAmountBox = SendAmountBoxBuilder()
        
        //
        
        sendAmountBoxView.addSubview(sendAmountBox)
        NSLayoutConstraint.activate([
            sendAmountBox.topAnchor.constraint(equalTo: sendAmountBoxView.topAnchor, constant: 5),
            sendAmountBox.leftAnchor.constraint(equalTo: sendAmountBoxView.leftAnchor, constant: 15),
            sendAmountBox.rightAnchor.constraint(equalTo: sendAmountBoxView.rightAnchor, constant: -15),
            sendAmountBox.heightAnchor.constraint(equalToConstant: 105)
            
        ])
        
        print("view did load")
        
        segmentioView.valueDidChange = {
            segmentio, segmentIndex in
            print("selected item: ", segmentIndex)
            
            var imageName = segmentio.segmentioItems[segmentIndex].title ?? ""
            imageName = imageName + "-s"
            print(imageName)
            
            self.circleViewController?.changeCurrencyImage(name: imageName)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("view did appear")
    }
    
    
    
    private func _initSideMenu() {
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        SideMenuManager.default.menuWidth = view.frame.width * 0.4
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "circleSegue" {
            circleViewController = segue.destination as? SendCurrencyIconViewControlelr
            print("this is 1")
            
        }
    }
}

extension UIStackView {
    func addBackgroud(color: UIColor) -> Void {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}

