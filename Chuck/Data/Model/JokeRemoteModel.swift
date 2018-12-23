//
//  JokeRemoteModel.swift
//  Chuck
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain

struct JokeRemoteModel: Decodable {
    let jokeId: String
    let iconUrl: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case jokeId = "id"
        case iconUrl = "icon_url"
        case url = "url"
        case value = "value"
    }
}

extension JokeRemoteModel {
    func toDomainModel() -> Domain.Joke {
        return Joke(jokeId: jokeId, url: url, iconUrl: iconUrl, value: value)
    }
}
