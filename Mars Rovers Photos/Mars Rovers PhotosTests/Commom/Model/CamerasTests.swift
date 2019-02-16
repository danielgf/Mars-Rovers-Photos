//
//  CamerasTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class CamerasTests: XCTestCase {

    func testFromJsonReturnCuriosityPhotos() {
        
        // Given
        
        let bundle = Bundle(for: PhotosTests.self)
        let path = bundle.path(forResource: "curiosity", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
            
            let photos = GenericResponse(object: data).photos ?? []
            
            XCTAssertEqual(photos.first?.rover?.cameras?.first?.name!, "FHAZ")
            XCTAssertEqual(photos.first?.rover?.cameras?.first?.fullName!, "Front Hazard Avoidance Camera")
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
            
            XCTAssertEqual(photos.first?.rover?.cameras?.first?.name!, "FHAZ")
            XCTAssertEqual(photos.first?.rover?.cameras?.first?.fullName!, "Front Hazard Avoidance Camera")
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
            
            XCTAssertEqual(photos.first?.rover?.cameras?.first?.name!, "FHAZ")
            XCTAssertEqual(photos.first?.rover?.cameras?.first?.fullName!, "Front Hazard Avoidance Camera")
            
        } catch  {
            XCTFail()
        }
    }

}
