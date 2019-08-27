
import Foundation

class Storage {
    static let driver = StorageRealmBase()
    
    static func getLogInStatus() -> LoginStatus {
        return self.driver.getLoginStatus()
    }
    
    static func writeLoginInfo(email: String, status: LoginStatus) {
        return self.driver.writeLoginInfo(email: email, status: status)
    }
    
    static func writeCurrencyRate(rate: [CurrencyRateModel]) {
        return self.driver.writeCurrencyRate(rate: rate)
    }
}
