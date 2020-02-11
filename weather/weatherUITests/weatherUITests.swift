// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import XCTest
@testable import weather

class weatherUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

    app = XCUIApplication()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testAppLaunch() {
    app.launch()
  }
  
  //First Step: Need to display Today weather information
  func testLaunchTodayWeatherView() {
    app.launch()
    XCTAssertTrue(app.otherElements["todayWeatherView"].exists)
  }
  
  //Second Step: Need to display weather of five days
  //Condition: Scroll Up
  func testLaunchDayWeatherView() {
    app.launch()
    app.swipeUp()
    XCTAssertTrue(app.otherElements["dayWeatherView"].exists)
  }
  
  //Show Top Information: City Name
  func testDisplayCityName() {
    app.launch()
    XCTAssertTrue(app.staticTexts["cityName"].exists)
  }
  
  //Show Top Information: Location Button
  func testDisplayCityButton() {
    app.launch()
    XCTAssertTrue(app.buttons["cityButton"].exists)
  }
  
  //Show List of cities
  func testShowCitiesViewController() {
    app.launch()
    app.buttons["cityButton"].tap()
    XCTAssertTrue(app.tables["citiesView"].exists)
  }
  
  //Select other cities and back to main screen
  func testSelectOtherCities() {
    app.launch()
    app.buttons["cityButton"].tap()
    let cell1 = app.tables["citiesView"].cells.element(boundBy: 1)
    cell1.tap()
    let cell2 = app.tables["citiesView"].cells.element(boundBy: 2)
    cell2.tap()
    let cell3 = app.tables["citiesView"].cells.element(boundBy: 3)
    cell3.tap()
    app.buttons["backButton"].tap()
    XCTAssertTrue(app.otherElements["mainScreen"].exists)
  }
  
  func testSwipePages() {
    app.launch()
    app.buttons["cityButton"].tap()
    let cell1 = app.tables["citiesView"].cells.element(boundBy: 1)
    cell1.tap()
    let cell2 = app.tables["citiesView"].cells.element(boundBy: 2)
    cell2.tap()
    let cell3 = app.tables["citiesView"].cells.element(boundBy: 3)
    cell3.tap()
    app.buttons["backButton"].tap()
    app.swipeLeft()
    app.swipeLeft()
    XCTAssertTrue(app.otherElements["mainScreen"].exists)
  }
}
