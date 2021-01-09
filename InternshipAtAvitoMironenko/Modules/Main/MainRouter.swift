//
//  MainRouter.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

protocol MainRouterInput {
    func showAlert(title: String?, body: String?)
}

class MainRouter: MainRouterInput {
    
    weak var viewController: UIViewController?
    
    func showAlert(title: String?, body: String?) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        alert.addAction(action)
        viewController?.present(alert, animated: true)
    }
}
