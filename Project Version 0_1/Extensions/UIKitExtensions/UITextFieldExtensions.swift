//
//  UITextFieldExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import FTPopOverMenu_Swift

extension UITextField {
    
    // check if a text field is empty or not
    func checkTextFieldHasStringValue() -> Bool {
        
        if let stringValue = self.text as String? {
            
            if stringValue.isEmpty {
                
                return false
                
            } else {
                
                return true
                
            }
            
        } else {
            
            return false
            
        }
    }
    
    func clearTextFiedl() {
        
        text = SPACE_CHARACTER
        
    }
    
    /*
    func rightButtonText() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "error@2x.png"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
        button.frame = CGRect(x: CGFloat(frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.showErrorPopup), for: .touchUpInside)
        
        rightView = button
        rightViewMode = .always
    }
    
    @objc func showErrorPopup(_ sender: Any) {
        
        changeToMoreStyle()
        
        FTPopOverMenu.showForSender(sender: self, with: menuOptionNameArray, menuImageArray: menuOptionImageNameArray, done: { (selectedIndex) -> () in
            print("Remzi index: \(selectedIndex)")
        }) {
            
        }
        
    }*/
    
    /*
    
    func changeToMoreStyle() {
        
        
        let config = FTConfiguration.shared
        config.textColor = UIColor.red
        config.backgoundTintColor = UIColor.white
        config.borderColor = UIColor.red
        config.menuWidth = email.frame.width
        config.menuSeparatorColor = UIColor.white
        config.textAlignment = .left
        config.textFont = UIFont.systemFont(ofSize: 14)
        config.menuRowHeight = 40
        config.cornerRadius = 10
    }*/
        
        self.changePopupStyle()
        FTPopOverMenu.showForSender(sender: self, with: menuOptionNameArray, menuImageArray: menuOptionImageNameArray, done: { (selectedIndex) -> () in         }) {
        }
    }
    
    
    func changePopupStyle() {
        
        let config = FTConfiguration.shared
        config.textColor = UIColor.red
        config.backgoundTintColor = UIColor.white
        config.borderColor = UIColor.red
        config.menuWidth = self.frame.width
        config.menuSeparatorColor = UIColor.white
        config.textAlignment = .left
        config.textFont = UIFont.systemFont(ofSize: 14)
        config.menuRowHeight = self.frame.height
        config.cornerRadius = 10
    }
    
    func showPopOver(popOverStyle: FTPopOverStyle) {
        let menuOptionNameArray : [String] =  [popOverStyle.popOverMessage]
        let menuOptionImageNameArray : [String] = []
        
        self.changePopupStyle()
        FTPopOverMenu.showForSender(sender: self, with: menuOptionNameArray, menuImageArray: menuOptionImageNameArray, done: { (selectedIndex) -> () in         }) {
        }
    }
    
}
