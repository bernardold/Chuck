//
//  Coordinator.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit

class WeakChild {
    private(set) weak var value: Coordinator?

    init(value: Coordinator?) {
        self.value = value
    }
}

protocol Coordinator: class {
    var children: [WeakChild] { get set }
    var navigationController: UINavigationController? { get set }

    func start()
    func navigate(to scene: CoordinatorScenes)
}

enum CoordinatorScenes {
    case categories
    case joke(category: String)
}
