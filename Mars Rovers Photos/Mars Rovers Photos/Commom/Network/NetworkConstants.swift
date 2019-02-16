//
//  NetworkConstants.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

final class PhotoListAPI {
    
    enum Constants: String {
        case baseURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/{sonda}/photos?"
        case date = "earth_date={date}&"
        case apiKey = "api_key=SH78sjsZiCQcJgAYKYA2MfYMXoYjsrSRrJDOwx3I"
    }
    
    struct UrlParts {
        struct Key {
            static let sonda = "{sonda}"
            static let date = "{date}"
        }
    }
    
    struct UrlParameters {
        static let earthDate = "earth_date"
        static let apiKey = "api_key"
    }
}
