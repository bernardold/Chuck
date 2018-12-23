//
//  CategoriesTableViewCell.swift
//  Chuck
//
//  Created by Bernardo Duarte on 22/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!

    func configure(with category: String) {
        categoryLabel.text = category.capitalized
    }
}
