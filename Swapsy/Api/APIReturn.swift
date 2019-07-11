
import Foundation
import SwiftyJSON

struct APIReturn {
    private var _status: Bool = false
    private var _message: String = ""
    private var _obj: Any? = nil
    
    init(_ status: Bool, _ message: String) {
        _status = status
        _message = message
        _obj = nil
    }
    
    init(returnJson re: JSON, pObj: ReturnProtocol? = nil) {
        if let content = re["content"].dictionary {
            pObj?.construct(content: content)
            _obj = pObj
        }
        if let status = re["status"].bool {
            _status = Bool(status)
            if let message = re["message"].string {
                _message = String(message)
            }
        }
    }
    
    init() {
        self.init(true, "")
    }
    
    var status: Bool {
        get {
            return _status
        }
        set {
            _status = newValue
        }
    }
    
    var message: String {
        get {
            return _message
        }
        set {
            _message = newValue
        }
    }
    
    var obj: Any {
        get {
            return _obj as Any
        }
    }
}
