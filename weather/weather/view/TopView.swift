// Created on 2/10/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

class TopView: UIView {
  
  //MARK: - Closure
  private var cityButtonTouchedCallback: (() -> Void)? = nil
  func setOnCityButtonTouched(_ callback: (() -> Void)?) {
    cityButtonTouchedCallback = callback
  }
  
  //MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - UI
  private var cityLabel: UILabel!
  private var cityButton: UIButton!
  
  private func initUI() {
    self.cityLabel = UILabel()
    
    self.cityLabel.textColor = UIColor.white
    self.cityLabel.font = UIFont.systemFont(ofSize: 18.0)
    self.cityLabel.textAlignment = .center
    self.cityLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.cityLabel)
    self.cityLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
    self.cityButton = UIButton()
    self.cityButton.setImage(UIImage.init(named: "location"), for: .normal)
    self.cityButton.contentMode = .scaleAspectFill
    self.cityButton.tintColor = UIColor.white
    self.cityButton.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.cityButton)
    self.cityButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.cityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30.0).isActive = true
    self.cityButton.widthAnchor.constraint(equalToConstant: 25.0).isActive = true
    self.cityButton.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
    self.cityButton.addTarget(self, action: #selector(self.cityButtonTouched(_:)), for: .touchUpInside)
    
  }
  
  //MARK: - open Function
  func adjustedHeight() -> CGFloat {
    return 50.0
  }
  
  
  func populate(_ city: CityModel) {
    self.cityLabel.text = city.name
    
  }
  
  
  //MARK: - Button touched
  @objc private func cityButtonTouched(_ sender: Any) {
    if let callback = self.cityButtonTouchedCallback {
      callback()
    }
  }
  
}
