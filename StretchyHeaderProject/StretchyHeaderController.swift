//
//  StretchyHeaderController.swift
//  StretchyHeaderProject
//
//  Created by panditpakhurde on 14/02/19.
//  Copyright © 2019 Quikr. All rights reserved.
//

import UIKit


class StretchyHeaderController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let cellId = "CellId"
    fileprivate let headerId = "HeaderId"
    fileprivate let padding: CGFloat = 16


    override func viewDidLoad() {
        setupCollectionViewLayout()
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 340)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding, height: 50)
    }
    
    
}
