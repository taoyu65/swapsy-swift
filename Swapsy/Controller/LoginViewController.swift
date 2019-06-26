//
//  ViewController.swift
//  Swapsy
//
//  Created by Tao Yu on 6/20/19.
//  Copyright © 2019 Tao Yu. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController, LoginDelegate {
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    
    override func viewDidLoad() {
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
            
            print("success")
        } else {
            let message = "Email or passord wrong."
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Error", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        SVProgressHUD.dismiss()
    }
}

