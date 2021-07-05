// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import XCTest
@testable import weather

class weatherTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
  //Get City Name
  func testGetCityNameFromBerlinId_Success() {
    let berlinId: Double = 2950158
    let expectation = self.expectation(description: "Get city name from API.")
    APIService.instance.weatherInfo(cityId: berlinId, success: { (response) in
      XCTAssertEqual(response.city.name, "Berlin")
      expectation.fulfill()
    }) {
    }
    waitForExpectations(timeout: 5.0, handler: nil)
  }
  
  //Get List of weather
  func testGetListWeathersFromBerlinId_Success() {
    let berlinId: Double = 2950158
    let expectation = self.expectation(description: "Get List of Weather from API ")
    APIService.instance.weatherInfo(cityId: berlinId, success: { (response) in
      XCTAssertEqual(response.list.count, 6)
      expectation.fulfill()
    }) {
      print("false")
    }
    waitForExpectations(timeout: 5.0, handler: nil)
  }
  
  //Testing with Incorrect Id
  func testGetDataWithIncorrectId_Success() {
    let berlinId: Double = 1950158
    var passed: Bool = true
    let expectation = self.expectation(description: "Fetch Data with Incorrect Id.")
    APIService.instance.weatherInfo(cityId: berlinId, success: { (response) in
      passed = false
      expectation.fulfill()
    }) {
      expectation.fulfill() 
    }
    waitForExpectations(timeout: 5.0, handler: nil)
    XCTAssert(passed)
  }

}
