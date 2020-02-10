// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

class TodayWeatherView: UIView {
  
  //MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - UI
  private var icon: UIImageView!
  private var weatherMainLabel: UILabel!
  private var tempMaxIcon: UIImageView!
  private var tempMaxLabel: UILabel!
  private var tempMinIcon: UIImageView!
  private var tempMinLabel: UILabel!
  private var tempDayLabel: UILabel!
  
  private var heightIcon: CGFloat = 20.0
  
  private func initUI() {
    
    //Row 1
    self.icon = UIImageView()
    self.icon.contentMode = .center
    self.icon.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.icon)
    self.icon.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
    self.icon.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    self.icon.heightAnchor.constraint(equalToConstant: self.heightIcon).isActive = true
    
    self.weatherMainLabel = UILabel()
    self.weatherMainLabel.textColor = UIColor.white
    self.weatherMainLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.weatherMainLabel)
    self.weatherMainLabel.centerYAnchor.constraint(equalTo: self.icon.centerYAnchor).isActive = true
    self.weatherMainLabel.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: 10.0).isActive = true
    
    //Row 2
    self.tempMaxIcon = UIImageView()
    self.tempMaxIcon.image = UIImage(named: "TempMax")
    self.tempMaxIcon.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.tempMaxIcon)
    self.tempMaxIcon.topAnchor.constraint(equalTo: self.icon.bottomAnchor, constant: 20.0).isActive = true
    self.tempMaxIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
    self.tempMaxIcon.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
    self.tempMaxIcon.heightAnchor.constraint(equalToConstant: self.heightIcon).isActive = true
    
    self.tempMaxLabel = UILabel()
    self.tempMaxLabel.textColor = UIColor.white
    self.tempMaxLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.tempMaxLabel)
    self.tempMaxLabel.topAnchor.constraint(equalTo: self.tempMaxIcon.topAnchor).isActive = true
    self.tempMaxLabel.leadingAnchor.constraint(equalTo: self.tempMaxIcon.trailingAnchor, constant: 10.0).isActive = true
    
    self.tempMinIcon = UIImageView()
    self.tempMinIcon.image = UIImage(named: "TempMin")
    self.tempMinIcon.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.tempMinIcon)
    self.tempMinIcon.topAnchor.constraint(equalTo: self.tempMaxIcon.topAnchor).isActive = true
    self.tempMinIcon.leadingAnchor.constraint(equalTo: self.tempMaxLabel.trailingAnchor, constant: 20.0).isActive = true
    self.tempMinIcon.widthAnchor.constraint(equalToConstant: 10.0).isActive = true
    self.tempMinIcon.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    
    self.tempMinLabel = UILabel()
    self.tempMinLabel.textColor = UIColor.white
    self.tempMinLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.tempMinLabel)
    self.tempMinLabel.topAnchor.constraint(equalTo: self.tempMaxIcon.topAnchor).isActive = true
    self.tempMinLabel.leadingAnchor.constraint(equalTo: self.tempMinIcon.trailingAnchor, constant: 10.0).isActive = true
    
    //Row 3
    self.tempDayLabel = UILabel()
    self.tempDayLabel.textColor = UIColor.white
    self.tempDayLabel.translatesAutoresizingMaskIntoConstraints = false
    self.tempDayLabel.font = UIFont.systemFont(ofSize: 100)
    self.addSubview(self.tempDayLabel)
    self.tempDayLabel.topAnchor.constraint(equalTo: self.tempMinLabel.bottomAnchor, constant: -5.0).isActive = true
    self.tempDayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0).isActive = true
  }
  
  //MARK: - open Function
  func adjustedHeight() -> CGFloat {
    return 170.0
  }
  
  func populate(_ day: DayModel) {
    if let weather = day.weather?.first {
      self.weatherMainLabel.text = weather.main
      self.icon.sd_setImage(with: URL(string: "\(IMAGE_PATH)\(weather.icon!)@2x.png"))
    }
    
    if let temp = day.temp {
      self.tempMaxLabel.text = "\((Int)(temp.max ?? 0))°"
      self.tempMinLabel.text = "\((Int)(temp.min ?? 0))°"
      self.tempDayLabel.text = "\((Int)(temp.day ?? 0))°"
    }
  }
    
}
