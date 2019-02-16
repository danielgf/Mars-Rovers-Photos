//
//  ListOfPhotosPresenter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

class ListOfPhotosPresenter {
    
    weak var viewController: ListOfPhotosViewControllerAPI?
}

// MARK: - Conform to ListOfPhotosPresenterAPI protocol
extension ListOfPhotosPresenter: ListOfPhotosPresenterAPI {
    
    func presenterFetchPhotos(response: [Photos]) {
        viewController?.displayPhotos(viewModel: ListOfPhotosListViewModel(response))
    }
    
    func presenterFetchError(message: String) {
        viewController?.displayError(message: message)
    }
}
