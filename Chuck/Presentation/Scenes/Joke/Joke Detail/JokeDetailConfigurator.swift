//
//  JokeDetailConfigurator.swift
//  Chuck
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import Swinject
import SwinjectAutoregistration

extension Container {
    func setupJokeDetailScene() {
        register(JokeDetailViewController.self) { resolver -> JokeDetailViewController in
            JokeDetailViewController.instantiate(coordinator: resolver.resolve(Coordinator.self)!)
            }.initCompleted { (resolver, viewController) in
                viewController.presenter = resolver.resolve(JokeDetailPresenter.self)!
        }

        register(JokeDetailPresenter.self) { resolver -> JokeDetailPresenter in
            JokeDetailPresenter(view: resolver.resolve(JokeDetailViewController.self)!)
        }
    }
}
