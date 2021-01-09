//
//  MainBodyCollectionCellAdapter.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

struct MainBodyCollectionCellAdapter: CollectionCellAdapter {
    let image: UIImage?
    let title: String
    let description: String?
    let price: String
    let didSelectAction: () -> Void
    let didDeselectAction: () -> Void
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bodyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyCollectionViewCell", for: indexPath) as! MainViewController.BodyCollectionViewCell
        bodyCell.titleLabel.text = title
        bodyCell.bodyLabel.text = description
        bodyCell.priceLabel.text = price
        bodyCell.mainImage.image = image
        
        if let selectedItem = collectionView.indexPathsForSelectedItems?.first, indexPath == selectedItem {
            bodyCell.checkImage.image = UIImage(named: "Check")
        } else {
            bodyCell.checkImage.image = nil
        }
        return bodyCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainViewController.BodyCollectionViewCell else { return }
        if cell.checkImage.image == nil {
            cell.checkImage.image = UIImage(named: "Check")
            didSelectAction()
        } else {
            cell.checkImage.image = nil
            didDeselectAction()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainViewController.BodyCollectionViewCell else { return }
        cell.checkImage.image = nil
    }
}
