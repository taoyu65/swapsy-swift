
import UIKit

class SelectOfferController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paypalViewController = UIStoryboard(name: SwapsyStoryBoard.swapsyStoryBoard, bundle: nil).instantiateViewController(withIdentifier: SwapsyIdentifier.searchResultIdentifier) as! SearchResultViewController
        paypalViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        
        let zelleCiewController = UIStoryboard(name: SwapsyStoryBoard.swapsyStoryBoard, bundle: nil).instantiateViewController(withIdentifier: SwapsyIdentifier.searchResultIdentifier) as! SearchResultViewController
        zelleCiewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        viewControllers = [paypalViewController, zelleCiewController]
    }
}
