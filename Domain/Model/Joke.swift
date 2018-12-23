//
//  Joke.swift
//  Domain
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

public struct Joke {
    public let jokeId: String
    public let url: String
    public let iconUrl: String
    public let value: String

    public init(jokeId: String, url: String, iconUrl: String, value: String) {
        self.jokeId = jokeId
        self.url = url
        self.iconUrl = iconUrl
        self.value = value
    }
}
