
//
//  ListOfPhotosProtocols.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

protocol ListOfPhotosViewControllerAPI: class {
    func displayPhotos(viewModel: ListOfPhotosListViewModel)
    func displayError(message: String)
}

protocol ListOfPhotosInteractorAPI: class {
    func requestPhotos(endPoint: String, date: Date)
    func verifyEmptyData(viewModel: ListOfPhotosListViewModel) -> Bool
    func fetchDate(date: Date) -> Date
}

protocol ListOfPhotosInteractorDataSourceAPI: class {
    var viewModel: ListOfPhotosViewModel? { get }
}

protocol ListOfPhotosPresenterAPI: class {
    func presenterFetchPhotos(response: [Photos])
    func presenterFetchError(message: String)
}

protocol ListOfPhotosRouterAPI: class {
    func passDataToNextScreen(segue: UIStoryboardSegue?)
    func showPhoto(viewModel:ListOfPhotosViewModel)
    var viewModel: ListOfPhotosViewModel? { get }
}

protocol ListOfPhotosDataPassingAPI: class {
}
