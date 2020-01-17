
import Foundation
import SVProgressHUD

extension MainViewController {
    
    // update currency rate when clicking the update btn
    @objc public func updateRate() {
        SVProgressHUD.show()
        let bll = ExchangeRate()
        bll.update(success: {() -> Void in
            self.loadRates(sendCurrency: self.sendCurrency)
            self.receiveCollection.reloadData()
            SVProgressHUD.dismiss()
        })
    }
    
    @objc public func loadRates(sendCurrency: String) {
        rateMap = Storage.readCurrencyRateByBase(baseCurrency: sendCurrency)
    }
}
