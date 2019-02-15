//
//  PhotosListListViewModel.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class PhotosListListViewModel {

    // MARK: - Properties

    fileprivate var itemsViewModels = [IndexPath: PhotosViewModel]()

    var numberOfItems: Int { return itemsViewModels.count }
    
    // MARK: - Initialization
    
    convenience init(_ objects: [Photos]) {
        self.init()
        self.itemsViewModels = objects.enumerated().reduce(into: [IndexPath: PhotosViewModel]()) {
            let newIndexPath = IndexPath(row: $1.offset, section: 0)
            $0[newIndexPath] = PhotosViewModel($1.element)
        }
    }

    // MARK: - View Model
    
    func itemViewModel(indexPath: IndexPath) -> PhotosViewModel? {
        if itemsViewModels.keys.contains(indexPath) {
            return itemsViewModels[indexPath]
        }
        return nil
    }

}
