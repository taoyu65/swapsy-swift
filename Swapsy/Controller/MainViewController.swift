
import SideMenu
import Segmentio

class MainViewController: UIViewController {
    
    let plist = PlistModel()
    
    @IBOutlet weak var logoutBtn: UIBarButtonItem!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var safeView: UIView!
    @IBOutlet weak var sendCurrencyIconView: UIView!
    @IBOutlet weak var sendLabel: UILabel!
    @IBOutlet weak var sendAmountBoxView: UIView!
    
    private var circleViewController: SendCurrencyIconViewControlelr?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _initSideMenu()
        
        //MARK: others
        menuBtn.tintColor = .swapsyFlatBlue
        logoutBtn.tintColor = .swapsyFlatBlue
        
        //MARK: segmentio
        var segmentioView: Segmentio!
        let segmentioViewRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        segmentioView = Segmentio(frame: segmentioViewRect)
        SegmentioBuilder.startBuild(segmentioView: segmentioView, segmentioStyle: .onlyLabel, plist: plist)
        segmentioView.selectedSegmentioIndex = 0
        
        //MARK: send label
        sendLabel.text = .swapsySendLabel
        
        //MARK: send amount box
        let sendAmountBox = SendAmountBoxBuilder()
        
        //MARK: last update label
        let lastUpdateLabel = MainLabelBuilder(text: "Last update: Unknown", textAligment: .left, numberOfLines: 1)
        
        //MARK: current currency label
        let currentCurrencyLabel = MainLabelBuilder(text: "Current currency: Unknown", textAligment: .right, numberOfLines: 1)
        
        //MARK: send amount text field
        let sendAmountField: UITextField = {
            let tf = UITextField()
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.font = .swapsyFontLight(ofSize: .mainTextSize)
            tf.placeholder = "Enter Amount"
            tf.layer.borderWidth = 0.5
            tf.layer.borderColor = UIColor.swapsyMainText.cgColor.copy(alpha: 0.5)
            tf.textAlignment = .center
            tf.layer.cornerRadius = 4
//            tf.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
            return tf
        }()
        
        //MARK: update button
        let updateButton: UIButton = {
            let bt = UIButton()
            bt.translatesAutoresizingMaskIntoConstraints = false
            bt.titleLabel?.textAlignment = .center
            bt.titleLabel?.font = .swapsyFontLight(ofSize: .mainTextSize)
            bt.contentMode = .scaleAspectFit
            bt.clipsToBounds = true
            bt.layer.cornerRadius = 4
            bt.backgroundColor = .swapsyFlatBlue
            bt.setTitle("Update", for: .normal)
            bt.setTitleColor(.swapsyFlatWhite, for: .normal)
//            bt.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
            return bt
        }()
        
        
        safeView.addSubview(segmentioView)
        sendAmountBoxView.addSubview(sendAmountBox)
        sendAmountBox.addSubview(lastUpdateLabel)
        sendAmountBox.addSubview(currentCurrencyLabel)
        sendAmountBox.addSubview(sendAmountField)
        sendAmountBox.addSubview(updateButton)
        
        NSLayoutConstraint.activate([
            sendAmountBox.topAnchor.constraint(equalTo: sendAmountBoxView.topAnchor, constant: 5),
            sendAmountBox.leftAnchor.constraint(equalTo: sendAmountBoxView.leftAnchor, constant: 15),
            sendAmountBox.rightAnchor.constraint(equalTo: sendAmountBoxView.rightAnchor, constant: -15),
            sendAmountBox.heightAnchor.constraint(equalToConstant: 105),
            
            lastUpdateLabel.topAnchor.constraint(equalTo: sendAmountBox.topAnchor, constant: 5),
            lastUpdateLabel.leftAnchor.constraint(equalTo: sendAmountBox.leftAnchor, constant: 10),
            lastUpdateLabel.rightAnchor.constraint(equalTo: sendAmountBox.centerXAnchor),
            lastUpdateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            currentCurrencyLabel.topAnchor.constraint(equalTo: sendAmountBox.topAnchor, constant: 5),
            currentCurrencyLabel.leftAnchor.constraint(equalTo: sendAmountBox.centerXAnchor, constant: 0),
            currentCurrencyLabel.rightAnchor.constraint(equalTo: sendAmountBox.rightAnchor, constant: -10),
            currentCurrencyLabel.heightAnchor.constraint(equalToConstant: 20),
            
            sendAmountField.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 7),
            sendAmountField.leftAnchor.constraint(equalTo: sendAmountBox.leftAnchor, constant: 10),
            sendAmountField.rightAnchor.constraint(equalTo: sendAmountBox.rightAnchor, constant: -10),
            sendAmountField.heightAnchor.constraint(equalToConstant: 30),
            
            updateButton.topAnchor.constraint(equalTo: sendAmountField.bottomAnchor, constant: 7),
            updateButton.leftAnchor.constraint(equalTo: sendAmountBox.leftAnchor, constant: 10),
            updateButton.rightAnchor.constraint(equalTo: sendAmountBox.rightAnchor, constant: -10),
            updateButton.heightAnchor.constraint(equalToConstant: 30)
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

