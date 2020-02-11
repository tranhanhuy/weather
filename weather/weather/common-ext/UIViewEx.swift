// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import UIKit

extension UIView {
  
  func addContainerView(_ view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(view)
    view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
}
