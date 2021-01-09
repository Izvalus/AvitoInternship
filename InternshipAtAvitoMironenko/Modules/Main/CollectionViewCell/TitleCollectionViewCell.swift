//
//  TitleCollectionViewCell.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 04.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

extension MainViewController {
    class TitleCollectionViewCell: UICollectionViewCell {

        let headingLabel = setup(UILabel()) {
            $0.numberOfLines = 0
            $0.text = "Сделайте объявление заметнее на 7 дней"
            $0.font = UIFont.boldSystemFont(ofSize: 22)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        override init(frame: CGRect) {
            super.init(frame: .zero)
            contentView.addSubview(headingLabel)
            backgroundColor = .white
            setupConstraints()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func systemLayoutSizeFitting(
            _ targetSize: CGSize,
            withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
            verticalFittingPriority: UILayoutPriority
        ) -> CGSize {
            var targetSize = targetSize
            setNeedsLayout()
            layoutIfNeeded()
            targetSize.height = CGFloat.greatestFiniteMagnitude
            targetSize.width = UIScreen.main.bounds.width
            return super.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                headingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
        }
    }
}
