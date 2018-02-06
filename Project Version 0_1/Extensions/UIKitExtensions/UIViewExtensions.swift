//
//  UIViewExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 2.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setViewBackgroundColourShadow() {

        backgroundColor = UIColor(white: 1, alpha: 0.9)
        
    }
    
    func resetViewBackgroundColor() {
        
        backgroundColor = UIColor(white: 1, alpha: 1.0)
        
    }
    
    func changeCornerRadiues() {
        
        layer.cornerRadius = 10.0
        
    }
    
}
