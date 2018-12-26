//
//  Errors.swift
//  Domain
//
//  Created by Bernardo Duarte on 21/12/18.
//  Copyright © 2018 Bernardo Duarte. All rights reserved.
//

import Foundation

public enum DomainError: Error {
    case underlying
    case notConnectedToInternet
}
