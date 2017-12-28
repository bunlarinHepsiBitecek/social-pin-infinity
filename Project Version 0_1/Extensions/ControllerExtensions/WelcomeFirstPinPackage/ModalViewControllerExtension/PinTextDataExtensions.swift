//
//  PinTextDataExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

extension PinTextDataViewController {
    
    func getScreenShotOfTextFieldAndSetPinData() {
        
        UIGraphicsBeginImageContextWithOptions(self.textField.bounds.size, false, 0);
        self.textField.drawHierarchy(in: self.textField.bounds, afterScreenUpdates: true)
        let copied = UIGraphicsGetImageFromCurrentImageContext();
        
        if let presenter = presentingViewController as? WelcomeFirstPinViewController {

            presenter.denemeTextButton.setImage(copied, for: .normal)
            presenter.pinDataObject.setTextOnPin(inputTextOnPin: textField.text)
            
        }
        
        UIGraphicsEndImageContext();
        
        dismissTheCurrentView()
        
    }
    
    func setViewCornersOnModalViewcontroller() {
        
        pinTextView.changeCornerRadiues()
        textField.changeCornerRadiues()
        pinNoteLabel.setCornerRadius(inputRadiusValue: 10.0)
        textField.setBorderColor()
        
    }
    
    func dismissTheCurrentView() {
        
        self.dismiss(animated: true) {
            
            print("PinDataTextViewController is dismissed")
            
        }
        
    }
    
    
}
