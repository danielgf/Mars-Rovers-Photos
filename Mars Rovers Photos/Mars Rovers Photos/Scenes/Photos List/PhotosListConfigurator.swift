//
//  PhotosListConfigurator.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

final class PhotosListConfigurator {


    // MARK: - Singleton

    static let shared: PhotosListConfigurator = PhotosListConfigurator()


    // MARK: - Configuration

    func configure(viewController: PhotosListViewController) {

        let router = PhotosListRouter(viewController: viewController)
        let presenter = PhotosListPresenter(output: viewController)
        let interactor = PhotosListInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}


extension PhotosListViewController: PhotosListPresenterOutput {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataTONextScene(segue: segue)
    }
}
