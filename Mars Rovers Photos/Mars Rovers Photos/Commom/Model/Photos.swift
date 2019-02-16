//
//  Photos.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Photos: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let earthDate = "earth_date"
    static let camera = "camera"
    static let imgSrc = "img_src"
    static let rover = "rover"
    static let id = "id"
    static let sol = "sol"
  }

  // MARK: Properties
  public var earthDate: String?
  public var camera: Camera?
  public var imgSrc: String?
  public var rover: Rover?
  public var id: Int?
  public var sol: Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    earthDate = json[SerializationKeys.earthDate].string
    camera = Camera(json: json[SerializationKeys.camera])
    imgSrc = json[SerializationKeys.imgSrc].string
    rover = Rover(json: json[SerializationKeys.rover])
    id = json[SerializationKeys.id].int
    sol = json[SerializationKeys.sol].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = earthDate { dictionary[SerializationKeys.earthDate] = value }
    if let value = camera { dictionary[SerializationKeys.camera] = value.dictionaryRepresentation() }
    if let value = imgSrc { dictionary[SerializationKeys.imgSrc] = value }
    if let value = rover { dictionary[SerializationKeys.rover] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = sol { dictionary[SerializationKeys.sol] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.earthDate = aDecoder.decodeObject(forKey: SerializationKeys.earthDate) as? String
    self.camera = aDecoder.decodeObject(forKey: SerializationKeys.camera) as? Camera
    self.imgSrc = aDecoder.decodeObject(forKey: SerializationKeys.imgSrc) as? String
    self.rover = aDecoder.decodeObject(forKey: SerializationKeys.rover) as? Rover
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.sol = aDecoder.decodeObject(forKey: SerializationKeys.sol) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(earthDate, forKey: SerializationKeys.earthDate)
    aCoder.encode(camera, forKey: SerializationKeys.camera)
    aCoder.encode(imgSrc, forKey: SerializationKeys.imgSrc)
    aCoder.encode(rover, forKey: SerializationKeys.rover)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(sol, forKey: SerializationKeys.sol)
  }

}
