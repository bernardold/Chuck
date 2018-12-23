//
//  JokeDetailViewController.swift
//  Chuck
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import UIKit
import RxSwift

protocol JokeDetailView: CoordinatorHolderView {
}

class JokeDetailViewController: UIViewController {
    weak var coordinator: Coordinator?
    var presenter: JokeDetailPresenter!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension JokeDetailViewController: JokeDetailView {}
