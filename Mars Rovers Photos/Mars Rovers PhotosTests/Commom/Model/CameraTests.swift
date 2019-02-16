//
//  CameraTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class CameraTests: XCTestCase {

    func testFromJsonReturnCuriosityPhotos() {
        
        // Given
        
        let bundle = Bundle(for: PhotosTests.self)
        let path = bundle.path(forResource: "curiosity", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
            
            let photos = GenericResponse(object: data).photos ?? []
            
            XCTAssertEqual(photos.first?.camera?.id!, 20)
            XCTAssertEqual(photos.first?.camera?.name!, "FHAZ")
            XCTAssertEqual(photos.first?.camera?.roverId!, 5)
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
            
            XCTAssertEqual(photos.first?.camera?.id!, 16)
            XCTAssertEqual(photos.first?.camera?.name!, "NAVCAM")
            XCTAssertEqual(photos.first?.camera?.roverId, 6)
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
            
            XCTAssertEqual(photos.first?.camera?.id!, 30)
            XCTAssertEqual(photos.first?.camera?.name!, "PANCAM")
            XCTAssertEqual(photos.first?.camera?.roverId, 7)
            
        } catch  {
            XCTFail()
        }
    }    
}
