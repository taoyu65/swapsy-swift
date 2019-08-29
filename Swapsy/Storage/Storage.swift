
import Foundation

class Storage {
    static let driver = StorageRealmBase()
    
    static func readLogInStatus() -> LoginStatus {
        return self.driver.ReadLoginStatus()
    }
    
    static func readCurrencyRateByBase(baseCurrency: String) -> [CurrencyRateModel] {
        return self.driver.ReadCurrencyRateByBase(baseCurrency: baseCurrency)
    }
    
    static func writeLoginInfo(email: String, status: LoginStatus) {
        return self.driver.writeLoginInfo(email: email, status: status)
    }
    
    static func writeCurrencyRate(rate: [CurrencyRateModel]) {
        return self.driver.writeCurrencyRate(rate: rate)
    }
}
