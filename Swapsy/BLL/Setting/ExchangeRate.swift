
import Foundation

class ExchangeRate {
    
    public func update(success: @escaping () -> Void) {
        let api = API()
        api.CurrencyMaps(success: {(response: CurrencyRateModel) -> Void in
            Storage.driver.writeCurrencyRate(rate: response.rateMap)
            success()
        })
    }
}
