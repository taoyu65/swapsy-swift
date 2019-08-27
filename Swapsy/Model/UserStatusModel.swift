
import Foundation

class UserStatusModel: ModelBase {
    
    func isLoggedIn() -> Bool {
        return Storage.getLogInStatus() == LoginStatus.LoggedIn
//        if let first = realm.objects(UserStatusRealm.self).sorted(byKeyPath: "createdTime", ascending: true).first {
//            return first.loginStatus == LoginStatus.LoggedIn
//        }
//
//        return false
    }
}
