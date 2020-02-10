// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

class ViewController: UIViewController {

  private var scrollView: UIScrollView!
  private var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.initUI()
  }
  
  private func initUI() {
    self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    //Position Views
//    let scrollTop : CGFloat = self.view.frame.height < 760.0 ? 60.0 : 110.0
//    let scrollframe = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//    self.scrollView = UIScrollView(frame: scrollframe)
    
    self.scrollView = UIScrollView()
    self.view.addContainerView(self.scrollView)
//
//    self.view.addSubview(self.scrollView)
//
//
//
    self.label = UILabel.init(frame: CGRect(x: 100, y: 100, width: 100 , height: 40))
    self.label.text = "Testing"
    self.label.backgroundColor = UIColor.red
//
//
    self.scrollView.addSubview(self.label)
//
    let scrollSize = CGSize(width: self.scrollView.frame.size.width, height: self.view.bounds.height + 1400)
    self.scrollView.contentSize = scrollSize
//    self.scrollView.delegate = self
  }
  


}


//extension ViewController: UIScrollViewDelegate {
//
//}
