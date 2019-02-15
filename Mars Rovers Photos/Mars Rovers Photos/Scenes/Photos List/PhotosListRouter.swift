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
    var viewModel: PhotosViewModel? { get }

    func navigateToPhoto(viewModel: PhotosViewModel)
    
    func passDataTONextScene(segue: UIStoryboardSegue)
}

final class PhotosListRouter {

    weak var viewController: PhotosListViewController?
    weak var viewModel: PhotosViewModel?

    // MARK: - Initializers

    init(viewController: PhotosListViewController?) {

        self.viewController = viewController
    }
}


// MARK: - PhotosListRouterProtocol

extension PhotosListRouter: PhotosListRouterProtocol {
    func passDataTONextScene(segue: UIStoryboardSegue) {
        if segue.identifier == "Details" {
            let vc = segue.destination as! PhotoDetailsViewController
            vc.viewModel = self.viewModel!
        }
    }
    
    // MARK: - Navigation
    func navigateToPhoto(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
        viewController?.performSegue(withIdentifier: "Details", sender: nil)
    }
}
