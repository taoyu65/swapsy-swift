
import Foundation
import SwiftyJSON
import Alamofire

extension API {
    private static let route = "settings/currency-map"
    
    func CurrencyMaps(success: @escaping (_ rateList: CurrencyRateModel) -> Void) {
        let requestUrl = getUrl(route: API.route)
        Alamofire.request(requestUrl, method: .get).responseJSON {
            response in
            let crm = CurrencyRateModel()
            let value = response.result.value
            self.checkReturnValue(value: value as Any)
            let re = APIReturn(returnJson: JSON(value!), pObj: crm)
            self.checkContentObj(obj: re.obj)
            success(re.obj as! CurrencyRateModel)
        }
    }
}
