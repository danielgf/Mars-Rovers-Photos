//
//  ListOfPhotosViewModel.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation

class ListOfPhotosViewModel {

    // MARK: - Initialization

    convenience init(_ object: Photos?) {
        self.init()
        self.object = object
    }

    // MARK: - Properties

   var object: Photos?
    
    var eartDate: String { return object?.earthDate ?? "" }
    var imgSrc: String { return object?.imgSrc ?? "" }
    var id: Int { return object?.id ?? 0 }
    var sol: Int { return object?.sol ?? 0 }
    var camera: Camera? { return object?.camera }
    var cameras: [Cameras]? { return object?.rover?.cameras}
    var rover: Rover? { return object?.rover }
    

}
