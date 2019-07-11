
import UIKit

class SendCurrencyIconViewControlelr: UIViewController {
    
    let sendCurrencyIcon = SendCurrencyIconBuilder()
    
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet weak var circleView: UIView!
    
    override func viewDidLoad() {print("this is 2")
        
        currencyImage.image = UIImage(named: "USD-s")
        circleView.addSubview(sendCurrencyIcon)
        sendCurrencyIcon.run()
        
        NSLayoutConstraint.activate([
            sendCurrencyIcon.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 16),
            sendCurrencyIcon.leftAnchor.constraint(equalTo: circleView.leftAnchor, constant: 16),
//            sendCurrencyIcon.rightAnchor.constraint(equalTo: view.rightAnchor),
//            sendCurrencyIcon.heightAnchor.constraint(equalToConstant: 130),
            
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            imageView.centerYAnchor.constraint(equalTo: sendCurrencyIcon.centerYAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {print("this is 3")
        sendCurrencyIcon.run()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "circleSegue" {
            let mainViewController = segue.destination as? MainViewController
            print(mainViewController)
        }
    }
    
    func changeCurrencyImage(name: String) {
        currencyImage?.image = UIImage(named: name)
    }
}
