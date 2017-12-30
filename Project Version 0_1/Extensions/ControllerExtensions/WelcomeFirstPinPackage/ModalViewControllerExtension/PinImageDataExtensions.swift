   //
//  PinImageDataExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit
import AudioUnit

extension PinDataPictureViewController {
    
    func getPictureChoiseByTappingProfileImage() {
        
        print("getPictureChoiseByTappingProfileImage starts")
        
        /*
            the function below allows user to get an action sheet related to choises for getting a picture from photo library
            or by taking a new one via camera. It recognized a tap gesture onto image view on the viewcontroller
         */
        pinDataImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDecideHowProfilePictureLoads)))
        pinDataImage.isUserInteractionEnabled = true
        
    }
    
    func setPictureDataOnPin() {
        
        print("setPictureDataOnPin starts")
        
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "welcomeFirstPin_storyBoard_ID") as? WelcomeFirstPinViewController {
            
            print("erkut2")
            
            //destinationViewController.setSelectedImageToButton()
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapView = tempMapView
            //destinationViewController.tata()
            destinationViewController.setSelectedImageToButton()
            
        } else {
            
            print("yarro oldun")
        }
        
        dismissCurrentView()
        
    }
    
    func dismissCurrentView() {
        
        self.dismiss(animated: true) {
            
            print("PinDataPictureViewController is dismissed")
            
        }
        
    }
    
    func setImage() {
        
        pinDataImage.image = image
        
    }
    
    func erasePictureDataOnPin() {
        
        print("erasePictureDataOnPin starts")
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton("OK") {
            
            if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "welcomeFirstPin_storyBoard_ID") as? WelcomeFirstPinViewController {
                
                print("erkut2")
                self.pinDataObject.setPictureOnPin(inputPictureOnPin: UIImage())
                self.pinDataObject.isPictureExist(inputBooleanValue: false)
                
                destinationViewController.pinDataObject = self.pinDataObject
                destinationViewController.mapView = self.tempMapView
                destinationViewController.setSelectedImageToButton()
                
            } else {
                
                print("yarro oldun")
            }
            
            self.dismissCurrentView()
            
        }
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_PICTURE_WILL_ERASED, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL)
        
    }
    
}