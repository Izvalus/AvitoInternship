//
//  ViewController.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 02.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let presenter: MainPresenterInput
    
    private lazy var customView = View()
    
    init(presenter: MainPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        presenter.updateButtonAction = { [weak self] in
            self?.customView.selectButton.setTitle($0, for: .normal)
        }
        presenter.config()
        navigationItem.leftBarButtonItem = leftButton()
        customView.selectButton.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    @objc
    private func selectButton() {
        presenter.pressedButton()
    }

    private func leftButton() -> UIBarButtonItem {
        let leftButton = UIBarButtonItem(image: UIImage(named: "Close"), style: .done, target: self, action: nil)
        leftButton.isEnabled = false
        return leftButton
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.cellAdapter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return presenter.cellAdapter[indexPath.row].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.cellAdapter[indexPath.row].collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        presenter.cellAdapter[indexPath.row].collectionView(collectionView, didDeselectItemAt: indexPath)
    }
}

extension MainViewController: MainPresenterOutput {
    func reloadData() {
        customView.collectionView.reloadData()
    }
}
