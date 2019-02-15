//
//  PhotoDetailsConfigurator.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

final class PhotoDetailsConfigurator {


    // MARK: - Singleton

    static let shared: PhotoDetailsConfigurator = PhotoDetailsConfigurator()


    // MARK: - Configuration

    func configure(viewController: PhotoDetailsViewController) {

        let router = PhotoDetailsRouter(viewController: viewController)
        let presenter = PhotoDetailsPresenter(output: viewController)
        let interactor = PhotoDetailsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
