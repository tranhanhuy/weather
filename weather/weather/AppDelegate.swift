// Created on 2/9/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let viewController: UIViewController = ViewController()
    let navigationController = UINavigationController.init(rootViewController: viewController)
    navigationController.setNavigationBarHidden(false, animated: true)
    window = UIWindow(frame: UIScreen.main.bounds)
    window!.rootViewController = navigationController
    window!.makeKeyAndVisible()
    return true
  }
  

}

