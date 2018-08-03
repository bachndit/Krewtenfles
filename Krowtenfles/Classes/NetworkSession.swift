//
//  RequestData.swift
//  BBreviary
//
//  Created by BachVQ on 7/5/18.
//  Copyright © 2018 BachVQ. All rights reserved.
//

import Foundation
import Alamofire

typealias CompletionHandler<T> = ((T) -> Void)

protocol NetworkDispatcherRequest {
    func requestDispatch(request: RequestConfiguration, onSuccess: @escaping CompletionHandler<Data>, onFailure: @escaping CompletionHandler<Error>)
}

protocol NetWorkDispatcherDownload {
    func downloadDispatch(
        request: RequestConfiguration,
        onProgressing: @escaping CompletionHandler<Float>,
        onSuccess: @escaping CompletionHandler<Data>,
        onFailure: @escaping CompletionHandler<Error>
    )
}

class NetworkSession: NetworkDispatcherRequest {
    static let shared = NetworkSession()
    
    func requestDispatch(request: RequestConfiguration, onSuccess: @escaping (Data) -> Void, onFailure: @escaping (Error) -> Void) {
        if request.path.isEmpty {
            onFailure(NetworkError.invalidURL)
            return
        }
        
        Alamofire.request(request.path, method: request.method, parameters: request.params, encoding: JSONEncoding.default, headers: request.headers).responseData { (response) in
            if let error = response.error {
                onFailure(error)
                return
            }
			
            guard let data = response.data else {
                onFailure(NetworkError.dataNotFound)
                return
            }
			
            onSuccess(data)
        }
    }
}
