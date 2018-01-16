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
    
    func setPictureDataOnPin(callerView : ViewControllerEnums) {
        
        print("setPictureDataOnPin starts")
        
        switch callerView {
        case .PinDrop:
            print("Pindrop selected")
            setPictureDataOnPinInPinDropView()
            
        case .WelcomeFirstPin:
            print("WelcomeFirstPin selected")
            setPictureDataOnPinInWelcomeFirstPinView()
            
        default:
            print("none select")
        }
        
    }
    
    func setPictureDataOnPinInWelcomeFirstPinView() {
        
        print("setPictureDataOnPinInWelcomeFirstPinView starts")
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.WelcomeFirstPin, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.welcomeFirstPin_storyBoard_ID) as? WelcomeFirstPinViewController {
            
            print("rekut !")
            
            //destinationViewController.setSelectedImageToButton()
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapView = tempMapView
            destinationViewController.setSelectedImageToButton()
            
        } else {
            
            print("yarro oldun")
        }
        
        dismissCurrentView()
        
    }
    
    func setPictureDataOnPinInPinDropView() {
        
        print("setPictureDataOnPinInPinDropView starts")
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PinDropViewController_storyBoard_ID) as? PinDropViewController {
            
            //destinationViewController.setSelectedImageToButton()
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapViewObject = tempMapView
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
    
    
    func erasePictureDataOnPin(callerView : ViewControllerEnums) {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addButton("OK") {
            
            switch callerView {
            case .PinDrop:
                print("Back to PinDropView")
                self.erasePictureDataOnPinInPinDrop()
                
            case .WelcomeFirstPin:
                print("Back to WelcomeFirstPinView")
                self.erasePictureDataOnPinInWelcomeFirstPin()
                
            default:
                print("Do nothing")
            }
            
        }
        
        alertView.showWarning(ConstantStrings.AlertInfoHeaders.STRING_WARNING, subTitle: ConstantStrings.WarningSentences.STRING_WARNING_PICTURE_WILL_ERASED, closeButtonTitle: ConstantStrings.ButtonTitles.STRING_CANCEL)
        
    }
    
    func erasePictureDataOnPinInWelcomeFirstPin() {
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.WelcomeFirstPin, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.welcomeFirstPin_storyBoard_ID) as? WelcomeFirstPinViewController {
            
            self.pinDataObject.setPictureOnPin(inputPictureOnPin: UIImage())
            self.pinDataObject.isPictureExist(inputBooleanValue: false)
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapView = self.tempMapView
            destinationViewController.setSelectedImageToButton()
            
        }
        
        self.dismissCurrentView()
        
    }
    
    func erasePictureDataOnPinInPinDrop() {
        
        if let destinationViewController = UIStoryboard(name: ViewConstants.StoryBoard.HomePage, bundle: nil).instantiateViewController(withIdentifier: ViewConstants.StoryBoardIdentifiers.PinDropViewController_storyBoard_ID) as? PinDropViewController {
            
            self.pinDataObject.setPictureOnPin(inputPictureOnPin: UIImage())
            self.pinDataObject.isPictureExist(inputBooleanValue: false)
            
            destinationViewController.pinDataObject = self.pinDataObject
            destinationViewController.mapViewObject = self.tempMapView
            destinationViewController.setSelectedImageToButton()
            
        }
        
        self.dismissCurrentView()
        
    }
    
    
}
