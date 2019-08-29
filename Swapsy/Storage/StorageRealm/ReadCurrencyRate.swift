import UIKit

extension StorageRealmBase {
    
    func ReadCurrencyRateByBase(baseCurrency: String) -> [CurrencyRateModel] {
        var re: [CurrencyRateModel] = []
        let predicate = NSPredicate(format: "baseCurrency = %@", baseCurrency)
        let list = realm.objects(CurrencyRateRealm.self).filter(predicate)
        for item in list {
            re.append(CurrencyRateModel(base: item.baseCurrency, pair: item.pairCurrency, rate: item.rate))
        }
        
        return re
    }
}
