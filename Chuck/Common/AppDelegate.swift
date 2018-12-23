//
//  AppDelegate.swift
//  Chuck
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: AppCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window!)
        coordinator?.start()

        return true
    }
}
