//
//  RequestData.swift
//  BBreviary
//
//  Created by BachVQ on 7/5/18.
//  Copyright © 2018 BachVQ. All rights reserved.
//

import Foundation
import Alamofire

public struct RequestConfiguration {
    let path: String
    let method: HTTPMethod
    let params: [String: Any]?
    let headers: [String:String]?
    
    init(path: String, method: HTTPMethod, params: [String: Any]? = nil, headers: [String:String]? = nil) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
}
