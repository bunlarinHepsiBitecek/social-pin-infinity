//
//  UIImageViewExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 29.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setRoundedDesignToProfilePictureImageViews() {
        
        layer.cornerRadius = layer.frame.size.width / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.masksToBounds = false
        clipsToBounds = true
        //contentMode = .scaleAspectFit
        
    }
    
    func setImageViewLike3dEffect() {
        
        /*
        layer.borderWidth = 10.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)*/
        
        layer.shadowColor = UIColor(red: CGFloat(120.0 / 20.0), green: CGFloat(120.0 / 20.0), blue: CGFloat(120.0 / 20.0), alpha: 0.6).cgColor
        layer.shadowColor = UIColor.darkGray.cgColor
        
        layer.shadowOpacity = 30.0
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSize(width:  20, height: 20)
        
    }
    
}


