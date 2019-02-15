//
//  PhotoDetailsPresenter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotoDetailsPresenterInput: PhotoDetailsInteractorOutput {

}

protocol PhotoDetailsPresenterOutput: class {

    func displaySomething(viewModel: PhotoDetailsViewModel)
}

final class PhotoDetailsPresenter {

    private(set) weak var output: PhotoDetailsPresenterOutput!


    // MARK: - Initializers

    init(output: PhotoDetailsPresenterOutput) {

        self.output = output
    }
}


// MARK: - PhotoDetailsPresenterInput

extension PhotoDetailsPresenter: PhotoDetailsPresenterInput {


    // MARK: - Presentation logic

    func presentSomething() {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModel = PhotoDetailsViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
