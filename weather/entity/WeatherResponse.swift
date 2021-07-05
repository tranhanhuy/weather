// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import Foundation
import ObjectMapper

class WeatherResponse: Mappable {
  
  internal var list: [DayModel]!
  internal var city: CityModel!
  
  required init?(map:Map) {
    mapping(map: map)
  }
  
  func mapping(map:Map){
    list <- map["list"]
    city <- map["city"]
  }
}
