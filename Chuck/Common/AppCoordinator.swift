//
//  AppCoordinator.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import Swinject

class AppCoordinator {
    var children = [WeakChild]()
    let container: Container = buildAppContainer()
    var window: UIWindow!

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        let firstCoordinator = container.resolve(JokeCoordinator.self, argument: navigationController)!
        firstCoordinator.start()
        children.append(WeakChild(value: firstCoordinator))

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
