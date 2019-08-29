
extension StorageRealmBase {
    
    func writeLoginInfo(email: String, status: LoginStatus) {
        let userStatus = UserStatusRealm()
        userStatus.loginEmail = email
        userStatus.loginStatus = status
        
        try! realm.write {
            realm.add(userStatus)
        }
    }
}

