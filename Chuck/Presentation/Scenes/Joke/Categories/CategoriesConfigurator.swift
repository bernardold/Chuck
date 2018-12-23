//
//  CategoriesConfigurator.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import Swinject
import SwinjectAutoregistration

extension Container {
    func setupCategoriesScene() {
        register(CategoriesViewController.self) { resolver -> CategoriesViewController in
            CategoriesViewController.instantiate(coordinator: resolver.resolve(Coordinator.self)!)
            }.initCompleted { (resolver, viewController) in
                viewController.presenter = resolver.resolve(CategoriesPresenter.self)!
        }

        register(CategoriesPresenter.self) { resolver -> CategoriesPresenter in
            CategoriesPresenter(view: resolver.resolve(CategoriesViewController.self)!,
                                getCategoriesUseCase: resolver.resolve(GetCategoriesUseCase.self)!)
        }
    }
}
