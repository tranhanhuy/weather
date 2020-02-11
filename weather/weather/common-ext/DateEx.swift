// Created on 2/10/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import Foundation


extension Date {
  
  func dayOfWeek() -> String {
    let myCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
    let myComponents = myCalendar.dateComponents([.weekday], from: self)
    let weekDay = myComponents.weekday
    switch weekDay! {
    case 1:
      return "Sunday"
    case 2:
      return "Mon"
    case 3:
      return "Tuesday"
    case 4:
      return "Wednesday"
    case 5:
      return "Thursday"
    case 6:
      return "Friday"
    case 7:
      return "Saturday"
    default:
      return ""
    }
  }
}
