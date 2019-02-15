//
//  PhotosListViewModel.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright (c) 2019 Daniel Griso Filho. All rights reserved.
//

import UIKit

struct PhotosListViewModel {

    let eartDate: String?
    let imgSrc: String?
    let id: Int?
    let sol: Int?
    let camera: Camera?
    let cameras: [Cameras]?
    let rover: Rover?
}
