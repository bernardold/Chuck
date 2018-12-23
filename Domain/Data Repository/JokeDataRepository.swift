//
//  JokeDataRepository.swift
//  Domain
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import RxSwift

public protocol JokeDataRepository {
    func getJokeCategories() -> Single<[String]>
    func getRandomJoke(_ category: String) -> Single<Joke>
}
