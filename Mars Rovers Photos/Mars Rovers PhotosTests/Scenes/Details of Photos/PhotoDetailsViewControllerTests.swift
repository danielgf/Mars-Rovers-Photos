//
//  PhotoDetailsViewControllerTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class PhotoDetailsViewControllerTests: XCTestCase {
    
    let vc = PhotoDetailsViewController()
    
    func testViewModel() {
        XCTAssertNotNil(vc.viewModel)
    }

}

final class PhotoDetailsViewControllerSpy: PhotoDetailsViewControllerAPI {
    
}
