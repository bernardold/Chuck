//
//  GetCategoriesUseCase.swift
//  Domain
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import RxSwift

public class GetCategoriesUseCase: UseCase {
    public let jokeRepository: JokeDataRepository

    public init(jokeRepository: JokeDataRepository) {
        self.jokeRepository = jokeRepository
    }

    public func getSingle(request: Void? = nil) -> Single<[String]> {
        return jokeRepository.getJokeCategories()
    }
}
