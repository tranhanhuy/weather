// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import Foundation
import ObjectMapper

class WeatherModel: Mappable {
  
  internal var main: String!
  internal var icon: String!
  
  required init?(map:Map) {
    mapping(map: map)
  }
  
  func mapping(map:Map){
    main <- map["main"]
    icon <- map["icon"]
  }
}
