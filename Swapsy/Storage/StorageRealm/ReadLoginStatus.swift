
extension StorageRealmBase {
    
    func ReadLoginStatus() -> LoginStatus {
        if let first = realm.objects(UserStatusRealm.self).sorted(byKeyPath: "createdTime", ascending: true).first {
            return first.loginStatus
        }
        
        return LoginStatus.LoggedOut
    }
}
