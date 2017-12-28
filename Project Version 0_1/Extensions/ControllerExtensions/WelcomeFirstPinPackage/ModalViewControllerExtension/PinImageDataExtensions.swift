   //
//  PinImageDataExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import MapKit

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
        
        /*
        if let presenter = presentingViewController as? WelcomeFirstPinViewController {

            print("check_1")
            
            presenter.cameraButton.setImage(pinDataImage.image!, for: .normal)
            
            presenter.pinDataObject.setPictureOnPin(inputPictureOnPin: pinDataImage.image!)
            presenter.pinDataObject.setPictureIDOnPin(inputPictureIDOnPin: NSUUID().uuidString)
            //presenter.setSelectedImageToButton()
            presenter.tata()
            
        }*/
        
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
        
        if let destinationViewController = UIStoryboard(name: "WelcomeFirstPin", bundle: nil).instantiateViewController(withIdentifier: "welcomeFirstPin_storyBoard_ID") as? WelcomeFirstPinViewController {
            
            print("erkut2")
            
            destinationViewController.pinDataObject.setPictureOnPin(inputPictureOnPin: UIImage())
            destinationViewController.pinDataObject.isPictureExist(inputBooleanValue: false)
            destinationViewController.mapView = tempMapView
            destinationViewController.setSelectedImageToButton()
            
        } else {
            
            print("yarro oldun")
        }
        
        dismissCurrentView()
        
    }
    
}
