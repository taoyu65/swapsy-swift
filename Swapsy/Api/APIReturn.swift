//
//  APIReturn.swift
//  Swapsy
//
//  Created by Tao Yu on 6/21/19.
//  Copyright © 2019 Tao Yu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct APIReturn {
    private var _status: Bool = false
    private var _message: String = ""
    
    init(_ status: Bool, _ message: String) {
        _status = status
        _message = message
    }
    
    init(returnJson re: JSON) {
        if let status = re["status"].bool {
            _status = Bool(status)
            if let message = re["message"].string {
                _message = String(message)
            }
        } else {
            
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
//
//    mutating func initReturn(returnJson re: JSON) {
//        if let status = re["status"].bool {
//            _status = status
//            if let message = re["message"].string {
//                _message = message
//            }
//        } else {
//
//        }
//    }
}
