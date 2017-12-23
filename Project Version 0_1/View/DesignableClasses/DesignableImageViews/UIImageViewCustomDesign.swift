//
//  UIImageViewCustomDesign.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 22.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//


import UIKit

@IBDesignable
class UIImageViewCustomDesign: UIImageView {


    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            clipsToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    

}
