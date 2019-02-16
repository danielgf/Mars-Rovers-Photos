//
//  ListOfPhotosInteractor.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

class ListOfPhotosInteractor {
    
    var presenter: ListOfPhotosPresenterAPI?
    var worker = ListOfPhotosWorker()
    var photos: [Photos]?
    var viewModel: ListOfPhotosViewModel?
}

// MARK: - Conform to ListOfPhotosInteractorAPI, ListOfPhotosInteractorDataSourceAPI protocols
extension ListOfPhotosInteractor: ListOfPhotosInteractorAPI, ListOfPhotosInteractorDataSourceAPI {
    
    func requestPhotos(endPoint: String, date: Date) {
        worker.getPhotos(endPoint: endPoint, date: date, completion: { [weak self] photos, status in
            if let `self` = self {
                if let error = status?.error {
                    self.presenter?.presenterFetchError(message: error.localizedDescription)
                }else if let photosArray = photos {
                    self.photos = photosArray
                    self.presenter?.presenterFetchPhotos(response: photosArray)
                }
            }
        })
    }
    
    func verifyEmptyData(viewModel: ListOfPhotosListViewModel) -> Bool {
        if viewModel.numberOfItems <= 0 {
            return true
        }
        return false
    }
    
    func fetchDate(date: Date) -> Date {
        return date.daysAgo(1)
    }
}
