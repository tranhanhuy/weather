// Created on 2/11/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import Foundation

class AppTest {
  
  class var instance: AppTest {
    struct Singleton {
      static let instance = AppTest()
    }
    return Singleton.instance
  }
  
  let todayWeatherView: String = "todayWeatherView"
  let dayWeatherView: String = "dayWeatherView"
  let topView: String = "topView"
  let cityName: String = "cityName"
  let cityButton: String = "cityButton"
  let citiesView: String = "citiesView"
  let mainScreen: String = "mainScreen"
  
}
