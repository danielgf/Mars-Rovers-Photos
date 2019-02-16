//
//  ListOfPhotosRouterTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class ListOfPhotosRouterTests: XCTestCase {
    
    let router = ListOfPhotosRouterSpy()
    
    func testPassData() {
        router.passDataToNextScreen(segue: nil)
        
        XCTAssertTrue(router.routerFunctionsCalled)
    }
    
    func testShowPhotos() {
        router.showPhoto(viewModel: ListOfPhotosViewModel())
        
        XCTAssertTrue(router.routerFunctionsCalled)
        
        guard let _ = router.viewModel else { return XCTFail() }
    }

}

final class ListOfPhotosRouterSpy: ListOfPhotosRouterAPI, ListOfPhotosDataPassingAPI {
    
    var routerFunctionsCalled = false
    
    func passDataToNextScreen(segue: UIStoryboardSegue?) {
        routerFunctionsCalled = true
    }
    
    func showPhoto(viewModel: ListOfPhotosViewModel) {
        routerFunctionsCalled = true
        self.viewModel = ListOfPhotosViewModel()
    }
    
    var viewModel: ListOfPhotosViewModel?
}
