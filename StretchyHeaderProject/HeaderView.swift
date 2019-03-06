//
//  HeaderView.swift
//  StretchyHeaderProject
//
//  Created by panditpakhurde on 14/02/19.
//  Copyright © 2019 Quikr. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "scarlet_tanager"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code for layout
        backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        //blur
        setupVisualEffectView()
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectView() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            
            //treat this area as end of animation
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
        animator.startAnimation()
        animator.fractionComplete = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
