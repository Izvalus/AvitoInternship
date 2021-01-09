//
//  Result.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import Foundation

enum Result<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}

extension Result {
    
    func get() throws -> Success {
        switch self {
        case let .success(result):
            return result
        case let .failure(error):
            throw error
        }
    }
    
    @discardableResult
    func ifError(_ closure: (Failure) -> Void) -> Result {
        if case let .failure(error) = self {
            closure(error)
        }
        return self
    }
    
    @discardableResult
    func ifSuccess(_ closure: (Success) -> Void) -> Result {
        if case let .success(model) = self {
            closure(model)
        }
        return self
    }
}
