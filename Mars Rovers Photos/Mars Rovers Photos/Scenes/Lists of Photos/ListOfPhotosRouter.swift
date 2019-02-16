//
//  ListOfPhotosRouter.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

class ListOfPhotosRouter: NSObject {
    
    // MARK: - Variables
    weak var viewController: ListOfPhotosViewController?
    var dataSource: ListOfPhotosInteractorDataSourceAPI?
    var viewModel: ListOfPhotosViewModel? 
    
    // MARK: - Internal Functions
}

// MARK: - Conform to ListOfPhotosRouterAPI, ListOfPhotosDataPassingAPI protocols
extension ListOfPhotosRouter: ListOfPhotosRouterAPI, ListOfPhotosDataPassingAPI {
    
    // MARK: - Routing
    func showPhoto(viewModel: ListOfPhotosViewModel) {
        self.viewModel = viewModel
        viewController?.performSegue(withIdentifier: "ShowPhoto", sender: nil)
    }
    
    func passDataToNextScreen(segue: UIStoryboardSegue?) {
        if segue?.identifier == "ShowPhoto" {
            let vc = segue?.destination as! PhotoDetailsViewController
            vc.viewModel = self.viewModel!
        }
    }
}
