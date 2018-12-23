//
//  AppConfigurator.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import Domain
import Moya
import Swinject
import SwinjectAutoregistration

func buildAppContainer() -> Container {
    let container = Container()
    container.setupNetwork()
    container.setupCoordinators()
    container.setupService()
    container.setupRepositories()
    container.setupUseCases()
    return container
}

extension Container {
    func setupNetwork() {
        register(MoyaProvider<ServiceProvider>.self, factory: {_ in
            MoyaProvider<ServiceProvider>()
        })
        autoregister(JokeRepository.self, initializer: JokeRepository.init)
    }

    func setupCoordinators() {
        register(JokeCoordinator.self) { (_, navigation) -> JokeCoordinator in
            JokeCoordinator(navigationController: navigation, parentContainer: self)
        }
    }

    func setupService() {
        autoregister(JokeRemoteDataSource.self, initializer: JokeRemoteDataSource.init)
    }

    func setupRepositories() {
        autoregister(JokeDataRepository.self, initializer: JokeRepository.init)
    }

    func setupUseCases() {
        autoregister(GetCategoriesUseCase.self, initializer: GetCategoriesUseCase.init)
    }
}
