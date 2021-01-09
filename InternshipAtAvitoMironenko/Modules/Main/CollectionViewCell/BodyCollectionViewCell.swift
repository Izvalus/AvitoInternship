//
//  BodyCollectionViewCell.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 04.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

extension MainViewController {
    class BodyCollectionViewCell: UICollectionViewCell {

        let stackView = setup(UIStackView()) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 7
        }

        let mainImage = setup(UIImageView()) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentMode = .scaleAspectFit
        }

        let titleLabel = setup(UILabel()) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            $0.font = UIFont.boldSystemFont(ofSize: 18)
        }

        let bodyLabel = setup(UILabel()) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            $0.font = UIFont.systemFont(ofSize: 12)
        }

        let priceLabel = setup(UILabel()) {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }

        var checkImage = setup(UIImageView()) {
            $0.image = nil
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        override init(frame: CGRect) {
            super.init(frame: .zero)
            contentView.addSubview(checkImage)
            contentView.addSubview(mainImage)
            contentView.addSubview(stackView)
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(bodyLabel)
            stackView.addArrangedSubview(priceLabel)
            backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
            layer.cornerRadius = 4
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
            targetSize.width = UIScreen.main.bounds.width - (contentView.layoutMargins.left * 2)
            return super.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )
        }

        func setupConstraints() {
            NSLayoutConstraint.activate([
                mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                mainImage.topAnchor.constraint(equalTo: stackView.topAnchor),
                mainImage.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -19),
                mainImage.widthAnchor.constraint(equalToConstant: 55),
                mainImage.heightAnchor.constraint(equalToConstant: 58),
                
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                stackView.trailingAnchor.constraint(equalTo: checkImage.leadingAnchor),
                
                checkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 29),
                checkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                checkImage.widthAnchor.constraint(equalToConstant: 24),
                checkImage.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
    }
}
