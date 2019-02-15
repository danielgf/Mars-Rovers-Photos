//
//  PhotoDetailsViewController.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import SDWebImage

protocol PhotoDetailsViewControllerInput: PhotoDetailsPresenterOutput { }

protocol PhotoDetailsViewControllerOutput { }

final class PhotoDetailsViewController: UIViewController {

    var output: PhotoDetailsViewControllerOutput!
    var router: PhotoDetailsRouterProtocol!
    var viewModel = PhotosViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Initializers

    init(configurator: PhotoDetailsConfigurator = PhotoDetailsConfigurator.shared, viewModel: PhotosViewModel) {
        self.viewModel = viewModel
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
        updateView()
        titleButton.isUserInteractionEnabled = true
    }
    
    // MARK: - Internal Functions
    fileprivate func updateView() {
        titleButton.setTitle(viewModel.camera?.name, for: .normal)
        imageView.sd_setImage(with: URL(string: viewModel.imgSrc ), completed: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func didClickOnButton(_ sender: UIButton) {
        titleButton.setTitle(viewModel.camera?.fullName, for: .normal)
        sender.isUserInteractionEnabled = false
    }
}


// MARK: - PhotoDetailsViewControllerPresenterOutput

extension PhotoDetailsViewController: PhotoDetailsViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: PhotoDetailsViewModel) {

        // TODO: Update UI
    }
}
