//
//  Rover.swift
//  Mars Rovers Photos
//
//  Created by Daniel Griso Filho on 15/02/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Rover: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let maxDate = "max_date"
    static let status = "status"
    static let maxSol = "max_sol"
    static let name = "name"
    static let id = "id"
    static let landingDate = "landing_date"
    static let cameras = "cameras"
    static let totalPhotos = "total_photos"
    static let launchDate = "launch_date"
  }

  // MARK: Properties
  public var maxDate: String?
  public var status: String?
  public var maxSol: Int?
  public var name: String?
  public var id: Int?
  public var landingDate: String?
  public var cameras: [Cameras]?
  public var totalPhotos: Int?
  public var launchDate: String?

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
    maxDate = json[SerializationKeys.maxDate].string
    status = json[SerializationKeys.status].string
    maxSol = json[SerializationKeys.maxSol].int
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    landingDate = json[SerializationKeys.landingDate].string
    if let items = json[SerializationKeys.cameras].array { cameras = items.map { Cameras(json: $0) } }
    totalPhotos = json[SerializationKeys.totalPhotos].int
    launchDate = json[SerializationKeys.launchDate].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = maxDate { dictionary[SerializationKeys.maxDate] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = maxSol { dictionary[SerializationKeys.maxSol] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = landingDate { dictionary[SerializationKeys.landingDate] = value }
    if let value = cameras { dictionary[SerializationKeys.cameras] = value.map { $0.dictionaryRepresentation() } }
    if let value = totalPhotos { dictionary[SerializationKeys.totalPhotos] = value }
    if let value = launchDate { dictionary[SerializationKeys.launchDate] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.maxDate = aDecoder.decodeObject(forKey: SerializationKeys.maxDate) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.maxSol = aDecoder.decodeObject(forKey: SerializationKeys.maxSol) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.landingDate = aDecoder.decodeObject(forKey: SerializationKeys.landingDate) as? String
    self.cameras = aDecoder.decodeObject(forKey: SerializationKeys.cameras) as? [Cameras]
    self.totalPhotos = aDecoder.decodeObject(forKey: SerializationKeys.totalPhotos) as? Int
    self.launchDate = aDecoder.decodeObject(forKey: SerializationKeys.launchDate) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(maxDate, forKey: SerializationKeys.maxDate)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(maxSol, forKey: SerializationKeys.maxSol)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(landingDate, forKey: SerializationKeys.landingDate)
    aCoder.encode(cameras, forKey: SerializationKeys.cameras)
    aCoder.encode(totalPhotos, forKey: SerializationKeys.totalPhotos)
    aCoder.encode(launchDate, forKey: SerializationKeys.launchDate)
  }

}
