// Created on 2/11/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import XCTest
@testable import weather

class modelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetBackgroundNameFromCityId() {
      let city = CityModel(id: 2950158, name: "Berlin")
      XCTAssertNotNil(city.background)
    }

}
