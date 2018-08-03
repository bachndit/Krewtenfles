//
//  RequestType.swift
//  BBreviary
//
//  Created by BachVQ on 7/5/18.
//  Copyright © 2018 BachVQ. All rights reserved.
//

import Foundation
import Alamofire

protocol Requestable {
    associatedtype ResponseType: Codable
    var path: String {get}
}

protocol PostRequestable: Requestable {}
extension PostRequestable {
    var method: HTTPMethod {
        return .post
    }
}

protocol GetRequestable: Requestable {}
extension GetRequestable {
    var method: HTTPMethod {
        return .get
    }
}

protocol PutRequestable: Requestable {}
extension PutRequestable {
    var method: HTTPMethod {
        return .get
    }
}

protocol DeleteRequestable: Requestable {}
extension DeleteRequestable {
    var method: HTTPMethod {
        return .delete
    }
}
