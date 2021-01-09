//
//  MainInteractor.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import Foundation

protocol MainInteractorInput {
    func loadData(response: @escaping (Result<ResponseModel, MainInteractor.Error>) -> Void)
    func getImage(from string: String) -> Data?
}

protocol MainInteractorOutput: AnyObject {}

class MainInteractor: MainInteractorInput {
    weak var interactorOutput: MainInteractorOutput?
    
    enum Error: Swift.Error {
        case parse(Swift.Error)
    }

    func loadData(response: @escaping (Result<ResponseModel, Error>) -> Void) {
        DispatchQueue.global().async {
            guard let path = Bundle.main.url(forResource: "result", withExtension: "json") else { return }
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                response(Result.success(responseModel))
            } catch let error {
                response(Result.failure(.parse(error)))
            }
        }
    }

    func getImage(from string: String) -> Data? {
        return URL(string: string).flatMap { try? Data(contentsOf: $0, options: []) }
    }
}

