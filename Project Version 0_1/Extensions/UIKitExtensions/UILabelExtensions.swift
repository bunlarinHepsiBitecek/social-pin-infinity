//
//  UILabelExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 28.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setCornerRadius(inputRadiusValue : CGFloat) {
        
        layer.masksToBounds = true
        layer.cornerRadius = inputRadiusValue
        
    }
}
