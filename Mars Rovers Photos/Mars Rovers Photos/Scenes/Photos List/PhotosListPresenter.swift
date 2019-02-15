//
//  PhotosListPresenter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import Alamofire

protocol PhotosListPresenterInput: PhotosListInteractorOutput {

}

protocol PhotosListPresenterOutput: class {

    func displayPhotos(viewModel: PhotosListViewModel)
    func displayError(error: String)
}

final class PhotosListPresenter {

    private(set) weak var output: PhotosListPresenterOutput!


    // MARK: - Initializers

    init(output: PhotosListPresenterOutput) {

        self.output = output
    }
}


// MARK: - PhotosListPresenterInput

extension PhotosListPresenter: PhotosListPresenterInput {
    
    func presentPhotos(photos: [Photos]) {
        output.displayPhotos(viewModel: PhotosListViewModel(photos))
    }
    
    func presentError(error: Error) {
        output.displayError(error: error.localizedDescription)
    }
}
