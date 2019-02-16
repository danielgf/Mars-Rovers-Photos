//
//  PhotosTests.swift
//  Mars Rovers PhotosTests
//
//  Created by Daniel Griso Filho on 16/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest
@testable import Mars_Rovers_Photos

class PhotosTests: XCTestCase {

    func testFromJsonReturnCuriosityPhotos() {
        
        // Given
        
        let bundle = Bundle(for: PhotosTests.self)
        let path = bundle.path(forResource: "curiosity", ofType: "json")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
            
            let photos = GenericResponse(object: data).photos ?? []
            
            XCTAssertEqual(photos.first?.id!, 670921)
            XCTAssertEqual(photos.first?.sol!, 2319)
            XCTAssertEqual(photos.first?.imgSrc!, "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/02319/opgs/edr/fcam/FLA_603358966EDR_F0740210FHAZ00341M_.JPG")
            XCTAssertEqual(photos.first?.earthDate!, "2019-02-13")
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
            
            XCTAssertEqual(photos.first?.id!, 651790)
            XCTAssertEqual(photos.first?.sol!, 5000)
            XCTAssertEqual(photos.first?.imgSrc!, "https://mars.nasa.gov/mer/gallery/all/1/n/5000/1N572065026EFFD1B3P1960L0M1-BR.JPG")
            XCTAssertEqual(photos.first?.earthDate!, "2018-02-17")
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
            
            XCTAssertEqual(photos.first?.id!, 318733)
            XCTAssertEqual(photos.first?.sol!, 2177)
            XCTAssertEqual(photos.first?.imgSrc!, "http://mars.nasa.gov/mer/gallery/all/2/p/2177/2P319717415ESFB27MP2600L8M1-BR.JPG")
            XCTAssertEqual(photos.first?.earthDate!, "2010-02-17")

        } catch  {
            XCTFail()
        }
    }

}
