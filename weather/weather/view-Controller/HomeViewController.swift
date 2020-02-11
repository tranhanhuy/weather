// Created on 2/11/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

class HomeViewController: UIViewController {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
  }

  // Properties
  private var pageController: PageController!
  
  // MARK: - View
  override func viewDidLoad() {
    super.viewDidLoad()
    self.initUI()
    self.initData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  // MARK: - Init UI
  private func initUI() {
    self.pageController = PageController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    self.pageController.view.translatesAutoresizingMaskIntoConstraints = false
    self.view.addContainerView(self.pageController.view)
    
    
  }
  
  // MARK: - Init Data
  private func initData() {
    
  }
  
}
