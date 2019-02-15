//
//  PhotosListViewController.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotosListViewControllerInput: PhotosListPresenterOutput {

}

protocol PhotosListViewControllerOutput {

    func doSomething()
}

final class PhotosListViewController: UIViewController {

    var output: PhotosListViewControllerOutput!
    var router: PhotosListRouterProtocol!


    // MARK: - Initializers

    init(configurator: PhotosListConfigurator = PhotosListConfigurator.shared) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: PhotosListConfigurator = PhotosListConfigurator.shared) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        doSomethingOnLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        // TODO: Ask the Interactor to do some work

        output.doSomething()
    }
}


// MARK: - PhotosListViewControllerPresenterOutput

extension PhotosListViewController: PhotosListViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: PhotosListViewModel) {

        // TODO: Update UI
    }
}
