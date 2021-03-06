// Created on 2/9/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let viewController: UIViewController = HomeViewController()
    let navigationController = UINavigationController.init(rootViewController: viewController)
    navigationController.setNavigationBarHidden(true, animated: true)
    window = UIWindow(frame: UIScreen.main.bounds)
    window!.rootViewController = navigationController
    window!.makeKeyAndVisible()
    return true
  }
  

}

