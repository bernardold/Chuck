//
//  JokeCoordinator.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import Swinject

class JokeCoordinator: Coordinator {
    var children = [WeakChild]()
    var parentContainer: Container
    weak var navigationController: UINavigationController?
    lazy var container: Container = {
        return buildJokeContainer(withParent: parentContainer, andCoordinator: self)
    }()

    init(navigationController: UINavigationController, parentContainer: Container) {
        self.navigationController = navigationController
        self.parentContainer = parentContainer
    }

    func start() {
        let viewController = container.resolve(CategoriesViewController.self)!
        viewController.navigationItem.title = "Categories"
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = backButton
        navigationController?.pushViewController(viewController, animated: true)
        navigationController?.setToDefault()
    }
}

extension JokeCoordinator {
    func navigate(to scene: CoordinatorScenes) {
        switch scene {
        case .categories:
            navigationController?.popToRootViewController(animated: true)
        case .joke(let category):
            navigateToJoke(category)
        }
    }

    private func navigateToJoke(_ category: String) {
        let viewController = self.container.resolve(JokeDetailViewController.self)!
        viewController.navigationItem.title = category
        viewController.selectedCategory = category
        navigationController?.pushViewController(viewController, animated: true)
    }
}
