//
//  MainPresenter.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

protocol MainPresenterInput: AnyObject {
    var cellAdapter: [CollectionCellAdapter] { get }
    var updateButtonAction: ((String) -> Void)? { get set }
    func config()
    func pressedButton()
}

protocol MainPresenterOutput: AnyObject {
    func reloadData()
}

class MainPresenter: MainPresenterInput {
  
    var cellAdapter = [CollectionCellAdapter]()
    var updateButtonAction: ((String) -> Void)?
    var selectedElement: ResponseModel.List?
    
    let interactor: MainInteractorInput
    let router: MainRouterInput
    weak var presenterOutput: MainPresenterOutput?
    
    init(interactor: MainInteractorInput, router: MainRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    func pressedButton() {
        guard selectedElement?.title.isEmpty == false else { return }
        router.showAlert(title: selectedElement?.title, body: selectedElement?.description)
    }
    
    func config() {
        interactor.loadData { [weak self] in
            guard let response = try? $0.get() else { return }
            let bodyList = response.result.list
                .filter { $0.isSelected }
                .map { item -> CollectionCellAdapter in
                    let imagePath = item.icon.first?.value
                    return MainBodyCollectionCellAdapter(
                        image: imagePath
                            .flatMap { self?.interactor.getImage(from: $0) }
                            .flatMap { UIImage(data: $0) },
                        title: item.title,
                        description: item.description,
                        price: item.price,
                        didSelectAction: {
                            self?.updateButtonAction?(response.result.selectedActionTitle)
                            self?.selectedElement = item
                        },
                        didDeselectAction: {
                            self?.updateButtonAction?(response.result.actionTitle)
                            self?.selectedElement = nil
                        }
                    )
            }
            DispatchQueue.main.async {
                self?.cellAdapter = [MainTitleCollectionCellAdapter(title: response.result.title)] + bodyList
                
                self?.presenterOutput?.reloadData()
                self?.updateButtonAction?(response.result.actionTitle)
            }
        }
    }
}

extension MainPresenter: MainInteractorOutput {}
