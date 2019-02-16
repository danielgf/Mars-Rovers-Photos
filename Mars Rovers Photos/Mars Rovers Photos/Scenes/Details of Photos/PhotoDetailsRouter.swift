//
//  PhotoDetailsRouter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

class PhotoDetailsRouter: NSObject {
    
    // MARK: - Variables
    weak var viewController: PhotoDetailsViewController?
    var dataSource: PhotoDetailsInteractorDataSourceAPI?
    var viewModel: ListOfPhotosViewModel?
    
    // MARK: - Internal Functions
}

// MARK: - Conform to ListOfPhotosRouterAPI, ListOfPhotosDataPassingAPI protocols
extension PhotoDetailsRouter: PhotoDetailsRouterAPI, PhotoDetailsDataPassingAPI {
    
}
