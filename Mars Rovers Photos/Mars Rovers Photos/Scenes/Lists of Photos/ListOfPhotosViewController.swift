//
//  ListOfPhotosViewController.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit
import ProgressHUD

class ListOfPhotosViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    var interactor: ListOfPhotosInteractorAPI?
    var router: (NSObjectProtocol & ListOfPhotosRouterAPI & ListOfPhotosDataPassingAPI)?
    var date = Date().getCurrentTime()
    var viewModel = ListOfPhotosListViewModel()
    
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
        let interactor = ListOfPhotosInteractor()
        let presenter = ListOfPhotosPresenter()
        let router = ListOfPhotosRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: - Life cicle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let title = segmentedControl.titleForSegment(at: 0) else { return }
        fetchPhotoList(endPoint: title, date: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Internal Functions
    func fetchPhotoList(endPoint: String, date: Date) {
        ProgressHUD.show()
        interactor?.requestPhotos(endPoint: endPoint, date: date)
    }
    
    fileprivate func setupCollectionView() {
        collectionView.registerNibCell(CustomCell.self)
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        if let layout = collectionView?.collectionViewLayout as? CustomLayout {
            layout.delegate = self
        }
    }
    
    func verifyItems() {
        if let `interactor` = interactor, interactor.verifyEmptyData(viewModel: viewModel) {
            let newDate = interactor.fetchDate(date: date)
            date = newDate
            let index = segmentedControl.selectedSegmentIndex
            let title = segmentedControl.titleForSegment(at: index) ?? ""
            fetchPhotoList(endPoint: title, date: date)
        }else {
            collectionView.reloadData()
            ProgressHUD.dismiss()
        }
    }
    
    // MARK: - Actions
    @IBAction func segmentedDidChange(_ sender: UISegmentedControl) {
        viewModel = ListOfPhotosListViewModel()
        collectionView.reloadData()
        date = Date().getCurrentTime()
        let index = segmentedControl.selectedSegmentIndex
        let title = segmentedControl.titleForSegment(at: index) ?? ""
        fetchPhotoList(endPoint: title, date: date)
    }
    
    // MARK: - Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScreen(segue: segue)
    }

}

// MARK: - Conform to ListOfPhotosViewControllerAPI protocol
extension ListOfPhotosViewController: ListOfPhotosViewControllerAPI {
    
    func displayPhotos(viewModel: ListOfPhotosListViewModel) {
        self.viewModel = viewModel
        verifyItems()
        
    }
    
    func displayError(message: String) {
        let alert = UIAlertController.showSimpleAlert(message: message)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Conform to UICollectionViewDataSource, UICollectionViewDelegate, CustomLayoutDelegate protocols
extension ListOfPhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, CustomLayoutDelegate {
    
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
            router?.showPhoto(viewModel: vm)
        }
    }
    
}
