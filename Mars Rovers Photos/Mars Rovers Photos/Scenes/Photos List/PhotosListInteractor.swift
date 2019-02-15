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

    func presentSomething()
}

final class PhotosListInteractor {

    let output: PhotosListInteractorOutput
    let worker: PhotosListWorker


    // MARK: - Initializers

    init(output: PhotosListInteractorOutput, worker: PhotosListWorker = PhotosListWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - PhotosListInteractorInput

extension PhotosListInteractor: PhotosListInteractorInput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
