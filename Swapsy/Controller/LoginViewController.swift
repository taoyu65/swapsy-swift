
import UIKit
import SVProgressHUD

class LoginViewController: UIViewController, LoginDelegate {
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    
    override func viewDidLoad() {
        let userStatus = UserStatusModel()
        if userStatus.isLoggedIn() {
            //加载 block model.
            // 根据block 的不同状态 加载不同的 界面.
            //TAOYU: here todo
            
            // read and load to realm
            _fetchCurrencyRate()
            
            redirectToMainView()
        }
        
        super.viewDidLoad()
    }

    @IBAction func LoginOnClick(_ sender: Any) {
        guard let email = EmailText.text, let password = PasswordText.text else {
            return
        }
        SVProgressHUD.show()
        // login in
        let api = API()
        api.loginDelegate = self
        api.Login(email: email, password: password)
//        let message = "Successfully logged in with pass."
//        let alert = UIAlertController(title: "Success", message: message, preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    func userDidLogin(apiReturn: APIReturn) {
        if apiReturn.status {
            do {
                try recordLogin()
            } catch {
                fatalError("Email can not be empty.")
            }
            redirectToMainView()
        } else {
            let message = "Email or passord wrong."
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Error", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        SVProgressHUD.dismiss()
    }
    
    private func redirectToMainView() {
        let storyboard = UIStoryboard(name: "Swapsy", bundle: nil)
        let mainViewController = storyboard.instantiateInitialViewController()!
        self.present(mainViewController, animated: true, completion: {
            print("user did login after and excuting completion")
        })
        print("success")
    }
    
    private func recordLogin() throws {
        let email = EmailText.text!
        if email == "" {
            throw RuntimeError("email can not be empty.")
        }
        Storage.writeLoginInfo(email: email, status: .LoggedIn)
    }
    
    private func _fetchCurrencyRate() {
        let api = API()
        api.CurrencyMaps(success: {(response: CurrencyRateModel) -> Void in
            Storage.writeCurrencyRate(rate: response.rateMap)
        })
    }
}

