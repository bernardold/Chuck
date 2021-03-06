//
//  CategoriesViewModel.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

struct CategoriesViewModel {
    let categories: [String]
}

extension Array where Element == String {
    func toViewModel() -> CategoriesViewModel {
        return CategoriesViewModel(categories: self.map({ $0.capitalized }))
    }
}
