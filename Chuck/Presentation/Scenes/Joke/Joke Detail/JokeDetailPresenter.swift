//
//  JokeDetailPresenter.swift
//  Chuck
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import RxSwift

struct JokeDetailPresenter {
    let disposeBag: DisposeBag = DisposeBag()
    weak var view: JokeDetailView?
}
