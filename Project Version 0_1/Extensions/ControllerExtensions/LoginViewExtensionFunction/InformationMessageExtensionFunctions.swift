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
    
    func createForgetPasswordAlertController(inputEmailTextString : String) {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.addTextField().text = inputEmailTextString
        alertView.addButton("Şifre Sıfırla") {
            
            
            self.initiatePasswordResetProcess()
            
        }
        
        alertView.showInfo("Sifre Sıfırlama", subTitle: "Aşağıdaki e-mail adresine gönderilen link ile şifrenizi sıfırlayabilirsiniz", closeButtonTitle: "Vazgeç")
        
    }
    
    func initiatePasswordResetProcess() {
        
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
    
    
    /*
        create animated alerts from SCLAlertView
     */
    func PopUpFromSCLAlertViews(inputAlertType : alertType, inputAlertField : alertFields, inputFirebaseErrorCode : AuthErrorCode) {
        
        switch inputAlertType {
        case .Warning:
            
            prepareWarningFieldBased(inputAlertField: inputAlertField)
            
        case .Error:
            
            prepareErrorCaseBased(inputFirebaseErrorCode: inputFirebaseErrorCode)
            
            
        default:
            print("Nothing to do at this point")
            
        }
        
    }

    /*
        Error pop up process
     */
    
    func prepareErrorCaseBased(inputFirebaseErrorCode : AuthErrorCode)  {
        
        switch inputFirebaseErrorCode {
        case .accountExistsWithDifferentCredential:
            print("Aynı account farklı credential ile mevcut")
            
        case .appNotAuthorized:
            
            print("App not authorized")
            
        case .wrongPassword:
            
            createErrorForWrongPassword()
            
        case .userNotFound:
            
            createErrorUserNotFound()
            
        default:
            
            print("Nothing to do at this point")
            
        }
        
    }
    
    
    func createErrorForWrongPassword() {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showError(CONSTANT_STRING_ERROR, subTitle: CONSTANT_STRING_INVALID_CREDENTIALS, closeButtonTitle: CONSTANT_STRING_OK, timeout: SCLAlertView.SCLTimeoutConfiguration.init(timeoutValue: 2, timeoutAction: timeoutAction))
        
    }
    
    func createErrorUserNotFound() {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showError(CONSTANT_STRING_ERROR, subTitle: CONSTANT_STRING_USER_NOT_FOUND, closeButtonTitle: CONSTANT_STRING_OK, timeout: SCLAlertView.SCLTimeoutConfiguration.init(timeoutValue: 2, timeoutAction: timeoutAction))
        
    }
    
    
    /*
        Warning pop up process
     */
    func prepareWarningFieldBased(inputAlertField : alertFields ) {
        
        switch inputAlertField {
        case .Email:
            
            createWarningMessageForEmail()
            
        case .Password:
            
            createWarningMessageForPassword()
            
        case .EmptyType:
            
            break
       
        default:
            
            break
            
        }
        
    }
    
    func createWarningMessageForEmail() {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showWarning(CONSTANT_STRING_WARNING, subTitle: CONSTANT_WARNING_INVALID_EMAIL_FORMAT, closeButtonTitle: CONSTANT_STRING_OK, timeout: SCLAlertView.SCLTimeoutConfiguration.init(timeoutValue: 2, timeoutAction: timeoutAction))
        
    }
    
    func createWarningMessageForPassword() {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showWarning(CONSTANT_STRING_WARNING, subTitle: CONSTANT_WARNING_INVALID_PASSWORD_FORMAT, closeButtonTitle: CONSTANT_STRING_OK, timeout: SCLAlertView.SCLTimeoutConfiguration.init(timeoutValue: 2, timeoutAction: timeoutAction))
        
    }
    
}
