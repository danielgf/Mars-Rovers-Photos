//
//  NetworkManager.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let shared = NetworkManager()
    
    static func request(url: URL, method: HTTPMethod, _ parameters: [String: Any]? = nil, _ enconding: ParameterEncoding = JSONEncoding.default, _ headers: HTTPHeaders? = nil, handleObject: @escaping (JSON) -> Void, handleError: @escaping (ResponseStatus) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: enconding, headers: headers).responseJSON { (response) in
            
            if response.response?.statusCode == HTTPStatus.Success.ok.statusCode, let result = response.result.value {
                let json = JSON(result)
                handleObject(json)
            }else {
                if let error = response.error{
                    let validation = ResponseStatus.errorStatus(error)
                    handleError(validation)
                }
            }
        }
    }
}
