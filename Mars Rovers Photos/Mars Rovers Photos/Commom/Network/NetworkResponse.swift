//
//  NetworkResponse.swift
//  Conversions
//
//  Created by Daniel Griso Filho on 07/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct ResponseStatus {
    var success: Bool
    var message: String = ""
    var response: DataResponse<Any>?
    var error: Error?
    
    static func status(_ success: Bool,
                       message: String = "",
                       response: DataResponse<Any>? = nil,
                       error: Error? = nil) -> ResponseStatus {
        
        return ResponseStatus(success: success,
                              message: message,
                              response: response,
                              error: error)
    }
    
    static func successStatus() -> ResponseStatus {
        return ResponseStatus(success: true,
                              message: "",
                              response: nil,
                              error: nil)
    }
    
    static func errorStatus(_ error: Error) -> ResponseStatus {
        return ResponseStatus(success: false,
                              message: error.localizedDescription,
                              response: nil,
                              error: error)
    }
    
}

struct HTTPStatus {
    
    struct Success {
        static let ok = (statusCode: 200, description: "The request was successful; no errors or faults.")
        static let created = (statusCode: 201, description: "Creation request was successful.")
        static let accepted = (statusCode: 202, description: "Modification request was accepted but may not have completed.")
        static let noContent = (statusCode: 204, description: "Modification was successful, but there’s no content in the response.")
    }
    
    struct OtherURL {
        static let movedPermanently = (statusCode: 301, description: "Content may be available at a different URL.")
        static let found = (statusCode: 302, description: "Content definitely available at a specific URL.")
    }
    
    struct Fail {
        static let badRequest = (statusCode: 404, description: "The request wasn’t accepted as formed.")
        static let unauthorized = (statusCode: 401, description: "The request wasn’t accepted because its authorization is missing or invalid due to an issue with the developer token.")
        static let forbidden = (statusCode: 403, description: "The request wasn’t accepted due to an issue with the music user token or because it’s using incorrect authentication.")
        static let notFound = (statusCode: 404, description: "The requested resource doesn’t exist.")
        static let methodNotAllowed = (statusCode: 405, description: "The method can’t be used for the request.")
        static let conflit = (statusCode: 409, description: "A modification or creation request couldn’t be processed because there’s a conflict with the current state of the resource.")
        static let payloadTooLarge = (statusCode: 413, description: "The body of the request is too large.")
        static let urlTooLong = (statusCode: 414, description: "The URI of the request is too long and won’t be processed.")
        static let tooManyRequests = (statusCode: 429, description: "The user has made too many requests. See Simulate the Too Many Requests Error.")
    }
    
    struct ServerError {
        static let internalServerError = (statusCode: 500, description: "There’s an error processing the request.")
        static let notImplemented = (statusCode: 501, description: "Endpoint is currently unavailable and reserved for future use.")
        static let serviceUnavalible = (statusCode: 503, description: "The service is currently unavailable to process requests.")
    }
    
}
