//
//  PhotosListPresenter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotosListPresenterInput: PhotosListInteractorOutput {

}

protocol PhotosListPresenterOutput: class {

    func displaySomething(viewModel: PhotosListViewModel)
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


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = PhotosListViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
