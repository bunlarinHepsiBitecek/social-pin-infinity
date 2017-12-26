//
//  PinImageDataExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 24.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit

extension PinDataPictureViewController {
    
    func getPictureChoiseByTappingProfileImage() {
        
        /*
            the function below allows user to get an action sheet related to choises for getting a picture from photo library
            or by taking a new one via camera. It recognized a tap gesture onto image view on the viewcontroller
         */
        pinDataImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDecideHowProfilePictureLoads)))
        pinDataImage.isUserInteractionEnabled = true
        
    }
    
    func setPictureDataOnPin() {
        
        if let presenter = presentingViewController as? WelcomeFirstPinViewController {

            presenter.cameraButton.setImage(pinDataImage.image!, for: .normal)
            
            presenter.pinDataObject.setPictureOnPin(inputPictureOnPin: pinDataImage.image!)
            presenter.pinDataObject.setPictureIDOnPin(inputPictureIDOnPin: NSUUID().uuidString)
            
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
    
}
