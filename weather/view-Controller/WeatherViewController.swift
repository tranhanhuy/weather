// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import UIKit

class WeatherViewController: UIViewController {
  
  //MARK: - Closure
  private var didSelectCities: ((_ cities: [CityModel]) -> Void)? = nil
  func setOnDidSelectCities(_ callback: ((_ cities: [CityModel]) -> Void)?) {
    didSelectCities = callback
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
  }

  private var scrollView: UIScrollView!
  private var backgroundView: UIImageView!
  private var topView: TopView!
  private var todayWeatherView: TodayWeatherView!
  private var dayWeatherViews: [DayWeatherView] = []
  private var contentHeight: CGFloat = 0.0
  private var cities: [CityModel] = []
  var city: CityModel?
  
  convenience init(cities: [CityModel], index: Int) {
    self.init()
    self.cities = cities
    self.city = cities[index]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.initUI()
    self.fetchData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  //MARK: - UI
  private func initUI() {
    self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.view.accessibilityIdentifier = AppTest.instance.mainScreen
    
    self.scrollView = UIScrollView()
    self.view.addContainerView(self.scrollView)
    
    //Add top
    self.topView = TopView()
    self.topView.translatesAutoresizingMaskIntoConstraints = false
    self.topView.setOnCityButtonTouched { [weak self] in
      if let self = self {
        self.cityButtonTouched()
      }
    }
    self.view.addSubview(self.topView)
    if #available(iOS 11.0, *) {
      self.topView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
      self.topView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
      self.topView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    } else {
      self.topView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
      self.topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
      self.topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    self.topView.heightAnchor.constraint(equalToConstant: self.topView.adjustedHeight()).isActive = true
    
    
    //Add today weather
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
      dayWeatherView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
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
      self.backgroundView.heightAnchor.constraint(equalToConstant: self.contentHeight + UIApplication.shared.statusBarFrame.height + (bottomPadding ?? 30.0)).isActive = true
    } else {
      self.backgroundView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -UIApplication.shared.statusBarFrame.height).isActive = true
      self.backgroundView.heightAnchor.constraint(equalToConstant: self.contentHeight + UIApplication.shared.statusBarFrame.height).isActive = true
    }
    self.backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    self.backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    
    let scrollSize = CGSize(width: self.scrollView.frame.size.width, height: self.contentHeight)
    self.scrollView.contentSize = scrollSize
    
  }
  
  //MARK: - Data
  private func fetchData() {
    
    func responseSuccess() {
      self.todayWeatherView.isHidden = false
      self.dayWeatherViews.forEach { (view) in
        view.isHidden = false
      }
    }
    
    func responseFail() {
      if let city = self.city {
        self.topView.populate(city)
      }
      self.todayWeatherView.isHidden = true
      self.dayWeatherViews.forEach { (view) in
        view.isHidden = true
      }
      alertCityDidntSupport()
    }
    
    func alertCityDidntSupport() {
      if let city = self.city {
        let alert = UIAlertController(title: "\(city.name!) \(RS_CITY_DIDNT_SUPPORT)", message: RS_SELECT_ANOTHER_CITY, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: RS_YES, style: .default) { [weak self] (_) in
          if let self = self {
            self.cityButtonTouched()
          }
        })
        alert.addAction(UIAlertAction(title: RS_NO, style: .cancel, handler: nil))
        self.present(alert, animated: true)
      }
    }
    
    if let city = self.city {
      APIService.instance.weatherInfo(cityId: city.id, success: { [weak self] (response) in
        if let self = self {
          let currentDay = Date()
          if response.city != nil {
            self.backgroundView.image = response.city.background
            self.city = response.city
            self.topView.populate(response.city)
          }
          
          if let today = response.list.first {
            today.dayOfWeak = currentDay.dayOfWeek()
            self.todayWeatherView.populate(today)
          }
          for (index, entry) in response.list.enumerated() {
            if (0 < index && index <= self.dayWeatherViews.count) {
              let modifiedDate = Calendar.current.date(byAdding: .day, value: index, to: currentDay)!
              entry.dayOfWeak = modifiedDate.dayOfWeek()
              self.dayWeatherViews[index - 1].populate(entry)
            }
          }
          responseSuccess()
        }
      }) {
        responseFail()
      }
    }
  }
  
  //MARK: - Action
  private func cityButtonTouched() {
    let vc = CitiesViewController()
    vc.selectedCities = self.cities
    vc.delegate = self
    if #available(iOS 13.0, *) {
      let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
      if let window = keyWindow {
        if let navigation = window.rootViewController as? UINavigationController {
          navigation.pushViewController(vc, animated: true)
        }
      }
    } else {
      if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
          if let navigation = window.rootViewController as? UINavigationController {
            navigation.pushViewController(vc, animated: true)
          }
      }
    }
  }

}

extension WeatherViewController: CitiesViewControllerDelegate {
  
  func didSelectCities(_ cities: [CityModel]) {
    if let callback = self.didSelectCities {
      callback(cities)
    }
  }
    
}
