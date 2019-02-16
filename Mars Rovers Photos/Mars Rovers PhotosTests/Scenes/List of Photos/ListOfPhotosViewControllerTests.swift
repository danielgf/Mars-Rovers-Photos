//
//  ListOfPhotosViewControllerTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class ListOfPhotosViewControllerTests: XCTestCase {
    
    let view = ListOfPhotosViewControllerSpy()
    
    func testDisplayPhotos() {
        
        view.displayPhotos(viewModel: ListOfPhotosListViewModel())
        
        XCTAssertTrue(view.displayCalled)
    }
    
    func testDisplayError() {
        
        view.displayError(message: "")
        
        XCTAssertTrue(view.displayCalled)
    }

}

final class ListOfPhotosViewControllerSpy: ListOfPhotosViewControllerAPI {
    
    var displayCalled = false
    
    func displayPhotos(viewModel: ListOfPhotosListViewModel) {
        displayCalled = true
    }
    
    func displayError(message: String) {
        displayCalled = true
    }
}
