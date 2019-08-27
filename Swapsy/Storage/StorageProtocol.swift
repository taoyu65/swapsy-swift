
import Foundation

protocol StorageProtocol {
    
    func getLoginStatus() -> LoginStatus
    
    func writeLoginInfo(email: String, status: LoginStatus)
    
    func writeCurrencyRate(rate: [CurrencyRateModel])
}
