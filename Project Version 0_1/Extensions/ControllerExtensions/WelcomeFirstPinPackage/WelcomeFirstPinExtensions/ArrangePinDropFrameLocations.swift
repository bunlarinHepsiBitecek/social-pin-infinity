//
//  ArrangePinDropFrameLocations.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 6.01.2018.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension WelcomeFirstPinViewController {
    
    func relocateAdditionalButtonsToCenter() {
        
        setImageToPinDropOnlyMe(inputImage: self.user.userProfilePicture)

        pinDropObjects.pinButtonAllFriends = self.buttonAllFriends.center
        pinDropObjects.pinButtonOnlyMe = self.buttonOnlyMe.center
        pinDropObjects.pinButtonSpecialPersonOrGroup = self.buttonSpecialFriends.center
        pinDropObjects.pinButtonConfirm = self.buttonConfirmPinData.center
        pinDropObjects.pinButtonDelete = self.buttonDeletePinData.center
        
        pinDropObjects.centerInfoForSelectedButton = self.buttonOnlyMe.center
        
        print("onlyMe : \(pinDropObjects.pinButtonOnlyMe)")
        print("allFriends :\(pinDropObjects.pinButtonAllFriends)")
        print("special : \(pinDropObjects.pinButtonSpecialPersonOrGroup)")
        
        setAllPinDropButtonsBehindMainPinDropButton(inputCenterValue: self.buttonMainDropPin.center)
        
    }
    
    func arrangeCenterOfAdditionalButtons2() {
        
        print("arrangeCenterOfAdditionalButtons2 starts")
        
    }
    
    func setImageToPinDropOnlyMe(inputImage : UIImage) {
        
        self.buttonOnlyMe.setImage(inputImage, for: .normal)
        
    }
    
    func setAllPinDropButtonsBehindMainPinDropButton(inputCenterValue : CGPoint) {
        
        self.buttonOnlyMe.center = inputCenterValue
        self.buttonAllFriends.center = inputCenterValue
        self.buttonSpecialFriends.center = inputCenterValue
        self.buttonConfirmPinData.center = inputCenterValue
        self.buttonDeletePinData.center = inputCenterValue
        
    }
    
    func doTheAnimation() {
        
        print("doTheAnimation starts")
        print("mainPinDropButtonTapped : \(mainPinDropButtonTapped)")
        
        if !mainPinDropButtonTapped {
            
            UIView.animate(withDuration: 0.3) {
                
                self.buttonSpecialFriends.center = self.pinDropObjects.pinButtonSpecialPersonOrGroup
                self.buttonAllFriends.center = self.pinDropObjects.pinButtonAllFriends
                self.buttonOnlyMe.center = self.pinDropObjects.pinButtonOnlyMe
                
            }
            
            mainPinDropButtonTapped = true
            
        } else {
            
            if pinDataObject.isPinDropped {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.arrangeCenterOfAdditionalButtons2()
                }
                
            } else {
                
                UIView.animate(withDuration: 0.3) {
                    
                    self.relocateAdditionalButtonsToCenter()
                }
                
            }
            
            
            
            mainPinDropButtonTapped = false
        }
        
    }
    

    /*
        returns true if the main pin drop button is active
        returns false if the main pin drop button is converted to confirmation button
     */
    func isMainButtonPinDropOrConfirmationButton() -> Bool {
        
        if pinDataObject.isPinDropped {
            
            return true
            
        } else {
            
            return false
        }
        
    }
    
    func doTheAnimationForSpecificPinDropButtons() {
        
        if !mainPinDropButtonTapped {
            
            UIView.animate(withDuration: 0.3) {
                
                self.buttonSpecialFriends.center = self.pinDropObjects.pinButtonSpecialPersonOrGroup
                self.buttonAllFriends.center = self.pinDropObjects.pinButtonAllFriends
                self.buttonOnlyMe.center = self.pinDropObjects.pinButtonOnlyMe
                
            }
            
            mainPinDropButtonTapped = true
            
        } else {
            
            UIView.animate(withDuration: 0.3) {
                    
                self.relocateAdditionalButtonsToCenter()
            }
            
            mainPinDropButtonTapped = false
                
        }
            
            
            
        
    }
    
    func doTheAnimationForConfirmationButtons() {
        
        UIView.animate(withDuration: 0.3) {
            
            self.buttonConfirmPinData.center = self.pinDropObjects.pinButtonConfirm
            self.buttonDeletePinData.center = self.pinDropObjects.pinButtonDelete
            
        }
        
    }
        
        
    
}
