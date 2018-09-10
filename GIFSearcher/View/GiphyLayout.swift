//
//  UICollectionViewLayout.swift
//  GIFSearcher
//
//  Created by Константин Клинов on 9/9/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class GiphyLayout: UICollectionViewFlowLayout {

    //Appear elements
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath) else
        {
            return nil
        }

        let rotate = CGAffineTransform.init(rotationAngle: 90.0)
        attributes.transform = rotate.concatenating(CGAffineTransform.init(scaleX: 0.1, y: 0.1))

        return attributes
    }
    
    //Disappear elements
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath) else
        {
            return nil
        }
        
        let rotate = CGAffineTransform.init(rotationAngle: -90.0)
        attributes.transform = rotate.concatenating(CGAffineTransform.init(scaleX: 2.0, y: 2.0))
        
        return attributes
    }
    
}
