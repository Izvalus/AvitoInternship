//
//  MainConfigurator.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

final class MainFactory {
    func create() -> UIViewController {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interactor: interactor, router: router)
        let viewController = MainViewController(presenter: presenter)
        presenter.presenterOutput = viewController
        interactor.interactorOutput = presenter
        router.viewController = viewController
        return viewController
    }
}
