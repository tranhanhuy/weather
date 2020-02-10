// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

class ViewController: UIViewController {

  private var scrollView: UIScrollView!
  private var backgroundView: UIImageView!
  private var todayWeatherView: TodayWeatherView!
  private var dayWeatherViews: [DayWeatherView] = []
  private var contentHeight: CGFloat = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.initUI()
    
    APIService.instance.weatherInfo(cityId: "1566083", success: { [weak self] (response) in
      if let self = self {
        if response.city != nil {
          self.backgroundView.image = response.city.background
        }
        if let today = response.list.first {
          self.todayWeatherView.populate(today)
        }
        for (index, entry) in response.list.enumerated() {
          if (0 < index && index <= self.dayWeatherViews.count) {
            self.dayWeatherViews[index - 1].populate(entry)
          }
          
        }
      }
    }) {
      print("false")
    }
  }
  
  private func initUI() {
    self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    self.scrollView = UIScrollView()
    self.view.addContainerView(self.scrollView)
    
    self.todayWeatherView = TodayWeatherView()
    self.todayWeatherView.translatesAutoresizingMaskIntoConstraints = false
    self.scrollView.addSubview(self.todayWeatherView)
    self.todayWeatherView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: self.view.frame.height - self.todayWeatherView.adjustedHeight() - UIApplication.shared.statusBarFrame.height ).isActive = true
    self.todayWeatherView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    self.todayWeatherView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    self.todayWeatherView.heightAnchor.constraint(equalToConstant: self.todayWeatherView.adjustedHeight()).isActive = true
    
    self.contentHeight += self.view.frame.height - UIApplication.shared.statusBarFrame.height
    
    for i in 0..<5 {
      let dayWeatherView = DayWeatherView()
      dayWeatherView.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
      dayWeatherView.translatesAutoresizingMaskIntoConstraints = false
      self.scrollView.addSubview(dayWeatherView)
      self.dayWeatherViews.append(dayWeatherView)
      dayWeatherView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0).isActive = true
      dayWeatherView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10.0).isActive = true
      dayWeatherView.heightAnchor.constraint(equalToConstant: dayWeatherView.adjustedHeight()).isActive = true
      if i == 0 {
        dayWeatherView.topAnchor.constraint(equalTo: self.todayWeatherView.bottomAnchor, constant: 30.0 ).isActive = true
        self.contentHeight += 30
      } else {
        dayWeatherView.topAnchor.constraint(equalTo: self.dayWeatherViews[i-1].bottomAnchor).isActive = true
      }
      self.contentHeight += dayWeatherView.adjustedHeight()
    }
    
    self.contentHeight += 30
    
    //Add background
    self.backgroundView = UIImageView()
    self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundView.contentMode = .scaleAspectFill
    self.scrollView.insertSubview(self.backgroundView, at: 0)
    if #available(iOS 11.0, *) {
        let window = UIApplication.shared.keyWindow
      let bottomPadding = window?.safeAreaInsets.bottom
      self.backgroundView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -UIApplication.shared.statusBarFrame.height).isActive = true
      self.backgroundView.heightAnchor.constraint(equalToConstant: self.contentHeight + UIApplication.shared.statusBarFrame.height + (bottomPadding ?? 0.0)).isActive = true
    } else {
      self.backgroundView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -UIApplication.shared.statusBarFrame.height).isActive = true
      self.backgroundView.heightAnchor.constraint(equalToConstant: self.contentHeight + UIApplication.shared.statusBarFrame.height).isActive = true
    }
    
    self.backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    self.backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    
    let scrollSize = CGSize(width: self.scrollView.frame.size.width, height: self.contentHeight)
    self.scrollView.contentSize = scrollSize
  }
  


}


//extension ViewController: UIScrollViewDelegate {
//
//}
