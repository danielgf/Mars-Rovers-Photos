//
//  ListOfPhotosInteractorTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class ListOfPhotosInteractorTests: XCTestCase {
    
    let interacor = ListOfPhotosInteractorSpy()
    
    func testRequestPhotos() {
        interacor.requestPhotos(endPoint: "", date: Date().getCurrentTime())
        
        XCTAssertTrue(interacor.interactorFunctionsCalled)
    }
    
    func testVerifyEmpty() {
        let _ = interacor.verifyEmptyData(viewModel: ListOfPhotosListViewModel())
        
        XCTAssertTrue(interacor.interactorFunctionsCalled)
        
        guard let _ = interacor.viewModel else { return XCTFail() }
    }
    
    func testfetchDate() {
        let _ = interacor.fetchDate(date: Date().getCurrentTime())
        
        XCTAssertTrue(interacor.interactorFunctionsCalled)
    }
    
    
}

final class ListOfPhotosInteractorSpy: ListOfPhotosInteractorAPI, ListOfPhotosInteractorDataSourceAPI {
    
     var interactorFunctionsCalled = false
    
    func requestPhotos(endPoint: String, date: Date) {
        interactorFunctionsCalled = true
    }
    
    func verifyEmptyData(viewModel: ListOfPhotosListViewModel) -> Bool {
        interactorFunctionsCalled = true
        self.viewModel = ListOfPhotosViewModel()
        return interactorFunctionsCalled
    }
    
    func fetchDate(date: Date) -> Date {
        interactorFunctionsCalled = true
        return Date().getCurrentTime()
    }
    
    var viewModel: ListOfPhotosViewModel?

}
