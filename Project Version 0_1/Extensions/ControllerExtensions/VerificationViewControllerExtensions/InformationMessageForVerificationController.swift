//
//  InformationMessageForVerificationController.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 11.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase
import AudioUnit

extension VerificationViewController {
    
    /*
     create animated alerts from SCLAlertView
     */
    
    func PopUpFromSCLAlertViews(inputAlertType : alertType, inputAlertField : alertFields) {
        
        switch inputAlertType {
        case .Warning:
            
            prepareWarningMessageFieldBased(inputAlertField: inputAlertField)
            
        case .Info:
            
            prepareInfoFieldBased()
            
        default:
            print("Nothing to do at this point")
            
        }
        
    }
    
    /*
     
     Information pop up process
     
     */
    func prepareInfoFieldBased() {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showInfo(CONSTANT_STRING_INFO, subTitle: CONSTANT_STRING_EMAIL_SEND_AGAIN, closeButtonTitle: CONSTANT_STRING_OK, timeout: SCLAlertView.SCLTimeoutConfiguration.init(timeoutValue: 2, timeoutAction: timeoutAction))
        
    }
    
    func prepareWarningMessageFieldBased(inputAlertField : alertFields) {
        
        switch inputAlertField {
        case .ButtonActivateAccount:
            
            createWarningMessageForButtonActivation()
            
        case .EmptyType:
            
            break
        
        default:
            
            break
            
        }
        
        
    }
    
    func createWarningMessageForButtonActivation() {
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showWarning(CONSTANT_STRING_WARNING, subTitle: CONSTANT_STRING_EMAIL_VERIFICATION_REQUIRED, closeButtonTitle: CONSTANT_STRING_OK, timeout: SCLAlertView.SCLTimeoutConfiguration.init(timeoutValue: 2, timeoutAction: timeoutAction))
        
    }
    
}
