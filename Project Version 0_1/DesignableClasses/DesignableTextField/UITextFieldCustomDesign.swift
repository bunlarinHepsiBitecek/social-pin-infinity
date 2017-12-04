//
//  UITextFieldCustomDesign.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 3.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

@IBDesignable
class UITextFieldCustomDesign : UITextField, UITextFieldDelegate {
    
    @IBInspectable dynamic open var borderInactiveColor: UIColor? {
        didSet {
            setBottomBorder()
        }
    }
    
    @IBInspectable dynamic open var leftViewImage: UIImage? {
        didSet {
            
            setImage()
            
        }
    }
    
    func setBottomBorder()
    {
        borderStyle = UITextBorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = borderInactiveColor?.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setImage() {
        
        leftViewMode = UITextFieldViewMode.always
        let imageEmailIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let emailIconImage = leftViewImage
        
        imageEmailIcon.image = emailIconImage
        
        leftView = imageEmailIcon
        
    }
    
    
    
}
