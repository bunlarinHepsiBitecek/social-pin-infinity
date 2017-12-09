//
//  InformationMessageExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 4.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import AudioUnit
import Firebase

extension LoginViewController {
    
    func createWarningMessage(inputTitle : String, inputMessage : String) {
        
        let informationObject = Information()
        informationObject.setAlertController(inputTitle: inputTitle, inputMessage: inputMessage)
        
        self.present(informationObject.alertControllerObject, animated: true, completion: nil)
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let whenToCloseAlert = DispatchTime.now() + 2
        
        DispatchQueue.main.asyncAfter(deadline: whenToCloseAlert){
            
            informationObject.alertControllerObject.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func createForgetPasswordAlertController(inputEmailTextString : String) {
        
        let informationObjectForgetPassword = Information()
        informationObjectForgetPassword.setAlertControllerForgetPassword(inputTitle: CONSTANT_FORGET_PASSWORD, inputMessage: CONSTANT_FORGET_PASSWORD_INFO, inputEmailAddressText: inputEmailTextString)
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        self.present(informationObjectForgetPassword.alertControllerObject, animated: true) {
            
            var actionCodeSettingsObject = ActionCodeSettings.init()
            actionCodeSettingsObject.url = URL(string: String(format: "gotoVerify://social-media-infinity.firebaseapp.com?email=%@", self.email.text!))
            
            actionCodeSettingsObject.setIOSBundleID("com.erkutbas.Project-Version-0-1")
            
            Auth.auth().sendPasswordReset(withEmail: self.email.text!, actionCodeSettings: actionCodeSettingsObject) { (error) in
                
                if error != nil {
                    
                    if let errorMessage = error as NSError? {
                        
                        print("errorMessage : \(errorMessage.localizedDescription)")
                        print("errorMessage : \(errorMessage.userInfo)")
                        
                    }
                    
                } else {
                    
                    print("password reset email sent")
                }
                
            }
            
            
        }
        
    }
    
}

