//
//  RoverTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class RoverTests: XCTestCase {

    func testFromJsonReturnCuriosityPhotos() {
        
        // Given
        
        let bundle = Bundle(for: PhotosTests.self)
        let path = bundle.path(forResource: "curiosity", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
            
            let photos = GenericResponse(object: data).photos ?? []
            
            XCTAssertEqual(photos.first?.rover?.id!, 5)
            XCTAssertEqual(photos.first?.rover?.name!, "Curiosity")
            XCTAssertEqual(photos.first?.rover?.status, "active")
        } catch  {
            XCTFail()
        }
    }
    
    func testFromJsonReturnOpportunityPhotos() {
        
        // Given
        
        let bundle = Bundle(for: PhotosTests.self)
        let path = bundle.path(forResource: "opportunity", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
            
            let photos = GenericResponse(object: data).photos ?? []
            
            XCTAssertEqual(photos.first?.rover?.id!, 6)
            XCTAssertEqual(photos.first?.rover?.name!, "Opportunity")
            XCTAssertEqual(photos.first?.rover?.status, "active")
        } catch  {
            XCTFail()
        }
    }
    
    func testFromJsonReturnSpiritPhotos() {
        
        // Given
        
        let bundle = Bundle(for: PhotosTests.self)
        let path = bundle.path(forResource: "spirit", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
            
            let photos = GenericResponse(object: data).photos ?? []
            
            XCTAssertEqual(photos.first?.rover?.id!, 7)
            XCTAssertEqual(photos.first?.rover?.name!, "Spirit")
            XCTAssertEqual(photos.first?.rover?.status, "complete")
            
        } catch  {
            XCTFail()
        }
    }

}
