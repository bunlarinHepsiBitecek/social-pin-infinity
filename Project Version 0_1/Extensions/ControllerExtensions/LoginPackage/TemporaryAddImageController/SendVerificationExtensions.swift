//
//  SendVerificationExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 28.11.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

extension AddImageViewController {
    
    func sendVerificationMail() {
        
        let informationObject = Information()
        
        let currentUser = Auth.auth().currentUser
        
        let actionCodeSettingsObject = ActionCodeSettings.init()
        
        actionCodeSettingsObject.url = URL(string: String(format: EMAIL_VERIFICATON_URL, self.userObject.email))
        
        actionCodeSettingsObject.setIOSBundleID(BUNDLE_IDENTIFIER)
        
        currentUser?.sendEmailVerification(with: actionCodeSettingsObject, completion: { (error) in
            
            print("email verification basliyorrrrrrrrrrrrrrr")
            
            if error != nil {
                
                print("hata geldi")
                
                if let errorMessage = error as NSError? {
                    
                    print("errorMessage : \(errorMessage)")
                    print("errorMessage : \(errorMessage.userInfo)")
                    print("errorMessage : \(errorMessage.localizedDescription)")
                    
                }
                
                informationObject.setEmailSendResult(inputResult: false)
                informationObject.setVerificationNotifMessage(inputMessage: USER_EMAIL_VERIFICATION_NOTIF_FAILED)
                self.createVerificationEmailSendFailedError(informationObject: informationObject, userObject: self.userObject)
                
                
            } else {
                
                print("email verification sent")
                
                informationObject.setEmailSendResult(inputResult: false)
                informationObject.setVerificationNotifMessage(inputMessage: USER_EMAIL_VERIFICATION_NOTIF_FAILED)
                //self.createVerificationEmailSendSuccessInfo(informationObject: informationObject, userObject: self.userObject)
                self.directToNextPage(inputInformationMessage: informationObject, inputUserObject: self.userObject)
                
            }
        })
        
    }
    
    // manage perform segue
    func directToNextPage(inputInformationMessage : Information, inputUserObject : User) {
        
        let verificationViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "VerificationViewController_storyBoardID") as! VerificationViewController
        
        verificationViewControllerObject.verificationMessage = inputInformationMessage
        verificationViewControllerObject.userObjectInVerificationView = inputUserObject
        
        navigationController?.pushViewController(verificationViewControllerObject, animated: true)
            
    }
}
