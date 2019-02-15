//
//  PhotoDetailsInteractor.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotoDetailsInteractorInput: PhotoDetailsViewControllerOutput {

}

protocol PhotoDetailsInteractorOutput {

    func presentSomething()
}

final class PhotoDetailsInteractor {

    let output: PhotoDetailsInteractorOutput
    let worker: PhotoDetailsWorker


    // MARK: - Initializers

    init(output: PhotoDetailsInteractorOutput, worker: PhotoDetailsWorker = PhotoDetailsWorker()) {

        self.output = output
        self.worker = worker
    }
}


// MARK: - PhotoDetailsInteractorInput

extension PhotoDetailsInteractor: PhotoDetailsInteractorInput {


    // MARK: - Business logic

    func doSomething() {

        // TODO: Create some Worker to do the work

        worker.doSomeWork()

        // TODO: Pass the result to the Presenter

        output.presentSomething()
    }
}
