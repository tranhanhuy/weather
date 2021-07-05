// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import Foundation
import ObjectMapper

class TempModel: Mappable {
  
  internal var day: Double!
  internal var min: Double!
  internal var max: Double!
  
  required init?(map:Map) {
    mapping(map: map)
  }
  
  func mapping(map:Map){
    day <- map["day"]
    min <- map["min"]
    max <- map["max"]
  }
}
