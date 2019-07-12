
import UIKit
import SVProgressHUD
import RealmSwift

class LoginViewController: UIViewController, LoginDelegate {
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        let userStatus = UserStatusModel()
        if userStatus.isLoggedIn() {
            //加载 block model.
            // 根据block 的不同状态 加载不同的 界面.
            //TAOYU: here todo
            
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
            recordLogin()
            redirectToMainView()
            //print(Realm.Configuration.defaultConfiguration.fileURL)
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
    
    private func recordLogin() {
        let userStatus = UserStatusRealm()
        userStatus.loginEmail = EmailText.text
        userStatus.loginStatus = .LoggedIn
        
        try! realm.write {
            realm.add(userStatus)
        }
    }
}

