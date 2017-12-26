//
//  UITextFieldExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

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
    
    func hideRightViewButton() {
        
        if let _ =  self.rightView {
            self.rightView?.isHidden = true
        }
    }
    
    func addRightViewButton(popOverStyle: FTPopOverStyle) {
        let button = UIButton(type: .custom)
        var imageName: String = "error@2x.png"
        
        switch popOverStyle {
        case .required:
            button.tag = 1
        case .invalid:
            button.tag = 2
        case .invalidEmail:
            button.tag = 3
        case .invalidPassword:
            button.tag = 4
        case .success:
            imageName = "ic_password_checkmark@2x"
            button.tag = 5
        }
        
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.showErrorPopup), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @IBAction func showErrorPopup(sender: UIButton) {
        var menuOptionNameArray : [String] =  []
        let menuOptionImageNameArray : [String] = []
        
        switch sender.tag {
        case 1:
            menuOptionNameArray =  [FTPopOverStyle.required.popOverMessage]
        case 2:
            menuOptionNameArray =  [FTPopOverStyle.invalid.popOverMessage]
        case 3:
            menuOptionNameArray =  [FTPopOverStyle.invalidEmail.popOverMessage]
        case 3:
            menuOptionNameArray =  [FTPopOverStyle.invalidPassword.popOverMessage]
        case 5:
            return
        default:
            menuOptionNameArray =  [""]
        }
        
        
        self.changePopupStyle()
        FTPopOverMenu.showForSender(sender: self, with: menuOptionNameArray, menuImageArray: menuOptionImageNameArray, done: { (selectedIndex) -> () in         }) {
        }
    }
    
    func changeCornerRadius() {
        
        layer.cornerRadius = 10.00
        
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
    
    
    func addHideShowButton() {
        
        print("Remzi: addHideShowButton framesize: \(frame.width)")
        let eyeOpenedImage: UIImage = UIImage(named: "ic_eye_open")!.withRenderingMode(.alwaysTemplate)
        let eyeClosedImage: UIImage = UIImage(named: "ic_eye_closed")!
        let eyeButton: UIButton = UIButton(type: .custom)
        
        let padding: CGFloat = 5
        
        //let buttonWidth = (frame.width / 2) - padding
        let buttonWidth = frame.height
        let buttonFrame = CGRect(x: buttonWidth + padding, y: 0, width: buttonWidth, height: frame.height)
        eyeButton.frame = buttonFrame
        eyeButton.backgroundColor = UIColor.clear
        eyeButton.adjustsImageWhenHighlighted = false
        eyeButton.setImage(eyeClosedImage, for: .normal)
        eyeButton.setImage(eyeOpenedImage.withRenderingMode(.alwaysTemplate), for: .selected)
        eyeButton.addTarget(self, action: #selector(eyeButtonPressed), for: .touchUpInside)
        eyeButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        eyeButton.tintColor = self.tintColor
        self.addSubview(eyeButton)
        self.rightView = eyeButton
        self.rightViewMode = .whileEditing
        
    }
    
    @objc func eyeButtonPressed(sender: UIButton) {
        print("eyeButtonPressed : \(sender.isSelected)")
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = !sender.isSelected
    }
    
}



