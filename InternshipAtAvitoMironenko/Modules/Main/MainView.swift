//
//  AvitoMainView.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 05.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

extension MainViewController {
    class View: UIView {
        
        private lazy var collectionViewLayout = UICollectionViewFlowLayout()
        
        lazy var collectionView = setup(UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)) {
            let width = UIScreen.main.bounds.width - 30
            collectionViewLayout.estimatedItemSize = CGSize(width: width, height: 200)
            $0.contentInset.bottom = 70
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.alwaysBounceVertical = true
            $0.register(MainViewController.TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCollectionViewCell")
            $0.register(MainViewController.BodyCollectionViewCell.self, forCellWithReuseIdentifier: "BodyCollectionViewCell")
        }
        
        private let enabledView = setup(UIView()) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
        }
        
        let selectButton = setup(UIButton()) {
            $0.layer.cornerRadius = 10
            $0.setTitle("Выбрать", for: .normal)
            $0.tintColor = .white
            $0.setBackgroundImage(UIColor(red: 76/255, green: 171/255, blue: 1, alpha: 1).image(), for: .normal)
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        init() {
            super.init(frame: .zero)
            backgroundColor = .white
            addSubview(collectionView)
            addSubview(enabledView)
            addSubview(selectButton)
            setupConstraints()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                enabledView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -7),
                enabledView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
                enabledView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.96),
                enabledView.heightAnchor.constraint(equalToConstant: 50),
                
                selectButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -7),
                selectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
                selectButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.96),
                selectButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
}
