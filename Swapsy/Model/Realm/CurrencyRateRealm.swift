
import Foundation
import RealmSwift

class CurrencyRateRealm: Object {
    @objc dynamic var baseCurrency: String?
    @objc dynamic var pairCurrency: String?
    @objc dynamic var rate: Double = 0
    
    convenience init(base: String, pair: String, rate: Double) {
        self.init()
        self.baseCurrency = base
        self.pairCurrency = pair
        self.rate = rate
    }
    

//    override required init() {
//        fatalError("init() has not been implemented")
//    }
}
