//
//  JokeConfigurator.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import Swinject

func buildJokeContainer(withParent parent: Container, andCoordinator coordinator: Coordinator) -> Container {
    let container = Container(parent: parent)
    container.setupCategoriesScene()
//    container.setupJokeScene()
    container.register(Coordinator.self) { _ in coordinator}
    return container
}
