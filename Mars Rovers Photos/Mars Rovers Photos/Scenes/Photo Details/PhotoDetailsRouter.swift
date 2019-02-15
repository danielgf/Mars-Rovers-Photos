//
//  PhotoDetailsRouter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotoDetailsRouterProtocol {

    var viewController: PhotoDetailsViewController? { get }

    func navigateToSomewhere()
}

final class PhotoDetailsRouter {

    weak var viewController: PhotoDetailsViewController?


    // MARK: - Initializers

    init(viewController: PhotoDetailsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - PhotoDetailsRouterProtocol

extension PhotoDetailsRouter: PhotoDetailsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
