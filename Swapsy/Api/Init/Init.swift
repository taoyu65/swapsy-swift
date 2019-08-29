
import Foundation
import Alamofire
import SwiftyJSON

protocol InitDelegate {
    func updateInit(plist: PlistModel)
}

extension API {
    private static let initRoute = "init/index"
    
    func Init() {
        let requestUrl = getUrl(route: API.initRoute)
        Alamofire.request(requestUrl, method: .get, parameters: nil).responseJSON {
            response in
            let plist = PlistModel()
            let value = response.result.value
            self.checkReturnValue(value: value as Any)
            let re = APIReturn(returnJson: JSON(value!), pObj: plist)
            self.checkContentObj(obj: re.obj)
            self.initDelegate?.updateInit(plist: re.obj as! PlistModel)
        }
    }
}
