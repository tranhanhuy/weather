// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import Foundation
import Alamofire
import AlamofireObjectMapper

class APIService {
  
  class var instance: APIService {
    struct Singleton {
      static let instance = APIService()
    }
    return Singleton.instance
  }
  
  func weatherInfo(cityId: Double, success: @escaping (_ weatherResponse: WeatherResponse) -> (),
               failed: @escaping () -> ()) {
    var params: [String: Any] = [:]
    params["APPID"] = API_KEY
    params["id"] = cityId
    params["cnt"] = 6
    params["units"] = "metric"
    
    AF.request(API_WEATHER_INFO, parameters: params).responseObject { (response: DataResponse<WeatherResponse, AFError>) in
      if(response.response?.statusCode == 200){
        if let rs = response.value {
          success(rs)
        } else {
          failed()
        }
      } else {
        failed()
      }
    }
  }
}
