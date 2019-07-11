
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
            let re = APIReturn(returnJson: JSON(response.result.value!), pObj: plist)
            self.initDelegate?.updateInit(plist: re.obj as! PlistModel)
        }
    }
}
