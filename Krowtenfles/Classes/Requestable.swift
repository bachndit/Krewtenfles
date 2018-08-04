//
//  RequestType.swift
//  BBreviary
//
//  Created by BachVQ on 7/5/18.
//  Copyright © 2018 BachVQ. All rights reserved.
//

import Foundation
import Alamofire

public protocol Requestable {
    associatedtype ResponseType: Codable
    var path: String {get}
}

public protocol PostRequestable: Requestable {}
extension PostRequestable {
    var method: HTTPMethod {
        return .post
    }
}

public protocol GetRequestable: Requestable {}
extension GetRequestable {
    var method: HTTPMethod {
        return .get
    }
}

public protocol PutRequestable: Requestable {}
extension PutRequestable {
    var method: HTTPMethod {
        return .get
    }
}

public protocol DeleteRequestable: Requestable {}
extension DeleteRequestable {
    public var method: HTTPMethod {
        return .delete
    }
}
