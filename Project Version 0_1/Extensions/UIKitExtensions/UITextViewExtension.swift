//
//  UITextViewExtension.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 28.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

extension UITextView {
    
    func setBorderColor() {
    
        layer.borderColor = #colorLiteral(red: 0.972686708, green: 0.4787125587, blue: 0.0700564906, alpha: 1)
        layer.masksToBounds = true
        layer.borderWidth = 3
    
    }
    
}
