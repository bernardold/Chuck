//
//  JokeRemoteDataSource.swift
//  Chuck
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import Moya
import RxSwift

class JokeRemoteDataSource {
    let provider: MoyaProvider<ServiceProvider>

    init(provider: MoyaProvider<ServiceProvider>) {
        self.provider = provider
    }

    func getJokeCategories() -> Single<[String]> {
        return provider.rx.request(.categories).map([String].self)
    }

    func getJoke(fromCategory category: String) -> Single<JokeRemoteModel> {
        return provider.rx.request(.joke(category: category)).map(JokeRemoteModel.self)
    }
}
