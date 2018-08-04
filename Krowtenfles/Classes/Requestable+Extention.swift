//
//  Requestable+Extention.swift
//  BBreviary
//
//  Created by BachVQ on 7/6/18.
//  Copyright © 2018 BachVQ. All rights reserved.
//

import Foundation
import Alamofire

public extension Requestable {
    
    var method: HTTPMethod {
        get {
            return .get
        }
        set {}
    }
    
    var params: [String: String]? {
        get {
            return nil
        }
        set {}
    }
    
    // Config Header for Request
    var header: [String: String]? {
        get {
            return nil
        }
        set {}
    }
    
    func execute(dispatcher: NetworkSession = NetworkSession.shared, onSuccess: @escaping CompletionHandler<ResponseType>, onError: @escaping CompletionHandler<Error>) {
        let requestData = RequestConfiguration(path: path, method: method, params: params, headers: header)
        
        dispatcher.requestDispatch(request: requestData , onSuccess: { (responseData: Data) in
            do {
                let jsonDecoder = JSONDecoder()
                let result = try jsonDecoder.decode(ResponseType.self, from: responseData)
                DispatchQueue.main.async {
                    onSuccess(result)
                }
            } catch let error {
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        }) { (error) in
            DispatchQueue.main.async {
                onError(error)
            }
        }
    }
}
