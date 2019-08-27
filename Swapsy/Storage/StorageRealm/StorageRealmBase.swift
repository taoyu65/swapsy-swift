
import Foundation
import RealmSwift

class StorageRealmBase: StorageProtocol {
    internal let realm = try! Realm()
    
    init() {
        print(Realm.Configuration.defaultConfiguration.fileURL as Any) //TAOYU: delete
    }
}
