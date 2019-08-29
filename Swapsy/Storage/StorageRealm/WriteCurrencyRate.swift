
import Foundation

extension StorageRealmBase {
    
    func writeCurrencyRate(rate: [CurrencyRateModel]) {
        try! realm.write {
            let allDeleteRates = realm.objects(CurrencyRateRealm.self)
            realm.delete(allDeleteRates)
            realm.add(_getRate(rates: rate))
        }
    }
    
    private func _getRate(rates: [CurrencyRateModel]) -> [CurrencyRateRealm] {
        var re: [CurrencyRateRealm] = []
        for item in rates {
            re.append(CurrencyRateRealm(base: item.base, pair: item.pair, rate: item.rate))
        }
        
        return re
    }
}
