//
//  ServiceProvider.swift
//  Chuck
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Moya

enum ServiceProvider {
    case categories
    case joke(category: String)
}

extension ServiceProvider: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.chucknorris.io/jokes") else {
            fatalError("Chuck Norris didn't want to be bothered so he killed your app")
        }
        return url
    }

    var path: String {
        switch self {
        case .categories: return "/categories"
        case .joke: return "/random"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .joke(let category):
            return .requestParameters(parameters: ["category": category], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
