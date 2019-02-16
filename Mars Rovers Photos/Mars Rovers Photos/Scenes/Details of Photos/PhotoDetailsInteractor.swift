//
//  PhotoDetailsInteractor.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

class PhotoDetailsInteractor {
    
    var presenter: PhotoDetailsPresenterAPI?
    var worker: PhotoDetailsWorker?
    var viewModel: ListOfPhotosViewModel?
}

// MARK: - Conform to PhotoDetailsInteractorAPI, PhotoDetailsInteractorDataSourceAPI protocols
extension PhotoDetailsInteractor: PhotoDetailsInteractorAPI, PhotoDetailsInteractorDataSourceAPI {
    
    func getPhotoInfo() {
//        presenter?.presentUpdatePhoto(viewModel: viewModel!)
    }
    
}
