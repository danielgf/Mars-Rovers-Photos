//
//  PhotoDetailsViewController.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    // MARK: - Variables
    var interactor: PhotoDetailsInteractorAPI?
    var router: (NSObjectProtocol & PhotoDetailsRouterAPI & PhotoDetailsDataPassingAPI)?
    var date = Date()
    var viewModel = ListOfPhotosViewModel()
    
    // MARK: - Outlets
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Init and setup
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = PhotoDetailsInteractor()
        let presenter = PhotoDetailsPresenter()
        let router = PhotoDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataSource = interactor
    }
    
    // MARK: - Life cicle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

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
        title = viewModel.camera?.name
        sender.isUserInteractionEnabled = false
    }
    
    // MARK: - Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
}

// MARK: - Conform to DetailsOfPhotoViewControllerAPI protocol
extension PhotoDetailsViewController: PhotoDetailsViewControllerAPI {
    
}
