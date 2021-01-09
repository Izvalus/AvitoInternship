//
//  MainTitleCollectionCellAdapter.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 09.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

struct MainTitleCollectionCellAdapter: CollectionCellAdapter {
    
    let title: String
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let titleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! MainViewController.TitleCollectionViewCell
        titleCell.headingLabel.text = title
        return titleCell
    }
}
