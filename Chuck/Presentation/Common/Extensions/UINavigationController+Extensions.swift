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
        navigationBar.barStyle = .default
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .primary
        navigationBar.tintColor = .black
        let titleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = titleAttributes
        if #available(iOS 11.0, *) {
            navigationBar.largeTitleTextAttributes = titleAttributes
            navigationBar.prefersLargeTitles = true
        }
    }
}
