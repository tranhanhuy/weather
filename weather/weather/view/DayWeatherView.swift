// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

class DayWeatherView: UIView {
  
  //MARK: - Closure
  
  //MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - UI
  private var dayLabel: UILabel!
  private var icon: UIImageView!
  private var tempMaxLabel: UILabel!
  private var tempMinLabel: UILabel!
  
  private func initUI() {
    self.tempMinLabel = UILabel()
    self.tempMinLabel.textAlignment = .center
    self.tempMinLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.tempMinLabel)
    self.tempMinLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0).isActive = true
    self.tempMinLabel.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    self.tempMinLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    self.tempMaxLabel = UILabel()
    self.tempMaxLabel.textAlignment = .center
    self.tempMaxLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.tempMaxLabel)
    self.tempMaxLabel.trailingAnchor.constraint(equalTo: self.tempMinLabel.leadingAnchor, constant: 10.0).isActive = true
    self.tempMaxLabel.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    self.tempMaxLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    self.icon = UIImageView()
    self.icon.contentMode = .scaleAspectFill
    self.icon.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.icon)
    self.icon.trailingAnchor.constraint(equalTo: self.tempMaxLabel.leadingAnchor, constant: 20.0).isActive = true
    self.icon.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    self.icon.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    self.icon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    self.dayLabel = UILabel()
    self.dayLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.dayLabel)
    self.dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
    self.dayLabel.trailingAnchor.constraint(equalTo: self.icon.leadingAnchor, constant: 10.0).isActive = true
    self.dayLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
  }
  
  //MARK: - open Function
  func adjustedHeight() -> CGFloat {
    return 40.0
  }
  
  
  func populate(_ day: DayModel) {
    if let weather = day.weather?.first {
//      self.dayLabel.text = weather.main
      self.icon.sd_setImage(with: URL(string: "\(IMAGE_PATH)\(weather.icon!)@2x.png"))
    }
    
    if let temp = day.temp {
      self.tempMaxLabel.text = "\((Int)(temp.max ?? 0))°"
      self.tempMinLabel.text = "\((Int)(temp.min ?? 0))°"
    }
  }
  
  
  //MARK: - Button touched
//  @objc private func closeButtonTouched(_ sender: Any) {
//    if let callback = self.closeButtonTouchedCallback {
//      callback()
//    }
//  }
//
//  @objc private func bookButtonTouched(_ sender: Any) {
//    if let callback = self.bookButtonTouchedCallback {
//      callback()
//    }
//  }
  
}
