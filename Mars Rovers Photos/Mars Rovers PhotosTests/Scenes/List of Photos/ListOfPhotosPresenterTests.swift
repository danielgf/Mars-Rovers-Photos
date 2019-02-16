//
//  ListOfPhotosPresenterTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class ListOfPhotosPresenterTests: XCTestCase {

    let presenter = ListOfPhotosPresenterSpy()
    
    func testFetchPhotos() {
        presenter.presenterFetchPhotos(response: [Photos]())
        
        XCTAssertTrue(presenter.presenterFunctionsCalled)
    }
    
    func testFetchError() {
        presenter.presenterFetchError(message: "")
        
        XCTAssertTrue(presenter.presenterFunctionsCalled)
    }
    
}

final class ListOfPhotosPresenterSpy: ListOfPhotosPresenterAPI {
    var presenterFunctionsCalled = false
    
    func presenterFetchPhotos(response: [Photos]) {
        presenterFunctionsCalled = true
    }
    
    func presenterFetchError(message: String) {
        presenterFunctionsCalled = true
    }
}
