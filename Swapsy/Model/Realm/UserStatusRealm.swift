
import Foundation
import RealmSwift

class UserStatusRealm: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var loginEmail: String?
    @objc private dynamic var _loginStatus: Int = LoginStatus.LoggedOut.rawValue
    @objc dynamic var createdTime: Date = Date()
    
    var loginStatus: LoginStatus {
        get {
            return LoginStatus(rawValue: _loginStatus)!
        }
        set {
            _loginStatus = newValue.rawValue
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}
