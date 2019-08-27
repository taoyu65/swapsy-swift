//
//  Base.swift
//  Swapsy
//
//  Created by Tao Yu on 6/21/19.
//  Copyright © 2019 Tao Yu. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIBase {
    func checkContentObj(obj: Any, message: String = "", isNotifyTao: Bool = false) {
        let errMessage = "System went wrong."
        let message = message == "" ? errMessage : message
        if case Optional<Any>.none = obj {
            RuntimeError(message, true)
            fatalError(message)
        }
    }
}
