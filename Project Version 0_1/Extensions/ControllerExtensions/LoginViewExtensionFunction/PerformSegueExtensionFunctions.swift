//
//  SeguePerformingExtensionFunctions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 1.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func gotoVerificationView(inputUserIsEmailVerifiedFlag : Bool) {
        
        let verificationViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "VerificationViewController_storyBoardID") as! VerificationViewController
        
        verificationViewControllerObject.userObjectInVerificationView = self.userDatabaseObjectToPass
        
        if !inputUserIsEmailVerifiedFlag {
            
            print(">> : \(USER_EMAIL_VERIFICATION_REQUIRED)")
            
            var informationMessage = Information()
            informationMessage.setVerificationNotifMessage(inputMessage: USER_EMAIL_VERIFICATION_NOTIF_FAILED)
            
            verificationViewControllerObject.verificationMessage = informationMessage
        }
        
        navigationController?.pushViewController(verificationViewControllerObject, animated: true)
        
    }
    
    func gotoMainPage() {
        
        let mainPageViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "mainPageVC_storyBoardID") as! MainPageViewController
        
        navigationController?.pushViewController(mainPageViewControllerObject, animated: true)
        
    }
    
}
