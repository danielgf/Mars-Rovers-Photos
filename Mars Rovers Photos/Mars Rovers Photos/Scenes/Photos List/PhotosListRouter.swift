//
//  PhotosListRouter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotosListRouterProtocol {

    var viewController: PhotosListViewController? { get }

    func navigateToSomewhere()
}

final class PhotosListRouter {

    weak var viewController: PhotosListViewController?


    // MARK: - Initializers

    init(viewController: PhotosListViewController?) {

        self.viewController = viewController
    }
}


// MARK: - PhotosListRouterProtocol

extension PhotosListRouter: PhotosListRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
