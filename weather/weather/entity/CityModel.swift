// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import Foundation
import ObjectMapper

class CityModel: Mappable {
  
  internal var id: Double!
  internal var name: String!
  internal var background: UIImage? {
    return UIImage.init(named: "\(self.id!)")
  }
  
  required init?(map:Map) {
    mapping(map: map)
  }
  
  init(id: Double, name: String) {
    self.id = id
    self.name = name
  }
  
  func mapping(map:Map){
    id <- map["id"]
    name <- map["name"]
  }
}
