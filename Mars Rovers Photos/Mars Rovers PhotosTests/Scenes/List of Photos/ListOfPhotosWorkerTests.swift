//
//  ListOfPhotosWorkerTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class ListOfPhotosWorkerTests: XCTestCase {

    
    func testFetchListPhotos() {
        
        let worker = ListOfPhotosSpy()
        
        worker.getPhotos(endPoint: "", date: Date().getCurrentTime()) { photos, status in
        }
        
        XCTAssertTrue(worker.getPhotosCalled)
        
    }
}

final class ListOfPhotosSpy: ListOfPhotosWorker {
    
    var getPhotosCalled = false
    
    override func getPhotos(endPoint: String, date: Date, completion: @escaping RemoteCompletion) {
        getPhotosCalled = true
        
        completion(nil,nil)
    }
}
