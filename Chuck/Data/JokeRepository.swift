//
//  JokeRepository.swift
//  Chuck
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import Moya

struct JokeRepository: JokeDataRepository {
    private let jokeRemoteDataSource: JokeRemoteDataSource

    public init(jokeRemoteDataSource: JokeRemoteDataSource) {
        self.jokeRemoteDataSource = jokeRemoteDataSource
    }

    func getJokeCategories() -> Single<[String]> {
        return jokeRemoteDataSource.getJokeCategories()
    }
}
