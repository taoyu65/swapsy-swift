//
//  API.swift
//  Swapsy
//
//  Created by Tao Yu on 6/21/19.
//  Copyright © 2019 Tao Yu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API: APIBase {
    var loginDelegate: LoginDelegate?
    var initDelegate: InitDelegate?
    
    private let url: String = "http://localhost:4443/v1/"
    internal let apiKey: String = ""
    
    internal var json: JSON?
    
    override init() {
        json = JSON()
    }
    
    func getUrl(route: String) -> String {
        return url + route
    }
}
