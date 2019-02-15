//
//  PhotoDetailsViewController.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol PhotoDetailsViewControllerInput: PhotoDetailsPresenterOutput {

}

protocol PhotoDetailsViewControllerOutput {

    func doSomething()
}

final class PhotoDetailsViewController: UIViewController {

    var output: PhotoDetailsViewControllerOutput!
    var router: PhotoDetailsRouterProtocol!
    
    // MARK: - Initializers

    init(configurator: PhotoDetailsConfigurator = PhotoDetailsConfigurator.shared) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: PhotoDetailsConfigurator = PhotoDetailsConfigurator.shared) {

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


// MARK: - PhotoDetailsViewControllerPresenterOutput

extension PhotoDetailsViewController: PhotoDetailsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: PhotoDetailsViewModel) {

        // TODO: Update UI
    }
}
