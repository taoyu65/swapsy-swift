
import Foundation

struct RuntimeError: Error {
    let message: String
    let isNotifyTao: Bool
    
    init(_ message: String, _ isNotifyTao: Bool = false) {
        self.message = message
        self.isNotifyTao = isNotifyTao
        //TAOYU: document all the messages
    }
    
    public var localizedDescription: String {
        return message
    }
}
