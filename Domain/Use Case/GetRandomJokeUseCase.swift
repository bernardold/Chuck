//
//  GetRandomJokeUseCase.swift
//  Domain
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import RxSwift

public class GetRandomJokeUseCase: UseCase {
    public let jokeRepository: JokeDataRepository

    public init(jokeRepository: JokeDataRepository) {
        self.jokeRepository = jokeRepository
    }

    public func getSingle(request: GetRandomJokeUseCase.Request) -> Single<Joke> {
        return jokeRepository.getRandomJoke(request.category)
    }

    public struct Request {
        var category: String
        public init(category: String) {
            self.category = category
        }
    }
}
