//
//  InformationPopupExtensions.swift
//  Project Version 0_1
//
//  Created by Erkut Baş on 13.12.2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import AudioUnit

extension AddImageViewController {
    
    func createVerificationEmailSendFailedError(informationObject : Information, userObject : User) {
        
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        
        let alertAppearance = SCLAlertView.SCLAppearance()
        
        let alertView = SCLAlertView(appearance: alertAppearance)
        
        alertView.showError(CONSTANT_STRING_ERROR, subTitle: CONSTANT_STRING_EMAIL_VERIFICATION_SEND_FAILED, closeButtonTitle: CONSTANT_STRING_OK).setDismissBlock {
            
            self.directToNextPage(inputInformationMessage: informationObject, inputUserObject: userObject)
        }
        
        
    }
    
}
