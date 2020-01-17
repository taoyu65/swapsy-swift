
import Foundation
import SwiftyJSON

class CurrencyRateModel: ReturnProtocol {
    
    private var _base: String
    private var _pair: String
    private var _rate: Double
    private var _rateMap: [CurrencyRateModel] = []
    
    var base: String {
        get { return _base; }
        set { _base = newValue }
    }
    
    var pair: String {
        get { return _pair }
        set { _pair = newValue }
    }
    
    var rate: Double {
        get {
            return Double(round(_rate * 10000) / 10000)
        }
        set { _rate = newValue }
    }
    
    var rateMap: [CurrencyRateModel] {
        get { return _rateMap }
    }
    
    init() {
        self._base = ""
        self._pair = ""
        self._rate = 0
    }
    
    init(base: String, pair: String, rate: Double) {
        self._base = base
        self._pair = pair
        self._rate = rate
    }
    
    func construct(content: String) {
        let content = JSON.init(parseJSON: content)
        for item in content.array! {
            if let base = item["base"].string, let pair = item["pair"].string, let rate = item["rate"].double {
                _rateMap.append(CurrencyRateModel(base: base, pair: pair, rate: rate))
            }
        }
    }
}
