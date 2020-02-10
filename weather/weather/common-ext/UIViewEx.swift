// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

extension UIView {
  
  func addContainerView(_ view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(view)
//    if #available(iOS 11.0, *) {
//      view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
//      view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
//      view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
//      view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
//    } else {
      view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
      view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
      view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
      view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//    }
  }
}
