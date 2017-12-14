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

import FTPopOverMenu_Swift

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
    
    func createForgetPasswordAlertController_v2(inputEmailTextString : String) {
        
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
        
        print("PopUpFromSCLAlertViews starts ")
        
        print("Alert type : \(inputAlertType)")
        print("Auth Error Code : \(inputFirebaseErrorCode)")
        
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
        
        print("prepareErrorCaseBased starts")
        
        print("inputFirebaseErrorCode : \(inputFirebaseErrorCode)")
        print("inputFirebaseErrorCode : \(inputFirebaseErrorCode.rawValue)")
        print("inputFirebaseErrorCode : \(inputFirebaseErrorCode.hashValue)")
        

        switch inputFirebaseErrorCode {
        case .accountExistsWithDifferentCredential:
            print("Aynı account farklı credential ile mevcut")
            
        case .appNotAuthorized:
            
            print("App not authorized")
            
        case .emailAlreadyInUse:
            
            print("Email is already in use")
            
            createErrorForEmailIsAlreadyInUse()
            
        case .wrongPassword:
            
            createErrorForWrongPassword()
            
        case .userNotFound:
            
            createErrorUserNotFound()
            
        default:
            
            print("Nothing to do at this point")
            
        }
        
        
    }
    
    
    func createErrorForEmailIsAlreadyInUse() {
        
        print("------")
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
            
            print("Alert for email validations")
        
            createWarningMessageForEmail()
            
        case .Password:
            
            print("Alert for password validations")
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












































