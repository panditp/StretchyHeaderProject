//
//  StretchyHeaderViewLayout.swift
//  StretchyHeaderProject
//
//  Created by panditpakhurde on 15/02/19.
//  Copyright © 2019 Quikr. All rights reserved.
//

import UIKit

class StretchyHeaderViewLayout: UICollectionViewFlowLayout {
    //we have to modify attributes of our header component somehow
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0{
                
                guard let collectionView = collectionView else { return }
                
                let width = collectionView.frame.width
                
                let contentOffsetY = collectionView.contentOffset.y
                print(contentOffsetY)
                
                if contentOffsetY > 0 {
                    return
                }
                
                let height = attributes.frame.height - contentOffsetY
                
                attributes.frame = CGRect.init(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
