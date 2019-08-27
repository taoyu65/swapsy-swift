
import Foundation
import SwiftyJSON

class PlistModel: Codable, ReturnProtocol {
    
    var version: String? = ""
    var currency: [String]? = []
    var currencyWalletMap: [String: [String]]? = nil
//    var currencyIconMap: [String: String]? = [:]
    
    private let _plistFileName = "SwapsyInit"
    
    init() {
        _init()
    }
    
    private func _init() {
        let plist = getPlist()
        
        //TAOYU: 需要验证是否有值
        version = plist?.version
        currency = plist?.currency
        currencyWalletMap = plist?.currencyWalletMap
//        currencyIconMap = plist?.currencyIconMap
    }
    
//    func construct(content: [JSON]) {
//        return
//    }
    
    func construct(content: String) {
        let content = JSON.init(parseJSON: content)
        if let version = content["version"].string {
            self.version = version
        }
        if let currency = content["currency"].arrayObject {
            self.currency = currency as? [String]
        }
        if let currencyWalletMap = content["currencyWalletMap"].dictionaryObject {
            self.currencyWalletMap = currencyWalletMap as? [String: [String]]
        }
        
    }

    private func getPlist() -> PlistModel? {
        if  let path = Bundle.main.path(forResource: _plistFileName, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let plist = try? PropertyListDecoder().decode(PlistModel.self, from: xml) {
            return plist
        }
        
        return nil
    }
    
//    public func upddate() {
//        let encoder = PropertyListEncoder()
//        encoder.outputFormat = .xml
//        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(_plistFileName).plist")
//        do {
//            let data = try encoder.encode(self)
//            try data.write(to: path)
//        } catch {
//            print(error)
//        }
//    }
}
