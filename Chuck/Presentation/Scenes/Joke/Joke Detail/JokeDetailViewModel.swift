//
//  JokeDetailViewModel.swift
//  Chuck
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain

struct JokeDetailViewModel {
    let jokeId: String
    let imageUrl: String
    let fact: String
    let externalUrl: String
}

extension Domain.Joke {
    func toViewModel() -> JokeDetailViewModel {
        return JokeDetailViewModel(jokeId: jokeId,
                                   imageUrl: iconUrl,
                                   fact: value,
                                   externalUrl: url)
    }
}
