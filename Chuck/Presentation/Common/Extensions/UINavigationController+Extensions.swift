//
//  UINavigationController+Extensions.swift
//  Chuck
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setToDefault() {
        view.backgroundColor = .white
        navigationBar.barStyle = .default
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .primary
        navigationBar.tintColor = .white
        let titleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = titleAttributes
    }
}
