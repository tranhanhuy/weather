// Created on 2/11/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import UIKit

class PageController: UIPageViewController {
  
  // Properties
  private var orderedControllers: [UIViewController] = []
  private var cities: [CityModel] = [CITIES.first!] {
    didSet {
      self.orderedControllers.removeAll()
      self.initData()
    }
  }
  
  // MARK: - View
  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    delegate = self
    self.initData()
  }
  
  // MARK: - Init UI
  
  // MARK: - Init Data
  private func initData() {
    
    for (index, _) in self.cities.enumerated() {
      let weatherViewController = WeatherViewController(cities: self.cities, index: index)
      weatherViewController.setOnDidSelectCities { [weak self] (didSelectCities) in
        if let self = self {
          self.cities = didSelectCities
        }
      }
      self.orderedControllers.append(weatherViewController)
    }
    
    if let vc = self.orderedControllers.first {
      scrollToViewController(viewController: vc)
    }
    
  }
  
  // MARK: - Implemented
  /**
   Scrolls to the view controller at the given index. Automatically calculates
   the direction.
   */
  func scrollToViewController(index newIndex: Int) {
    if let firstViewController = viewControllers?.first,
      let currentIndex = self.orderedControllers.firstIndex(of: firstViewController) {
      let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
      let nextViewController = self.orderedControllers[newIndex]
      scrollToViewController(viewController: nextViewController, direction: direction)
    }
  }
  
  /**
   Scrolls to the given 'viewController' page.
   */
  private func scrollToViewController(viewController: UIViewController,
                                      direction: UIPageViewController.NavigationDirection = .forward) {
    setViewControllers([viewController],
                       direction: direction,
                       animated: true,
                       completion: { (finished) -> Void in
                        
    })
  }
  
}

// MARK: - UIPageViewControllerDataSource
extension PageController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = orderedControllers.firstIndex(of: viewController) else {
      return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    if previousIndex == -1 {
      return nil
    }
    
    guard orderedControllers.count > previousIndex else {
      return nil
    }
    
    return orderedControllers[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewControllerIndex = orderedControllers.firstIndex(of: viewController) else {
      return nil
    }
    
    let nextIndex = viewControllerIndex + 1
    let orderedControllersCount = orderedControllers.count
    
    guard orderedControllersCount > nextIndex else {
      return nil
    }
    
    return orderedControllers[nextIndex]
  }
  
}

// MARK: - UIPageViewControllerDelegate
extension PageController: UIPageViewControllerDelegate {
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
  }
  
}
