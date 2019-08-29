
import Foundation

extension MainViewController {
    @objc public func updateRate() {
        //TAOYU:  update currency rate when clicking the update btn
    }
    
    @objc public func loadRates(sendCurrency: String) {
        rateMap = Storage.readCurrencyRateByBase(baseCurrency: sendCurrency)
    }
}
