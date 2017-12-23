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
    
}


