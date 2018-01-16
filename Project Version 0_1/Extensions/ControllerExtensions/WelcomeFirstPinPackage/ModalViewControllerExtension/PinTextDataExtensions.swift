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
    
    func getScreenShotOfTextFieldAndSetPinData(callerView : ViewControllerEnums) {
        
        switch callerView {
        case .WelcomeFirstPin:
            print("back to welcomeFirstPinView")
            getScreenShotOfTextFieldAndSetPinDataForWelcomeFirstPin()
            
        case .PinDrop:
            print("back to pinDropView")
            getScreenShotOfTextFieldAndSetPinDataForPinDropView()
            
        default:
            print("Do nothing")
            return
        }
        
        
        
        dismissTheCurrentView()
        
    }
    
    func getScreenShotOfTextFieldAndSetPinDataForWelcomeFirstPin() {
        
        self.textField.textAlignment = .center
        
        UIGraphicsBeginImageContextWithOptions(self.textField.bounds.size, false, 0);
        self.textField.drawHierarchy(in: self.textField.bounds, afterScreenUpdates: true)
        let copied = UIGraphicsGetImageFromCurrentImageContext();
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.WelcomeFirstPin, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.welcomeFirstPin_storyBoard_ID) as? WelcomeFirstPinViewController {
            
            print("erkut2")
            
            self.pinDataObject.setTextCaptureImage(inputCapturedImage: copied!)
            self.pinDataObject.isCapturedTextExist(inputBooleanValue: true)
            self.pinDataObject.setTextOnPin(inputTextOnPin: self.textField.text)
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapView = tempMapView
            destinationViewController.setCaptureImageOfTextFieldOnButton()
            
        }
        
        UIGraphicsEndImageContext();
        
    }
    
    func getScreenShotOfTextFieldAndSetPinDataForPinDropView() {
        
        self.textField.textAlignment = .center
        
        UIGraphicsBeginImageContextWithOptions(self.textField.bounds.size, false, 0);
        self.textField.drawHierarchy(in: self.textField.bounds, afterScreenUpdates: true)
        let copied = UIGraphicsGetImageFromCurrentImageContext();
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PinDropViewController_storyBoard_ID) as? PinDropViewController {
            
            print("erkut2")
            
            self.pinDataObject.setTextCaptureImage(inputCapturedImage: copied!)
            self.pinDataObject.isCapturedTextExist(inputBooleanValue: true)
            self.pinDataObject.setTextOnPin(inputTextOnPin: self.textField.text)
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapViewObject = tempMapView
            destinationViewController.setCaptureImageOfTextFieldOnButton()
            
        }
        
        UIGraphicsEndImageContext();
        
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
    
    func eraseTextFieldFromPinData(callerView : ViewControllerEnums) {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton("OK") {
            
            switch callerView {
            case .WelcomeFirstPin:
                print("Back to WelcomeFirstPin")
                self.eraseTextFieldFromPinDataForWelcomeFirstPin()
                
            case .PinDrop:
                print("Back to PinDrop")
                self.eraseTextFieldFromPinDataForPinDropView()
                
            default:
                print("Do nothing")
                return
            }
            
        }
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_PICTURE_WILL_ERASED, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL)
        
    }
    
    func eraseTextFieldFromPinDataForWelcomeFirstPin() {
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.WelcomeFirstPin, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.welcomeFirstPin_storyBoard_ID) as? WelcomeFirstPinViewController {
            
            self.pinDataObject.isCapturedTextExist(inputBooleanValue: false)
            self.pinDataObject.setTextOnPin(inputTextOnPin: SPACE_CHARACTER)
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapView = self.tempMapView
            destinationViewController.setCaptureImageOfTextFieldOnButton()
            
        }
        
        UIGraphicsEndImageContext();
        
        self.dismissTheCurrentView()
        
    }
    
    func eraseTextFieldFromPinDataForPinDropView() {
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PinDropViewController_storyBoard_ID) as? PinDropViewController {
            
            self.pinDataObject.isCapturedTextExist(inputBooleanValue: false)
            self.pinDataObject.setTextOnPin(inputTextOnPin: SPACE_CHARACTER)
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapViewObject = self.tempMapView
            destinationViewController.setCaptureImageOfTextFieldOnButton()
            
        }
        
        UIGraphicsEndImageContext();
        
        self.dismissTheCurrentView()
        
    }
    
}
