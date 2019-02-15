//
//  PhotosListViewController.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import ProgressHUD

protocol PhotosListViewControllerInput: PhotosListPresenterOutput {

}

protocol PhotosListViewControllerOutput {
    
    var photos: [Photos]? { get }

    func fetchPhotos(endPoint: String, date: Date)
    
    func fetchDate(date: Date) -> Date
    
    func verifyEmptyData(viewModel: PhotosListViewModel) -> Bool
}

final class PhotosListViewController: UIViewController {

    var output: PhotosListViewControllerOutput!
    var router: PhotosListRouterProtocol!
    fileprivate var viewModel = PhotosListViewModel()
    var date = Date().getCurrentTime()
    
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
        fetchPhotos(endPoint: segmentedControl.titleForSegment(at: 0) ?? "", date: date )
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

    func fetchPhotos(endPoint: String, date: Date) {
        ProgressHUD.show()
        output.fetchPhotos(endPoint: endPoint, date: date)
    }
    
    func verifyItems() {
        if output.verifyEmptyData(viewModel: viewModel) {
            let newDate = output.fetchDate(date: date)
            date = newDate
            let index = segmentedControl.selectedSegmentIndex
            let title = segmentedControl.titleForSegment(at: index) ?? ""
            fetchPhotos(endPoint: title, date: date)
        }else {
            collectionView.reloadData()
            ProgressHUD.dismiss()
        }
    }
    
    
    // MARK: - Actions
    @IBAction func segmentedControlValueChange(_ sender: UISegmentedControl) {
        viewModel = PhotosListViewModel()
        date = Date().getCurrentTime()
        let index = sender.selectedSegmentIndex
        let title = sender.titleForSegment(at: index) ?? ""
        fetchPhotos(endPoint: title, date: date)
    }
}


// MARK: - PhotosListViewControllerPresenterOutput

extension PhotosListViewController: PhotosListViewControllerInput {

    func displayPhotos(viewModel: PhotosListViewModel) {
        self.viewModel = viewModel
        
        verifyItems()
    }
    
    func displayError(error: String) {
        ProgressHUD.dismiss()
        let alert = UIAlertController.showSimpleAlert(message: error)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Conform UICollectionViewDelegate, UICollectionViewDataSource, CustomLayoutDelegate protocols
extension PhotosListViewController: UICollectionViewDelegate, UICollectionViewDataSource, CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.cellReuseId(), for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.itemViewModel(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vm = viewModel.itemViewModel(indexPath: indexPath) {
            router.navigateToPhoto(viewModel: vm)
        }
    }
    
}
