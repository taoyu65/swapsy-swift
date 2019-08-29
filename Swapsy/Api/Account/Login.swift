
import Foundation
import SwiftyJSON
import Alamofire

protocol LoginDelegate {
    func userDidLogin(apiReturn: APIReturn)
}

extension API {
    private static let loginRoute = "account/login"
    
    func Login(email: String, password: String) {
        let params: [String: String] = ["email": email, "password": password]
        let requestUrl = getUrl(route: API.loginRoute)
        Alamofire.request(requestUrl, method: .get, parameters: params).responseJSON {
            response in
            let value = response.result.value
            self.checkReturnValue(value: value as Any)
            let re = APIReturn(returnJson: JSON(value!))
           
//            let re_tem = APIReturn(true, "") //TAOYU:  this need to be replaced with the real invoke
            self.loginDelegate?.userDidLogin(apiReturn: re)
        }
    }
}
