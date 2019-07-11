
import Foundation

protocol InitMessageDelegate {
    func showMessage(message: String)
}

struct InitComponent: InitDelegate {
    
    func updateInit() -> Void {
        let api = API()
        api.initDelegate = self
        api.Init()
    }
    
    internal func updateInit(plist: PlistModel) {
        let _plist = PlistModel()
        if _plist.version != plist.version {
            //TAOYU: alert user the app need to be updated
            print("this app need to be updated")
        }
    }
}
