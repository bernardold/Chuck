//
//  RxSwift+Moya.swift
//  Chuck
//
//  Created by Bernardo Duarte on 25/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import Domain
import Moya
import RxSwift

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    func mapError() -> Single<Response> {
        return catchError({ error in
            guard let moyaError = error as? MoyaError else {
                return Single.error(DomainError.underlying)
            }
            switch moyaError {
            case .underlying(let nsError as NSError, _):
                var domainError: DomainError
                switch nsError.code {
                case NSURLErrorNotConnectedToInternet, NSURLErrorTimedOut:
                    domainError = .notConnectedToInternet
                default: domainError = .underlying
                }
                return Single.error(domainError)

            default: return Single.error(DomainError.underlying)
            }
        })
        // Moya treats 400...500 status code as successful
        .flatMap { response in
            do {
                let successfulResponse = try response.filterSuccessfulStatusCodes()
                return Single.just(successfulResponse)
            } catch {
                return Single.error(DomainError.underlying)
            }
        }
    }
}
