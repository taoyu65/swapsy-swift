
import Foundation

protocol StorageProtocol {
    
    func ReadLoginStatus() -> LoginStatus
    
    func writeLoginInfo(email: String, status: LoginStatus)
    
    func writeCurrencyRate(rate: [CurrencyRateModel])
}
