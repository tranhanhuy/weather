// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import Foundation
import ObjectMapper

class DayModel: Mappable {
  
  internal var temp: TempModel?
  internal var weather: [WeatherModel]?
  
  required init?(map:Map) {
    mapping(map: map)
  }
  
  func mapping(map:Map){
    temp <- map["temp"]
    weather <- map["weather"]
  }
}
