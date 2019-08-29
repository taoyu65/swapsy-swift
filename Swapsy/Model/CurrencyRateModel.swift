
import Foundation
import SwiftyJSON

class CurrencyRateModel: ReturnProtocol {
    
    let base: String
    let pair: String
    let rate: Double
    
    var rateMap: [CurrencyRateModel] = []
    
    init() {
        self.base = ""
        self.pair = ""
        self.rate = 0
    }
    
    init(base: String, pair: String, rate: Double) {
        self.base = base
        self.pair = pair
        self.rate = rate
    }
    
    func construct(content: String) {
        let content = JSON.init(parseJSON: content)
        for item in content.array! {
            if let base = item["base"].string, let pair = item["pair"].string, let rate = item["rate"].double {
                rateMap.append(CurrencyRateModel(base: base, pair: pair, rate: rate))
            }
        }
    }
}
