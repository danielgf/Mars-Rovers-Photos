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
    
    var photos: [Photos]? { get }

    func fetchPhotos()
}

final class PhotosListViewController: UIViewController {

    var output: PhotosListViewControllerOutput!
    var router: PhotosListRouterProtocol!
    fileprivate var viewModels: [PhotosListViewModel] = []
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    

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
        fetchPhotos()
        setupCollectionView()
    }

    // MARK: - Setup
    private func setupCollectionView() {
        collectionView.registerNibCell(CustomCell.self)
        collectionView?.contentInset = UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8)
        if let layout = collectionView?.collectionViewLayout as? CustomLayout {
            layout.delegate = self
        }
    }

    // MARK: - Load data

    func fetchPhotos() {

        // TODO: Ask the Interactor to do some work

        output.fetchPhotos()
    }
}


// MARK: - PhotosListViewControllerPresenterOutput

extension PhotosListViewController: PhotosListViewControllerInput {


    // MARK: - Display logic

    func displayPhotos(viewModel: [PhotosListViewModel]) {
        self.viewModels = viewModel
        collectionView.reloadData()
    }
    
    func displayError(error: String) {
        print(error)
    }
}

// MARK: - Conform protocols
extension PhotosListViewController: UICollectionViewDelegate, UICollectionViewDataSource, CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.cellReuseId(), for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        cell.backgroundColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 300
    }

}
