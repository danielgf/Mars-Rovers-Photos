//
//  PhotosListWorker.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation
import Alamofire

typealias RemoteCompletion = ([Photos]?, ResponseStatus?) -> Void

class PhotosListWorker {

    func fetchPhotos(endPoint: String, date: Date, completion: @escaping RemoteCompletion) {
        
        let changeSonda = PhotoListAPI.Constants.baseURL.rawValue.replacingOccurrences(of: PhotoListAPI.UrlParts.Key.sonda, with: endPoint)
        let changeDate = PhotoListAPI.Constants.date.rawValue.replacingOccurrences(of: PhotoListAPI.UrlParts.Key.date, with: date.formateDateToString(date: date))
//        let changeDate = PhotoListAPI.Constants.date.rawValue.replacingOccurrences(of: PhotoListAPI.UrlParts.Key.date, with: "2010-02-17")
        let finalURL = changeSonda + changeDate + PhotoListAPI.Constants.apiKey.rawValue
        
        guard let url = URL(string: finalURL) else { return completion(nil, nil) }
        
        NetworkManager.request(url: url, method: .get, handleObject: { (json) in
            var objects = [Photos]()
            let payload = GenericResponse(json: json).photos ?? []
            payload.forEach({ objects.append($0) })
            completion(objects, ResponseStatus.successStatus())
        }) { (status) in
            completion(nil, status)
        }
    }
}
