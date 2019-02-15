//
//  PhotosListInteractor.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotosListInteractorInput: PhotosListViewControllerOutput {

}

protocol PhotosListInteractorOutput {

    func presentPhotos(photos: [Photos])
    func presentError(error: Error)
}

final class PhotosListInteractor {

    let output: PhotosListInteractorOutput
    let worker: PhotosListWorker
    var photos: [Photos]?


    // MARK: - Initializers

    init(output: PhotosListInteractorOutput, worker: PhotosListWorker = PhotosListWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - PhotosListInteractorInput

extension PhotosListInteractor: PhotosListInteractorInput {
    
    func fetchPhotos(endPoint: String) {
        worker.fetchPhotos(endPoint: endPoint) { [weak self] photos, status in
            if let strongSelf = self {
                if let error = status?.error {
                    strongSelf.output.presentError(error: error)
                }else if let photosArray = photos {
                    strongSelf.photos = photosArray
                    strongSelf.output.presentPhotos(photos: photosArray)
                }
            }
        }
    }
}
