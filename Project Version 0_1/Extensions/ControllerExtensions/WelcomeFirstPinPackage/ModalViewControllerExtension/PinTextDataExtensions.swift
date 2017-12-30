//
//  PinTextDataExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import AudioUnit

extension PinTextDataViewController {
    
    func getScreenShotOfTextFieldAndSetPinData() {
        
        self.textField.textAlignment = .center
        
        UIGraphicsBeginImageContextWithOptions(self.textField.bounds.size, false, 0);
        self.textField.drawHierarchy(in: self.textField.bounds, afterScreenUpdates: true)
        let copied = UIGraphicsGetImageFromCurrentImageContext();
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "welcomeFirstPin_storyBoard_ID") as? WelcomeFirstPinViewController {
            
            print("erkut2")
            
            self.pinDataObject.setTextCaptureImage(inputCapturedImage: copied!)
            self.pinDataObject.isCapturedTextExist(inputBooleanValue: true)
            self.pinDataObject.setTextOnPin(inputTextOnPin: self.textField.text)
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapView = tempMapView
            destinationViewController.setCaptureImageOfTextFieldOnButton()
            
        } else {
            
            print("yarro oldun")
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
    
    func eraseTextFieldFromPinData() {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton("OK") {
            
            if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "welcomeFirstPin_storyBoard_ID") as? WelcomeFirstPinViewController {
                
                print("erkut2")
                
                self.pinDataObject.isCapturedTextExist(inputBooleanValue: false)
                self.pinDataObject.setTextOnPin(inputTextOnPin: SPACE_CHARACTER)
                
                destinationViewController.pinDataObject = self.pinDataObject
                destinationViewController.mapView = self.tempMapView
                destinationViewController.setCaptureImageOfTextFieldOnButton()
                
            } else {
                
                print("yarro oldun")
            }
            
            UIGraphicsEndImageContext();
            
            self.dismissTheCurrentView()
            
        }
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_PICTURE_WILL_ERASED, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL)
        
    }
    
}
