//
//  UseCase.swift
//  Domain
//
//  Created by Bernardo Duarte on 23/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation
import RxSwift

public protocol UseCase {
    associatedtype RequestModel
    associatedtype ResponseModel
    func getSingle(request: RequestModel) -> Single<ResponseModel>
}
