
import Foundation
import RealmSwift

class UserStatusModel: ModelBase {
    
    let realm = try! Realm()
    
    func isLoggedIn() -> Bool {
        if let first = realm.objects(UserStatusRealm.self).sorted(byKeyPath: "createdTime", ascending: true).first {
            return first.loginStatus == LoginStatus.LoggedIn
        }
        
        return false
    }
}
